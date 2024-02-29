// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingListBlocState _$ShoppingListBlocStateFromJson(
    Map<String, dynamic> json) {
  return _ShoppingListBlocState.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListBlocState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingItems => throw _privateConstructorUsedError;
  bool get isAddingItem => throw _privateConstructorUsedError;
  Map<String, bool> get isDeletingItem => throw _privateConstructorUsedError;
  ShoppingListModel? get shoppingList => throw _privateConstructorUsedError;
  List<Participant>? get participants => throw _privateConstructorUsedError;
  List<ShoppingItem>? get shoppingItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListBlocStateCopyWith<ShoppingListBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListBlocStateCopyWith<$Res> {
  factory $ShoppingListBlocStateCopyWith(ShoppingListBlocState value,
          $Res Function(ShoppingListBlocState) then) =
      _$ShoppingListBlocStateCopyWithImpl<$Res, ShoppingListBlocState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingItems,
      bool isAddingItem,
      Map<String, bool> isDeletingItem,
      ShoppingListModel? shoppingList,
      List<Participant>? participants,
      List<ShoppingItem>? shoppingItems});

  $ShoppingListModelCopyWith<$Res>? get shoppingList;
}

/// @nodoc
class _$ShoppingListBlocStateCopyWithImpl<$Res,
        $Val extends ShoppingListBlocState>
    implements $ShoppingListBlocStateCopyWith<$Res> {
  _$ShoppingListBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingItems = null,
    Object? isAddingItem = null,
    Object? isDeletingItem = null,
    Object? shoppingList = freezed,
    Object? participants = freezed,
    Object? shoppingItems = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingItems: null == isLoadingItems
          ? _value.isLoadingItems
          : isLoadingItems // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingItem: null == isAddingItem
          ? _value.isAddingItem
          : isAddingItem // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingItem: null == isDeletingItem
          ? _value.isDeletingItem
          : isDeletingItem // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      shoppingList: freezed == shoppingList
          ? _value.shoppingList
          : shoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingListModel?,
      participants: freezed == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>?,
      shoppingItems: freezed == shoppingItems
          ? _value.shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShoppingListModelCopyWith<$Res>? get shoppingList {
    if (_value.shoppingList == null) {
      return null;
    }

    return $ShoppingListModelCopyWith<$Res>(_value.shoppingList!, (value) {
      return _then(_value.copyWith(shoppingList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingListBlocStateImplCopyWith<$Res>
    implements $ShoppingListBlocStateCopyWith<$Res> {
  factory _$$ShoppingListBlocStateImplCopyWith(
          _$ShoppingListBlocStateImpl value,
          $Res Function(_$ShoppingListBlocStateImpl) then) =
      __$$ShoppingListBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingItems,
      bool isAddingItem,
      Map<String, bool> isDeletingItem,
      ShoppingListModel? shoppingList,
      List<Participant>? participants,
      List<ShoppingItem>? shoppingItems});

  @override
  $ShoppingListModelCopyWith<$Res>? get shoppingList;
}

/// @nodoc
class __$$ShoppingListBlocStateImplCopyWithImpl<$Res>
    extends _$ShoppingListBlocStateCopyWithImpl<$Res,
        _$ShoppingListBlocStateImpl>
    implements _$$ShoppingListBlocStateImplCopyWith<$Res> {
  __$$ShoppingListBlocStateImplCopyWithImpl(_$ShoppingListBlocStateImpl _value,
      $Res Function(_$ShoppingListBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingItems = null,
    Object? isAddingItem = null,
    Object? isDeletingItem = null,
    Object? shoppingList = freezed,
    Object? participants = freezed,
    Object? shoppingItems = freezed,
  }) {
    return _then(_$ShoppingListBlocStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingItems: null == isLoadingItems
          ? _value.isLoadingItems
          : isLoadingItems // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingItem: null == isAddingItem
          ? _value.isAddingItem
          : isAddingItem // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingItem: null == isDeletingItem
          ? _value._isDeletingItem
          : isDeletingItem // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      shoppingList: freezed == shoppingList
          ? _value.shoppingList
          : shoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingListModel?,
      participants: freezed == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>?,
      shoppingItems: freezed == shoppingItems
          ? _value._shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingListBlocStateImpl
    with DiagnosticableTreeMixin
    implements _ShoppingListBlocState {
  const _$ShoppingListBlocStateImpl(
      {required this.isLoading,
      required this.isLoadingItems,
      required this.isAddingItem,
      required final Map<String, bool> isDeletingItem,
      required this.shoppingList,
      required final List<Participant>? participants,
      required final List<ShoppingItem>? shoppingItems})
      : _isDeletingItem = isDeletingItem,
        _participants = participants,
        _shoppingItems = shoppingItems;

  factory _$ShoppingListBlocStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListBlocStateImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final bool isLoadingItems;
  @override
  final bool isAddingItem;
  final Map<String, bool> _isDeletingItem;
  @override
  Map<String, bool> get isDeletingItem {
    if (_isDeletingItem is EqualUnmodifiableMapView) return _isDeletingItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isDeletingItem);
  }

  @override
  final ShoppingListModel? shoppingList;
  final List<Participant>? _participants;
  @override
  List<Participant>? get participants {
    final value = _participants;
    if (value == null) return null;
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ShoppingItem>? _shoppingItems;
  @override
  List<ShoppingItem>? get shoppingItems {
    final value = _shoppingItems;
    if (value == null) return null;
    if (_shoppingItems is EqualUnmodifiableListView) return _shoppingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingListBlocState(isLoading: $isLoading, isLoadingItems: $isLoadingItems, isAddingItem: $isAddingItem, isDeletingItem: $isDeletingItem, shoppingList: $shoppingList, participants: $participants, shoppingItems: $shoppingItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoppingListBlocState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isLoadingItems', isLoadingItems))
      ..add(DiagnosticsProperty('isAddingItem', isAddingItem))
      ..add(DiagnosticsProperty('isDeletingItem', isDeletingItem))
      ..add(DiagnosticsProperty('shoppingList', shoppingList))
      ..add(DiagnosticsProperty('participants', participants))
      ..add(DiagnosticsProperty('shoppingItems', shoppingItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListBlocStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingItems, isLoadingItems) ||
                other.isLoadingItems == isLoadingItems) &&
            (identical(other.isAddingItem, isAddingItem) ||
                other.isAddingItem == isAddingItem) &&
            const DeepCollectionEquality()
                .equals(other._isDeletingItem, _isDeletingItem) &&
            (identical(other.shoppingList, shoppingList) ||
                other.shoppingList == shoppingList) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality()
                .equals(other._shoppingItems, _shoppingItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingItems,
      isAddingItem,
      const DeepCollectionEquality().hash(_isDeletingItem),
      shoppingList,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_shoppingItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListBlocStateImplCopyWith<_$ShoppingListBlocStateImpl>
      get copyWith => __$$ShoppingListBlocStateImplCopyWithImpl<
          _$ShoppingListBlocStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListBlocStateImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListBlocState implements ShoppingListBlocState {
  const factory _ShoppingListBlocState(
          {required final bool isLoading,
          required final bool isLoadingItems,
          required final bool isAddingItem,
          required final Map<String, bool> isDeletingItem,
          required final ShoppingListModel? shoppingList,
          required final List<Participant>? participants,
          required final List<ShoppingItem>? shoppingItems}) =
      _$ShoppingListBlocStateImpl;

  factory _ShoppingListBlocState.fromJson(Map<String, dynamic> json) =
      _$ShoppingListBlocStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isLoadingItems;
  @override
  bool get isAddingItem;
  @override
  Map<String, bool> get isDeletingItem;
  @override
  ShoppingListModel? get shoppingList;
  @override
  List<Participant>? get participants;
  @override
  List<ShoppingItem>? get shoppingItems;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListBlocStateImplCopyWith<_$ShoppingListBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
