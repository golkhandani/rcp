// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvitationBlocState {
  Map<String, bool> get isUpdating => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ListQueryState get queryState => throw _privateConstructorUsedError;
  List<Invitation> get invitations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitationBlocStateCopyWith<InvitationBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationBlocStateCopyWith<$Res> {
  factory $InvitationBlocStateCopyWith(
          InvitationBlocState value, $Res Function(InvitationBlocState) then) =
      _$InvitationBlocStateCopyWithImpl<$Res, InvitationBlocState>;
  @useResult
  $Res call(
      {Map<String, bool> isUpdating,
      bool isLoading,
      ListQueryState queryState,
      List<Invitation> invitations});

  $ListQueryStateCopyWith<$Res> get queryState;
}

/// @nodoc
class _$InvitationBlocStateCopyWithImpl<$Res, $Val extends InvitationBlocState>
    implements $InvitationBlocStateCopyWith<$Res> {
  _$InvitationBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdating = null,
    Object? isLoading = null,
    Object? queryState = null,
    Object? invitations = null,
  }) {
    return _then(_value.copyWith(
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      queryState: null == queryState
          ? _value.queryState
          : queryState // ignore: cast_nullable_to_non_nullable
              as ListQueryState,
      invitations: null == invitations
          ? _value.invitations
          : invitations // ignore: cast_nullable_to_non_nullable
              as List<Invitation>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ListQueryStateCopyWith<$Res> get queryState {
    return $ListQueryStateCopyWith<$Res>(_value.queryState, (value) {
      return _then(_value.copyWith(queryState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitationBlocStateImplCopyWith<$Res>
    implements $InvitationBlocStateCopyWith<$Res> {
  factory _$$InvitationBlocStateImplCopyWith(_$InvitationBlocStateImpl value,
          $Res Function(_$InvitationBlocStateImpl) then) =
      __$$InvitationBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, bool> isUpdating,
      bool isLoading,
      ListQueryState queryState,
      List<Invitation> invitations});

  @override
  $ListQueryStateCopyWith<$Res> get queryState;
}

/// @nodoc
class __$$InvitationBlocStateImplCopyWithImpl<$Res>
    extends _$InvitationBlocStateCopyWithImpl<$Res, _$InvitationBlocStateImpl>
    implements _$$InvitationBlocStateImplCopyWith<$Res> {
  __$$InvitationBlocStateImplCopyWithImpl(_$InvitationBlocStateImpl _value,
      $Res Function(_$InvitationBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdating = null,
    Object? isLoading = null,
    Object? queryState = null,
    Object? invitations = null,
  }) {
    return _then(_$InvitationBlocStateImpl(
      isUpdating: null == isUpdating
          ? _value._isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      queryState: null == queryState
          ? _value.queryState
          : queryState // ignore: cast_nullable_to_non_nullable
              as ListQueryState,
      invitations: null == invitations
          ? _value._invitations
          : invitations // ignore: cast_nullable_to_non_nullable
              as List<Invitation>,
    ));
  }
}

/// @nodoc

class _$InvitationBlocStateImpl implements _InvitationBlocState {
  const _$InvitationBlocStateImpl(
      {required final Map<String, bool> isUpdating,
      required this.isLoading,
      required this.queryState,
      required final List<Invitation> invitations})
      : _isUpdating = isUpdating,
        _invitations = invitations;

  final Map<String, bool> _isUpdating;
  @override
  Map<String, bool> get isUpdating {
    if (_isUpdating is EqualUnmodifiableMapView) return _isUpdating;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isUpdating);
  }

  @override
  final bool isLoading;
  @override
  final ListQueryState queryState;
  final List<Invitation> _invitations;
  @override
  List<Invitation> get invitations {
    if (_invitations is EqualUnmodifiableListView) return _invitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitations);
  }

  @override
  String toString() {
    return 'InvitationBlocState(isUpdating: $isUpdating, isLoading: $isLoading, queryState: $queryState, invitations: $invitations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationBlocStateImpl &&
            const DeepCollectionEquality()
                .equals(other._isUpdating, _isUpdating) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.queryState, queryState) ||
                other.queryState == queryState) &&
            const DeepCollectionEquality()
                .equals(other._invitations, _invitations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_isUpdating),
      isLoading,
      queryState,
      const DeepCollectionEquality().hash(_invitations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationBlocStateImplCopyWith<_$InvitationBlocStateImpl> get copyWith =>
      __$$InvitationBlocStateImplCopyWithImpl<_$InvitationBlocStateImpl>(
          this, _$identity);
}

abstract class _InvitationBlocState implements InvitationBlocState {
  const factory _InvitationBlocState(
      {required final Map<String, bool> isUpdating,
      required final bool isLoading,
      required final ListQueryState queryState,
      required final List<Invitation> invitations}) = _$InvitationBlocStateImpl;

  @override
  Map<String, bool> get isUpdating;
  @override
  bool get isLoading;
  @override
  ListQueryState get queryState;
  @override
  List<Invitation> get invitations;
  @override
  @JsonKey(ignore: true)
  _$$InvitationBlocStateImplCopyWith<_$InvitationBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
