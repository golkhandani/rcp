import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/environment.dart';

extension FunctionsTenancyClient on FunctionsClient {
  Future<FunctionResponse> tenancyInvoke(
    String fn, {
    Map<String, dynamic>? body,
  }) async {
    final prefs = locator.get<SharedPreferences>();
    final groupId = prefs.getString(Environment.selectedGroupKey) ?? '';
    final headers = <String, String>{
      ...Supabase.instance.client.headers,
      'x-group-id': groupId,
    };

    return await Supabase.instance.client.functions.invoke(
      fn,
      body: body,
      headers: headers,
    );
  }
}
