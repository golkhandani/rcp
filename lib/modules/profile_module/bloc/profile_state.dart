import 'package:flutter/foundation.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/models/user_profile/index.dart';
import 'package:rcp/core/functions/models/user_username_is_available/index.dart';
import 'package:rcp/core/functions/users/handler.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/services/profile_manager_service.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
class ProfileBlocState with _$ProfileBlocState {
  const factory ProfileBlocState({
    required bool isEditing,
    required bool isUpdating,
    required bool isLoading,
    required bool isLoadingAvatar,
    UserInfo? user,
  }) = _ProfileBlocState;

  factory ProfileBlocState.init() => const ProfileBlocState(
        isEditing: false,
        isUpdating: false,
        isLoadingAvatar: false,
        isLoading: false,
      );
  factory ProfileBlocState.fromJson(Map<String, Object?> json) =>
      _$ProfileBlocStateFromJson(json);
}

class ProfileBloc extends Cubit<ProfileBlocState> {
  final StackLogger _logger = locator.console('ProfileBloc');
  final SupabaseClient supabase;
  final ProfileManagerService profileManagerService;
  final NotificationBannerService banner;

  ProfileBloc({
    required this.supabase,
    required this.banner,
    required this.profileManagerService,
  }) : super(ProfileBlocState.init());

  enableEditing() {
    emit(state.copyWith(isEditing: true));
  }

  createProfile({
    required String username,
    required String fullname,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));
      var isAvailable = false;
      try {
        final res = await supabase.usersFunctions.userUsernameIsAvailable(
          body: UserUsernameIsAvailableInput(username: username),
        );
        isAvailable = res.isAvailable;
      } catch (e) {
        _logger.error(e);
        throw const AuthException('Something Went Wrong!');
      }

      if (!isAvailable) {
        _logger.warn('Username is already taken!');
        throw const AuthException('Username is already taken!');
      }
      await supabase.usersFunctions.userProfileUpdate(
        body: UserProfileUpdateInput(
          username: username,
          fullName: fullname,
        ),
      );
      await profileManagerService.hasValidProfile(forceCheck: true);
      onSuccess();
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner(
        e is AuthException ? e.message : 'Something went wrong!',
      );
      onFailure();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  getUserInfo() async {
    try {
      emit(state.copyWith(isLoading: true));
      final user = supabase.auth.currentUser;
      if (user == null) return;

      final userProfile = await supabase.usersFunctions.userProfileGet();

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

  updateProfileDetails({
    required String username,
    required String fullname,
  }) async {
    UserProfile2? currentProfile = state.user?.profile;
    try {
      if (currentProfile?.fullName == fullname &&
          currentProfile?.username == username) {
        emit(state.copyWith(isEditing: false));
        return;
      }
      if (state.user == null) {
        return;
      }
      currentProfile = state.user!.profile;
      emit(
        state.copyWith(
          isUpdating: true,
          user: state.user!.copyWith(
            profile: currentProfile.copyWith(
              username: username,
            ),
          ),
        ),
      );
      final user = state.user;
      if (user == null) return;

      final checked = await supabase.usersFunctions.userUsernameIsAvailable(
        body: UserUsernameIsAvailableInput(
          username: username,
        ),
      );
      if (!checked.isAvailable) {
        throw const AuthException('Username is already taken!');
      }

      currentProfile = await supabase.usersFunctions.userProfileUpdate(
        body: UserProfileUpdateInput(
          username: username,
          fullName: fullname,
        ),
      );
      emit(state.copyWith(isEditing: false));
    } on Exception catch (e) {
      var code = 0;
      if (e is AuthException) {
        banner.showErrorBanner(e.message);
        rethrow;
      }

      if (e is StorageException) {
        code = int.tryParse(e.statusCode ?? '-1') ?? 0;
      }
      _logger.error(e);
      banner.showErrorBanner("Something went wrong! ($code)");
      rethrow;
    } finally {
      if (currentProfile == null) {
        emit(state.copyWith(isUpdating: false));
      } else {
        final userData = state.user?.copyWith(
          profile: currentProfile,
        );
        emit(state.copyWith(
          isUpdating: false,
          user: userData,
        ));
      }
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
          await supabase.usersFunctions.userProfileUpdateAvatar(file: file);

      final userData = state.user?.copyWith(
        profile: updatedUserProfile,
      );

      emit(state.copyWith(user: userData));
    } on Exception catch (e) {
      var code = 0;
      if (e is AuthException) {
        code = int.tryParse(e.statusCode ?? '-1') ?? 0;
      }

      if (e is StorageException) {
        code = int.tryParse(e.statusCode ?? '-1') ?? 0;
      }
      _logger.error(e);
      banner.showErrorBanner("Something went wrong! ($code)");
    } finally {
      emit(state.copyWith(isLoadingAvatar: false));
    }
  }
}
