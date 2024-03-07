class ApiError extends Error {
  final String message;
  final int statusCode;
  final int errorCode;

  ApiError({
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  static ApiError unknown() {
    return ApiError(
      message: 'Something went wrong!',
      statusCode: 500,
      errorCode: 90500,
    );
  }

  static ApiError? tryParse(dynamic json) {
    if (json == null) {
      return null;
    }
    return ApiError(
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }
}

class ApiResponse<T> {
  final List<T>? docs;
  final T? doc;
  final ApiError? error;
  final int status;

  ApiResponse({
    required this.docs,
    required this.doc,
    required this.error,
    required this.status,
  });

  static ApiResponse tryParseError(dynamic json) {
    return ApiResponse(
      docs: null,
      doc: null,
      error: ApiError.tryParse(json['error']) ?? ApiError.unknown(),
      status: json['status'] ?? 200,
    );
  }

  static ApiResponse<T> tryParse<T>(
      dynamic json, T Function(Map<String, dynamic> dataJson)? dataParser) {
    final error = ApiError.tryParse(json['error']);

    List<T>? docs;
    if (json['docs'] != null && json['docs'] is List && dataParser != null) {
      docs = (json['docs'] as List<dynamic>).map((e) => dataParser(e)).toList();
    }

    T? doc;
    if (json['doc'] != null && dataParser != null) {
      doc = dataParser(json['doc']);
    }

    return ApiResponse(
      docs: docs,
      doc: doc,
      error: error,
      status: json['status'] ?? 200,
    );
  }
}
