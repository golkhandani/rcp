import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/services/auth_service.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/theme/theme_system.dart';
import 'package:bnf/environment.dart';
import 'package:bnf/firebase_options.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/authentication_module/auth_router.dart';
import 'package:bnf/modules/dashboard_module/dashboard_router.dart';
import 'package:bnf/modules/group_module/create_group_module.dart';
import 'package:bnf/modules/group_module/group_picker_module.dart';
import 'package:bnf/modules/group_module/search_public_group_module.dart';
import 'package:bnf/modules/on_boarding_module/on_boarding_router.dart';
import 'package:bnf/utils/themes.dart';

void main() async {
  // START APP INIT
  // initialize widget and supabase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    anonKey: Environment.supabaseKey,
  );

  // setup locator for dependency injection
  // everything from logger to blocs
  // has to be registerd in IoC
  await setupLocator();
  // END APP INIT
  locator.logger.info("APP INIT DONE!");

  // START CHECKS
  final prefs = locator.get<SharedPreferences>();

  // Check if user is logged in
  final authService = locator.get<AuthServie>();
  final bool isLoggedIn = authService.isLoggedIn;
  // if user is logged in restore the session
  if (isLoggedIn) {
    authService.restoreSession();
  }
  locator.logger.info("AUTH INIT DONE!, isLoggedIn: $isLoggedIn");

  // check if user selected a group
  // if yes -> go to dashboard page
  // if no  -> go to group picker page
  final bool isGroupSelected =
      prefs.getString(Environment.selectedGroupKey) != null;
  locator.logger.info("TENANCY INIT DONE!, isGroupSelected: $isGroupSelected");

  // check if user has seen the intro page
  final bool isIntroChecked =
      prefs.getBool(Environment.isIntroCheckedKey) ?? isLoggedIn;
  // change it to false so we don't see it next time
  // TODO, move it to intro done function
  // to only change it to seen when user is actually done with intro
  await locator
      .get<SharedPreferences>()
      .setBool(Environment.isIntroCheckedKey, true);
  // END CHECKS

  // START ROUTER INIT
  final String initialPath = isLoggedIn
      ? isGroupSelected
          ? dashboardRoute.path
          : groupPickerRoute.path
      : signinRoute.path;

  final router = GoRouter(
    navigatorKey: locator.get(),
    initialLocation: !isIntroChecked ? onBoardingRoute.path : initialPath,
    routes: [
      ...authRouter,
      groupPickerRoute,
      createGroupRoute,
      searchPublicGroupRoute,
      onBoardingRoute,
      ...dashboardRoutes,
      GoRoute(
        path: '/*',
        redirect: (context, state) => state.namedLocation(
          dashboardRoute.name!,
        ),
      ),
    ],
  );
  // START ROUTER INIT

  runApp(MyApp(router: router));
}

class MyApp extends StatefulWidget {
  final GoRouter router;
  const MyApp({required this.router, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _tenancyBloc = locator.get<AppTenancyBloc>();
  @override
  Widget build(BuildContext context) {
    final material = Theme.of(context);
    final theme = trendyTheme;
    return BlocProvider(
      create: (context) => _tenancyBloc,
      child: AppTheme(
        colorTheme: theme,
        child: Builder(builder: (context) {
          return MaterialApp.router(
            theme: context.appTheme.materialBaseTheme(material),
            routerConfig: widget.router,
          );
        }),
      ),
    );
  }
}
