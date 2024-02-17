import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/core/widgets/user_group_list.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:bnf/modules/dashboard_module/dashboard_router.dart';
import 'package:bnf/modules/group_module/bloc/group_cubit.dart';
import 'package:bnf/modules/group_module/bloc/group_state.dart';
import 'package:bnf/modules/group_module/create_group_module.dart';
import 'package:bnf/utils/extensions/context_go_extension.dart';

final groupPickerRoute = GoRoute(
  path: '/group_picker',
  name: 'group_picker',
  builder: (context, state) => const GroupPickerScreen(showLogout: true),
);

class GroupPickerScreen extends StatefulWidget {
  final bool showLogout;
  const GroupPickerScreen({
    super.key,
    required this.showLogout,
  });

  @override
  State<GroupPickerScreen> createState() => _GroupPickerScreenState();
}

class _GroupPickerScreenState extends State<GroupPickerScreen> {
  final AuthenticationCubit _signupCubit = locator.get();
  final GroupCubit _groupCubit = locator.get();

  void _goToDashboard() {
    context.neglectNamed(dashboardRoute.name!);
  }

  void _goToCreateNewGroup() {
    context.pushNamed(createGroupRoute.name!);
  }

  void _logout() {
    _signupCubit.logout();
  }

  @override
  void initState() {
    super.initState();
    _groupCubit.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
      safeareaColor: context.colorTheme.background,
      bodyColor: context.colorTheme.background,
      padding: const EdgeInsets.all(16).copyWith(top: 32),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Groups',
                          style:
                              context.textTheme.titleMedium.onBackground.style,
                        ),
                      ),
                      const Gap(32),
                      AppThemeElevatedButton(
                        background: context.colorTheme.primary,
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _goToCreateNewGroup();
                        },
                        child: Text(
                          'Create a New Group!',
                          style:
                              context.textTheme.subtitleMedium.onPrimary.style,
                        ),
                      ),
                      const Gap(32),
                      if (state.joinedGroups.isEmpty && state.isLoading) ...[
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                      ] else ...[
                        Row(children: <Widget>[
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "YOUR GROUPS",
                              style: context.textTheme.hint.style,
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ]),
                        const Gap(16),
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
                  );
                },
              ),
            ),
          ),
          if (widget.showLogout)
            AppThemeElevatedButton(
              background: context.colorTheme.error,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.zero,
              onPressed: () {
                _logout();
              },
              child: Text(
                'Logout',
                style: context.textTheme.subtitleMedium.onSecondary.style,
              ),
            ),
        ],
      ),
    );
  }
}
