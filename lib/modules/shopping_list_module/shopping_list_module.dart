import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/widgets/headers/sliver_title_bar.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/modules/shopping_list_module/bloc/shopping_list_bloc.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_item_add_or_edit.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_item_card.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_list_editor.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_list_summary_header.dart';

final shoppingListRoute = GoRouteNamed(
  path: 'shopping_list/:shopping_list_id',
  name: 'shopping_list',
  redirect: (context, state) {
    final shoppingListId = state.pathParameters['shopping_list_id'];
    if (shoppingListId == null) {
      return state.namedLocation('home');
    }
    return null;
  },
  builder: (context, state) {
    final shoppingListId = state.pathParameters['shopping_list_id']!;
    final shoppingList = state.extra == null
        ? null
        : ShoppingList.fromJson(
            state.extra as dynamic,
          );
    return ShoppingListScreen(
      shoppingListId: shoppingListId,
      shoppingList: shoppingList,
    );
  },
);

class ShoppingListScreen extends StatefulWidget {
  static const pathId = 'shopping_list_id';
  const ShoppingListScreen({
    super.key,
    required this.shoppingListId,
    this.shoppingList,
  });

  final String shoppingListId;
  final ShoppingList? shoppingList;

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final ShoppingListBloc _shoppingListBloc = locator.get();

  showAddItemBottomSheet(BuildContext context) {
    final NotificationBannerService bannerService = locator.get();
    final child = ShoppingItemAddOrEdit(
      shoppingListBloc: _shoppingListBloc,
      shoppingItem: null,
    );
    bannerService.showBottomSheet(child);
  }

  showEditItemBottomSheet(BuildContext context, ShoppingItem shoppingItem) {
    final NotificationBannerService bannerService = locator.get();
    final child = ShoppingItemAddOrEdit(
      shoppingListBloc: _shoppingListBloc,
      shoppingItem: shoppingItem,
    );
    bannerService.showBottomSheet(child);
  }

  showListEditorBottomSheet(
    BuildContext context,
    ShoppingList shoppingList,
  ) {
    final NotificationBannerService bannerService = locator.get();
    final child = ShoppingListAddOrEdit(
      shoppingListBloc: _shoppingListBloc,
      shoppingList: shoppingList,
    );
    bannerService.showBottomSheet(child);
  }

  @override
  void initState() {
    super.initState();

    _shoppingListBloc
      ..loadShoppingList(
        shoppingListId: widget.shoppingListId,
        shoppingList: widget.shoppingList,
      )
      ..loadShoppingItems(
        shoppingListId: widget.shoppingListId,
      )
      ..loadParticipants(
        shoppingListId: widget.shoppingListId,
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool _addInHeader = false;

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      useSafeArea: false,
      child: CustomScrollView(
        slivers: [
          BlocBuilder<ShoppingListBloc, ShoppingListBlocState>(
            bloc: _shoppingListBloc,
            buildWhen: (p, c) => p.shoppingList != c.shoppingList,
            builder: (context, state) {
              final item = state.shoppingList;
              if (item == null) {
                return const SliverTitleBar(title: '');
              }
              return MultiSliver(
                children: [
                  ShoppingListSummaryHeader(
                    item: item,
                    onAddItemClicked: _addInHeader
                        ? () => showAddItemBottomSheet(context)
                        : null,
                    onEditClicked: () => showListEditorBottomSheet(
                      context,
                      item,
                    ),
                  ),
                ],
              );
            },
          ),
          SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: VisibilityDetector(
                  key: const Key('add_new_item'),
                  onVisibilityChanged: (visibilityInfo) {
                    if (!mounted) {
                      return;
                    }
                    if (visibilityInfo.visibleFraction <= 0.8 &&
                        !_addInHeader) {
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
                      onPressed: () => showAddItemBottomSheet(context),
                      labelText: "Add new item!",
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
                            'Add Item!',
                            style: context.typoraphyTheme.subtitleLarge
                                .onPrimary.textStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<ShoppingListBloc, ShoppingListBlocState>(
                bloc: _shoppingListBloc,
                builder: (context, state) {
                  if (state.isLoadingItems) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.all(16).copyWith(
                      bottom: 88 + context.bottomSafePadding,
                      top: 0,
                    ),
                    sliver: MultiSliver(
                      children: [
                        SliverList.builder(
                            itemCount: state.shoppingItems.length,
                            itemBuilder: (
                              context,
                              index,
                            ) {
                              final item = state.shoppingItems[index];

                              return Padding(
                                key: Key(item.id),
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ShoppingItemCard(
                                    onTap: () => showEditItemBottomSheet(
                                          context,
                                          item,
                                        ),
                                    item: item,
                                    onCheckToggled: () {
                                      _shoppingListBloc
                                          .toggleIsPurchasedShoppingItem(
                                        shoppingItem: item,
                                      );
                                    },
                                    isDeleting:
                                        state.isDeletingItem[item.id] ?? false,
                                    onDeleted: () {
                                      _shoppingListBloc.removeShoppingItem(
                                        shoppingItem: item,
                                      );
                                    }),
                              );
                            }),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
