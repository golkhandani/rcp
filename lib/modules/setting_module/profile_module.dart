import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:bnf/core/go_route_named.dart';
import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/dwew.dart';
import 'package:bnf/core/widgets/back_button.dart';
import 'package:bnf/core/widgets/dashboard_screen_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:bnf/packages/components/card_container.dart';

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
  final AuthenticationCubit _authenticationCubit = locator.get();
  void _logout() {
    _authenticationCubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      child: CustomScrollView(
        slivers: [
          BlocBuilder<AppTenancyBloc, AppTenancyState>(
            bloc: context.read(),
            builder: (context, state) {
              if (state.user == null) {
                return const SliverTitleBar(title: '-');
              }
              return MultiSliver(
                children: [
                  SliverAppBar(
                    forceElevated: true, //* here
                    elevation: 2,
                    backgroundColor: context.colorTheme.navBackground,
                    toolbarHeight: 48,
                    expandedHeight: 300,
                    scrolledUnderElevation: 2,
                    pinned: true,
                    floating: false,
                    leading: const MyBackButton(),
                    flexibleSpace: CustomizableSpaceBar(
                      builder: (context, scrollingRate) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 42),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        state.user!.imageUrl,
                                      ), // Replace with user avatar URL
                                      radius: 64,
                                    ),
                                  ),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  state.user!.name,
                                  maxLines: 2,
                                  style: context.typoraphyTheme.titleMedium
                                      .onNavBackground.textStyle,
                                ),
                              ),
                              const Gap(16)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: MultiSliver(children: [
                      SliverToBoxAdapter(
                        child: AppThemeElevatedButton(
                          isLoading: state.isLoading,
                          background: context.colorTheme.error,
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _logout();
                          },
                          child: Text(
                            'Logout',
                            style: context.typoraphyTheme.subtitleMedium
                                .onSecondary.textStyle,
                          ),
                        ),
                      ),
                      const SliverGap(16),
                      SliverToBoxAdapter(
                        child: CardContainer(
                          color: context.colorTheme.tertiary,
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
                                'Username: ${state.user!.name}',
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
