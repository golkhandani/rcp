import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/user_session.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/environment.dart';

class AuthServie {
  final SupabaseClient _supabase;
  AuthServie({required SupabaseClient supabase}) : _supabase = supabase;

  bool get isLoggedIn => _supabase.auth.currentSession != null;

  Future<UserSession> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final Session? session = res.session;
      final User? user = res.user;

      if (user == null || session == null) {
        throw Exception('Invalid login');
      }
      await _supabase.auth.refreshSession();

      return (user: user, session: session);
    } on AuthException catch (e) {
      locator.logger.error(e);
      rethrow;
    } on Exception catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }

  Future<bool> requestResetPassword({
    required String email,
  }) async {
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
      );

      return true;
    } on AuthException catch (e) {
      locator.logger.error(e);
      rethrow;
    } on Exception catch (e) {
      locator.logger.error(e);
      throw Exception('Invalid login');
    }
  }

  Future<User> loginWithResetPasswordOtp(
      {required String email, required String token}) async {
    try {
      final AuthResponse res = await _supabase.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.recovery,
      );

      final User? user = res.user;

      if (user == null) {
        throw Exception('Invalid login');
      }

      return user;
    } on AuthException catch (e) {
      locator.logger.error(e);
      rethrow;
    } on Exception catch (e) {
      locator.logger.error(e);
      throw Exception('Invalid login');
    }
  }

  Future<User> updatePassword({
    required String password,
  }) async {
    try {
      final res =
          await _supabase.auth.updateUser(UserAttributes(password: password));
      final User? user = res.user;

      if (user == null) {
        throw Exception('Invalid login');
      }
      return user;
    } on AuthException catch (e) {
      locator.logger.error(e);
      rethrow;
    } on Exception catch (e) {
      locator.logger.error(e);
      throw Exception('Invalid login');
    }
  }

  Future<User> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final User? user = res.user;

      if (user == null) {
        throw Exception('Invalid login');
      }

      return user;
    } on AuthException catch (e) {
      locator.logger.error(e);
      rethrow;
    } on Exception catch (e) {
      locator.logger.error(e);
      throw Exception('Invalid login');
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      await _supabase.auth.refreshSession();
      final User? user = _supabase.auth.currentUser;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<void> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    bool exist = prefs.containsKey(Environment.supabaseKey);
    if (!exist) {
      return;
    }

    String? jsonStr = prefs.getString(Environment.persistSessionKey);
    if (jsonStr == null) {
      return;
    }

    final supabaseClient = locator.get<SupabaseClient>();
    final response = await supabaseClient.auth.recoverSession(jsonStr);
    if (response.session != null) {
      await prefs.remove(Environment.persistSessionKey);
      return;
    }

    prefs.setString(Environment.persistSessionKey,
        response.session?.toJson().toString() ?? '{}');
    final message = 'Welcome ${response.user!.email}';
    locator.get<NotificationBannerService>().showErrorBanner(message);
  }

  Future<void> logout() async {
    try {
      final prefs = locator.get<SharedPreferences>();
      final supabase = locator.get<SupabaseClient>();
      await prefs.clear();
      await supabase.auth.signOut();
      final nav = locator.get<GlobalKey<NavigatorState>>();
      if (nav.currentContext != null) {
        Router.neglect(nav.currentContext!, () {
          nav.currentContext!.go('/');
        });
      }
    } catch (e) {
      locator.logger.error("logout: $e");
      rethrow;
    }
  }
}
