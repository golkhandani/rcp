// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListQueryState _$ListQueryStateFromJson(Map<String, dynamic> json) {
  return _ListQueryState.fromJson(json);
}

/// @nodoc
mixin _$ListQueryState {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  String? get sortKey => throw _privateConstructorUsedError;
  SortOrder get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListQueryStateCopyWith<ListQueryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListQueryStateCopyWith<$Res> {
  factory $ListQueryStateCopyWith(
          ListQueryState value, $Res Function(ListQueryState) then) =
      _$ListQueryStateCopyWithImpl<$Res, ListQueryState>;
  @useResult
  $Res call({int page, int pageSize, String? sortKey, SortOrder sortOrder});
}

/// @nodoc
class _$ListQueryStateCopyWithImpl<$Res, $Val extends ListQueryState>
    implements $ListQueryStateCopyWith<$Res> {
  _$ListQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? sortKey = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      sortKey: freezed == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListQueryStateImplCopyWith<$Res>
    implements $ListQueryStateCopyWith<$Res> {
  factory _$$ListQueryStateImplCopyWith(_$ListQueryStateImpl value,
          $Res Function(_$ListQueryStateImpl) then) =
      __$$ListQueryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int pageSize, String? sortKey, SortOrder sortOrder});
}

/// @nodoc
class __$$ListQueryStateImplCopyWithImpl<$Res>
    extends _$ListQueryStateCopyWithImpl<$Res, _$ListQueryStateImpl>
    implements _$$ListQueryStateImplCopyWith<$Res> {
  __$$ListQueryStateImplCopyWithImpl(
      _$ListQueryStateImpl _value, $Res Function(_$ListQueryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? sortKey = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_$ListQueryStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      sortKey: freezed == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListQueryStateImpl
    with DiagnosticableTreeMixin
    implements _ListQueryState {
  const _$ListQueryStateImpl(
      {this.page = 1,
      this.pageSize = 10,
      this.sortKey,
      this.sortOrder = SortOrder.asc});

  factory _$ListQueryStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListQueryStateImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  final String? sortKey;
  @override
  @JsonKey()
  final SortOrder sortOrder;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListQueryState(page: $page, pageSize: $pageSize, sortKey: $sortKey, sortOrder: $sortOrder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListQueryState'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('sortKey', sortKey))
      ..add(DiagnosticsProperty('sortOrder', sortOrder));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListQueryStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, sortKey, sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListQueryStateImplCopyWith<_$ListQueryStateImpl> get copyWith =>
      __$$ListQueryStateImplCopyWithImpl<_$ListQueryStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListQueryStateImplToJson(
      this,
    );
  }
}

abstract class _ListQueryState implements ListQueryState {
  const factory _ListQueryState(
      {final int page,
      final int pageSize,
      final String? sortKey,
      final SortOrder sortOrder}) = _$ListQueryStateImpl;

  factory _ListQueryState.fromJson(Map<String, dynamic> json) =
      _$ListQueryStateImpl.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  String? get sortKey;
  @override
  SortOrder get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$ListQueryStateImplCopyWith<_$ListQueryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
