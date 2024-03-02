import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
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
}

extension ShoppingListFunctionsExtension on SupabaseClient {
  ShoppingListFunctions get shoppingListFuntions => ShoppingListFunctions(this);
}
