import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/models/api_response.dart';
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

      final parsed = ApiResponse.tryParse<ShoppingList>(
        res.data,
        ShoppingList.fromJson,
      );

      return parsed.docs!;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<ShoppingList> getShoppingListById(
    String id,
  ) async {
    try {
      final functionName = getfnName(id);
      final res = await supabaseClient.functions.get(functionName);
      final parsed = ApiResponse.tryParse<ShoppingList>(
        res.data,
        ShoppingList.fromJson,
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

        final parsed = ApiResponse.tryParse<ShoppingList>(
          res.data,
          ShoppingList.fromJson,
        );
        return parsed.doc!;
      } else {
        final functionName = getfnName('');
        final res = await supabaseClient.functions.post(
          functionName,
          body: {
            'name': name,
            'description': description,
          },
        );
        final parsed = ApiResponse.tryParse<ShoppingList>(
          res.data,
          ShoppingList.fromJson,
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

  Future<void> deleteShoppingListById(
    String id,
  ) async {
    try {
      final functionName = getfnName(id);
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
