import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SingleDomainFunctions {
  final String _domain;
  final SupabaseClient supabaseClient;
  String getfnName(String fn) => '$_domain/$fn';
  SingleDomainFunctions(this._domain, this.supabaseClient);

  Future<FunctionResponse> invokeDomain(
    String fnName, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    HttpMethod method = HttpMethod.post,
  }) async {
    final headers = <String, String>{
      ...supabaseClient.headers,
      'x-function-name': fnName,
    };
    return await supabaseClient.functions.invoke(
      _domain,
      body: body,
      headers: headers,
      method: method,
    );
  }
}
