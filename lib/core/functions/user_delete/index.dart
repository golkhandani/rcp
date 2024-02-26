// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';

const user_delete = 'user_delete';

extension UserProfileFunctions on SupabaseClient {
  Future<void> userDelete() async {
    try {
      await functions.invoke(user_delete);
    } catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }
}
