import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/widgets/dashboard_screen_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';
import 'package:bnf/core/widgets/user_group_list.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/dashboard_module/dashboard_router.dart';
import 'package:bnf/modules/group_module/bloc/group_cubit.dart';
import 'package:bnf/modules/group_module/bloc/group_state.dart';
import 'package:bnf/modules/group_module/create_group_module.dart';
import 'package:bnf/modules/setting_module/profile_module.dart';
import 'package:bnf/utils/extensions/context_go_extension.dart';

final settingRoute = GoRoute(
  path: '/dashboard/setting',
  name: 'setting',
  builder: (context, state) => const SettingScreen(),
  routes: [
    profileRoute,
  ],
);

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GroupCubit _groupCubit = locator.get();

  void _goToDashboard() {
    context.neglectNamed(dashboardRoute.name!);
  }

  void _goToCreateNewGroup() {
    context.pushNamed(createGroupRoute.name!);
  }

  @override
  void initState() {
    super.initState();
    _groupCubit.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      child: CustomScrollView(
        slivers: [
          const SliverTitleBar(
            title: 'Settings',
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<GroupCubit, GroupState>(
              bloc: _groupCubit,
              listener: (context, state) {
                if (state.groupId != null) {
                  context.read<AppTenancyBloc>().setCurrentGroup(
                        state.groupId!,
                        _goToDashboard,
                      );
                }
              },
              builder: (context, state) {
                return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppThemeElevatedButton(
                          background: context.colorTheme.primary,
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _goToCreateNewGroup();
                          },
                          child: Text(
                            'Create a New Group!',
                            style: context
                                .textTheme.subtitleMedium.onPrimary.style,
                          ),
                        ),
                        const Gap(16),
                        if (state.joinedGroups.isEmpty && state.isLoading) ...[
                          const Center(
                              child: CircularProgressIndicator.adaptive()),
                        ] else ...[
                          const Gap(16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Change Your Group!",
                              style: context.textTheme.subtitleMedium.style,
                            ),
                          ),
                          UserGroupList(
                            groupCubit: _groupCubit,
                            list: state.joinedGroups,
                            joined: true,
                          ),
                          UserGroupList(
                            groupCubit: _groupCubit,
                            list: state.pendingGroups,
                            joined: false,
                          ),
                        ],
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
