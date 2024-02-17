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

CreateNewGroupReq _$CreateNewGroupReqFromJson(Map<String, dynamic> json) {
  return _CreateNewGroupReq.fromJson(json);
}

/// @nodoc
mixin _$CreateNewGroupReq {
  Group get group => throw _privateConstructorUsedError;
  UserGroup get userGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNewGroupReqCopyWith<CreateNewGroupReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewGroupReqCopyWith<$Res> {
  factory $CreateNewGroupReqCopyWith(
          CreateNewGroupReq value, $Res Function(CreateNewGroupReq) then) =
      _$CreateNewGroupReqCopyWithImpl<$Res, CreateNewGroupReq>;
  @useResult
  $Res call({Group group, UserGroup userGroup});

  $GroupCopyWith<$Res> get group;
  $UserGroupCopyWith<$Res> get userGroup;
}

/// @nodoc
class _$CreateNewGroupReqCopyWithImpl<$Res, $Val extends CreateNewGroupReq>
    implements $CreateNewGroupReqCopyWith<$Res> {
  _$CreateNewGroupReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? userGroup = null,
  }) {
    return _then(_value.copyWith(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      userGroup: null == userGroup
          ? _value.userGroup
          : userGroup // ignore: cast_nullable_to_non_nullable
              as UserGroup,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserGroupCopyWith<$Res> get userGroup {
    return $UserGroupCopyWith<$Res>(_value.userGroup, (value) {
      return _then(_value.copyWith(userGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateNewGroupReqImplCopyWith<$Res>
    implements $CreateNewGroupReqCopyWith<$Res> {
  factory _$$CreateNewGroupReqImplCopyWith(_$CreateNewGroupReqImpl value,
          $Res Function(_$CreateNewGroupReqImpl) then) =
      __$$CreateNewGroupReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Group group, UserGroup userGroup});

  @override
  $GroupCopyWith<$Res> get group;
  @override
  $UserGroupCopyWith<$Res> get userGroup;
}

/// @nodoc
class __$$CreateNewGroupReqImplCopyWithImpl<$Res>
    extends _$CreateNewGroupReqCopyWithImpl<$Res, _$CreateNewGroupReqImpl>
    implements _$$CreateNewGroupReqImplCopyWith<$Res> {
  __$$CreateNewGroupReqImplCopyWithImpl(_$CreateNewGroupReqImpl _value,
      $Res Function(_$CreateNewGroupReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? userGroup = null,
  }) {
    return _then(_$CreateNewGroupReqImpl(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      userGroup: null == userGroup
          ? _value.userGroup
          : userGroup // ignore: cast_nullable_to_non_nullable
              as UserGroup,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateNewGroupReqImpl implements _CreateNewGroupReq {
  const _$CreateNewGroupReqImpl({required this.group, required this.userGroup});

  factory _$CreateNewGroupReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateNewGroupReqImplFromJson(json);

  @override
  final Group group;
  @override
  final UserGroup userGroup;

  @override
  String toString() {
    return 'CreateNewGroupReq(group: $group, userGroup: $userGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewGroupReqImpl &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.userGroup, userGroup) ||
                other.userGroup == userGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, group, userGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewGroupReqImplCopyWith<_$CreateNewGroupReqImpl> get copyWith =>
      __$$CreateNewGroupReqImplCopyWithImpl<_$CreateNewGroupReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateNewGroupReqImplToJson(
      this,
    );
  }
}

abstract class _CreateNewGroupReq implements CreateNewGroupReq {
  const factory _CreateNewGroupReq(
      {required final Group group,
      required final UserGroup userGroup}) = _$CreateNewGroupReqImpl;

  factory _CreateNewGroupReq.fromJson(Map<String, dynamic> json) =
      _$CreateNewGroupReqImpl.fromJson;

  @override
  Group get group;
  @override
  UserGroup get userGroup;
  @override
  @JsonKey(ignore: true)
  _$$CreateNewGroupReqImplCopyWith<_$CreateNewGroupReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
