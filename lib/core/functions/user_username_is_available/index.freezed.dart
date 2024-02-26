// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserUsernameIsAvailableInput _$UserUsernameIsAvailableInputFromJson(
    Map<String, dynamic> json) {
  return _UserUsernameIsAvailableInput.fromJson(json);
}

/// @nodoc
mixin _$UserUsernameIsAvailableInput {
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUsernameIsAvailableInputCopyWith<UserUsernameIsAvailableInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUsernameIsAvailableInputCopyWith<$Res> {
  factory $UserUsernameIsAvailableInputCopyWith(
          UserUsernameIsAvailableInput value,
          $Res Function(UserUsernameIsAvailableInput) then) =
      _$UserUsernameIsAvailableInputCopyWithImpl<$Res,
          UserUsernameIsAvailableInput>;
  @useResult
  $Res call({@JsonKey(name: 'username') String username});
}

/// @nodoc
class _$UserUsernameIsAvailableInputCopyWithImpl<$Res,
        $Val extends UserUsernameIsAvailableInput>
    implements $UserUsernameIsAvailableInputCopyWith<$Res> {
  _$UserUsernameIsAvailableInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUsernameIsAvailableInputImplCopyWith<$Res>
    implements $UserUsernameIsAvailableInputCopyWith<$Res> {
  factory _$$UserUsernameIsAvailableInputImplCopyWith(
          _$UserUsernameIsAvailableInputImpl value,
          $Res Function(_$UserUsernameIsAvailableInputImpl) then) =
      __$$UserUsernameIsAvailableInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'username') String username});
}

/// @nodoc
class __$$UserUsernameIsAvailableInputImplCopyWithImpl<$Res>
    extends _$UserUsernameIsAvailableInputCopyWithImpl<$Res,
        _$UserUsernameIsAvailableInputImpl>
    implements _$$UserUsernameIsAvailableInputImplCopyWith<$Res> {
  __$$UserUsernameIsAvailableInputImplCopyWithImpl(
      _$UserUsernameIsAvailableInputImpl _value,
      $Res Function(_$UserUsernameIsAvailableInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$UserUsernameIsAvailableInputImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUsernameIsAvailableInputImpl
    implements _UserUsernameIsAvailableInput {
  const _$UserUsernameIsAvailableInputImpl(
      {@JsonKey(name: 'username') required this.username});

  factory _$UserUsernameIsAvailableInputImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserUsernameIsAvailableInputImplFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String username;

  @override
  String toString() {
    return 'UserUsernameIsAvailableInput(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUsernameIsAvailableInputImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUsernameIsAvailableInputImplCopyWith<
          _$UserUsernameIsAvailableInputImpl>
      get copyWith => __$$UserUsernameIsAvailableInputImplCopyWithImpl<
          _$UserUsernameIsAvailableInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUsernameIsAvailableInputImplToJson(
      this,
    );
  }
}

abstract class _UserUsernameIsAvailableInput
    implements UserUsernameIsAvailableInput {
  const factory _UserUsernameIsAvailableInput(
          {@JsonKey(name: 'username') required final String username}) =
      _$UserUsernameIsAvailableInputImpl;

  factory _UserUsernameIsAvailableInput.fromJson(Map<String, dynamic> json) =
      _$UserUsernameIsAvailableInputImpl.fromJson;

  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$UserUsernameIsAvailableInputImplCopyWith<
          _$UserUsernameIsAvailableInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserUsernameIsAvailableOutout _$UserUsernameIsAvailableOutoutFromJson(
    Map<String, dynamic> json) {
  return _UserUsernameIsAvailableOutout.fromJson(json);
}

/// @nodoc
mixin _$UserUsernameIsAvailableOutout {
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUsernameIsAvailableOutoutCopyWith<UserUsernameIsAvailableOutout>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUsernameIsAvailableOutoutCopyWith<$Res> {
  factory $UserUsernameIsAvailableOutoutCopyWith(
          UserUsernameIsAvailableOutout value,
          $Res Function(UserUsernameIsAvailableOutout) then) =
      _$UserUsernameIsAvailableOutoutCopyWithImpl<$Res,
          UserUsernameIsAvailableOutout>;
  @useResult
  $Res call({@JsonKey(name: 'is_available') bool isAvailable});
}

/// @nodoc
class _$UserUsernameIsAvailableOutoutCopyWithImpl<$Res,
        $Val extends UserUsernameIsAvailableOutout>
    implements $UserUsernameIsAvailableOutoutCopyWith<$Res> {
  _$UserUsernameIsAvailableOutoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUsernameIsAvailableOutoutImplCopyWith<$Res>
    implements $UserUsernameIsAvailableOutoutCopyWith<$Res> {
  factory _$$UserUsernameIsAvailableOutoutImplCopyWith(
          _$UserUsernameIsAvailableOutoutImpl value,
          $Res Function(_$UserUsernameIsAvailableOutoutImpl) then) =
      __$$UserUsernameIsAvailableOutoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'is_available') bool isAvailable});
}

/// @nodoc
class __$$UserUsernameIsAvailableOutoutImplCopyWithImpl<$Res>
    extends _$UserUsernameIsAvailableOutoutCopyWithImpl<$Res,
        _$UserUsernameIsAvailableOutoutImpl>
    implements _$$UserUsernameIsAvailableOutoutImplCopyWith<$Res> {
  __$$UserUsernameIsAvailableOutoutImplCopyWithImpl(
      _$UserUsernameIsAvailableOutoutImpl _value,
      $Res Function(_$UserUsernameIsAvailableOutoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_$UserUsernameIsAvailableOutoutImpl(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUsernameIsAvailableOutoutImpl
    implements _UserUsernameIsAvailableOutout {
  const _$UserUsernameIsAvailableOutoutImpl(
      {@JsonKey(name: 'is_available') required this.isAvailable});

  factory _$UserUsernameIsAvailableOutoutImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserUsernameIsAvailableOutoutImplFromJson(json);

  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;

  @override
  String toString() {
    return 'UserUsernameIsAvailableOutout(isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUsernameIsAvailableOutoutImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUsernameIsAvailableOutoutImplCopyWith<
          _$UserUsernameIsAvailableOutoutImpl>
      get copyWith => __$$UserUsernameIsAvailableOutoutImplCopyWithImpl<
          _$UserUsernameIsAvailableOutoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUsernameIsAvailableOutoutImplToJson(
      this,
    );
  }
}

abstract class _UserUsernameIsAvailableOutout
    implements UserUsernameIsAvailableOutout {
  const factory _UserUsernameIsAvailableOutout(
          {@JsonKey(name: 'is_available') required final bool isAvailable}) =
      _$UserUsernameIsAvailableOutoutImpl;

  factory _UserUsernameIsAvailableOutout.fromJson(Map<String, dynamic> json) =
      _$UserUsernameIsAvailableOutoutImpl.fromJson;

  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$UserUsernameIsAvailableOutoutImplCopyWith<
          _$UserUsernameIsAvailableOutoutImpl>
      get copyWith => throw _privateConstructorUsedError;
}
