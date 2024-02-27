import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/user_delete/index.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/environment.dart';

class SessionManagerService {
  static const refreshSessionDuration = Duration(seconds: 1800);
  final StackLogger _logger = locator.logger;
  final SupabaseClient _supabase;
  Timer? _timer;
  final SharedPreferences _prefs;

  final NotificationBannerService _bannerService;

  SessionManagerService({
    required SupabaseClient supabase,
    required SharedPreferences prefs,
    required GlobalKey<NavigatorState> navigatorState,
    required NotificationBannerService bannerService,
  })  : _supabase = supabase,
        _prefs = prefs,
        _bannerService = bannerService {
    _logger.info("SessionManagerService -> Setup onAuthStateChange Listener");
    _supabase.auth.onAuthStateChange.listen((event) async {
      // This listener is responsible for
      // 1. register a token refresh timer so eveery few minutes we will get new access token
      // 2. with each change in session, update (get) user and session data

      switch (event.event) {
        // signedOut -> no need to call refresh token function
        case AuthChangeEvent.signedOut:
          _timer?.cancel();
          _timer = null;
          break;
        // TODO: it's better to check event and setup refresh token timer if needed
        // but for now it will be fine to do it in the rest of events
        default:
          if (event.session != null) {
            await setupRefreshTokenTimer();
          }
      }
    });
  }

  bool get hasValidSession => _supabase.auth.currentSession != null;
  bool get hasValidUser => _supabase.auth.currentUser != null;
  bool get hasSeenIntro => hasValidSession
      ? true
      : _prefs.getBool(Environment.isIntroCheckedKey) ?? false;

  Future<void> setupRefreshTokenTimer() async {
    _timer ??= Timer.periodic(refreshSessionDuration, (_) async {
      try {
        _logger.info(
            "SessionManagerService -> Timer.periodic -> Refreshing user session");
        await restoreSession();
        _logger.info(
            "SessionManagerService -> Timer.periodic -> Refreshed user session");
      } catch (e) {
        _logger.error(
            "SessionManagerService -> Timer.periodic -> Error Refreshing user session -> $e");
        await logout();
      }
    });
  }

  Future<void> restoreSession() async {
    bool exist = _prefs.containsKey(Environment.supabaseKey);
    if (!exist) {
      return;
    }

    String? jsonStr = _prefs.getString(Environment.persistSessionKey);
    if (jsonStr == null) {
      return;
    }

    final supabaseClient = locator.get<SupabaseClient>();
    final response = await supabaseClient.auth.recoverSession(jsonStr);
    if (response.session != null) {
      await _prefs.remove(Environment.persistSessionKey);
      return;
    }

    _prefs.setString(
      Environment.persistSessionKey,
      response.session?.toJson().toString() ?? '{}',
    );
    final message = 'Welcome ${response.user!.email}';
    _bannerService.showErrorBanner(message);
  }

  Future<void> clear() async {
    try {
      await _prefs.clear();
      await _supabase.auth.signOut();
    } catch (e) {
      locator.logger.error("logout: $e");
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _prefs.clear();
      await _supabase.auth.signOut();
      _navigateToRoot();
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

  void _navigateToRoot() {
    final GlobalKey<NavigatorState> navigatorState = locator.get();
    final context = navigatorState.currentContext;
    if (context == null) {
      throw GoException('No Context found for navigatorState');
    }
    GoRouter.maybeOf(context)?.go('/');
  }
}
