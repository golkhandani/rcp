// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_query_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListQueryStateImpl _$$ListQueryStateImplFromJson(Map<String, dynamic> json) =>
    _$ListQueryStateImpl(
      page: json['page'] as int? ?? 1,
      pageSize: json['pageSize'] as int? ?? 10,
      sortKey: json['sortKey'] as String?,
      sortOrder: $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']) ??
          SortOrder.asc,
    );

Map<String, dynamic> _$$ListQueryStateImplToJson(
        _$ListQueryStateImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'sortKey': instance.sortKey,
      'sortOrder': _$SortOrderEnumMap[instance.sortOrder]!,
    };

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};
