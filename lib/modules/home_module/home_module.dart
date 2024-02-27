import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/modules/home_module/bloc/home_bloc.dart';
import 'package:rcp/modules/profile_module/bloc/profile_state.dart';
import 'package:rcp/modules/profile_module/profile_module.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';

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
  final HomeBloc _homeBloc = locator.get();
  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeBloc.loadShoppingLists();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      useSafeArea: false,
      child: CustomScrollView(
        slivers: [
          const SliverProfileSummaryHeader(),
          BlocConsumer<HomeBloc, HomeBlocState>(
            bloc: _homeBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state.isLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList.builder(
                    itemCount: state.shoppingLists.length,
                    itemBuilder: (context, index) {
                      final item = state.shoppingLists[index];
                      return ShoppingListCard(item: item)
                          .animate()
                          .fade()
                          .scale();
                    }),
              );
            },
          ),
          const SliverGap(120)
        ],
      ),
    );
  }
}

class ShoppingListCard extends StatelessWidget {
  const ShoppingListCard({
    super.key,
    required this.item,
  });

  final ShoppingListModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: context.colorTheme.cardBackground,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          item.name,
          style: context.typoraphyTheme.titleSmall.onCardBackground.textStyle,
        ),
        tileColor: Colors.transparent,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8.0),
            Text(
              item.description ?? '-',
              style: context
                  .typoraphyTheme.subtitleMedium.onCardBackground.textStyle,
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 48,
              width: context.vWidth,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...item.itemNames.take(5).map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Chip(
                            labelPadding: EdgeInsets.zero,
                            label: Text(
                              e,
                              style: context.typoraphyTheme.hint
                                  .onCardBackground.textStyle,
                            ),
                          ),
                        ),
                      ),
                  Chip(
                    label: Text(
                      '...',
                      style: context
                          .typoraphyTheme.hint.onCardBackground.textStyle,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Last updated at ${DateFormat.yMMMd().format(item.updatedAt)} by ${item.updatedBy}',
              style: context.typoraphyTheme.hint.onCardBackground.textStyle,
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 48,
              width: context.vWidth,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...item.participantNames.take(5).map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Chip(
                            color: MaterialStatePropertyAll(
                              context.colorTheme.primary,
                            ),
                            labelPadding: EdgeInsets.zero,
                            label: Text(
                              e,
                              style: context
                                  .typoraphyTheme.hint.onPrimary.textStyle,
                            ),
                          ),
                        ),
                      ),
                  Chip(
                    color: MaterialStatePropertyAll(
                      context.colorTheme.primary,
                    ),
                    label: Text(
                      '...',
                      style: context.typoraphyTheme.hint.onPrimary.textStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle onTap action here
        },
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
              final bg =
                  context.colorTheme.navBackground.withOpacity(scrollingRate);

              final fg = bg.opacity < 0.5
                  ? context.colorTheme.onBackground
                  : context.colorTheme.onNavBackground;
              return AnimatedContainer(
                color: bg,
                padding: EdgeInsets.only(
                    top: context.topSafePadding + 16, bottom: 16),
                duration: const Duration(milliseconds: 200),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Gap(16),
                      GestureDetector(
                        onTap: () => context.goNamed(ProfileScreen.route.name),
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
                                        .copyWithColor(color: fg)
                                        .textStyle,
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
                                      .copyWithColor(color: fg)
                                      .textStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.goNamed(inboxRoute.name),
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: fg,
                        ),
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
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
