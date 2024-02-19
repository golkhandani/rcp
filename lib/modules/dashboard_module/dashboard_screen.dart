import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/theme/dwew.dart';
import 'package:bnf/core/widgets/dashboard_shell.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/home_module/home_module.dart';
import 'package:bnf/modules/setting_module/profile_module.dart';
import 'package:bnf/modules/setting_module/setting_module.dart';
import 'package:bnf/modules/user_inbox_module/inbox_module.dart';

final dahboardItems = [
  DashboardLink(
    iconData: Icons.shopping_cart_outlined,
    label: 'Home',
    routeName: homeRoute.name,
    index: 0,
  ),
  DashboardLink(
    iconData: Icons.list_alt_outlined,
    label: 'Inbox',
    routeName: inboxRoute.name,
    index: 1,
  ),
  DashboardLink(
    iconData: Icons.inbox_outlined,
    label: 'Settings',
    routeName: settingRoute.name,
    index: 2,
  ),
  DashboardLink(
    iconData: Icons.settings_applications_outlined,
    label: 'Profile',
    routeName: profileRoute.name,
    index: 3,
  ),
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.child,
  });
  final StatefulNavigationShell child;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final _tenancyBloc = context.read<AppTenancyBloc>();

  void onItemTapped(int index) {
    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex,
    );
  }

  int calculateDashboardSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    final item = dahboardItems
        .firstWhereOrNull((element) => location.contains(element.routeName));

    return item?.index ?? 0;
  }

  @override
  void initState() {
    super.initState();
    _tenancyBloc
      ..getCurrentGroup()
      ..getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = calculateDashboardSelectedIndex(context);
    final color =
        dahboardItems[currentIndex].color ?? context.colorTheme.navBackground;

    return BlocConsumer<AppTenancyBloc, AppTenancyState>(
      bloc: _tenancyBloc,
      listenWhen: (previous, current) =>
          !current.isLoading &&
          previous.selectedGroupId != null &&
          current.selectedGroupId != null &&
          previous.selectedGroupId != current.selectedGroupId,
      listener: (context, state) {
        locator.logger.info("GROUP UPDATED! >> ${state.selectedGroup?.name}");
        if (state.selectedGroupId != null &&
            state.selectedGroup?.id != state.selectedGroupId) {
          _tenancyBloc.getCurrentGroup();
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return ScaffoldShell(
            bodyColor: context.colorTheme.navBackground,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: context.colorTheme.onNavUnselected,
              ),
            ),
          );
        }
        return DashboardShell(
          items: dahboardItems,
          currentIndex: currentIndex,
          onTap: onItemTapped,
          navigationActiveColor: context.colorTheme.onNavSelected,
          navigationInactiveColor: context.colorTheme.onNavUnselected,
          navigationBackgroundColor: color,
          contentBackgroundColor: context.colorTheme.background,
          safeAreaColor: color,
          height: 56,
          useFloatingNavBar: false,
          handleTopSafePadding: false,
          floatingActionButton: currentIndex == 0
              ? FloatingActionButton(
                  backgroundColor: color,
                  elevation: 1,
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: context.colorTheme.onNavBackground,
                  ),
                )
              : null,
          child: widget.child,
        );
      },
    );
  }
}
