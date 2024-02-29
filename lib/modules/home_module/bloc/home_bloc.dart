import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState({
    required bool isLoading,
    required bool isAdding,
    required Map<String, bool> isDeletingItem,
    required List<ShoppingListModel> shoppingLists,
  }) = _HomeBlocState;

  factory HomeBlocState.init() => const HomeBlocState(
      isLoading: false, isAdding: false, shoppingLists: [], isDeletingItem: {});
}

class HomeBloc extends Cubit<HomeBlocState> {
  final StackLogger _logger = locator.console('HomeBloc');
  final SupabaseClient supabase;
  final NotificationBannerService banner;

  HomeBloc({
    required this.supabase,
    required this.banner,
  }) : super(HomeBlocState.init());

  loadShoppingLists() async {
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(milliseconds: 1000));
      final list = generateFakeShoppingListData(20);
      emit(state.copyWith(
        shoppingLists: list,
        isLoading: false,
      ));
    } catch (e) {
      _logger.error(e);
    }
  }

  addShoppingList({
    required ShoppingListModel shoppingList,
  }) async {
    try {
      emit(state.copyWith(isAdding: true));
      await Future.delayed(const Duration(milliseconds: 1000));
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

  updateShoppingList({
    required ShoppingListModel shoppingList,
  }) async {
    try {
      emit(state.copyWith(isAdding: true));
      await Future.delayed(const Duration(milliseconds: 1000));
      final updatedList = List<ShoppingListModel>.from(state.shoppingLists);
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

  removeShoppingList({
    required ShoppingListModel shoppingList,
  }) async {
    try {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingList.id: true,
        },
      ));
      await Future.delayed(const Duration(milliseconds: 1000));
      final updatedItems = List<ShoppingListModel>.from(state.shoppingLists)
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
