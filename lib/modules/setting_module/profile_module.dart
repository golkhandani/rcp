import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/sliver_profile_header.dart';
import 'package:rcp/core/widgets/sliver_title_bar.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/setting_module/bloc/profile_state.dart';
import 'package:rcp/packages/components/card_container.dart';
import 'package:rcp/utils/extensions/context_ui_extension.dart';

final profileRoute = GoRouteNamed(
  path: '/dashboard/profile',
  name: 'profile',
  builder: (context, state) => const ProfileScreen(),
);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileBloc _profileBloc = context.read();
  late final AuthenticationCubit _authenticationCubit = context.read();

  void _logout() {
    _authenticationCubit.logout();
  }

  void _delete() {
    _authenticationCubit.delete();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      useSafeArea: false,
      child: CustomScrollView(
        slivers: [
          BlocBuilder<ProfileBloc, ProfileBlocState>(
            bloc: _profileBloc,
            builder: (context, state) {
              if (state.user == null) {
                return const SliverTitleBar(title: '-');
              }
              return MultiSliver(
                children: [
                  SliverProfileHeader(
                    username: state.user?.profile.username,
                    avatarUrl: state.user?.profile.avatarUrl,
                    isLoadingAvatar: state.isLoadingAvatar,
                    isLoadingUsername: state.isLoadingUsername,
                    onEditAvatarClicked: _profileBloc.updateProfileImage,
                    onEditUsernameCompleted: (username) =>
                        _profileBloc.updateProfileUsername(username: username),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: MultiSliver(children: [
                      SliverToBoxAdapter(
                        child: CardContainer(
                          color: context.colorTheme.primary,
                          borderRadius: BorderRadius.circular(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email: ${state.user!.email}',
                                maxLines: 2,
                                style: context.typoraphyTheme.subtitleLarge
                                    .onTertiary.textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverGap(context.vHeight -
                          106 -
                          240 -
                          148 -
                          64 -
                          context.bottomSafePadding -
                          context.topSafePadding),
                      SliverToBoxAdapter(
                        child: BasicElevatedButton(
                          background: context.colorTheme.warning,
                          foreground: context.colorTheme.onWarning,
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.zero,
                          onPressed: _logout,
                          labelText: 'Logout',
                        ),
                      ),
                      const SliverGap(16),
                      SliverToBoxAdapter(
                        child: BasicElevatedButton(
                          background: context.colorTheme.error,
                          foreground: context.colorTheme.onError,
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.zero,
                          onPressed: _delete,
                          labelText: 'Delete',
                        ),
                      ),
                      const SliverGap(106),
                    ]),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
