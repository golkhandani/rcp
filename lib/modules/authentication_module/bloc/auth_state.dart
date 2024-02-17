import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required bool isLoading,
    String? userId,
  }) = _AuthenticationState;

  factory AuthenticationState.init() =>
      const AuthenticationState(isLoading: false);
  factory AuthenticationState.fromJson(Map<String, Object?> json) =>
      _$AuthenticationStateFromJson(json);
}
