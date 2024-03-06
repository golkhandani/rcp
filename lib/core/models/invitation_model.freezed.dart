// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return _Invitation.fromJson(json);
}

/// @nodoc
mixin _$Invitation {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userProfileId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get invitedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ShoppingListSummary get shoppingList => throw _privateConstructorUsedError;
  UserProfile2 get invitedBy => throw _privateConstructorUsedError;
  UserProfile2 get createdBy => throw _privateConstructorUsedError;
  UserProfile2 get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res, Invitation>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String email,
      String userProfileId,
      String status,
      DateTime invitedAt,
      DateTime createdAt,
      DateTime updatedAt,
      ShoppingListSummary shoppingList,
      UserProfile2 invitedBy,
      UserProfile2 createdBy,
      UserProfile2 updatedBy});

  $ShoppingListSummaryCopyWith<$Res> get shoppingList;
  $UserProfile2CopyWith<$Res> get invitedBy;
  $UserProfile2CopyWith<$Res> get createdBy;
  $UserProfile2CopyWith<$Res> get updatedBy;
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res, $Val extends Invitation>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? email = null,
    Object? userProfileId = null,
    Object? status = null,
    Object? invitedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? shoppingList = null,
    Object? invitedBy = null,
    Object? createdBy = null,
    Object? updatedBy = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileId: null == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      invitedAt: null == invitedAt
          ? _value.invitedAt
          : invitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shoppingList: null == shoppingList
          ? _value.shoppingList
          : shoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingListSummary,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShoppingListSummaryCopyWith<$Res> get shoppingList {
    return $ShoppingListSummaryCopyWith<$Res>(_value.shoppingList, (value) {
      return _then(_value.copyWith(shoppingList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfile2CopyWith<$Res> get invitedBy {
    return $UserProfile2CopyWith<$Res>(_value.invitedBy, (value) {
      return _then(_value.copyWith(invitedBy: value) as $Val);
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
abstract class _$$InvitationImplCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$InvitationImplCopyWith(
          _$InvitationImpl value, $Res Function(_$InvitationImpl) then) =
      __$$InvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String email,
      String userProfileId,
      String status,
      DateTime invitedAt,
      DateTime createdAt,
      DateTime updatedAt,
      ShoppingListSummary shoppingList,
      UserProfile2 invitedBy,
      UserProfile2 createdBy,
      UserProfile2 updatedBy});

  @override
  $ShoppingListSummaryCopyWith<$Res> get shoppingList;
  @override
  $UserProfile2CopyWith<$Res> get invitedBy;
  @override
  $UserProfile2CopyWith<$Res> get createdBy;
  @override
  $UserProfile2CopyWith<$Res> get updatedBy;
}

/// @nodoc
class __$$InvitationImplCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$InvitationImpl>
    implements _$$InvitationImplCopyWith<$Res> {
  __$$InvitationImplCopyWithImpl(
      _$InvitationImpl _value, $Res Function(_$InvitationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? email = null,
    Object? userProfileId = null,
    Object? status = null,
    Object? invitedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? shoppingList = null,
    Object? invitedBy = null,
    Object? createdBy = null,
    Object? updatedBy = null,
  }) {
    return _then(_$InvitationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileId: null == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      invitedAt: null == invitedAt
          ? _value.invitedAt
          : invitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shoppingList: null == shoppingList
          ? _value.shoppingList
          : shoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingListSummary,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InvitationImpl implements _Invitation {
  _$InvitationImpl(
      {required this.id,
      required this.userId,
      required this.email,
      required this.userProfileId,
      required this.status,
      required this.invitedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.shoppingList,
      required this.invitedBy,
      required this.createdBy,
      required this.updatedBy});

  factory _$InvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String email;
  @override
  final String userProfileId;
  @override
  final String status;
  @override
  final DateTime invitedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final ShoppingListSummary shoppingList;
  @override
  final UserProfile2 invitedBy;
  @override
  final UserProfile2 createdBy;
  @override
  final UserProfile2 updatedBy;

  @override
  String toString() {
    return 'Invitation(id: $id, userId: $userId, email: $email, userProfileId: $userProfileId, status: $status, invitedAt: $invitedAt, createdAt: $createdAt, updatedAt: $updatedAt, shoppingList: $shoppingList, invitedBy: $invitedBy, createdBy: $createdBy, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userProfileId, userProfileId) ||
                other.userProfileId == userProfileId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invitedAt, invitedAt) ||
                other.invitedAt == invitedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.shoppingList, shoppingList) ||
                other.shoppingList == shoppingList) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      email,
      userProfileId,
      status,
      invitedAt,
      createdAt,
      updatedAt,
      shoppingList,
      invitedBy,
      createdBy,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationImplCopyWith<_$InvitationImpl> get copyWith =>
      __$$InvitationImplCopyWithImpl<_$InvitationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationImplToJson(
      this,
    );
  }
}

abstract class _Invitation implements Invitation {
  factory _Invitation(
      {required final String id,
      required final String userId,
      required final String email,
      required final String userProfileId,
      required final String status,
      required final DateTime invitedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final ShoppingListSummary shoppingList,
      required final UserProfile2 invitedBy,
      required final UserProfile2 createdBy,
      required final UserProfile2 updatedBy}) = _$InvitationImpl;

  factory _Invitation.fromJson(Map<String, dynamic> json) =
      _$InvitationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get email;
  @override
  String get userProfileId;
  @override
  String get status;
  @override
  DateTime get invitedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  ShoppingListSummary get shoppingList;
  @override
  UserProfile2 get invitedBy;
  @override
  UserProfile2 get createdBy;
  @override
  UserProfile2 get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$InvitationImplCopyWith<_$InvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingListSummary _$ShoppingListSummaryFromJson(Map<String, dynamic> json) {
  return _ShoppingListSummary.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListSummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListSummaryCopyWith<ShoppingListSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListSummaryCopyWith<$Res> {
  factory $ShoppingListSummaryCopyWith(
          ShoppingListSummary value, $Res Function(ShoppingListSummary) then) =
      _$ShoppingListSummaryCopyWithImpl<$Res, ShoppingListSummary>;
  @useResult
  $Res call({String id, String name, String? description});
}

/// @nodoc
class _$ShoppingListSummaryCopyWithImpl<$Res, $Val extends ShoppingListSummary>
    implements $ShoppingListSummaryCopyWith<$Res> {
  _$ShoppingListSummaryCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListSummaryImplCopyWith<$Res>
    implements $ShoppingListSummaryCopyWith<$Res> {
  factory _$$ShoppingListSummaryImplCopyWith(_$ShoppingListSummaryImpl value,
          $Res Function(_$ShoppingListSummaryImpl) then) =
      __$$ShoppingListSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? description});
}

/// @nodoc
class __$$ShoppingListSummaryImplCopyWithImpl<$Res>
    extends _$ShoppingListSummaryCopyWithImpl<$Res, _$ShoppingListSummaryImpl>
    implements _$$ShoppingListSummaryImplCopyWith<$Res> {
  __$$ShoppingListSummaryImplCopyWithImpl(_$ShoppingListSummaryImpl _value,
      $Res Function(_$ShoppingListSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$ShoppingListSummaryImpl(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingListSummaryImpl implements _ShoppingListSummary {
  _$ShoppingListSummaryImpl(
      {required this.id, required this.name, this.description});

  factory _$ShoppingListSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'ShoppingListSummary(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListSummaryImplCopyWith<_$ShoppingListSummaryImpl> get copyWith =>
      __$$ShoppingListSummaryImplCopyWithImpl<_$ShoppingListSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListSummaryImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListSummary implements ShoppingListSummary {
  factory _ShoppingListSummary(
      {required final String id,
      required final String name,
      final String? description}) = _$ShoppingListSummaryImpl;

  factory _ShoppingListSummary.fromJson(Map<String, dynamic> json) =
      _$ShoppingListSummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListSummaryImplCopyWith<_$ShoppingListSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
