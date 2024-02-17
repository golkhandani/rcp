// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_tenancy_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppTenancyState _$AppTenancyStateFromJson(Map<String, dynamic> json) {
  return _AppTenancyState.fromJson(json);
}

/// @nodoc
mixin _$AppTenancyState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get selectedGroupId => throw _privateConstructorUsedError;
  Group? get selectedGroup => throw _privateConstructorUsedError;
  UserData? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppTenancyStateCopyWith<AppTenancyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppTenancyStateCopyWith<$Res> {
  factory $AppTenancyStateCopyWith(
          AppTenancyState value, $Res Function(AppTenancyState) then) =
      _$AppTenancyStateCopyWithImpl<$Res, AppTenancyState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? selectedGroupId,
      Group? selectedGroup,
      UserData? user});

  $GroupCopyWith<$Res>? get selectedGroup;
  $UserDataCopyWith<$Res>? get user;
}

/// @nodoc
class _$AppTenancyStateCopyWithImpl<$Res, $Val extends AppTenancyState>
    implements $AppTenancyStateCopyWith<$Res> {
  _$AppTenancyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedGroupId = freezed,
    Object? selectedGroup = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedGroupId: freezed == selectedGroupId
          ? _value.selectedGroupId
          : selectedGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedGroup: freezed == selectedGroup
          ? _value.selectedGroup
          : selectedGroup // ignore: cast_nullable_to_non_nullable
              as Group?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res>? get selectedGroup {
    if (_value.selectedGroup == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.selectedGroup!, (value) {
      return _then(_value.copyWith(selectedGroup: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppTenancyStateImplCopyWith<$Res>
    implements $AppTenancyStateCopyWith<$Res> {
  factory _$$AppTenancyStateImplCopyWith(_$AppTenancyStateImpl value,
          $Res Function(_$AppTenancyStateImpl) then) =
      __$$AppTenancyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? selectedGroupId,
      Group? selectedGroup,
      UserData? user});

  @override
  $GroupCopyWith<$Res>? get selectedGroup;
  @override
  $UserDataCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AppTenancyStateImplCopyWithImpl<$Res>
    extends _$AppTenancyStateCopyWithImpl<$Res, _$AppTenancyStateImpl>
    implements _$$AppTenancyStateImplCopyWith<$Res> {
  __$$AppTenancyStateImplCopyWithImpl(
      _$AppTenancyStateImpl _value, $Res Function(_$AppTenancyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedGroupId = freezed,
    Object? selectedGroup = freezed,
    Object? user = freezed,
  }) {
    return _then(_$AppTenancyStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedGroupId: freezed == selectedGroupId
          ? _value.selectedGroupId
          : selectedGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedGroup: freezed == selectedGroup
          ? _value.selectedGroup
          : selectedGroup // ignore: cast_nullable_to_non_nullable
              as Group?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppTenancyStateImpl
    with DiagnosticableTreeMixin
    implements _AppTenancyState {
  const _$AppTenancyStateImpl(
      {required this.isLoading,
      this.selectedGroupId,
      this.selectedGroup,
      this.user});

  factory _$AppTenancyStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppTenancyStateImplFromJson(json);

  @override
  final bool isLoading;
  @override
  final String? selectedGroupId;
  @override
  final Group? selectedGroup;
  @override
  final UserData? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppTenancyState(isLoading: $isLoading, selectedGroupId: $selectedGroupId, selectedGroup: $selectedGroup, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppTenancyState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('selectedGroupId', selectedGroupId))
      ..add(DiagnosticsProperty('selectedGroup', selectedGroup))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppTenancyStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedGroupId, selectedGroupId) ||
                other.selectedGroupId == selectedGroupId) &&
            (identical(other.selectedGroup, selectedGroup) ||
                other.selectedGroup == selectedGroup) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, selectedGroupId, selectedGroup, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppTenancyStateImplCopyWith<_$AppTenancyStateImpl> get copyWith =>
      __$$AppTenancyStateImplCopyWithImpl<_$AppTenancyStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppTenancyStateImplToJson(
      this,
    );
  }
}

abstract class _AppTenancyState implements AppTenancyState {
  const factory _AppTenancyState(
      {required final bool isLoading,
      final String? selectedGroupId,
      final Group? selectedGroup,
      final UserData? user}) = _$AppTenancyStateImpl;

  factory _AppTenancyState.fromJson(Map<String, dynamic> json) =
      _$AppTenancyStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  String? get selectedGroupId;
  @override
  Group? get selectedGroup;
  @override
  UserData? get user;
  @override
  @JsonKey(ignore: true)
  _$$AppTenancyStateImplCopyWith<_$AppTenancyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
