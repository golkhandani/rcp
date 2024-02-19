import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:bnf/core/services/auth_service.dart';
import 'package:bnf/core/services/notification_banner_service.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_bloc.dart';

GetIt locator = GetIt.instance;

class StackLogger {
  final SimpleLogger _logger;

  StackLogger() : _logger = SimpleLogger() {
    _logger.formatter =
        (info) => '${_logger.levelPrefixes[info.level]} ====> ${info.message}';
  }

  StackTrace get stack => StackTrace.empty;

  String? _getMessage(Object? object) {
    final message = object is Exception
        ? object.toString()
        : object is AuthException
            ? object.message
            : object.toString();
    return message;
  }

  String _getLog(Object? object, StackTrace? stack) {
    return '\n==> Type: ${object.runtimeType} \n==> Message: ${_getMessage(object)} \n==> Stack: $stack \n${List.generate(100, (_) => '_').join()}';
  }

  info(Object? object) {
    _logger.info(_getLog(object, stack));
  }

  warn(Object? object) {
    _logger.warning(_getLog(object, stack));
  }

  error(Object? object) {
    _logger.shout(_getLog(object, stack));
  }
}

extension LoggerLocator on GetIt {
  StackLogger get logger => GetIt.instance.get<StackLogger>();
}

Future<void> setupLogger() async {
  final logger = StackLogger();
  locator.registerSingleton(logger);
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
  locator.registerLazySingleton(() => prefs);
}

Future<void> setupSupabaseRepo() async {
  final supabase = Supabase.instance.client;
  locator.registerLazySingleton(() => supabase);
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
    ),
  );
}

Future<void> setupLocator() async {
  await setupLogger();
  await setupStorage();

  await setupSupabaseRepo();
  await setupNavigator();
  await setupBloc();
}
