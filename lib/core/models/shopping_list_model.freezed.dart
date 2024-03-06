// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile2 _$UserProfile2FromJson(Map<String, dynamic> json) {
  return _UserProfile2.fromJson(json);
}

/// @nodoc
mixin _$UserProfile2 {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfile2CopyWith<UserProfile2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfile2CopyWith<$Res> {
  factory $UserProfile2CopyWith(
          UserProfile2 value, $Res Function(UserProfile2) then) =
      _$UserProfile2CopyWithImpl<$Res, UserProfile2>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String username,
      String? fullName,
      String? avatarUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserProfile2CopyWithImpl<$Res, $Val extends UserProfile2>
    implements $UserProfile2CopyWith<$Res> {
  _$UserProfile2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? username = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = null,
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
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfile2ImplCopyWith<$Res>
    implements $UserProfile2CopyWith<$Res> {
  factory _$$UserProfile2ImplCopyWith(
          _$UserProfile2Impl value, $Res Function(_$UserProfile2Impl) then) =
      __$$UserProfile2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String username,
      String? fullName,
      String? avatarUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserProfile2ImplCopyWithImpl<$Res>
    extends _$UserProfile2CopyWithImpl<$Res, _$UserProfile2Impl>
    implements _$$UserProfile2ImplCopyWith<$Res> {
  __$$UserProfile2ImplCopyWithImpl(
      _$UserProfile2Impl _value, $Res Function(_$UserProfile2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? username = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserProfile2Impl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserProfile2Impl extends _UserProfile2 {
  const _$UserProfile2Impl(
      {required this.id,
      required this.userId,
      required this.username,
      this.fullName,
      this.avatarUrl,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$UserProfile2Impl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfile2ImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String? fullName;
  @override
  final String? avatarUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserProfile2(id: $id, userId: $userId, username: $username, fullName: $fullName, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfile2Impl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, username, fullName,
      avatarUrl, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfile2ImplCopyWith<_$UserProfile2Impl> get copyWith =>
      __$$UserProfile2ImplCopyWithImpl<_$UserProfile2Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfile2ImplToJson(
      this,
    );
  }
}

abstract class _UserProfile2 extends UserProfile2 {
  const factory _UserProfile2(
      {required final String id,
      required final String userId,
      required final String username,
      final String? fullName,
      final String? avatarUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserProfile2Impl;
  const _UserProfile2._() : super._();

  factory _UserProfile2.fromJson(Map<String, dynamic> json) =
      _$UserProfile2Impl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get username;
  @override
  String? get fullName;
  @override
  String? get avatarUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserProfile2ImplCopyWith<_$UserProfile2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvitationCandidate _$InvitationCandidateFromJson(Map<String, dynamic> json) {
  return _InvitationCandidate.fromJson(json);
}

/// @nodoc
mixin _$InvitationCandidate {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationCandidateCopyWith<InvitationCandidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCandidateCopyWith<$Res> {
  factory $InvitationCandidateCopyWith(
          InvitationCandidate value, $Res Function(InvitationCandidate) then) =
      _$InvitationCandidateCopyWithImpl<$Res, InvitationCandidate>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String username,
      String email,
      String? fullName,
      String? avatarUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$InvitationCandidateCopyWithImpl<$Res, $Val extends InvitationCandidate>
    implements $InvitationCandidateCopyWith<$Res> {
  _$InvitationCandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = null,
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
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvitationCandidateImplCopyWith<$Res>
    implements $InvitationCandidateCopyWith<$Res> {
  factory _$$InvitationCandidateImplCopyWith(_$InvitationCandidateImpl value,
          $Res Function(_$InvitationCandidateImpl) then) =
      __$$InvitationCandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String username,
      String email,
      String? fullName,
      String? avatarUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$InvitationCandidateImplCopyWithImpl<$Res>
    extends _$InvitationCandidateCopyWithImpl<$Res, _$InvitationCandidateImpl>
    implements _$$InvitationCandidateImplCopyWith<$Res> {
  __$$InvitationCandidateImplCopyWithImpl(_$InvitationCandidateImpl _value,
      $Res Function(_$InvitationCandidateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$InvitationCandidateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InvitationCandidateImpl extends _InvitationCandidate {
  const _$InvitationCandidateImpl(
      {required this.id,
      required this.userId,
      required this.username,
      required this.email,
      this.fullName,
      this.avatarUrl,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$InvitationCandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationCandidateImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String email;
  @override
  final String? fullName;
  @override
  final String? avatarUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'InvitationCandidate(id: $id, userId: $userId, username: $username, email: $email, fullName: $fullName, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationCandidateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, username, email,
      fullName, avatarUrl, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationCandidateImplCopyWith<_$InvitationCandidateImpl> get copyWith =>
      __$$InvitationCandidateImplCopyWithImpl<_$InvitationCandidateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationCandidateImplToJson(
      this,
    );
  }
}

abstract class _InvitationCandidate extends InvitationCandidate {
  const factory _InvitationCandidate(
      {required final String id,
      required final String userId,
      required final String username,
      required final String email,
      final String? fullName,
      final String? avatarUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$InvitationCandidateImpl;
  const _InvitationCandidate._() : super._();

  factory _InvitationCandidate.fromJson(Map<String, dynamic> json) =
      _$InvitationCandidateImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get username;
  @override
  String get email;
  @override
  String? get fullName;
  @override
  String? get avatarUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$InvitationCandidateImplCopyWith<_$InvitationCandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingListResponse _$ShoppingListResponseFromJson(Map<String, dynamic> json) {
  return _ShoppingListResponse.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListResponse {
  List<ShoppingList> get shoppingLists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListResponseCopyWith<ShoppingListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListResponseCopyWith<$Res> {
  factory $ShoppingListResponseCopyWith(ShoppingListResponse value,
          $Res Function(ShoppingListResponse) then) =
      _$ShoppingListResponseCopyWithImpl<$Res, ShoppingListResponse>;
  @useResult
  $Res call({List<ShoppingList> shoppingLists});
}

/// @nodoc
class _$ShoppingListResponseCopyWithImpl<$Res,
        $Val extends ShoppingListResponse>
    implements $ShoppingListResponseCopyWith<$Res> {
  _$ShoppingListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingLists = null,
  }) {
    return _then(_value.copyWith(
      shoppingLists: null == shoppingLists
          ? _value.shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListResponseImplCopyWith<$Res>
    implements $ShoppingListResponseCopyWith<$Res> {
  factory _$$ShoppingListResponseImplCopyWith(_$ShoppingListResponseImpl value,
          $Res Function(_$ShoppingListResponseImpl) then) =
      __$$ShoppingListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShoppingList> shoppingLists});
}

/// @nodoc
class __$$ShoppingListResponseImplCopyWithImpl<$Res>
    extends _$ShoppingListResponseCopyWithImpl<$Res, _$ShoppingListResponseImpl>
    implements _$$ShoppingListResponseImplCopyWith<$Res> {
  __$$ShoppingListResponseImplCopyWithImpl(_$ShoppingListResponseImpl _value,
      $Res Function(_$ShoppingListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingLists = null,
  }) {
    return _then(_$ShoppingListResponseImpl(
      shoppingLists: null == shoppingLists
          ? _value._shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingListResponseImpl implements _ShoppingListResponse {
  _$ShoppingListResponseImpl({required final List<ShoppingList> shoppingLists})
      : _shoppingLists = shoppingLists;

  factory _$ShoppingListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListResponseImplFromJson(json);

  final List<ShoppingList> _shoppingLists;
  @override
  List<ShoppingList> get shoppingLists {
    if (_shoppingLists is EqualUnmodifiableListView) return _shoppingLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingLists);
  }

  @override
  String toString() {
    return 'ShoppingListResponse(shoppingLists: $shoppingLists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._shoppingLists, _shoppingLists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_shoppingLists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListResponseImplCopyWith<_$ShoppingListResponseImpl>
      get copyWith =>
          __$$ShoppingListResponseImplCopyWithImpl<_$ShoppingListResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListResponseImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListResponse implements ShoppingListResponse {
  factory _ShoppingListResponse(
          {required final List<ShoppingList> shoppingLists}) =
      _$ShoppingListResponseImpl;

  factory _ShoppingListResponse.fromJson(Map<String, dynamic> json) =
      _$ShoppingListResponseImpl.fromJson;

  @override
  List<ShoppingList> get shoppingLists;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListResponseImplCopyWith<_$ShoppingListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) {
  return _ShoppingList.fromJson(json);
}

/// @nodoc
mixin _$ShoppingList {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Participant> get participants => throw _privateConstructorUsedError;
  List<ShoppingItem> get items => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  UserProfile2 get ownerId => throw _privateConstructorUsedError;
  UserProfile2 get createdBy => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  UserProfile2 get updatedBy => throw _privateConstructorUsedError;
  bool get isOwner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListCopyWith<ShoppingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListCopyWith<$Res> {
  factory $ShoppingListCopyWith(
          ShoppingList value, $Res Function(ShoppingList) then) =
      _$ShoppingListCopyWithImpl<$Res, ShoppingList>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      List<Participant> participants,
      List<ShoppingItem> items,
      DateTime createdAt,
      UserProfile2 ownerId,
      UserProfile2 createdBy,
      DateTime updatedAt,
      UserProfile2 updatedBy,
      bool isOwner});

  $UserProfile2CopyWith<$Res> get ownerId;
  $UserProfile2CopyWith<$Res> get createdBy;
  $UserProfile2CopyWith<$Res> get updatedBy;
}

/// @nodoc
class _$ShoppingListCopyWithImpl<$Res, $Val extends ShoppingList>
    implements $ShoppingListCopyWith<$Res> {
  _$ShoppingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? participants = null,
    Object? items = null,
    Object? createdAt = null,
    Object? ownerId = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? updatedBy = null,
    Object? isOwner = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfile2CopyWith<$Res> get ownerId {
    return $UserProfile2CopyWith<$Res>(_value.ownerId, (value) {
      return _then(_value.copyWith(ownerId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfile2CopyWith<$Res> get createdBy {
    return $UserProfile2CopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfile2CopyWith<$Res> get updatedBy {
    return $UserProfile2CopyWith<$Res>(_value.updatedBy, (value) {
      return _then(_value.copyWith(updatedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingListImplCopyWith<$Res>
    implements $ShoppingListCopyWith<$Res> {
  factory _$$ShoppingListImplCopyWith(
          _$ShoppingListImpl value, $Res Function(_$ShoppingListImpl) then) =
      __$$ShoppingListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      List<Participant> participants,
      List<ShoppingItem> items,
      DateTime createdAt,
      UserProfile2 ownerId,
      UserProfile2 createdBy,
      DateTime updatedAt,
      UserProfile2 updatedBy,
      bool isOwner});

  @override
  $UserProfile2CopyWith<$Res> get ownerId;
  @override
  $UserProfile2CopyWith<$Res> get createdBy;
  @override
  $UserProfile2CopyWith<$Res> get updatedBy;
}

/// @nodoc
class __$$ShoppingListImplCopyWithImpl<$Res>
    extends _$ShoppingListCopyWithImpl<$Res, _$ShoppingListImpl>
    implements _$$ShoppingListImplCopyWith<$Res> {
  __$$ShoppingListImplCopyWithImpl(
      _$ShoppingListImpl _value, $Res Function(_$ShoppingListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? participants = null,
    Object? items = null,
    Object? createdAt = null,
    Object? ownerId = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? updatedBy = null,
    Object? isOwner = null,
  }) {
    return _then(_$ShoppingListImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingListImpl implements _ShoppingList {
  _$ShoppingListImpl(
      {required this.id,
      required this.name,
      this.description,
      required final List<Participant> participants,
      required final List<ShoppingItem> items,
      required this.createdAt,
      required this.ownerId,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy,
      required this.isOwner})
      : _participants = participants,
        _items = items;

  factory _$ShoppingListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  final List<Participant> _participants;
  @override
  List<Participant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<ShoppingItem> _items;
  @override
  List<ShoppingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime createdAt;
  @override
  final UserProfile2 ownerId;
  @override
  final UserProfile2 createdBy;
  @override
  final DateTime updatedAt;
  @override
  final UserProfile2 updatedBy;
  @override
  final bool isOwner;

  @override
  String toString() {
    return 'ShoppingList(id: $id, name: $name, description: $description, participants: $participants, items: $items, createdAt: $createdAt, ownerId: $ownerId, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, isOwner: $isOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_items),
      createdAt,
      ownerId,
      createdBy,
      updatedAt,
      updatedBy,
      isOwner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListImplCopyWith<_$ShoppingListImpl> get copyWith =>
      __$$ShoppingListImplCopyWithImpl<_$ShoppingListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListImplToJson(
      this,
    );
  }
}

abstract class _ShoppingList implements ShoppingList {
  factory _ShoppingList(
      {required final String id,
      required final String name,
      final String? description,
      required final List<Participant> participants,
      required final List<ShoppingItem> items,
      required final DateTime createdAt,
      required final UserProfile2 ownerId,
      required final UserProfile2 createdBy,
      required final DateTime updatedAt,
      required final UserProfile2 updatedBy,
      required final bool isOwner}) = _$ShoppingListImpl;

  factory _ShoppingList.fromJson(Map<String, dynamic> json) =
      _$ShoppingListImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  List<Participant> get participants;
  @override
  List<ShoppingItem> get items;
  @override
  DateTime get createdAt;
  @override
  UserProfile2 get ownerId;
  @override
  UserProfile2 get createdBy;
  @override
  DateTime get updatedAt;
  @override
  UserProfile2 get updatedBy;
  @override
  bool get isOwner;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListImplCopyWith<_$ShoppingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
