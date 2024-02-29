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
  List<Participant> get participants => throw _privateConstructorUsedError;
  List<ShoppingItem> get items => throw _privateConstructorUsedError;
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
      List<Participant> participants,
      List<ShoppingItem> items,
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
    Object? participants = null,
    Object? items = null,
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
      List<Participant> participants,
      List<ShoppingItem> items,
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
    Object? participants = null,
    Object? items = null,
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

@JsonSerializable(explicitToJson: true)
class _$ShoppingListModelImpl implements _ShoppingListModel {
  _$ShoppingListModelImpl(
      {required this.id,
      required this.name,
      this.description,
      required final List<Participant> participants,
      required final List<ShoppingItem> items,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy})
      : _participants = participants,
        _items = items;

  factory _$ShoppingListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListModelImplFromJson(json);

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
  final String createdBy;
  @override
  final DateTime updatedAt;
  @override
  final String updatedBy;

  @override
  String toString() {
    return 'ShoppingListModel(id: $id, name: $name, description: $description, participants: $participants, items: $items, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
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
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
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
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_items),
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
      required final List<Participant> participants,
      required final List<ShoppingItem> items,
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
  List<Participant> get participants;
  @override
  List<ShoppingItem> get items;
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
