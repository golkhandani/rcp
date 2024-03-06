import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/shopping_list/handler.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState({
    required bool isPaginationDone,
    required bool isLoading,
    required bool isAdding,
    required bool isRefreshing,
    required ListQueryState listQueryState,
    required Map<String, bool> isDeletingItem,
    required List<ShoppingList> shoppingLists,
  }) = _HomeBlocState;

  factory HomeBlocState.init() => const HomeBlocState(
        isPaginationDone: false,
        isLoading: false,
        isAdding: false,
        isRefreshing: false,
        listQueryState: ListQueryState(),
        shoppingLists: [],
        isDeletingItem: {},
      );
}

class HomeBloc extends Cubit<HomeBlocState> {
  final StackLogger _logger = locator.console('HomeBloc');
  final SupabaseClient supabase;
  final NotificationBannerService banner;

  HomeBloc({
    required this.supabase,
    required this.banner,
  }) : super(HomeBlocState.init());

  Future<void> getAcceptedShoppingList({
    required String shoppingListId,
  }) async {
    try {
      final item = await supabase.shoppingListFuntions.getShoppingListById(
        shoppingListId,
      );

      emit(state.copyWith(
        shoppingLists: [
          item,
          ...state.shoppingLists,
        ],
      ));
    } catch (e) {
      _logger.error(e);
    }
  }

  Future<void> loadShoppingLists() async {
    try {
      if (state.isPaginationDone) {
        return;
      }

      var query = state.listQueryState.copyWith(
        page: state.shoppingLists.isEmpty ? 1 : state.listQueryState.page + 1,
      );

      emit(state.copyWith(
        isLoading: true,
      ));

      final list = await supabase.shoppingListFuntions.getShoppingListsByUser(
        query,
      );

      emit(state.copyWith(
        isPaginationDone: list.isEmpty || list.length < query.pageSize,
        listQueryState: query,
        shoppingLists: {
          ...state.shoppingLists,
          ...list,
        }.toList(),
        isLoading: false,
        isRefreshing: false,
      ));
    } catch (e) {
      _logger.error(e);
    }
  }

  Future<void> reloadShoppingLists() async {
    try {
      final newState = HomeBlocState.init();
      final query = newState.listQueryState;

      final list = await supabase.shoppingListFuntions.getShoppingListsByUser(
        query,
      );

      emit(state.copyWith(
        isPaginationDone: list.isEmpty || list.length < query.pageSize,
        listQueryState: query,
        shoppingLists: list,
        isLoading: false,
        isRefreshing: false,
      ));
    } catch (e) {
      _logger.error(e);
    }
  }

  // Just updating ui -> main logic in shopping_list_bloc
  Future<void> addShoppingList({
    required ShoppingList shoppingList,
  }) async {
    try {
      emit(state.copyWith(
        shoppingLists: [
          shoppingList,
          ...state.shoppingLists,
        ],
        isAdding: false,
      ));
      banner.showSuccessBanner('List add to the home!');
    } catch (e) {
      _logger.error(e);
    } finally {
      emit(state.copyWith(isAdding: true));
    }
  }

  // Just updating ui -> main logic in shopping_list_bloc
  Future<void> updateShoppingList({
    required ShoppingList shoppingList,
  }) async {
    try {
      emit(state.copyWith(isAdding: true));
      final updatedList = List<ShoppingList>.from(state.shoppingLists);
      final index = updatedList.indexWhere(
        (e) => e.id == shoppingList.id,
      );
      updatedList.replaceRange(index, index + 1, [shoppingList]);
      emit(state.copyWith(
        shoppingLists: updatedList,
        isAdding: false,
      ));
    } catch (e) {
      _logger.error(e);
    } finally {
      emit(state.copyWith(isAdding: true));
    }
  }

  Future<void> removeShoppingList({
    required ShoppingList shoppingList,
  }) async {
    try {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingList.id: true,
        },
      ));
      await supabase.shoppingListFuntions.deleteShoppingListById(
        shoppingList.id,
      );
      final updatedItems = List<ShoppingList>.from(state.shoppingLists)
        ..remove(shoppingList);
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingList.id: false,
        },
        shoppingLists: updatedItems,
      ));
      banner.showSuccessBanner('List removed!');
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingList.id: false,
        },
      ));
    }
  }
}
