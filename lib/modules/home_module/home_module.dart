import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/extensions/sequential_animate.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/modules/home_module/bloc/home_bloc.dart';
import 'package:rcp/modules/home_module/shopping_list_card.dart';
import 'package:rcp/modules/home_module/sliver_profile_summary_header.dart';
import 'package:rcp/modules/shopping_list_module/bloc/shopping_list_bloc.dart';
import 'package:rcp/modules/shopping_list_module/shopping_list_module.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_list_editor.dart';

final homeRoute = GoRouteNamed(
  path: '/dashboard/home',
  name: 'home',
  builder: (context, state) => const HomeScreen(),
  routes: [
    shoppingListRoute,
  ],
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = locator.get();

  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  bool _addInHeader = false;

  showAddListBottomSheet(BuildContext context) {
    final ShoppingListBloc shoppingListBloc = locator.get();
    final NotificationBannerService bannerService = locator.get();
    final child = ShoppingListAddOrEdit(
      shoppingListBloc: shoppingListBloc,
      shoppingListAdded: (spl) =>
          _homeBloc.addShoppingList(shoppingList: spl).then(
                (value) => context.pop(),
              ),
      shoppingListUpdated: (spl) =>
          _homeBloc.updateShoppingList(shoppingList: spl),
      shoppingList: null,
    );
    bannerService.showBottomSheet(child);
  }

  @override
  void initState() {
    super.initState();
    _homeBloc.loadShoppingLists();
    _scrollController.addListener(_endOfScrollHandler);
  }

  _endOfScrollHandler() {
    final maxTriggerExtend = _scrollController.position.maxScrollExtent - 88;
    final offset = _scrollController.offset;

    if (offset > maxTriggerExtend &&
        !_homeBloc.state.isLoading &&
        !_homeBloc.state.isPaginationDone) {
      _homeBloc.loadShoppingLists();
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      useSafeArea: false,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverProfileSummaryHeader(),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: const Key('add_new_item'),
              onVisibilityChanged: (visibilityInfo) {
                if (!mounted) {
                  return;
                }
                if (visibilityInfo.visibleFraction <= 0.8 && !_addInHeader) {
                  setState(() {
                    _addInHeader = true;
                  });
                } else if (visibilityInfo.visibleFraction > 0.8 &&
                    _addInHeader) {
                  setState(() {
                    _addInHeader = false;
                  });
                }
              },
              child: Container(
                color: context.colorTheme.background,
                padding: const EdgeInsets.all(16),
                child: BasicElevatedButton(
                  height: 88,
                  onPressed: () => showAddListBottomSheet(context),
                  labelText: "Add new list!",
                  labelWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: context.colorTheme.onPrimary,
                      ),
                      const Gap(8),
                      Text(
                        'Add List!',
                        style: context
                            .typoraphyTheme.subtitleLarge.onPrimary.textStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          BlocConsumer<HomeBloc, HomeBlocState>(
            bloc: _homeBloc,
            listener: (context, state) {},
            builder: (context, state) {
              return MultiSliver(
                children: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16).copyWith(
                      bottom: 88 + context.bottomSafePadding,
                      top: 0,
                    ),
                    sliver: SliverList.builder(
                        itemCount: state.shoppingLists.length,
                        itemBuilder: (context, index) {
                          final item = state.shoppingLists[index];
                          final extra = item.toJson();
                          return ShoppingListCard(
                            item: item,
                            onTap: () {
                              // Handle onTap action here
                              context.goNamed(
                                shoppingListRoute.name,
                                pathParameters: {
                                  ShoppingListScreen.pathId: item.id,
                                },
                                extra: extra,
                              );
                            },
                            isDeleting: state.isDeletingItem[item.id] ?? false,
                            onDeleted: () {
                              _homeBloc.removeShoppingList(shoppingList: item);
                            },
                          ).sequentialAnimate(index % 10).fade().scale();
                        }),
                  ),
                  if (state.isLoading)
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
