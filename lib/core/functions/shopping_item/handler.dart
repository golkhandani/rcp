import 'package:collection/collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

class ShoppingItemFunctions extends SingleDomainFunctions {
  final _logger = locator.console('ShoppingListFunctions');

  ShoppingItemFunctions(SupabaseClient supabaseClient)
      : super(
          'shopping_items',
          supabaseClient,
        );

  Future<List<ShoppingItem>> getShoppingItemsByShoppingList(
    String shoppingListId,
    ListQueryState listQueryState,
  ) async {
    try {
      final functionName = getfnName('all_by_shopping_list/$shoppingListId');

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
        final functionName = getfnName(id);
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
      } else {
        final functionName = getfnName('in_shopping_list/$shoppingListId');
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
      }
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
      final functionName = getfnName('$id/purchased');
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
    String id,
  ) async {
    try {
      final functionName = getfnName('delete_shopping_item_by_id');
      await invokeDomain(
        functionName,
        body: {'id': id},
      );
    } catch (e) {
      _logger.error(e);
      rethrow;
    }
  }
}

extension ShoppingItemFunctionsExtension on SupabaseClient {
  ShoppingItemFunctions get shoppingItemsFuntions =>
      ShoppingItemFunctions(this);
}
