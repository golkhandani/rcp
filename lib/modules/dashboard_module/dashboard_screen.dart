import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/widgets/layouts/dashboard_shell.dart';
import 'package:rcp/core/widgets/layouts/scaffold_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/modules/home_module/bloc/home_bloc.dart';
import 'package:rcp/modules/home_module/home_module.dart';
import 'package:rcp/modules/profile_module/bloc/profile_state.dart';
import 'package:rcp/modules/profile_module/profile_module.dart';
import 'package:rcp/modules/setting_module/setting_module.dart';
import 'package:rcp/modules/user_inbox_module/bloc/invitation_bloc_state.dart';
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
  final HomeBloc _homeBloc = locator.get();
  final InvitationBloc _invitationBloc = locator.get();
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
      routeName: ProfileScreen.route.name,
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
    _homeBloc.loadShoppingLists();
    _invitationBloc.loadInvitations();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = calculateDashboardSelectedIndex(context);
    final color =
        dahboardItems[currentIndex].color ?? context.colorTheme.navBackground;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authenticationCubit),
        BlocProvider.value(value: _profileBloc),
        BlocProvider.value(value: _homeBloc),
        BlocProvider.value(value: _invitationBloc),
      ],
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        bloc: _authenticationCubit,
        listener: (context, auth) {},
        builder: (context, auth) {
          return BlocConsumer<ProfileBloc, ProfileBlocState>(
            bloc: _profileBloc,
            listenWhen: (previous, current) =>
                previous.user?.id == null && current.user?.id != null,
            listener: (context, profile) {
              locator.logger.info("PROFILE UPDATED! >> $profile");
            },
            builder: (context, profile) {
              if (profile.isLoading || auth.isLoading) {
                return ScaffoldShell(
                  child: BasicBackgroundContainer(
                    child: MobileFrame(
                      color: context.colorTheme.background,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
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
                height: 64,
                useFloatingNavBar: true,
                handleTopSafePadding: false,
                floatingActionButton: null,
                useMobileFrameOnWideScreen: true,
                child: widget.child,
              );
            },
          );
        },
      ),
    );
  }
}
