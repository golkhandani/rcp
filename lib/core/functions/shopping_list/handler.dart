import 'package:collection/collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

class ShoppingListFunctions extends SingleDomainFunctions {
  final _logger = locator.console('ShoppingListFunctions');

  ShoppingListFunctions(SupabaseClient supabaseClient)
      : super(
          'shopping_lists',
          supabaseClient,
        );

  Future<List<ShoppingList>> getShoppingListsByUser(
    ListQueryState listQueryState,
  ) async {
    try {
      final functionName = getfnName('all');

      final res = await supabaseClient.functions.get(
        functionName,
        query: listQueryState.toJson(),
      );

      final rawData = res.data as List<dynamic>;

      final data = rawData.map((e) => ShoppingList.fromJson(e)).toList();
      return data;
    } on FunctionException catch (e) {
      _logger.error(e.details);
      rethrow;
    }
  }

  Future<ShoppingList> getShoppingListById(
    String id,
  ) async {
    try {
      final functionName = getfnName(id);

      final res = await supabaseClient.functions.get(
        functionName,
      );

      final data = ShoppingList.fromJson(res.data);
      return data;
    } on FunctionException catch (e) {
      _logger.error(e.details);
      rethrow;
    }
  }

  Future<ShoppingList> addOrUpdateShoppingListById({
    required String? id,
    required String name,
    required String? description,
  }) async {
    try {
      if (id != null) {
        final functionName = getfnName(id);
        final res = await supabaseClient.functions.put(
          functionName,
          body: {
            'id': id,
            'name': name,
            'description': description,
          },
        );
        final data = ShoppingList.fromJson(res.data);
        return data;
      } else {
        final functionName = getfnName('');
        final res = await supabaseClient.functions.post(
          functionName,
          body: {
            'name': name,
            'description': description,
          },
        );
        final data = ShoppingList.fromJson(res.data);
        return data;
      }
    } on FunctionException catch (e) {
      _logger.error(e.details);
      rethrow;
    }
  }

  Future<void> deleteShoppingListById(
    String id,
  ) async {
    try {
      final functionName = getfnName(id);
      await supabaseClient.functions.delete(
        functionName,
      );
    } on FunctionException catch (e) {
      _logger.error(e.details);
      rethrow;
    }
  }

  // PARTICIPANTS
  Future<List<Participant>> getShoppingListParticipantsById(
    String id,
  ) async {
    try {
      final functionName = getfnName('$id/participants');

      final res = await supabaseClient.functions.get(
        functionName,
      );
      final rawData = res.data as List<dynamic>;

      final data = rawData.map((e) => Participant.fromJson(e)).toList();

      return data;
    } on FunctionException catch (e) {
      _logger.error(e.details);
      rethrow;
    }
  }

  // SHOPPING ITEMS
  Future<List<ShoppingItem>> getShoppingItemsByShoppingListId(
    String shoppingListId,
    ListQueryState listQueryState,
  ) async {
    try {
      final functionName = getfnName('$shoppingListId/items');
      final res = await supabaseClient.functions.get(
        functionName,
        query: listQueryState.toJson(),
      );
      final rawData = res.data as List<dynamic>;

      final data = rawData.map((e) => ShoppingItem.fromJson(e)).toList();
      return data.sorted(
        (a, b) => b.isPurchased ? 0 : 1,
      );
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<ShoppingItem> addOrUpdateShoppingItem(
    String shoppingListId, {
    required String? id,
    required String name,
    required String? quantity,
  }) async {
    try {
      if (id != null) {
        final functionName = getfnName('$shoppingListId/items');
        final res = await supabaseClient.functions.post(
          functionName,
          body: {
            'shoppingListId': shoppingListId,
            'id': id,
            'name': name,
            'quantity': quantity,
          },
        );
        final data = ShoppingItem.fromJson(res.data);
        return data;
      } else {
        final functionName = getfnName('$shoppingListId/items/$id');
        final res = await supabaseClient.functions.put(
          functionName,
          body: {
            'shoppingListId': shoppingListId,
            'id': id,
            'name': name,
            'quantity': quantity,
          },
        );
        final data = ShoppingItem.fromJson(res.data);
        return data;
      }
    } on FunctionException catch (e) {
      _logger.error(e.details);
      rethrow;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<ShoppingItem> togglePurchasedShoppingItem(
    String shoppingListId, {
    required String id,
    required bool isPurchased,
  }) async {
    try {
      final functionName = getfnName('$shoppingListId/items/$id/purchased');
      final res = await supabaseClient.functions.patch(
        functionName,
        body: {
          'shoppingListId': shoppingListId,
          'id': id,
          'isPurchased': isPurchased,
        },
      );

      final data = ShoppingItem.fromJson(res.data);
      return data;
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }

  Future<void> deleteShoppingItemById(
    String shoppingListId, {
    required String id,
  }) async {
    try {
      final functionName = getfnName('$shoppingListId/items/$id');
      await supabaseClient.functions.delete(
        functionName,
      );
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }
}

extension ShoppingListFunctionsExtension on SupabaseClient {
  ShoppingListFunctions get shoppingListFuntions => ShoppingListFunctions(this);
}
