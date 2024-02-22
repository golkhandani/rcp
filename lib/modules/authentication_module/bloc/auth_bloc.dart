import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/services/auth_service.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthServie authServie;
  final NotificationBannerService banner;
  AuthenticationCubit({
    required this.authServie,
    required this.banner,
  }) : super(AuthenticationState.init());

  signinWithEmail({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    emit(state.copyWith(isLoading: true, email: email));
    try {
      final res =
          await authServie.loginWithEmail(email: email, password: password);
      emit(state.copyWith(
        isLoading: false,
        userId: res.user.id,
      ));
      onSuccess();
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
    } catch (e) {
      onFailure();
      banner.showErrorBanner('Something went wrong: ${e.toString()}');
      onFailure();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  signupWithEmail({
    required String username,
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    emit(state.copyWith(isLoading: true, email: email));
    try {
      final metadata = UserMetadata(
        username: username,
        avatarUrl: null,
      );
      final user = await authServie.signUpWithEmail(
        email: email,
        password: password,
        metadata: metadata,
      );

      emit(state.copyWith(isLoading: false, userId: user.id));
      banner.showSuccessBanner('Please check your email inbox!');
      onSuccess();
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
      onFailure();
    } catch (e) {
      banner.showErrorBanner('Something went wrong: ${e.toString()}');
      onFailure();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  requestResetPassword({
    required String email,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    emit(state.copyWith(isLoading: true, email: email));
    try {
      await authServie.requestResetPassword(
        email: email,
      );
      banner.showSuccessBanner('Please check your email inbox!');
      onSuccess();
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
      onFailure();
    } catch (e) {
      banner.showErrorBanner('Something went wrong: ${e.toString()}');
      onFailure();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  loginWithOtp({
    required String otp,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      if (state.email == null) {
        banner.showErrorBanner("No email provided!");
        return;
      }
      final user = await authServie.loginWithResetPasswordOtp(
        email: state.email!,
        token: otp,
      );
      emit(state.copyWith(isLoading: false, userId: user.id));
      banner.showSuccessBanner('Please update your password!');
      onSuccess();
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
      onFailure();
    } catch (e) {
      banner.showErrorBanner('Something went wrong: ${e.toString()}');
      onFailure();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  updatePassword({
    required String password,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      if (state.email == null) {
        banner.showErrorBanner("No email provided!");
        return;
      }
      final user = await authServie.updatePassword(
        password: password,
      );
      emit(state.copyWith(isLoading: false, userId: user.id));
      banner.showSuccessBanner('Password updated!');
      onSuccess();
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
      onFailure();
    } catch (e) {
      banner.showErrorBanner('Something went wrong: ${e.toString()}');
      onFailure();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  logout() async {
    emit(state.copyWith(isLoading: true, email: null));
    await authServie.logout();
    emit(state.copyWith(isLoading: false));
  }
}
