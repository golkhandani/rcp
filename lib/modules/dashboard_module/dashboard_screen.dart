import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/dashboard_shell.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/home_module/home_module.dart';
import 'package:rcp/modules/profile_module/bloc/profile_state.dart';
import 'package:rcp/modules/profile_module/profile_module.dart';
import 'package:rcp/modules/setting_module/setting_module.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';

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
  late final AuthenticationCubit _authenticationCubit = context.read();
  final ProfileBloc _profileBloc = locator.get();

  late final dahboardItems = [
    DashboardLink(
      iconData: Icons.home,
      label: 'Home',
      routeName: homeRoute.name,
      index: 0,
      color: context.colorTheme.navBackground,
    ),
    DashboardLink(
      iconData: Icons.inbox,
      label: 'Inbox',
      routeName: inboxRoute.name,
      index: 1,
    ),
    DashboardLink(
      iconData: Icons.settings,
      label: 'Settings',
      routeName: settingRoute.name,
      index: 2,
    ),
    DashboardLink(
      iconData: Icons.person,
      label: 'Profile',
      routeName: profileRoute.name,
      index: 3,
      color: context.colorTheme.navBackground,
    ),
  ];

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
    _profileBloc.getUserInfo();
  }

  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    final currentIndex = calculateDashboardSelectedIndex(context);
    final color =
        dahboardItems[currentIndex].color ?? context.colorTheme.navBackground;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authenticationCubit),
        BlocProvider.value(value: _profileBloc),
      ],
      child: BlocConsumer<ProfileBloc, ProfileBlocState>(
        bloc: _profileBloc,
        listenWhen: (previous, current) =>
            previous.user?.id == null && current.user?.id != null,
        listener: (context, state) {
          locator.logger.info("TENANT UPDATED! >> $state");
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
            navigationBackgroundColor: context.colorTheme.navBackground,
            contentBackgroundColor: Colors.white,
            safeAreaColor: color,
            height: 56,
            useFloatingNavBar: true,
            handleTopSafePadding: false,
            floatingActionButton: null,
            useMobileFrameOnWideScreen: true,
            child: widget.child,
          );
        },
      ),
    );
  }
}
