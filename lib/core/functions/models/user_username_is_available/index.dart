import 'package:freezed_annotation/freezed_annotation.dart';

part 'index.freezed.dart';
part 'index.g.dart';

// ignore: constant_identifier_names
const user_username_is_available = 'user_username_is_available';

@freezed
abstract class UserUsernameIsAvailableInput
    with _$UserUsernameIsAvailableInput {
  const factory UserUsernameIsAvailableInput({
    @JsonKey(name: 'username') required String username,
  }) = _UserUsernameIsAvailableInput;

  factory UserUsernameIsAvailableInput.fromJson(Map<String, dynamic> json) =>
      _$UserUsernameIsAvailableInputFromJson(json);
}

@freezed
abstract class UserUsernameIsAvailableOutout
    with _$UserUsernameIsAvailableOutout {
  const factory UserUsernameIsAvailableOutout({
    required bool isAvailable,
  }) = _UserUsernameIsAvailableOutout;

  factory UserUsernameIsAvailableOutout.fromJson(Map<String, dynamic> json) =>
      _$UserUsernameIsAvailableOutoutFromJson(json);
}
