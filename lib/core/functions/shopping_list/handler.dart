import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/shopping_list/participants_functions.dart';
import 'package:rcp/core/functions/shopping_list/shopping_items_functions.dart';
import 'package:rcp/core/functions/shopping_list/shopping_list_functions.dart';

extension ShoppingListFunctionsExtension on SupabaseClient {
  ShoppingListFunctions get shoppingListFuntions => ShoppingListFunctions(this);

  ParticipantsFunctions get participantsFunctions =>
      ParticipantsFunctions(this);

  ShoppingItemsFunctions get shoppingItemsFunctions =>
      ShoppingItemsFunctions(this);
}
