// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by')
  String get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'updated_by') String updatedBy});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdBy = null,
    Object? updatedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'updated_by') String updatedBy});
}

/// @nodoc
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdBy = null,
    Object? updatedBy = null,
  }) {
    return _then(_$GroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupImpl implements _Group {
  const _$GroupImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'updated_by') required this.updatedBy});

  factory _$GroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  @JsonKey(name: 'updated_by')
  final String updatedBy;

  @override
  String toString() {
    return 'Group(id: $id, name: $name, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, createdAt,
      updatedAt, createdBy, updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupImplToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt,
          @JsonKey(name: 'created_by') required final String createdBy,
          @JsonKey(name: 'updated_by') required final String updatedBy}) =
      _$GroupImpl;

  factory _Group.fromJson(Map<String, dynamic> json) = _$GroupImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy;
  @override
  @JsonKey(name: 'updated_by')
  String get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserGroup _$UserGroupFromJson(Map<String, dynamic> json) {
  return _UserGroup.fromJson(json);
}

/// @nodoc
mixin _$UserGroup {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  String get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_level')
  String get accessLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserGroupCopyWith<UserGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGroupCopyWith<$Res> {
  factory $UserGroupCopyWith(UserGroup value, $Res Function(UserGroup) then) =
      _$UserGroupCopyWithImpl<$Res, UserGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'group_id') String groupId,
      @JsonKey(name: 'access_level') String accessLevel,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$UserGroupCopyWithImpl<$Res, $Val extends UserGroup>
    implements $UserGroupCopyWith<$Res> {
  _$UserGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? groupId = null,
    Object? accessLevel = null,
    Object? createdAt = null,
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserGroupImplCopyWith<$Res>
    implements $UserGroupCopyWith<$Res> {
  factory _$$UserGroupImplCopyWith(
          _$UserGroupImpl value, $Res Function(_$UserGroupImpl) then) =
      __$$UserGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'group_id') String groupId,
      @JsonKey(name: 'access_level') String accessLevel,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$UserGroupImplCopyWithImpl<$Res>
    extends _$UserGroupCopyWithImpl<$Res, _$UserGroupImpl>
    implements _$$UserGroupImplCopyWith<$Res> {
  __$$UserGroupImplCopyWithImpl(
      _$UserGroupImpl _value, $Res Function(_$UserGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? groupId = null,
    Object? accessLevel = null,
    Object? createdAt = null,
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGroupImpl implements _UserGroup {
  const _$UserGroupImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'group_id') required this.groupId,
      @JsonKey(name: 'access_level') required this.accessLevel,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$UserGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGroupImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'group_id')
  final String groupId;
  @override
  @JsonKey(name: 'access_level')
  final String accessLevel;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'UserGroup(id: $id, userId: $userId, groupId: $groupId, accessLevel: $accessLevel, createdAt: $createdAt, status: $status, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, groupId, accessLevel,
      createdAt, status, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGroupImplCopyWith<_$UserGroupImpl> get copyWith =>
      __$$UserGroupImplCopyWithImpl<_$UserGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGroupImplToJson(
      this,
    );
  }
}

abstract class _UserGroup implements UserGroup {
  const factory _UserGroup(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'group_id') required final String groupId,
          @JsonKey(name: 'access_level') required final String accessLevel,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$UserGroupImpl;

  factory _UserGroup.fromJson(Map<String, dynamic> json) =
      _$UserGroupImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'group_id')
  String get groupId;
  @override
  @JsonKey(name: 'access_level')
  String get accessLevel;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserGroupImplCopyWith<_$UserGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JoinedGroup _$JoinedGroupFromJson(Map<String, dynamic> json) {
  return _JoinedGroup.fromJson(json);
}

/// @nodoc
mixin _$JoinedGroup {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinedGroupCopyWith<JoinedGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinedGroupCopyWith<$Res> {
  factory $JoinedGroupCopyWith(
          JoinedGroup value, $Res Function(JoinedGroup) then) =
      _$JoinedGroupCopyWithImpl<$Res, JoinedGroup>;
  @useResult
  $Res call({@JsonKey(name: 'user_id') String userId, Group group});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class _$JoinedGroupCopyWithImpl<$Res, $Val extends JoinedGroup>
    implements $JoinedGroupCopyWith<$Res> {
  _$JoinedGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? group = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JoinedGroupImplCopyWith<$Res>
    implements $JoinedGroupCopyWith<$Res> {
  factory _$$JoinedGroupImplCopyWith(
          _$JoinedGroupImpl value, $Res Function(_$JoinedGroupImpl) then) =
      __$$JoinedGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id') String userId, Group group});

  @override
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$JoinedGroupImplCopyWithImpl<$Res>
    extends _$JoinedGroupCopyWithImpl<$Res, _$JoinedGroupImpl>
    implements _$$JoinedGroupImplCopyWith<$Res> {
  __$$JoinedGroupImplCopyWithImpl(
      _$JoinedGroupImpl _value, $Res Function(_$JoinedGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? group = null,
  }) {
    return _then(_$JoinedGroupImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinedGroupImpl implements _JoinedGroup {
  const _$JoinedGroupImpl(
      {@JsonKey(name: 'user_id') required this.userId, required this.group});

  factory _$JoinedGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinedGroupImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final Group group;

  @override
  String toString() {
    return 'JoinedGroup(userId: $userId, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinedGroupImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinedGroupImplCopyWith<_$JoinedGroupImpl> get copyWith =>
      __$$JoinedGroupImplCopyWithImpl<_$JoinedGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinedGroupImplToJson(
      this,
    );
  }
}

abstract class _JoinedGroup implements JoinedGroup {
  const factory _JoinedGroup(
      {@JsonKey(name: 'user_id') required final String userId,
      required final Group group}) = _$JoinedGroupImpl;

  factory _JoinedGroup.fromJson(Map<String, dynamic> json) =
      _$JoinedGroupImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  Group get group;
  @override
  @JsonKey(ignore: true)
  _$$JoinedGroupImplCopyWith<_$JoinedGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvitedGroup _$InvitedGroupFromJson(Map<String, dynamic> json) {
  return _InvitedGroup.fromJson(json);
}

/// @nodoc
mixin _$InvitedGroup {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitedGroupCopyWith<InvitedGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitedGroupCopyWith<$Res> {
  factory $InvitedGroupCopyWith(
          InvitedGroup value, $Res Function(InvitedGroup) then) =
      _$InvitedGroupCopyWithImpl<$Res, InvitedGroup>;
  @useResult
  $Res call({@JsonKey(name: 'user_id') String userId, Group group});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class _$InvitedGroupCopyWithImpl<$Res, $Val extends InvitedGroup>
    implements $InvitedGroupCopyWith<$Res> {
  _$InvitedGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? group = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitedGroupImplCopyWith<$Res>
    implements $InvitedGroupCopyWith<$Res> {
  factory _$$InvitedGroupImplCopyWith(
          _$InvitedGroupImpl value, $Res Function(_$InvitedGroupImpl) then) =
      __$$InvitedGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id') String userId, Group group});

  @override
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$InvitedGroupImplCopyWithImpl<$Res>
    extends _$InvitedGroupCopyWithImpl<$Res, _$InvitedGroupImpl>
    implements _$$InvitedGroupImplCopyWith<$Res> {
  __$$InvitedGroupImplCopyWithImpl(
      _$InvitedGroupImpl _value, $Res Function(_$InvitedGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? group = null,
  }) {
    return _then(_$InvitedGroupImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitedGroupImpl implements _InvitedGroup {
  const _$InvitedGroupImpl(
      {@JsonKey(name: 'user_id') required this.userId, required this.group});

  factory _$InvitedGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitedGroupImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final Group group;

  @override
  String toString() {
    return 'InvitedGroup(userId: $userId, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitedGroupImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitedGroupImplCopyWith<_$InvitedGroupImpl> get copyWith =>
      __$$InvitedGroupImplCopyWithImpl<_$InvitedGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitedGroupImplToJson(
      this,
    );
  }
}

abstract class _InvitedGroup implements InvitedGroup {
  const factory _InvitedGroup(
      {@JsonKey(name: 'user_id') required final String userId,
      required final Group group}) = _$InvitedGroupImpl;

  factory _InvitedGroup.fromJson(Map<String, dynamic> json) =
      _$InvitedGroupImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  Group get group;
  @override
  @JsonKey(ignore: true)
  _$$InvitedGroupImplCopyWith<_$InvitedGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
