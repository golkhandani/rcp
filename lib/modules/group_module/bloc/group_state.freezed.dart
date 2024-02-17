// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupState _$GroupStateFromJson(Map<String, dynamic> json) {
  return _GroupState.fromJson(json);
}

/// @nodoc
mixin _$GroupState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Group> get joinedGroups => throw _privateConstructorUsedError;
  List<Group> get pendingGroups => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupStateCopyWith<GroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupStateCopyWith<$Res> {
  factory $GroupStateCopyWith(
          GroupState value, $Res Function(GroupState) then) =
      _$GroupStateCopyWithImpl<$Res, GroupState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Group> joinedGroups,
      List<Group> pendingGroups,
      String? groupId});
}

/// @nodoc
class _$GroupStateCopyWithImpl<$Res, $Val extends GroupState>
    implements $GroupStateCopyWith<$Res> {
  _$GroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? joinedGroups = null,
    Object? pendingGroups = null,
    Object? groupId = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      joinedGroups: null == joinedGroups
          ? _value.joinedGroups
          : joinedGroups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      pendingGroups: null == pendingGroups
          ? _value.pendingGroups
          : pendingGroups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupStateImplCopyWith<$Res>
    implements $GroupStateCopyWith<$Res> {
  factory _$$GroupStateImplCopyWith(
          _$GroupStateImpl value, $Res Function(_$GroupStateImpl) then) =
      __$$GroupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Group> joinedGroups,
      List<Group> pendingGroups,
      String? groupId});
}

/// @nodoc
class __$$GroupStateImplCopyWithImpl<$Res>
    extends _$GroupStateCopyWithImpl<$Res, _$GroupStateImpl>
    implements _$$GroupStateImplCopyWith<$Res> {
  __$$GroupStateImplCopyWithImpl(
      _$GroupStateImpl _value, $Res Function(_$GroupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? joinedGroups = null,
    Object? pendingGroups = null,
    Object? groupId = freezed,
  }) {
    return _then(_$GroupStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      joinedGroups: null == joinedGroups
          ? _value._joinedGroups
          : joinedGroups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      pendingGroups: null == pendingGroups
          ? _value._pendingGroups
          : pendingGroups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupStateImpl with DiagnosticableTreeMixin implements _GroupState {
  const _$GroupStateImpl(
      {required this.isLoading,
      required final List<Group> joinedGroups,
      required final List<Group> pendingGroups,
      this.groupId})
      : _joinedGroups = joinedGroups,
        _pendingGroups = pendingGroups;

  factory _$GroupStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupStateImplFromJson(json);

  @override
  final bool isLoading;
  final List<Group> _joinedGroups;
  @override
  List<Group> get joinedGroups {
    if (_joinedGroups is EqualUnmodifiableListView) return _joinedGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinedGroups);
  }

  final List<Group> _pendingGroups;
  @override
  List<Group> get pendingGroups {
    if (_pendingGroups is EqualUnmodifiableListView) return _pendingGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingGroups);
  }

  @override
  final String? groupId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupState(isLoading: $isLoading, joinedGroups: $joinedGroups, pendingGroups: $pendingGroups, groupId: $groupId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('joinedGroups', joinedGroups))
      ..add(DiagnosticsProperty('pendingGroups', pendingGroups))
      ..add(DiagnosticsProperty('groupId', groupId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._joinedGroups, _joinedGroups) &&
            const DeepCollectionEquality()
                .equals(other._pendingGroups, _pendingGroups) &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_joinedGroups),
      const DeepCollectionEquality().hash(_pendingGroups),
      groupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupStateImplCopyWith<_$GroupStateImpl> get copyWith =>
      __$$GroupStateImplCopyWithImpl<_$GroupStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupStateImplToJson(
      this,
    );
  }
}

abstract class _GroupState implements GroupState {
  const factory _GroupState(
      {required final bool isLoading,
      required final List<Group> joinedGroups,
      required final List<Group> pendingGroups,
      final String? groupId}) = _$GroupStateImpl;

  factory _GroupState.fromJson(Map<String, dynamic> json) =
      _$GroupStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  List<Group> get joinedGroups;
  @override
  List<Group> get pendingGroups;
  @override
  String? get groupId;
  @override
  @JsonKey(ignore: true)
  _$$GroupStateImplCopyWith<_$GroupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
