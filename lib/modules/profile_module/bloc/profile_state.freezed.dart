// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileBlocState _$ProfileBlocStateFromJson(Map<String, dynamic> json) {
  return _ProfileBlocState.fromJson(json);
}

/// @nodoc
mixin _$ProfileBlocState {
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingAvatar => throw _privateConstructorUsedError;
  UserInfo? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileBlocStateCopyWith<ProfileBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileBlocStateCopyWith<$Res> {
  factory $ProfileBlocStateCopyWith(
          ProfileBlocState value, $Res Function(ProfileBlocState) then) =
      _$ProfileBlocStateCopyWithImpl<$Res, ProfileBlocState>;
  @useResult
  $Res call(
      {bool isEditing,
      bool isUpdating,
      bool isLoading,
      bool isLoadingAvatar,
      UserInfo? user});

  $UserInfoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileBlocStateCopyWithImpl<$Res, $Val extends ProfileBlocState>
    implements $ProfileBlocStateCopyWith<$Res> {
  _$ProfileBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditing = null,
    Object? isUpdating = null,
    Object? isLoading = null,
    Object? isLoadingAvatar = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAvatar: null == isLoadingAvatar
          ? _value.isLoadingAvatar
          : isLoadingAvatar // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileBlocStateImplCopyWith<$Res>
    implements $ProfileBlocStateCopyWith<$Res> {
  factory _$$ProfileBlocStateImplCopyWith(_$ProfileBlocStateImpl value,
          $Res Function(_$ProfileBlocStateImpl) then) =
      __$$ProfileBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEditing,
      bool isUpdating,
      bool isLoading,
      bool isLoadingAvatar,
      UserInfo? user});

  @override
  $UserInfoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfileBlocStateImplCopyWithImpl<$Res>
    extends _$ProfileBlocStateCopyWithImpl<$Res, _$ProfileBlocStateImpl>
    implements _$$ProfileBlocStateImplCopyWith<$Res> {
  __$$ProfileBlocStateImplCopyWithImpl(_$ProfileBlocStateImpl _value,
      $Res Function(_$ProfileBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditing = null,
    Object? isUpdating = null,
    Object? isLoading = null,
    Object? isLoadingAvatar = null,
    Object? user = freezed,
  }) {
    return _then(_$ProfileBlocStateImpl(
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAvatar: null == isLoadingAvatar
          ? _value.isLoadingAvatar
          : isLoadingAvatar // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileBlocStateImpl
    with DiagnosticableTreeMixin
    implements _ProfileBlocState {
  const _$ProfileBlocStateImpl(
      {required this.isEditing,
      required this.isUpdating,
      required this.isLoading,
      required this.isLoadingAvatar,
      this.user});

  factory _$ProfileBlocStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileBlocStateImplFromJson(json);

  @override
  final bool isEditing;
  @override
  final bool isUpdating;
  @override
  final bool isLoading;
  @override
  final bool isLoadingAvatar;
  @override
  final UserInfo? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileBlocState(isEditing: $isEditing, isUpdating: $isUpdating, isLoading: $isLoading, isLoadingAvatar: $isLoadingAvatar, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileBlocState'))
      ..add(DiagnosticsProperty('isEditing', isEditing))
      ..add(DiagnosticsProperty('isUpdating', isUpdating))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isLoadingAvatar', isLoadingAvatar))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileBlocStateImpl &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingAvatar, isLoadingAvatar) ||
                other.isLoadingAvatar == isLoadingAvatar) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isEditing, isUpdating, isLoading, isLoadingAvatar, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileBlocStateImplCopyWith<_$ProfileBlocStateImpl> get copyWith =>
      __$$ProfileBlocStateImplCopyWithImpl<_$ProfileBlocStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileBlocStateImplToJson(
      this,
    );
  }
}

abstract class _ProfileBlocState implements ProfileBlocState {
  const factory _ProfileBlocState(
      {required final bool isEditing,
      required final bool isUpdating,
      required final bool isLoading,
      required final bool isLoadingAvatar,
      final UserInfo? user}) = _$ProfileBlocStateImpl;

  factory _ProfileBlocState.fromJson(Map<String, dynamic> json) =
      _$ProfileBlocStateImpl.fromJson;

  @override
  bool get isEditing;
  @override
  bool get isUpdating;
  @override
  bool get isLoading;
  @override
  bool get isLoadingAvatar;
  @override
  UserInfo? get user;
  @override
  @JsonKey(ignore: true)
  _$$ProfileBlocStateImplCopyWith<_$ProfileBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
