import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/dashboard_screen_shell.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/modules/setting_module/bloc/profile_state.dart';
import 'package:rcp/modules/setting_module/profile_module.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';
import 'package:rcp/utils/extensions/context_ui_extension.dart';

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
      useSafeArea: false,
      child: CustomScrollView(
        slivers: [
          const SliverProfileSummaryHeader(),
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

class SliverProfileSummaryHeader extends StatelessWidget {
  const SliverProfileSummaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileBlocState>(
      bloc: context.read(),
      builder: (context, state) {
        if (state.user == null) {
          return SliverAppBar(
            forceElevated: true,
            pinned: true,
            elevation: 4,
            shadowColor: Colors.black,
            backgroundColor: context.colorTheme.background,
            toolbarHeight: 64,
            expandedHeight: 92,
          );
        }

        return SliverAppBar(
          forceElevated: false,
          pinned: true,
          elevation: 2,
          shadowColor: Colors.black38,
          backgroundColor: context.colorTheme.background,
          toolbarHeight: 64,
          expandedHeight: 92,
          flexibleSpace: CustomizableSpaceBar(
            builder: (context, scrollingRate) {
              return AnimatedContainer(
                color:
                    context.colorTheme.navBackground.withOpacity(scrollingRate),
                padding: EdgeInsets.only(
                    top: context.topSafePadding + 16, bottom: 16),
                duration: const Duration(milliseconds: 200),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Gap(16),
                      GestureDetector(
                        onTap: () => context.goNamed(profileRoute.name),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: CircleAvatar(
                              backgroundImage: state.user?.profile.avatarUrl ==
                                      null
                                  ? Assets.images.profilePlaceholder.provider()
                                  : NetworkImage(
                                      state.user!.profile.avatarUrl!,
                                    ), // // Replace with user avatar URL
                              radius: 32,
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (scrollingRate < 0.9)
                              SizedBox(
                                height: (1 - scrollingRate) * 24,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    'Welcome,',
                                    maxLines: 2,
                                    style: context.typoraphyTheme.subtitleLarge
                                        .onNavBackground.textStyle,
                                  ),
                                ),
                              ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  state.user?.profile.username ?? '',
                                  maxLines: 2,
                                  style: context.typoraphyTheme.titleMedium
                                      .onNavBackground.textStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.goNamed(inboxRoute.name),
                        icon: const Icon(Icons.notifications_outlined),
                      ),
                      const Gap(16),
                    ]),
              );
            },
          ),
        );
      },
    );
  }
}
