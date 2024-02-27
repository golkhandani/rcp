import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/services/auth_service.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/services/profile_manager_service.dart';
import 'package:rcp/core/services/session_manager_service.dart';
import 'package:rcp/modules/app_bloc/group_tenancy_state.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/home_module/bloc/home_bloc.dart';
import 'package:rcp/modules/profile_module/bloc/profile_state.dart';

GetIt locator = GetIt.instance;

class StackLogger {
  final SimpleLogger _logger;
  final String debugName;

  StackLogger(this.debugName) : _logger = SimpleLogger() {
    _logger.formatter = (info) =>
        '${List.generate(100, (_) => '_').join()} \n${_logger.levelPrefixes[info.level]} ${info.message}';
  }

  StackTrace get stack => StackTrace.current;

  String? _getMessage(Object? object) {
    final message = object is Exception
        ? object.toString()
        : object is AuthException
            ? object.message
            : object.toString();
    return message;
  }

  String _getLog(Object? object, StackTrace? stack) {
    return '| $debugName \n==> Type: ${object.runtimeType} \n==> Message: ${_getMessage(object)} \n==> Stack: $stack \n${List.generate(100, (_) => '_').join()}';
  }

  info(Object? object) {
    _logger.info(_getLog(object, StackTrace.empty));
  }

  warn(Object? object) {
    _logger.warning(_getLog(object, stack));
  }

  error(Object? object) {
    _logger.shout(_getLog(object, stack));
  }
}

extension LoggerLocator on GetIt {
  StackLogger console(String debugName) => locator.get<StackLogger>(
        param1: debugName,
      );

  StackLogger get logger => console("GENERAL LOGGER!");
}

Future<void> setupLogger() async {
  locator.registerFactoryParam<StackLogger, String, void>(
      (s, _) => StackLogger(s));
}

Future<void> setupStorage() async {
  // SECURE STORAGE
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final flutterSecureStorage =
      FlutterSecureStorage(aOptions: getAndroidOptions());
  locator.registerSingleton<FlutterSecureStorage>(flutterSecureStorage);

  // HIVE (HYDRATED BLOCS/CACHE)

  // PREF
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerSingleton(prefs);
}

Future<void> setupSupabaseRepo() async {
  final supabase = Supabase.instance.client;
  locator.registerSingleton<SupabaseClient>(supabase);

  locator.registerLazySingleton<SessionManagerService>(
    () => SessionManagerService(
      supabase: locator.get(),
      prefs: locator.get(),
      navigatorState: locator.get(),
      bannerService: locator.get(),
    ),
  );

  locator.registerLazySingleton<ProfileManagerService>(
    () => ProfileManagerService(
      supabase: locator.get(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthServie(
      supabase: locator.get(),
    ),
  );
}

Future<void> setupNavigator() async {
  // setup navigator
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  locator.registerSingleton(navigatorKey);
  locator.registerLazySingleton(() => NotificationBannerService(navigatorKey));
}

Future<void> setupBloc() async {
  // Register Global-Level Blocs
  locator.registerFactory(
    () => AppTenancyBloc(
      prefs: locator.get(),
      supabase: locator.get(),
      banner: locator.get(),
    ),
  );

  locator.registerFactory(
    () => AuthenticationCubit(
      authServie: locator.get(),
      banner: locator.get(),
      supabase: locator.get(),
      sessionManagerService: locator.get(),
      profileManagerService: locator.get(),
    ),
  );
  locator.registerFactory(
    () => ProfileBloc(
      supabase: locator.get(),
      profileManagerService: locator.get(),
      banner: locator.get(),
    ),
  );

  // Register Screen-Level Blocs
  locator.registerFactory(
    () => HomeBloc(
      supabase: locator.get(),
      banner: locator.get(),
    ),
  );
}

Future<void> setupLocator() async {
  // Basics
  await setupLogger();
  await setupNavigator();
  await setupStorage();

  // Logic flow

  await setupSupabaseRepo();
  await setupBloc();

  locator.logger.info("SetupLocator -> done!");
}
