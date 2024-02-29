import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/services/profile_manager_service.dart';
import 'package:rcp/core/services/session_manager_service.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/environment.dart';
import 'package:rcp/firebase_options.dart';
import 'package:rcp/modules/app_bloc/group_tenancy_state.dart';
import 'package:rcp/modules/app_onboarding_module/on_boarding_screen.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/signin_module.dart';
import 'package:rcp/modules/dashboard_module/dashboard_router.dart';
import 'package:rcp/modules/profile_module/profile_creation_module.dart';
import 'package:rcp/utils/themes.dart';

void main() async {
  // START APP INIT
  // initialize widget and supabase
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
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

  // START CHECKS

  // 1. Check session
  final SessionManagerService sessionManagerService = locator.get();
  var hasValidSession = sessionManagerService.hasValidSession;
  if (hasValidSession) {
    await sessionManagerService.restoreSession();
  }

  final hasValidUser = sessionManagerService.hasValidUser;
  if (!hasValidUser) {
    await sessionManagerService.clear();
    hasValidSession = false;
  }

  locator.logger.info("Check session -> done!");

  // Check if user is logged in

  // 2. Check intro

  final hasSeenIntro = sessionManagerService.hasSeenIntro;

  // END CHECKS

  // START ROUTER INIT
  final String initialPath = !hasSeenIntro
      ? OnBoardingScreen.route.path
      : hasValidSession
          ? dashboardRoute.path
          : SigninScreen.route.path;

  GoRouter.optionURLReflectsImperativeAPIs = true;
  final router = GoRouter(
    navigatorKey: locator.get(),
    initialLocation: initialPath,
    redirect: (context, state) async {
      // get services
      final SessionManagerService sessionManagerService = locator.get();
      final ProfileManagerService profileManagerService = locator.get();

      //
      final isAuthenticated = sessionManagerService.hasValidSession;
      final hasProfile = await profileManagerService.hasValidProfile();

      ///

      final isAuthRoute = state.fullPath?.contains(authRoute.path) ?? false;
      final isDashboardRoute =
          state.fullPath?.contains(dashboardRoute.path) ?? false;

      ///
      final shouldRedirectToDashboard =
          isAuthenticated && hasProfile && !isDashboardRoute;
      final shouldContinueToDashboard =
          isAuthenticated && hasProfile && isDashboardRoute;

      final shouldRedirectToAuth = !isAuthenticated && !isAuthRoute;
      final shouldContinueToAuth = !isAuthenticated && isAuthRoute;

      final shouldRedirectToProfileCreation = isAuthenticated && !hasProfile;

      final shouldRedirectToOnboarding = !sessionManagerService.hasSeenIntro;

      // print("____________________");
      // print("isAuthenticated ${isAuthenticated}");
      // print("shouldRedirectToOnboarding ${shouldRedirectToOnboarding}");
      // print("isAuthRoute ${isAuthRoute}");
      // print("hasProfile ${hasProfile}");
      // print("isDashboardRoute ${isDashboardRoute}");
      // print("state.fullPath ${state.fullPath}");
      // print("____________________");

      if (shouldRedirectToOnboarding) {
        return OnBoardingScreen.route.path;
      }
      if (shouldRedirectToAuth) {
        return authRoute.path;
      }
      if (shouldContinueToAuth) {
        return null;
      }
      if (shouldRedirectToProfileCreation) {
        return profileCreationRoute.path;
      }
      if (shouldRedirectToDashboard) {
        return dashboardRoute.path;
      }
      if (shouldContinueToDashboard) {
        return null;
      }

      return null;
    },
    routes: [
      OnBoardingScreen.route,
      authRoute,
      profileCreationRoute,
      ...dashboardRoutes,
      GoRoute(
        path: '/*',
        redirect: (context, state) => state.namedLocation(
          dashboardRoute.name,
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
  final _authBloc = locator.get<AuthenticationCubit>();
  @override
  Widget build(BuildContext context) {
    const pallete = trendyTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authBloc),
        BlocProvider.value(value: _tenancyBloc),
      ],
      child: CustomThemeProvider(
        pallete: pallete,
        typoraphy: CustomThemeTyporaphy(
          textStyle: TextStyle(
            fontSize: 16,
            fontFamily: GoogleFonts.nunito().fontFamily,
          ),
          pallete: pallete,
        ),
        child: Builder(builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: context.customTheme.data,
            darkTheme: context.customTheme.data,
            themeMode: ThemeMode.light,
            routerConfig: widget.router,
          );
        }),
      ),
    );
  }
}
