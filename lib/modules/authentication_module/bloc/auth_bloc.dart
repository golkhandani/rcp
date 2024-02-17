import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:bnf/core/services/auth_service.dart';
import 'package:bnf/core/services/notification_banner_service.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_state.dart';

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
    emit(state.copyWith(isLoading: true));
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
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await authServie.signUpWithEmail(
        email: email,
        password: password,
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

  logout() async {
    emit(state.copyWith(isLoading: true));
    await authServie.logout();
    emit(state.copyWith(isLoading: false));
  }
}
