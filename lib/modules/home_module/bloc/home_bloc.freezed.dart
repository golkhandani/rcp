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
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAdding => throw _privateConstructorUsedError;
  Map<String, bool> get isDeletingItem => throw _privateConstructorUsedError;
  List<ShoppingListModel> get shoppingLists =>
      throw _privateConstructorUsedError;

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
      {bool isLoading,
      bool isAdding,
      Map<String, bool> isDeletingItem,
      List<ShoppingListModel> shoppingLists});
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
    Object? isLoading = null,
    Object? isAdding = null,
    Object? isDeletingItem = null,
    Object? shoppingLists = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingItem: null == isDeletingItem
          ? _value.isDeletingItem
          : isDeletingItem // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      shoppingLists: null == shoppingLists
          ? _value.shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingListModel>,
    ) as $Val);
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
      {bool isLoading,
      bool isAdding,
      Map<String, bool> isDeletingItem,
      List<ShoppingListModel> shoppingLists});
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
    Object? isLoading = null,
    Object? isAdding = null,
    Object? isDeletingItem = null,
    Object? shoppingLists = null,
  }) {
    return _then(_$HomeBlocStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingItem: null == isDeletingItem
          ? _value._isDeletingItem
          : isDeletingItem // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      shoppingLists: null == shoppingLists
          ? _value._shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingListModel>,
    ));
  }
}

/// @nodoc

class _$HomeBlocStateImpl
    with DiagnosticableTreeMixin
    implements _HomeBlocState {
  const _$HomeBlocStateImpl(
      {required this.isLoading,
      required this.isAdding,
      required final Map<String, bool> isDeletingItem,
      required final List<ShoppingListModel> shoppingLists})
      : _isDeletingItem = isDeletingItem,
        _shoppingLists = shoppingLists;

  @override
  final bool isLoading;
  @override
  final bool isAdding;
  final Map<String, bool> _isDeletingItem;
  @override
  Map<String, bool> get isDeletingItem {
    if (_isDeletingItem is EqualUnmodifiableMapView) return _isDeletingItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isDeletingItem);
  }

  final List<ShoppingListModel> _shoppingLists;
  @override
  List<ShoppingListModel> get shoppingLists {
    if (_shoppingLists is EqualUnmodifiableListView) return _shoppingLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingLists);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeBlocState(isLoading: $isLoading, isAdding: $isAdding, isDeletingItem: $isDeletingItem, shoppingLists: $shoppingLists)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeBlocState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isAdding', isAdding))
      ..add(DiagnosticsProperty('isDeletingItem', isDeletingItem))
      ..add(DiagnosticsProperty('shoppingLists', shoppingLists));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBlocStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdding, isAdding) ||
                other.isAdding == isAdding) &&
            const DeepCollectionEquality()
                .equals(other._isDeletingItem, _isDeletingItem) &&
            const DeepCollectionEquality()
                .equals(other._shoppingLists, _shoppingLists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isAdding,
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
          {required final bool isLoading,
          required final bool isAdding,
          required final Map<String, bool> isDeletingItem,
          required final List<ShoppingListModel> shoppingLists}) =
      _$HomeBlocStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isAdding;
  @override
  Map<String, bool> get isDeletingItem;
  @override
  List<ShoppingListModel> get shoppingLists;
  @override
  @JsonKey(ignore: true)
  _$$HomeBlocStateImplCopyWith<_$HomeBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
