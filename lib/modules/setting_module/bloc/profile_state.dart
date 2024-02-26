import 'package:flutter/foundation.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/user_profile/index.dart';
import 'package:rcp/core/functions/user_username_is_available/index.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/services/notification_banner_service.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
class ProfileBlocState with _$ProfileBlocState {
  const factory ProfileBlocState({
    required bool isLoading,
    required bool isLoadingAvatar,
    required bool isLoadingUsername,
    UserInfo? user,
  }) = _ProfileBlocState;

  factory ProfileBlocState.init() => const ProfileBlocState(
        isLoadingUsername: false,
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

      final userProfile = await supabase.userProfileGet();

      final userData = UserInfo(
        id: user.id,
        email: user.email,
        phone: user.phone,
        profile: userProfile,
      );

      emit(state.copyWith(user: userData));
    } catch (error) {
      locator.logger.error(error);
      banner.showErrorBanner("Something went wrong!");
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  updateProfileUsername({
    required String username,
  }) async {
    try {
      emit(state.copyWith(isLoadingUsername: true));
      final user = state.user;
      if (user == null) return;

      final checked = await supabase.userUsernameIsAvailable(
        body: UserUsernameIsAvailableInput(
          username: username,
        ),
      );
      if (!checked.isAvailable) {
        throw const AuthException('Username is already taken!');
      }

      final updatedUserProfile = await supabase.userProfileUpdate(
        body: UserProfileUpdateInput(
          username: username,
        ),
      );

      final userData = state.user?.copyWith(
        profile: updatedUserProfile,
      );

      emit(state.copyWith(user: userData));
    } on Exception catch (error) {
      var code = 0;
      if (error is AuthException) {
        banner.showErrorBanner(error.message);
        rethrow;
      }

      if (error is StorageException) {
        code = int.tryParse(error.statusCode ?? '-1') ?? 0;
      }
      locator.logger.error(error);
      banner.showErrorBanner("Something went wrong! ($code)");
      rethrow;
    } finally {
      emit(state.copyWith(isLoadingUsername: false));
    }
  }

  updateProfileImage() async {
    try {
      emit(state.copyWith(isLoadingAvatar: true));
      final user = state.user;
      if (user == null) return;

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
        allowCompression: true,
        lockParentWindow: true,
      );

      // like when user has closed the picker
      if (result == null) {
        return;
      }

      PlatformFile file = result.files.first;

      final updatedUserProfile =
          await supabase.userProfileUpdateAvatar(file: file);

      final userData = state.user?.copyWith(
        profile: updatedUserProfile,
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
