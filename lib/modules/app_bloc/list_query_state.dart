import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_query_state.freezed.dart';
part 'list_query_state.g.dart';

@freezed
class ListQueryState with _$ListQueryState {
  const factory ListQueryState({
    @Default(1) int page,
    @Default(10) int pageSize,
    String? sortKey,
    @Default(SortOrder.asc) SortOrder sortOrder,
  }) = _ListQueryState;

  factory ListQueryState.fromJson(Map<String, Object?> json) =>
      _$ListQueryStateFromJson(json);
}

enum SortOrder { asc, desc }
