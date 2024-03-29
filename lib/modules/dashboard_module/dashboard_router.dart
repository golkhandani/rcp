import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/modules/dashboard_module/dashboard_screen.dart';
import 'package:rcp/modules/home_module/home_module.dart';
import 'package:rcp/modules/profile_module/profile_module.dart';
import 'package:rcp/modules/setting_module/setting_module.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';

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

final dashboardRoute = GoRouteNamed(
  name: 'dashboard',
  path: '/dashboard',
  redirect: (context, state) async {
    return state.namedLocation(homeRoute.name);
  },
  builder: (context, state) {
    return const Placeholder();
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
          name: homeRoute.name,
          path: homeRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            homeRoute.builder(context, state),
          ),
          routes: homeRoute.routes,
        ),
      ],
    ),

    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: inboxRoute.name,
          path: inboxRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            inboxRoute.builder(context, state),
          ),
          routes: inboxRoute.routes,
        ),
      ],
    ),

    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: settingRoute.name,
          path: settingRoute.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            settingRoute.builder(context, state),
          ),
          routes: settingRoute.routes,
        ),
      ],
    ),

    /// ABOUT PAGE
    StatefulShellBranch(
      routes: <RouteBase>[
        GoRoute(
          name: ProfileScreen.route.name,
          path: ProfileScreen.route.path,
          pageBuilder: (context, state) => dashboardPageBuilder(
            state,
            ProfileScreen.route.builder(context, state),
          ),
          routes: ProfileScreen.route.routes,
        ),
      ],
    ),
  ],
);
final dashboardRoutes = [
  dashboardRoute,
  dashboardShellRoutes,
];
