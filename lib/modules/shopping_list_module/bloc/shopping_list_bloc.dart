import 'package:flutter/foundation.dart';

import 'package:collection/collection.dart';
import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/services/profile_manager_service.dart';

part 'shopping_list_bloc.freezed.dart';
part 'shopping_list_bloc.g.dart';

@freezed
class ShoppingListBlocState with _$ShoppingListBlocState {
  const factory ShoppingListBlocState({
    required bool isLoading,
    required bool isLoadingItems,
    required bool isAddingItem,
    required Map<String, bool> isDeletingItem,
    required ShoppingListModel? shoppingList,
    required List<Participant>? participants,
    required List<ShoppingItem>? shoppingItems,
  }) = _ShoppingListBlocState;

  factory ShoppingListBlocState.init() => const ShoppingListBlocState(
        isLoading: false,
        isLoadingItems: false,
        isDeletingItem: {},
        isAddingItem: false,
        shoppingList: null,
        participants: null,
        shoppingItems: null,
      );
  factory ShoppingListBlocState.fromJson(Map<String, Object?> json) =>
      _$ShoppingListBlocStateFromJson(json);
}

class ShoppingListBloc extends Cubit<ShoppingListBlocState> {
  final StackLogger _logger = locator.console('ShoppingListBloc');
  final SupabaseClient supabase;
  final ProfileManagerService profileManagerService;
  final NotificationBannerService banner;

  ShoppingListBloc({
    required this.supabase,
    required this.banner,
    required this.profileManagerService,
  }) : super(ShoppingListBlocState.init());

  // SHOPPING LIST
  Future<void> loadShoppingList({
    required ShoppingListModel? shoppingList,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));
      if (shoppingList != null) {
        emit(state.copyWith(
          isLoading: false,
          shoppingList: shoppingList,
        ));
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      final list = generateFakeShoppingListData(1);
      emit(state.copyWith(
        isLoading: false,
        shoppingList: list[0],
      ));
    } catch (e) {
      _logger.error(e);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addShoppingList({
    required String name,
    required String? description,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));

      await Future.delayed(const Duration(milliseconds: 1000));
      final created = ShoppingListModel(
        name: name,
        description: description,
        // TODO: convert it to function input
        // will be completed by BE
        id: Faker().guid.guid(),
        participants: [],
        items: [],
        createdAt: Faker().date.dateTime(),
        createdBy: Faker().guid.toString(),
        updatedAt: Faker().date.dateTime(),
        updatedBy: Faker().guid.toString(),
      );
      emit(state.copyWith(
        isLoading: false,
        shoppingList: created,
      ));
    } catch (e) {
      banner.showErrorBanner(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> updateShoppingList({
    required String name,
    required String? description,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));
      if (state.shoppingList == null) {
        throw Exception('No Shopping List found!');
      }
      final sl = state.shoppingList!;
      if (sl.name == name && sl.description == description) {
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      final updated = sl.copyWith(
        name: name,
        description: description,
      );
      emit(state.copyWith(
        isLoading: false,
        shoppingList: updated,
      ));
    } catch (e) {
      banner.showErrorBanner(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  // SHOPPING ITEMS

  Future<void> loadShoppingItems({
    required String? shoppingListId,
  }) async {
    try {
      emit(state.copyWith(isLoadingItems: true));
      if (shoppingListId == null) {
        emit(state.copyWith(isLoadingItems: false));
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      final list = generateFakeShoppingItemData(10);
      emit(state.copyWith(
        isLoadingItems: false,
        shoppingItems: list.sorted(
          (a, b) => b.isPurchased ? 0 : 1,
        ),
      ));
    } catch (e) {
      _logger.error(e);
    } finally {
      emit(state.copyWith(isLoadingItems: false));
    }
  }

  Future<void> addOrUpdateShoppingItem({
    required String? id,
    required String name,
    required String? quantity,
  }) async {
    try {
      emit(state.copyWith(isAddingItem: true));
      if (name.isEmpty) {
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      ShoppingItem? item;
      bool shouldAdd = true;
      final updateList = List<ShoppingItem>.from(state.shoppingItems ?? []);
      final index = updateList.indexWhere((e) => e.id == id);

      if (index != -1) {
        item = updateList[index].copyWith(
          name: name,
          quantity: quantity,
        );
        updateList.replaceRange(index, index + 1, [item]);
        shouldAdd = false;
      }

      item ??= ShoppingItem(
        id: Faker().guid.guid(),
        name: name,
        createdAt: DateTime.now(),
        createdBy: Faker().person.name(),
      );

      final updatedList = [
        if (shouldAdd) item,
        ...updateList,
      ];
      emit(state.copyWith(
        shoppingItems: updatedList,
      ));
      banner.showSuccessBanner('Item add to the list!');
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(isAddingItem: false));
    }
  }

  Future<void> removeShoppingItem({required ShoppingItem shoppingItem}) async {
    try {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingItem.id: true,
        },
      ));
      await Future.delayed(const Duration(milliseconds: 1000));
      final updatedItems = List<ShoppingItem>.from(state.shoppingItems ?? [])
        ..remove(shoppingItem);

      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingItem.id: false,
        },
        shoppingItems: updatedItems,
      ));
      banner.showSuccessBanner('Item removed from the list');
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          shoppingItem.id: false,
        },
      ));
    }
  }

  Future<void> toggleIsPurchasedShoppingItem({
    required ShoppingItem shoppingItem,
  }) async {
    try {
      final isPurchased = shoppingItem.isPurchased;
      final updatedItem = shoppingItem.copyWith(
        purchasedAt: isPurchased ? null : DateTime.now(),
        purchasedBy:
            isPurchased ? null : profileManagerService.profile.fullName,
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      final currentItems = state.shoppingItems ?? [];
      final updatedItems = List<ShoppingItem>.from(currentItems)
        ..remove(shoppingItem)
        ..insert(isPurchased ? 0 : currentItems.length - 1, updatedItem);

      emit(state.copyWith(
        shoppingItems: updatedItems,
      ));
      banner.showSuccessBanner(
        isPurchased
            ? 'Item moved to the top of the list'
            : 'Item moved to the bottom of the list',
      );
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    }
  }

  // PARTICIPANTS
  Future<void> loadParticipants({
    required String? shoppingListId,
  }) async {
    try {
      emit(state.copyWith(isLoadingItems: true));
      if (shoppingListId == null) {
        emit(state.copyWith(isLoadingItems: false));
        return;
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      final list = generateFakeParticipantData(10);
      emit(state.copyWith(
        isLoadingItems: false,
        shoppingList: state.shoppingList?.copyWith(
          participants: list,
        ),
        participants: list,
      ));
    } catch (e) {
      _logger.error(e);
    } finally {
      emit(state.copyWith(isLoadingItems: false));
    }
  }

  Future<void> removeParticipant({required Participant participant}) async {
    try {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          participant.id: true,
        },
      ));
      await Future.delayed(const Duration(milliseconds: 1000));
      final updatedItems = List<Participant>.from(state.participants ?? [])
        ..remove(participant);

      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          participant.id: false,
        },
        participants: updatedItems,
      ));
      banner.showSuccessBanner('Participant removed from the list');
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(
        isDeletingItem: {
          ...state.isDeletingItem,
          participant.id: false,
        },
      ));
    }
  }

  Future<void> addParticipant({required Participant participant}) async {
    try {
      emit(state.copyWith(isAddingItem: true));
      await Future.delayed(const Duration(milliseconds: 1000));

      emit(state.copyWith(
        isAddingItem: false,
        participants: [
          participant.copyWith(status: ParticipantStatus.invited),
          ...?state.participants
        ],
      ));
      banner.showSuccessBanner('Participant add to the list');
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(isAddingItem: false));
    }
  }

  //

  //
}
