// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserGroupsReq _$GetUserGroupsReqFromJson(Map<String, dynamic> json) {
  return _GetUserGroupsReq.fromJson(json);
}

/// @nodoc
mixin _$GetUserGroupsReq {
  List<JoinedGroup> get joinedGroups => throw _privateConstructorUsedError;
  List<InvitedGroup> get invitedGroups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserGroupsReqCopyWith<GetUserGroupsReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserGroupsReqCopyWith<$Res> {
  factory $GetUserGroupsReqCopyWith(
          GetUserGroupsReq value, $Res Function(GetUserGroupsReq) then) =
      _$GetUserGroupsReqCopyWithImpl<$Res, GetUserGroupsReq>;
  @useResult
  $Res call({List<JoinedGroup> joinedGroups, List<InvitedGroup> invitedGroups});
}

/// @nodoc
class _$GetUserGroupsReqCopyWithImpl<$Res, $Val extends GetUserGroupsReq>
    implements $GetUserGroupsReqCopyWith<$Res> {
  _$GetUserGroupsReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedGroups = null,
    Object? invitedGroups = null,
  }) {
    return _then(_value.copyWith(
      joinedGroups: null == joinedGroups
          ? _value.joinedGroups
          : joinedGroups // ignore: cast_nullable_to_non_nullable
              as List<JoinedGroup>,
      invitedGroups: null == invitedGroups
          ? _value.invitedGroups
          : invitedGroups // ignore: cast_nullable_to_non_nullable
              as List<InvitedGroup>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserGroupsReqImplCopyWith<$Res>
    implements $GetUserGroupsReqCopyWith<$Res> {
  factory _$$GetUserGroupsReqImplCopyWith(_$GetUserGroupsReqImpl value,
          $Res Function(_$GetUserGroupsReqImpl) then) =
      __$$GetUserGroupsReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JoinedGroup> joinedGroups, List<InvitedGroup> invitedGroups});
}

/// @nodoc
class __$$GetUserGroupsReqImplCopyWithImpl<$Res>
    extends _$GetUserGroupsReqCopyWithImpl<$Res, _$GetUserGroupsReqImpl>
    implements _$$GetUserGroupsReqImplCopyWith<$Res> {
  __$$GetUserGroupsReqImplCopyWithImpl(_$GetUserGroupsReqImpl _value,
      $Res Function(_$GetUserGroupsReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedGroups = null,
    Object? invitedGroups = null,
  }) {
    return _then(_$GetUserGroupsReqImpl(
      joinedGroups: null == joinedGroups
          ? _value._joinedGroups
          : joinedGroups // ignore: cast_nullable_to_non_nullable
              as List<JoinedGroup>,
      invitedGroups: null == invitedGroups
          ? _value._invitedGroups
          : invitedGroups // ignore: cast_nullable_to_non_nullable
              as List<InvitedGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserGroupsReqImpl implements _GetUserGroupsReq {
  const _$GetUserGroupsReqImpl(
      {required final List<JoinedGroup> joinedGroups,
      required final List<InvitedGroup> invitedGroups})
      : _joinedGroups = joinedGroups,
        _invitedGroups = invitedGroups;

  factory _$GetUserGroupsReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserGroupsReqImplFromJson(json);

  final List<JoinedGroup> _joinedGroups;
  @override
  List<JoinedGroup> get joinedGroups {
    if (_joinedGroups is EqualUnmodifiableListView) return _joinedGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinedGroups);
  }

  final List<InvitedGroup> _invitedGroups;
  @override
  List<InvitedGroup> get invitedGroups {
    if (_invitedGroups is EqualUnmodifiableListView) return _invitedGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitedGroups);
  }

  @override
  String toString() {
    return 'GetUserGroupsReq(joinedGroups: $joinedGroups, invitedGroups: $invitedGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserGroupsReqImpl &&
            const DeepCollectionEquality()
                .equals(other._joinedGroups, _joinedGroups) &&
            const DeepCollectionEquality()
                .equals(other._invitedGroups, _invitedGroups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_joinedGroups),
      const DeepCollectionEquality().hash(_invitedGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserGroupsReqImplCopyWith<_$GetUserGroupsReqImpl> get copyWith =>
      __$$GetUserGroupsReqImplCopyWithImpl<_$GetUserGroupsReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserGroupsReqImplToJson(
      this,
    );
  }
}

abstract class _GetUserGroupsReq implements GetUserGroupsReq {
  const factory _GetUserGroupsReq(
          {required final List<JoinedGroup> joinedGroups,
          required final List<InvitedGroup> invitedGroups}) =
      _$GetUserGroupsReqImpl;

  factory _GetUserGroupsReq.fromJson(Map<String, dynamic> json) =
      _$GetUserGroupsReqImpl.fromJson;

  @override
  List<JoinedGroup> get joinedGroups;
  @override
  List<InvitedGroup> get invitedGroups;
  @override
  @JsonKey(ignore: true)
  _$$GetUserGroupsReqImplCopyWith<_$GetUserGroupsReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
