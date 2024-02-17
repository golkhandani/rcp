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

JoinInvitedGroupReq _$JoinInvitedGroupReqFromJson(Map<String, dynamic> json) {
  return _JoinInvitedGroupReq.fromJson(json);
}

/// @nodoc
mixin _$JoinInvitedGroupReq {
  JoinedGroup get joinedGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinInvitedGroupReqCopyWith<JoinInvitedGroupReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinInvitedGroupReqCopyWith<$Res> {
  factory $JoinInvitedGroupReqCopyWith(
          JoinInvitedGroupReq value, $Res Function(JoinInvitedGroupReq) then) =
      _$JoinInvitedGroupReqCopyWithImpl<$Res, JoinInvitedGroupReq>;
  @useResult
  $Res call({JoinedGroup joinedGroup});

  $JoinedGroupCopyWith<$Res> get joinedGroup;
}

/// @nodoc
class _$JoinInvitedGroupReqCopyWithImpl<$Res, $Val extends JoinInvitedGroupReq>
    implements $JoinInvitedGroupReqCopyWith<$Res> {
  _$JoinInvitedGroupReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedGroup = null,
  }) {
    return _then(_value.copyWith(
      joinedGroup: null == joinedGroup
          ? _value.joinedGroup
          : joinedGroup // ignore: cast_nullable_to_non_nullable
              as JoinedGroup,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JoinedGroupCopyWith<$Res> get joinedGroup {
    return $JoinedGroupCopyWith<$Res>(_value.joinedGroup, (value) {
      return _then(_value.copyWith(joinedGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JoinInvitedGroupReqImplCopyWith<$Res>
    implements $JoinInvitedGroupReqCopyWith<$Res> {
  factory _$$JoinInvitedGroupReqImplCopyWith(_$JoinInvitedGroupReqImpl value,
          $Res Function(_$JoinInvitedGroupReqImpl) then) =
      __$$JoinInvitedGroupReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JoinedGroup joinedGroup});

  @override
  $JoinedGroupCopyWith<$Res> get joinedGroup;
}

/// @nodoc
class __$$JoinInvitedGroupReqImplCopyWithImpl<$Res>
    extends _$JoinInvitedGroupReqCopyWithImpl<$Res, _$JoinInvitedGroupReqImpl>
    implements _$$JoinInvitedGroupReqImplCopyWith<$Res> {
  __$$JoinInvitedGroupReqImplCopyWithImpl(_$JoinInvitedGroupReqImpl _value,
      $Res Function(_$JoinInvitedGroupReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedGroup = null,
  }) {
    return _then(_$JoinInvitedGroupReqImpl(
      joinedGroup: null == joinedGroup
          ? _value.joinedGroup
          : joinedGroup // ignore: cast_nullable_to_non_nullable
              as JoinedGroup,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinInvitedGroupReqImpl implements _JoinInvitedGroupReq {
  const _$JoinInvitedGroupReqImpl({required this.joinedGroup});

  factory _$JoinInvitedGroupReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinInvitedGroupReqImplFromJson(json);

  @override
  final JoinedGroup joinedGroup;

  @override
  String toString() {
    return 'JoinInvitedGroupReq(joinedGroup: $joinedGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinInvitedGroupReqImpl &&
            (identical(other.joinedGroup, joinedGroup) ||
                other.joinedGroup == joinedGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, joinedGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinInvitedGroupReqImplCopyWith<_$JoinInvitedGroupReqImpl> get copyWith =>
      __$$JoinInvitedGroupReqImplCopyWithImpl<_$JoinInvitedGroupReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinInvitedGroupReqImplToJson(
      this,
    );
  }
}

abstract class _JoinInvitedGroupReq implements JoinInvitedGroupReq {
  const factory _JoinInvitedGroupReq({required final JoinedGroup joinedGroup}) =
      _$JoinInvitedGroupReqImpl;

  factory _JoinInvitedGroupReq.fromJson(Map<String, dynamic> json) =
      _$JoinInvitedGroupReqImpl.fromJson;

  @override
  JoinedGroup get joinedGroup;
  @override
  @JsonKey(ignore: true)
  _$$JoinInvitedGroupReqImplCopyWith<_$JoinInvitedGroupReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
