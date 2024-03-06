// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeBlocState {
  bool get isPaginationDone => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAdding => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  ListQueryState get listQueryState => throw _privateConstructorUsedError;
  Map<String, bool> get isDeletingItem => throw _privateConstructorUsedError;
  List<ShoppingList> get shoppingLists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeBlocStateCopyWith<HomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBlocStateCopyWith<$Res> {
  factory $HomeBlocStateCopyWith(
          HomeBlocState value, $Res Function(HomeBlocState) then) =
      _$HomeBlocStateCopyWithImpl<$Res, HomeBlocState>;
  @useResult
  $Res call(
      {bool isPaginationDone,
      bool isLoading,
      bool isAdding,
      bool isRefreshing,
      ListQueryState listQueryState,
      Map<String, bool> isDeletingItem,
      List<ShoppingList> shoppingLists});

  $ListQueryStateCopyWith<$Res> get listQueryState;
}

/// @nodoc
class _$HomeBlocStateCopyWithImpl<$Res, $Val extends HomeBlocState>
    implements $HomeBlocStateCopyWith<$Res> {
  _$HomeBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPaginationDone = null,
    Object? isLoading = null,
    Object? isAdding = null,
    Object? isRefreshing = null,
    Object? listQueryState = null,
    Object? isDeletingItem = null,
    Object? shoppingLists = null,
  }) {
    return _then(_value.copyWith(
      isPaginationDone: null == isPaginationDone
          ? _value.isPaginationDone
          : isPaginationDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      listQueryState: null == listQueryState
          ? _value.listQueryState
          : listQueryState // ignore: cast_nullable_to_non_nullable
              as ListQueryState,
      isDeletingItem: null == isDeletingItem
          ? _value.isDeletingItem
          : isDeletingItem // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      shoppingLists: null == shoppingLists
          ? _value.shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ListQueryStateCopyWith<$Res> get listQueryState {
    return $ListQueryStateCopyWith<$Res>(_value.listQueryState, (value) {
      return _then(_value.copyWith(listQueryState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeBlocStateImplCopyWith<$Res>
    implements $HomeBlocStateCopyWith<$Res> {
  factory _$$HomeBlocStateImplCopyWith(
          _$HomeBlocStateImpl value, $Res Function(_$HomeBlocStateImpl) then) =
      __$$HomeBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isPaginationDone,
      bool isLoading,
      bool isAdding,
      bool isRefreshing,
      ListQueryState listQueryState,
      Map<String, bool> isDeletingItem,
      List<ShoppingList> shoppingLists});

  @override
  $ListQueryStateCopyWith<$Res> get listQueryState;
}

/// @nodoc
class __$$HomeBlocStateImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$HomeBlocStateImpl>
    implements _$$HomeBlocStateImplCopyWith<$Res> {
  __$$HomeBlocStateImplCopyWithImpl(
      _$HomeBlocStateImpl _value, $Res Function(_$HomeBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPaginationDone = null,
    Object? isLoading = null,
    Object? isAdding = null,
    Object? isRefreshing = null,
    Object? listQueryState = null,
    Object? isDeletingItem = null,
    Object? shoppingLists = null,
  }) {
    return _then(_$HomeBlocStateImpl(
      isPaginationDone: null == isPaginationDone
          ? _value.isPaginationDone
          : isPaginationDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      listQueryState: null == listQueryState
          ? _value.listQueryState
          : listQueryState // ignore: cast_nullable_to_non_nullable
              as ListQueryState,
      isDeletingItem: null == isDeletingItem
          ? _value._isDeletingItem
          : isDeletingItem // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      shoppingLists: null == shoppingLists
          ? _value._shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
    ));
  }
}

/// @nodoc

class _$HomeBlocStateImpl
    with DiagnosticableTreeMixin
    implements _HomeBlocState {
  const _$HomeBlocStateImpl(
      {required this.isPaginationDone,
      required this.isLoading,
      required this.isAdding,
      required this.isRefreshing,
      required this.listQueryState,
      required final Map<String, bool> isDeletingItem,
      required final List<ShoppingList> shoppingLists})
      : _isDeletingItem = isDeletingItem,
        _shoppingLists = shoppingLists;

  @override
  final bool isPaginationDone;
  @override
  final bool isLoading;
  @override
  final bool isAdding;
  @override
  final bool isRefreshing;
  @override
  final ListQueryState listQueryState;
  final Map<String, bool> _isDeletingItem;
  @override
  Map<String, bool> get isDeletingItem {
    if (_isDeletingItem is EqualUnmodifiableMapView) return _isDeletingItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isDeletingItem);
  }

  final List<ShoppingList> _shoppingLists;
  @override
  List<ShoppingList> get shoppingLists {
    if (_shoppingLists is EqualUnmodifiableListView) return _shoppingLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingLists);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeBlocState(isPaginationDone: $isPaginationDone, isLoading: $isLoading, isAdding: $isAdding, isRefreshing: $isRefreshing, listQueryState: $listQueryState, isDeletingItem: $isDeletingItem, shoppingLists: $shoppingLists)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeBlocState'))
      ..add(DiagnosticsProperty('isPaginationDone', isPaginationDone))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isAdding', isAdding))
      ..add(DiagnosticsProperty('isRefreshing', isRefreshing))
      ..add(DiagnosticsProperty('listQueryState', listQueryState))
      ..add(DiagnosticsProperty('isDeletingItem', isDeletingItem))
      ..add(DiagnosticsProperty('shoppingLists', shoppingLists));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBlocStateImpl &&
            (identical(other.isPaginationDone, isPaginationDone) ||
                other.isPaginationDone == isPaginationDone) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdding, isAdding) ||
                other.isAdding == isAdding) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.listQueryState, listQueryState) ||
                other.listQueryState == listQueryState) &&
            const DeepCollectionEquality()
                .equals(other._isDeletingItem, _isDeletingItem) &&
            const DeepCollectionEquality()
                .equals(other._shoppingLists, _shoppingLists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPaginationDone,
      isLoading,
      isAdding,
      isRefreshing,
      listQueryState,
      const DeepCollectionEquality().hash(_isDeletingItem),
      const DeepCollectionEquality().hash(_shoppingLists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeBlocStateImplCopyWith<_$HomeBlocStateImpl> get copyWith =>
      __$$HomeBlocStateImplCopyWithImpl<_$HomeBlocStateImpl>(this, _$identity);
}

abstract class _HomeBlocState implements HomeBlocState {
  const factory _HomeBlocState(
      {required final bool isPaginationDone,
      required final bool isLoading,
      required final bool isAdding,
      required final bool isRefreshing,
      required final ListQueryState listQueryState,
      required final Map<String, bool> isDeletingItem,
      required final List<ShoppingList> shoppingLists}) = _$HomeBlocStateImpl;

  @override
  bool get isPaginationDone;
  @override
  bool get isLoading;
  @override
  bool get isAdding;
  @override
  bool get isRefreshing;
  @override
  ListQueryState get listQueryState;
  @override
  Map<String, bool> get isDeletingItem;
  @override
  List<ShoppingList> get shoppingLists;
  @override
  @JsonKey(ignore: true)
  _$$HomeBlocStateImplCopyWith<_$HomeBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
