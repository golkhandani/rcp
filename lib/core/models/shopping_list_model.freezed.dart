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

ShoppingListModel _$ShoppingListModelFromJson(Map<String, dynamic> json) {
  return _ShoppingListModel.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get participantNames => throw _privateConstructorUsedError;
  List<String> get itemNames => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListModelCopyWith<ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListModelCopyWith<$Res> {
  factory $ShoppingListModelCopyWith(
          ShoppingListModel value, $Res Function(ShoppingListModel) then) =
      _$ShoppingListModelCopyWithImpl<$Res, ShoppingListModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      List<String> participantNames,
      List<String> itemNames,
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      String updatedBy});
}

/// @nodoc
class _$ShoppingListModelCopyWithImpl<$Res, $Val extends ShoppingListModel>
    implements $ShoppingListModelCopyWith<$Res> {
  _$ShoppingListModelCopyWithImpl(this._value, this._then);

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
    Object? participantNames = null,
    Object? itemNames = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      participantNames: null == participantNames
          ? _value.participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      itemNames: null == itemNames
          ? _value.itemNames
          : itemNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListModelImplCopyWith<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  factory _$$ShoppingListModelImplCopyWith(_$ShoppingListModelImpl value,
          $Res Function(_$ShoppingListModelImpl) then) =
      __$$ShoppingListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      List<String> participantNames,
      List<String> itemNames,
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      String updatedBy});
}

/// @nodoc
class __$$ShoppingListModelImplCopyWithImpl<$Res>
    extends _$ShoppingListModelCopyWithImpl<$Res, _$ShoppingListModelImpl>
    implements _$$ShoppingListModelImplCopyWith<$Res> {
  __$$ShoppingListModelImplCopyWithImpl(_$ShoppingListModelImpl _value,
      $Res Function(_$ShoppingListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? participantNames = null,
    Object? itemNames = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? updatedBy = null,
  }) {
    return _then(_$ShoppingListModelImpl(
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
      participantNames: null == participantNames
          ? _value._participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      itemNames: null == itemNames
          ? _value._itemNames
          : itemNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingListModelImpl implements _ShoppingListModel {
  _$ShoppingListModelImpl(
      {required this.id,
      required this.name,
      this.description,
      required final List<String> participantNames,
      required final List<String> itemNames,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy})
      : _participantNames = participantNames,
        _itemNames = itemNames;

  factory _$ShoppingListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  final List<String> _participantNames;
  @override
  List<String> get participantNames {
    if (_participantNames is EqualUnmodifiableListView)
      return _participantNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantNames);
  }

  final List<String> _itemNames;
  @override
  List<String> get itemNames {
    if (_itemNames is EqualUnmodifiableListView) return _itemNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemNames);
  }

  @override
  final DateTime createdAt;
  @override
  final String createdBy;
  @override
  final DateTime updatedAt;
  @override
  final String updatedBy;

  @override
  String toString() {
    return 'ShoppingListModel(id: $id, name: $name, description: $description, participantNames: $participantNames, itemNames: $itemNames, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._participantNames, _participantNames) &&
            const DeepCollectionEquality()
                .equals(other._itemNames, _itemNames) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_participantNames),
      const DeepCollectionEquality().hash(_itemNames),
      createdAt,
      createdBy,
      updatedAt,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListModelImplCopyWith<_$ShoppingListModelImpl> get copyWith =>
      __$$ShoppingListModelImplCopyWithImpl<_$ShoppingListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListModelImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListModel implements ShoppingListModel {
  factory _ShoppingListModel(
      {required final String id,
      required final String name,
      final String? description,
      required final List<String> participantNames,
      required final List<String> itemNames,
      required final DateTime createdAt,
      required final String createdBy,
      required final DateTime updatedAt,
      required final String updatedBy}) = _$ShoppingListModelImpl;

  factory _ShoppingListModel.fromJson(Map<String, dynamic> json) =
      _$ShoppingListModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  List<String> get participantNames;
  @override
  List<String> get itemNames;
  @override
  DateTime get createdAt;
  @override
  String get createdBy;
  @override
  DateTime get updatedAt;
  @override
  String get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListModelImplCopyWith<_$ShoppingListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
