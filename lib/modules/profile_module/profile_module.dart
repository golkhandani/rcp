import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/widgets/headers/sliver_profile_header.dart';
import 'package:rcp/core/widgets/headers/sliver_title_bar.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/profile_module/bloc/profile_state.dart';
import 'package:rcp/packages/components/card_container.dart';

class ProfileScreen extends StatefulWidget {
  static final route = GoRouteNamed(
    path: '/dashboard/profile',
    name: 'profile',
    builder: (context, state) => const ProfileScreen(),
  );
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileBloc _profileBloc = context.read();
  late final AuthenticationCubit _authenticationCubit = context.read();

  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _fullnameController =
      TextEditingController();

  void _logout() {
    _authenticationCubit.logout();
  }

  void _delete() {
    _authenticationCubit.delete();
  }

  @override
  void initState() {
    super.initState();
    _usernameController.text = _profileBloc.state.user?.username ?? '';
    _fullnameController.text = _profileBloc.state.user?.fullName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      useSafeArea: false,
      child: CustomScrollView(
        slivers: [
          BlocConsumer<ProfileBloc, ProfileBlocState>(
            bloc: _profileBloc,
            listener: (context, state) =>
                _usernameController.text = state.user?.username ?? '',
            builder: (context, state) {
              if (state.user == null) {
                return const SliverTitleBar(title: '-');
              }
              return MultiSliver(
                children: [
                  SliverProfileHeader(
                    username: state.user!.profile.username,
                    avatarUrl: state.user!.profile.avatarUrl,
                    isLoadingAvatar: state.isLoadingAvatar,
                    isUpdating: state.isUpdating,
                    onEditAvatarClicked: _profileBloc.updateProfileImage,
                    onEditClicked: _profileBloc.enableEditing,
                    onDoneClicked: () {
                      _profileBloc.updateProfileDetails(
                        username: _usernameController.text,
                        fullname: _fullnameController.text,
                      );
                    },
                    isEditing: state.isEditing,
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
                              SizedBox(
                                height: 48,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Email: ${state.user!.email}',
                                    maxLines: 2,
                                    style: context.typoraphyTheme.subtitleLarge
                                        .onTertiary.textStyle,
                                  ).animate().fade().scale(),
                                ),
                              ),
                              AnimatedCrossFade(
                                firstChild: SizedBox(
                                  height: 48,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Username: ${state.user!.username}',
                                      maxLines: 1,
                                      style: context
                                          .typoraphyTheme
                                          .subtitleLarge
                                          .onNavBackground
                                          .textStyle,
                                    ).animate().fade().scale(),
                                  ),
                                ),
                                secondChild: BasicTextInput(
                                  fieldName: 'username_field',
                                  controller: _usernameController,
                                ),
                                crossFadeState: !state.isEditing
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 200),
                              ),
                              AnimatedCrossFade(
                                firstChild: SizedBox(
                                  height: 48,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Full Name: ${state.user!.fullName}',
                                      maxLines: 1,
                                      style: context
                                          .typoraphyTheme
                                          .subtitleLarge
                                          .onNavBackground
                                          .textStyle,
                                    ).animate().fade().scale(),
                                  ),
                                ),
                                secondChild: BasicTextInput(
                                  fieldName: 'fullname_field',
                                  controller: _fullnameController,
                                ),
                                crossFadeState: !state.isEditing
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 200),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverGap(16),
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
                      const SliverGap(306),
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
