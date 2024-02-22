import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class GoRouteNamed extends GoRoute {
  @override
  String get name => super.name!;
  @override
  Widget Function(BuildContext, GoRouterState) get builder => super.builder!;
  GoRouteNamed({
    required super.path,
    required super.name,
    required super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.onExit,
    super.routes = const <RouteBase>[],
  });
}

class GoRouteNamedPage extends GoRoute {
  @override
  String get name => super.name!;
  @override
  Page<dynamic> Function(BuildContext, GoRouterState)? get pageBuilder =>
      super.pageBuilder!;
  GoRouteNamedPage({
    required super.path,
    required super.name,
    super.builder,
    required super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.onExit,
    super.routes = const <RouteBase>[],
  });
}
