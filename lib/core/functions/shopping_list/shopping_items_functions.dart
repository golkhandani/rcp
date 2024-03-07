import 'package:collection/collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/models/api_response.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

class ShoppingItemsFunctions extends SingleDomainFunctions {
  final _logger = locator.console('ShoppingItemsFunctions');

  ShoppingItemsFunctions(SupabaseClient supabaseClient)
      : super(
          'shopping_lists',
          supabaseClient,
        );

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
      final parsed = ApiResponse.tryParse<ShoppingItem>(
        res.data,
        ShoppingItem.fromJson,
      );

      return parsed.docs!.sorted(
        (a, b) => b.isPurchased ? 0 : 1,
      );
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<ShoppingItem> addOrUpdateShoppingItem(
    String shoppingListId, {
    required String? id,
    required String name,
    required String? quantity,
  }) async {
    try {
      if (id == null) {
        final functionName = getfnName('$shoppingListId/items');
        final res = await supabaseClient.functions.post(
          functionName,
          body: {
            'name': name,
            'quantity': quantity,
          },
        );
        final parsed = ApiResponse.tryParse<ShoppingItem>(
          res.data,
          ShoppingItem.fromJson,
        );

        return parsed.doc!;
      } else {
        final functionName = getfnName('$shoppingListId/items/$id');
        final res = await supabaseClient.functions.put(
          functionName,
          body: {
            'name': name,
            'quantity': quantity,
          },
        );
        final parsed = ApiResponse.tryParse<ShoppingItem>(
          res.data,
          ShoppingItem.fromJson,
        );

        return parsed.doc!;
      }
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
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

      final parsed = ApiResponse.tryParse<ShoppingItem>(
        res.data,
        ShoppingItem.fromJson,
      );

      return parsed.doc!;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
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
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }
}
