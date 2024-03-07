import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:great_list_view/great_list_view.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/widgets/constants.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/modules/home_module/bloc/home_bloc.dart';
import 'package:rcp/modules/home_module/refreshable_nested_scroll_view.dart';
import 'package:rcp/modules/home_module/shopping_list_card.dart';
import 'package:rcp/modules/home_module/sliver_profile_summary_header.dart';
import 'package:rcp/modules/shopping_list_module/bloc/shopping_list_bloc.dart';
import 'package:rcp/modules/shopping_list_module/shopping_list_module.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_list_editor.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';

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
  late final HomeBloc _homeBloc = context.read();

  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  showAddListBottomSheet(BuildContext context) {
    final ShoppingListBloc shoppingListBloc = locator.get();
    final NotificationBannerService bannerService = locator.get();
    final child = ShoppingListAddOrEdit(
      shoppingListBloc: shoppingListBloc,
      shoppingListAdded: (spl) =>
          _homeBloc.addShoppingList(shoppingList: spl).then(
                (value) => bannerService.closeBottomSheet(),
              ),
      shoppingList: null,
    );
    bannerService.showBottomSheet(child);
  }

  late AnimatedListDiffListDispatcher<ShoppingList> _dispatcher;
  final _animatedListController = AnimatedListController();
  List<ShoppingList> list = [];

  void swapList(List<ShoppingList> updatedList) {
    setState(() {
      _dispatcher.dispatchNewList(updatedList);
    });
  }

  @override
  void initState() {
    super.initState();
    _dispatcher = AnimatedListDiffListDispatcher<ShoppingList>(
      controller: _animatedListController,
      itemBuilder: (c, item, d) => itemBuilder(
        c,
        item,
        d,
        _homeBloc.state,
      ),
      currentList: list,
      comparator: AnimatedListDiffListComparator<ShoppingList>(
        sameItem: (a, b) => a.id == b.id,
        sameContent: (a, b) => a.id == b.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
        useSafeArea: false,
        child: RefreshableNestedScrollView(
          header: const SliverProfileSummaryHeader(),
          onRefreshRequested: (handler) => {
            _homeBloc
                .reloadShoppingLists()
                .then((value) => handler.onRefreshDone()),
          },
          onMoreRequested: (handler) {
            _homeBloc.loadShoppingLists();
          },
          builder: (context, handler) {
            return BlocBuilder<HomeBloc, HomeBlocState>(
              bloc: _homeBloc,
              builder: (context, state) {
                return SliverMainAxisGroup(
                  slivers: [
                    const SliverGap(kMediumGap),
                    SliverToBoxAdapter(
                      child: BasicElevatedButton(
                        height: kMediumHeight,
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
                            const Gap(kMediumGap),
                            Text(
                              'Add List!',
                              style: context.typoraphyTheme.subtitleLarge
                                  .onPrimary.textStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SliverGap(kMediumGap),
                    if (state.isLoading && state.shoppingLists.isEmpty) ...[
                      const SliverToBoxAdapter(
                        child: LoadingCircle(),
                      ),
                      const SliverGap(kMediumGap),
                    ],
                    if (!state.isLoading && state.shoppingLists.isEmpty) ...[
                      const SliverToBoxAdapter(child: EmptyIsList()),
                      const SliverGap(kMediumGap),
                    ],
                    SliverList.builder(
                      itemCount: state.shoppingLists.length,
                      itemBuilder: (context, index) => itemBuilder(
                        context,
                        state.shoppingLists[index],
                        null,
                        state,
                      ),
                    ),
                    if (state.isLoading && state.shoppingLists.isNotEmpty) ...[
                      const SliverToBoxAdapter(
                        child: LoadingCircle(),
                      ),
                      const SliverGap(kMediumGap),
                    ],
                  ],
                );
              },
            );
          },
        ));
  }

  itemBuilder(
    BuildContext c,
    ShoppingList item,
    AnimatedWidgetBuilderData? d,
    HomeBlocState state,
  ) {
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
    );
  }
}
