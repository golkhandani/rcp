import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/services/auth_service.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/environment.dart';
import 'package:rcp/firebase_options.dart';
import 'package:rcp/modules/app_bloc/group_tenancy_state.dart';
import 'package:rcp/modules/app_onboarding_module/on_boarding_router.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/dashboard_module/dashboard_router.dart';
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

  final user = await authService.getCurrentUser();
  if (user == null) {
    authService.logout();
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
  final String initialPath =
      isLoggedIn ? dashboardRoute.path : signinRoute.path;

  final router = GoRouter(
    navigatorKey: locator.get(),
    initialLocation: !isIntroChecked ? onBoardingRoute.path : initialPath,
    routes: [
      onBoardingRoute,
      ...authRouter,
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
