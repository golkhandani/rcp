import 'package:supabase_flutter/supabase_flutter.dart';

extension FunctionsTenancyClient on FunctionsClient {
  String _getQueryString(
    Map<String, dynamic> query,
  ) {
    query.removeWhere((key, value) => value == null);

    String queryString = Uri(
      queryParameters: query.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    ).query;

    return queryString;
  }

  Future<FunctionResponse> get(
    String fn, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      path = '$path?${_getQueryString(query)}';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      headers: headers,
      method: HttpMethod.get,
    );
  }

  Future<FunctionResponse> post(
    String fn, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      path = '$path?${_getQueryString(query)}';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      body: body,
      headers: headers,
      method: HttpMethod.post,
    );
  }

  Future<FunctionResponse> put(
    String fn, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      path = '$path?${_getQueryString(query)}';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      body: body,
      headers: headers,
      method: HttpMethod.put,
    );
  }

  Future<FunctionResponse> patch(
    String fn, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      query.removeWhere((key, value) => value == null);
      String queryString = Uri(queryParameters: query).query;
      path = '$path?$queryString';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      body: body,
      headers: headers,
      method: HttpMethod.patch,
    );
  }

  Future<FunctionResponse> delete(
    String fn, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      path = '$path?${_getQueryString(query)}';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      headers: headers,
      method: HttpMethod.delete,
    );
  }
}
