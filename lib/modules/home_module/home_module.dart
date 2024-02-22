import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/sliver_title_bar.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/modules/setting_module/bloc/profile_state.dart';
import 'package:rcp/modules/setting_module/profile_module.dart';

final homeRoute = GoRouteNamed(
  path: '/dashboard/home',
  name: 'home',
  builder: (context, state) => const HomeScreen(),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      child: CustomScrollView(
        slivers: [
          BlocBuilder<ProfileBloc, ProfileBlocState>(
            bloc: context.read(),
            builder: (context, state) {
              if (state.user == null) {
                return const SliverTitleBar(title: '-');
              }
              return SliverAppBar(
                forceElevated: true,
                elevation: 2,
                backgroundColor: context.colorTheme.navBackground,
                toolbarHeight: 64,
                expandedHeight: 92,
                pinned: true,
                floating: false,
                flexibleSpace: CustomizableSpaceBar(
                  builder: (context, scrollingRate) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (scrollingRate < 0.9)
                                    SizedBox(
                                      height: (1 - scrollingRate) * 24,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Text(
                                          'Welcome,',
                                          maxLines: 2,
                                          style: context
                                              .typoraphyTheme
                                              .subtitleLarge
                                              .onNavBackground
                                              .textStyle,
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Text(
                                        state.user?.metadata.username ?? '',
                                        maxLines: 2,
                                        style: context
                                            .typoraphyTheme
                                            .titleMedium
                                            .onNavBackground
                                            .textStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.goNamed(profileRoute.name),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: CircleAvatar(
                                  backgroundImage: state
                                              .user?.metadata.avatarUrl ==
                                          null
                                      ? Assets.images.profilePlaceholder
                                          .provider()
                                      : NetworkImage(
                                          state.user!.metadata.avatarUrl!,
                                        ), // // Replace with user avatar URL
                                  radius: 32,
                                ),
                              ),
                            ),
                          ),
                        ]);
                  },
                ),
              );
            },
          ),
          SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index],
                    style: const TextStyle(color: Colors.black87),
                  ),
                  tileColor: Colors.transparent,
                );
              }),
          const SliverGap(120)
        ],
      ),
    );
  }
}
