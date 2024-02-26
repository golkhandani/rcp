import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/user_delete/index.dart';
import 'package:rcp/core/functions/user_profile/index.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/types/user_session.dart';
import 'package:rcp/environment.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';

class AuthServie {
  final SupabaseClient _supabase;
  AuthServie({required SupabaseClient supabase}) : _supabase = supabase {
    _supabase.auth.onAuthStateChange.listen((event) async {
      await hasProfile(force: true);
      switch (event.event) {
        case AuthChangeEvent.signedOut:
          _timer?.cancel();
          _timer = null;
          break;
        default:
          if (event.session != null) {
            await setupRefreshTokenTimer();
          }
      }
    });
  }

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

      await hasProfile(force: true);

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
      locator.logger.error(e);
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

  Timer? _timer;
  Future<void> setupRefreshTokenTimer() async {
    _timer ??= Timer.periodic(const Duration(seconds: 1800), (_) async {
      try {
        locator.logger.warn("Timer.periodic: Refresh user session");
        await restoreSession();
      } catch (e) {
        locator.logger.error("Timer.periodic: Error: $e");
        await logout();
      }
    });
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
          nav.currentContext!.goNamed(signinRoute.name);
        });
      }
    } catch (e) {
      locator.logger.error("logout: $e");
      rethrow;
    }
  }

  Future<void> delete() async {
    try {
      await _supabase.userDelete();
      logout();
    } catch (e) {
      locator.logger.error("logout: $e");
      rethrow;
    }
  }

  bool? _hasProfile;
  Future<bool> hasProfile({bool force = false}) async {
    if (_hasProfile == null || force) {
      return await _checkUserHasProfile();
    }
    return _hasProfile ?? false;
  }

  Future<bool> _checkUserHasProfile() async {
    try {
      if (!isLoggedIn) {
        throw const AuthException("Not LoggedIn");
      }
      final userProfile = await _supabase.userProfileGet();
      locator.logger.info(userProfile);
      _hasProfile = true;
      return _hasProfile!;
    } catch (e) {
      locator.logger.error(e is AuthException ? e.message : e);
      _hasProfile = false;
      return _hasProfile!;
    }
  }
}
