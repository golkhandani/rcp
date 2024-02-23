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
                    username: state.user?.metadata.username,
                    avatarUrl: state.user?.metadata.avatarUrl,
                    isLoadingAvatar: state.isLoadingAvatar,
                    onEditAvatarClicked: _profileBloc.updateProfileImage,
                  ),
                  const SliverGap(32),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: MultiSliver(children: [
                      SliverToBoxAdapter(
                        child: BasicElevatedButton(
                          background: context.colorTheme.error,
                          foreground: context.colorTheme.onError,
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.zero,
                          onPressed: _logout,
                          labelText: 'Logout',
                        ),
                      ),
                      const SliverGap(16),
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
                              const Gap(16),
                              Text(
                                'Username: ${state.user!.metadata.username}',
                                maxLines: 2,
                                style: context.typoraphyTheme.subtitleLarge
                                    .onTertiary.textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverGap(16),
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
