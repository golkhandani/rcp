import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bnf/modules/dashboard_module/dashboard_screen.dart';
import 'package:bnf/modules/home_module/request_around_module.dart';
import 'package:bnf/modules/setting_module/setting_module.dart';
import 'package:bnf/modules/user_inbox_module/inbox_module.dart';
import 'package:bnf/modules/user_request_module/active_request_module.dart';

Page<void> dashboardPageBuilder(GoRouterState state, Widget screen) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: animation.drive(
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeInOutCubic),
        ),
      ),
      child: child,
    ),
  );
}

final dashboardRoute = GoRoute(
  name: 'dashboard',
  path: '/dashboard',
  redirect: (context, state) async {
    return state.namedLocation(dahboardItems.first.routeName);
  },
);

final dashboardShellRoutes = StatefulShellRoute.indexedStack(
  pageBuilder: (context, state, child) {
    return MaterialPage(
      child: HeroControllerScope(
        controller: MaterialApp.createMaterialHeroController(),
        child: LayoutBuilder(
          // yes that LayoutBuilder is important. I don't know why
          builder: (ctx, constraints) => DashboardScreen(child: child),
        ),
      ),
    );
  },
  builder: (BuildContext context, GoRouterState state,
      StatefulNavigationShell child) {
    return DashboardScreen(child: child);
  },
  branches: [
    /// HOME PAGE
    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: requestAroundRoute.name!,
          path: requestAroundRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            requestAroundRoute.builder!(context, state),
          ),
          routes: requestAroundRoute.routes,
        ),
      ],
    ),

    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: activeRequestRoute.name!,
          path: activeRequestRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            activeRequestRoute.builder!(context, state),
          ),
          routes: activeRequestRoute.routes,
        ),
      ],
    ),

    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: inboxRoute.name!,
          path: inboxRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            inboxRoute.builder!(context, state),
          ),
          routes: inboxRoute.routes,
        ),
      ],
    ),

    /// ABOUT PAGE
    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: settingRoute.name!,
          path: settingRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            settingRoute.builder!(context, state),
          ),
          routes: settingRoute.routes,
        ),
      ],
    ),
  ],
);
final dashboardRoutes = [
  dashboardRoute,
  dashboardShellRoutes,
];
