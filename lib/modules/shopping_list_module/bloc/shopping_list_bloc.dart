import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/shopping_list/handler.dart';
import 'package:rcp/core/functions/users/handler.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/services/profile_manager_service.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

part 'shopping_list_bloc.freezed.dart';
part 'shopping_list_bloc.g.dart';

@freezed
class ShoppingListBlocState with _$ShoppingListBlocState {
  const factory ShoppingListBlocState({
    required bool isLoading,
    required bool isLoadingItems,
    required bool isAddingItem,
    required Map<String, bool> isDeletingItem,
    required Map<String, bool> isUpdatingItem,
    required ShoppingList? shoppingList,
    required List<Participant> participants,
    required Map<String, ShoppingItem> shoppingItems,
    required ListQueryState listQueryState,

    //
    required bool isLoadingInvitationCandidates,
    required List<InvitationCandidate> invitationCandidates,
  }) = _ShoppingListBlocState;

  factory ShoppingListBlocState.init() => const ShoppingListBlocState(
        isLoading: false,
        isLoadingItems: false,
        isDeletingItem: {},
        isUpdatingItem: {},
        isAddingItem: false,
        shoppingList: null,
        participants: [],
        shoppingItems: {},
        listQueryState: ListQueryState(pageSize: 50),
        //
        isLoadingInvitationCandidates: false,
        invitationCandidates: [],
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
    required String shoppingListId,
    required ShoppingList? shoppingList,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));
      if (shoppingList != null) {
        emit(state.copyWith(
          isLoading: false,
          shoppingList: shoppingList,
        ));
      }

      final fetchedData =
          await supabase.shoppingListFuntions.getShoppingListById(
        shoppingListId,
      );
      emit(state.copyWith(
        isLoading: false,
        shoppingList: fetchedData,
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

      final created =
          await supabase.shoppingListFuntions.addOrUpdateShoppingListById(
        id: null,
        name: name,
        description: description,
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

      final updated =
          await supabase.shoppingListFuntions.addOrUpdateShoppingListById(
        id: sl.id,
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
    bool isRefreshing = false,
  }) async {
    try {
      if (state.shoppingItems.isNotEmpty &&
          state.shoppingItems.length < state.listQueryState.pageSize) {
        return;
      }
      var query = state.listQueryState.copyWith(
        page: state.shoppingItems.isEmpty ? 1 : state.listQueryState.page + 1,
      );
      if (isRefreshing) {
        query = const ListQueryState();
      }

      emit(state.copyWith(isLoadingItems: true));

      final list = await supabase.shoppingItemsFunctions
          .getShoppingItemsByShoppingListId(shoppingListId!, query);
      final shoppingItems = {for (var item in list) item.id: item};
      emit(state.copyWith(
        listQueryState: query,
        isLoadingItems: false,
        shoppingList: state.shoppingList?.copyWith(
          items: shoppingItems.values.take(3).toList(),
        ),
        shoppingItems: {
          ...state.shoppingItems,
          ...shoppingItems,
        },
      ));
    } catch (e) {
      _logger.error(e);
    } finally {
      emit(state.copyWith(isLoadingItems: false));
    }
  }

  Future<void> reloadShoppingItems({
    required String? shoppingListId,
    bool isRefreshing = false,
  }) async {
    try {
      const query = ListQueryState();

      final list = await supabase.shoppingItemsFunctions
          .getShoppingItemsByShoppingListId(shoppingListId!, query);
      final shoppingItems = {for (var item in list) item.id: item};
      emit(state.copyWith(
        listQueryState: query,
        isLoadingItems: false,
        shoppingList: state.shoppingList?.copyWith(
          items: shoppingItems.values.take(3).toList(),
        ),
        shoppingItems: {
          ...state.shoppingItems,
          ...shoppingItems,
        },
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
      if (state.shoppingList == null) {
        return;
      }
      if (name.isEmpty) {
        return;
      }

      var updateList = Map<String, ShoppingItem>.from(state.shoppingItems);
      final exists = updateList.containsKey(id);

      final item =
          await supabase.shoppingItemsFunctions.addOrUpdateShoppingItem(
        state.shoppingList!.id,
        id: id,
        name: name,
        quantity: quantity,
      );

      if (exists) {
        updateList.update(id!, (value) => item);
      } else {
        updateList = {
          item.id: item,
          ...updateList,
        };
      }

      emit(state.copyWith(
        shoppingItems: updateList,
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
      await supabase.shoppingItemsFunctions.deleteShoppingItemById(
        state.shoppingList!.id,
        id: shoppingItem.id,
      );
      final updatedItems = Map<String, ShoppingItem>.from(state.shoppingItems);

      updatedItems.removeWhere((key, value) => key == shoppingItem.id);

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
      if (state.isUpdatingItem[shoppingItem.id] ?? false) {
        return;
      }

      emit(state.copyWith(
        isUpdatingItem: {
          ...state.isUpdatingItem,
          shoppingItem.id: true,
        },
      ));
      var updatedItems = Map<String, ShoppingItem>.from(state.shoppingItems);
      final currentIsPurchased = shoppingItem.isPurchased;
      updatedItems.removeWhere((key, value) => key == shoppingItem.id);
      if (!currentIsPurchased) {
        updatedItems = {
          ...updatedItems,
          shoppingItem.id: shoppingItem.copyWith(
            purchasedAt: DateTime.now(),
          ),
        };
      } else {
        updatedItems = {
          shoppingItem.id: shoppingItem.copyWith(
            purchasedAt: null,
            purchasedBy: null,
          ),
          ...updatedItems,
        };
      }

      final updatedItem =
          await supabase.shoppingItemsFunctions.togglePurchasedShoppingItem(
        state.shoppingList!.id,
        id: shoppingItem.id,
        isPurchased: !currentIsPurchased,
      );

      updatedItems.update(
        shoppingItem.id,
        (value) => value.copyWith(
          purchasedAt: updatedItem.purchasedAt,
          purchasedBy: updatedItem.purchasedBy,
        ),
      );

      emit(state.copyWith(
        isUpdatingItem: {
          ...state.isDeletingItem,
          shoppingItem.id: false,
        },
        shoppingItems: updatedItems,
      ));
      banner.showSuccessBanner(
        currentIsPurchased
            ? 'Item moved to the top of the list'
            : 'Item moved to the bottom of the list',
      );
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(
        isUpdatingItem: {
          ...state.isUpdatingItem,
          shoppingItem.id: false,
        },
      ));
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

      final list = await supabase.participantsFunctions
          .getShoppingListParticipantsById(shoppingListId);

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
      final updatedItems = List<Participant>.from(state.participants)
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

  Future<void> addParticipant({required InvitationCandidate candidate}) async {
    try {
      emit(state.copyWith(isAddingItem: true));

      final addedParticipant = await supabase.participantsFunctions
          .inviteShoppingListParticipantsById(
        state.shoppingList!.id,
        userId: candidate.userId,
        email: candidate.email,
      );

      emit(state.copyWith(
        isAddingItem: false,
        participants: [
          addedParticipant,
          ...state.participants,
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

  Future<void> getUserProfileForInvitation({
    required String email,
  }) async {
    try {
      emit(state.copyWith(isLoadingInvitationCandidates: true));
      final userProfile = await supabase.invitationsFunctions
          .userInvitationIsAvailable(email: email);

      emit(state.copyWith(
        invitationCandidates: userProfile != null ? [userProfile] : [],
        isLoadingInvitationCandidates: false,
      ));
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(isLoadingInvitationCandidates: false));
    }
  }

  //
}
