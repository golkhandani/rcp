import 'package:collection/collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension FunctionsTenancyClient on FunctionsClient {
  Future<FunctionResponse> get(
    String fn, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      path = '$path?${query.keys.map(
            (k) => query[k] == null ? null : '$k=${query[k]}',
          ).whereNotNull().join('&')}';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      body: body,
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
      path = '$path?${query.keys.map(
            (k) => query[k] == null ? null : '$k=${query[k]}',
          ).whereNotNull().join('&')}';
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
      path = '$path?${query.keys.map(
            (k) => query[k] == null ? null : '$k=${query[k]}',
          ).whereNotNull().join('&')}';
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
      path = '$path?${query.keys.map(
            (k) => query[k] == null ? null : '$k=${query[k]}',
          ).whereNotNull().join('&')}';
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
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    String path = fn;

    if (query != null) {
      path = '$path?${query.keys.map(
            (k) => query[k] == null ? null : '$k=${query[k]}',
          ).whereNotNull().join('&')}';
    }

    return await Supabase.instance.client.functions.invoke(
      path,
      body: body,
      headers: headers,
      method: HttpMethod.delete,
    );
  }
}
