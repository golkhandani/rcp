import 'package:flutter/foundation.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/services/storage_service.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
class ProfileBlocState with _$ProfileBlocState {
  const factory ProfileBlocState({
    required bool isLoading,
    required bool isLoadingAvatar,
    UserInfo? user,
  }) = _ProfileBlocState;

  factory ProfileBlocState.init() => const ProfileBlocState(
        isLoadingAvatar: false,
        isLoading: false,
      );
  factory ProfileBlocState.fromJson(Map<String, Object?> json) =>
      _$ProfileBlocStateFromJson(json);
}

class ProfileBloc extends Cubit<ProfileBlocState> {
  final SupabaseClient supabase;
  final NotificationBannerService banner;

  ProfileBloc({
    required this.supabase,
    required this.banner,
  }) : super(ProfileBlocState.init());

  getUserInfo() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return;

      final metadata = user.userMetadata;

      final filePath = metadata?[UserMetadata.avatarUrlKey];

      String? imageUrlResponse;

      if (filePath != null) {
        imageUrlResponse = await supabase.storage
            .from('avatars')
            .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
      }

      final userData = UserInfo(
        id: user.id,
        email: user.email,
        phone: user.phone,
        metadata: UserMetadata(
          username: metadata?[UserMetadata.usernameKey] ??
              user.email?.split('@')[0] ??
              '-',
          avatarUrl: imageUrlResponse,
        ),
      );

      emit(state.copyWith(user: userData));
    } catch (error) {
      locator.logger.error(error);
      banner.showErrorBanner("Something went wrong!");
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<Uint8List> _compress(Uint8List pngBytes) async {
    final pngImage = img.decodeImage(pngBytes);
    final pngImageResized = img.copyResize(pngImage!, width: 400);
    return img.encodeJpg(pngImageResized, quality: 60);
  }

  updateProfileImage() async {
    emit(state.copyWith(isLoadingAvatar: true));

    try {
      final user = supabase.auth.currentUser;
      if (user == null) return;
      final filePath = user.avatarFilePath;

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
        allowCompression: true,
        lockParentWindow: true,
      );

      if (result == null) {
        // like when user has closed the picker
        return;
      }

      PlatformFile file = result.files.first;

      if (file.bytes == null) {
        throw BasicException.imageWithNoData;
      }

      final compresssedFile = await _compress(file.bytes!);
      if (user.avatarUrl != null) {
        await supabase.storage
            .from(StorageServie.avatarsBucketId)
            .remove([filePath]);
      }
      await supabase.storage.from(StorageServie.avatarsBucketId).uploadBinary(
            filePath,
            compresssedFile,
          );

      final imageUrlResponse = await supabase.storage
          .from(StorageServie.avatarsBucketId)
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

      await supabase.auth.updateUser(
        UserAttributes(
          data: {
            ...?state.user?.metadata.toJson(),
            UserMetadata.avatarUrlKey: filePath,
          },
        ),
      );

      final userData = state.user?.copyWith.metadata(
        avatarUrl: imageUrlResponse,
      );

      emit(state.copyWith(user: userData));
    } on Exception catch (error) {
      var code = 0;
      if (error is AuthException) {
        code = int.tryParse(error.statusCode ?? '-1') ?? 0;
      }

      if (error is StorageException) {
        code = int.tryParse(error.statusCode ?? '-1') ?? 0;
      }
      locator.logger.error(error);
      banner.showErrorBanner("Something went wrong! ($code)");
    } finally {
      emit(state.copyWith(isLoadingAvatar: false));
    }
  }
}
