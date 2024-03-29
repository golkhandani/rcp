// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) {
  return _ShoppingItem.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItem {
  String get id => throw _privateConstructorUsedError;
  String get shoppingListId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get quantity => throw _privateConstructorUsedError;
  UserProfile2? get purchasedBy => throw _privateConstructorUsedError;
  DateTime? get purchasedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  UserProfile2 get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingItemCopyWith<ShoppingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemCopyWith<$Res> {
  factory $ShoppingItemCopyWith(
          ShoppingItem value, $Res Function(ShoppingItem) then) =
      _$ShoppingItemCopyWithImpl<$Res, ShoppingItem>;
  @useResult
  $Res call(
      {String id,
      String shoppingListId,
      String name,
      String? quantity,
      UserProfile2? purchasedBy,
      DateTime? purchasedAt,
      DateTime createdAt,
      UserProfile2 createdBy});

  $UserProfile2CopyWith<$Res>? get purchasedBy;
  $UserProfile2CopyWith<$Res> get createdBy;
}

/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res, $Val extends ShoppingItem>
    implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shoppingListId = null,
    Object? name = null,
    Object? quantity = freezed,
    Object? purchasedBy = freezed,
    Object? purchasedAt = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingListId: null == shoppingListId
          ? _value.shoppingListId
          : shoppingListId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2?,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfile2CopyWith<$Res>? get purchasedBy {
    if (_value.purchasedBy == null) {
      return null;
    }

    return $UserProfile2CopyWith<$Res>(_value.purchasedBy!, (value) {
      return _then(_value.copyWith(purchasedBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfile2CopyWith<$Res> get createdBy {
    return $UserProfile2CopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingItemImplCopyWith<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  factory _$$ShoppingItemImplCopyWith(
          _$ShoppingItemImpl value, $Res Function(_$ShoppingItemImpl) then) =
      __$$ShoppingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String shoppingListId,
      String name,
      String? quantity,
      UserProfile2? purchasedBy,
      DateTime? purchasedAt,
      DateTime createdAt,
      UserProfile2 createdBy});

  @override
  $UserProfile2CopyWith<$Res>? get purchasedBy;
  @override
  $UserProfile2CopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$ShoppingItemImplCopyWithImpl<$Res>
    extends _$ShoppingItemCopyWithImpl<$Res, _$ShoppingItemImpl>
    implements _$$ShoppingItemImplCopyWith<$Res> {
  __$$ShoppingItemImplCopyWithImpl(
      _$ShoppingItemImpl _value, $Res Function(_$ShoppingItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shoppingListId = null,
    Object? name = null,
    Object? quantity = freezed,
    Object? purchasedBy = freezed,
    Object? purchasedAt = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
  }) {
    return _then(_$ShoppingItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingListId: null == shoppingListId
          ? _value.shoppingListId
          : shoppingListId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2?,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserProfile2,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingItemImpl extends _ShoppingItem {
  _$ShoppingItemImpl(
      {required this.id,
      required this.shoppingListId,
      required this.name,
      this.quantity,
      this.purchasedBy,
      this.purchasedAt,
      required this.createdAt,
      required this.createdBy})
      : super._();

  factory _$ShoppingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemImplFromJson(json);

  @override
  final String id;
  @override
  final String shoppingListId;
  @override
  final String name;
  @override
  final String? quantity;
  @override
  final UserProfile2? purchasedBy;
  @override
  final DateTime? purchasedAt;
  @override
  final DateTime createdAt;
  @override
  final UserProfile2 createdBy;

  @override
  String toString() {
    return 'ShoppingItem(id: $id, shoppingListId: $shoppingListId, name: $name, quantity: $quantity, purchasedBy: $purchasedBy, purchasedAt: $purchasedAt, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shoppingListId, shoppingListId) ||
                other.shoppingListId == shoppingListId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.purchasedBy, purchasedBy) ||
                other.purchasedBy == purchasedBy) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shoppingListId, name,
      quantity, purchasedBy, purchasedAt, createdAt, createdBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemImplCopyWith<_$ShoppingItemImpl> get copyWith =>
      __$$ShoppingItemImplCopyWithImpl<_$ShoppingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItem extends ShoppingItem {
  factory _ShoppingItem(
      {required final String id,
      required final String shoppingListId,
      required final String name,
      final String? quantity,
      final UserProfile2? purchasedBy,
      final DateTime? purchasedAt,
      required final DateTime createdAt,
      required final UserProfile2 createdBy}) = _$ShoppingItemImpl;
  _ShoppingItem._() : super._();

  factory _ShoppingItem.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemImpl.fromJson;

  @override
  String get id;
  @override
  String get shoppingListId;
  @override
  String get name;
  @override
  String? get quantity;
  @override
  UserProfile2? get purchasedBy;
  @override
  DateTime? get purchasedAt;
  @override
  DateTime get createdAt;
  @override
  UserProfile2 get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingItemImplCopyWith<_$ShoppingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
