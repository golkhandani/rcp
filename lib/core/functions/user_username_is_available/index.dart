import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';

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
    @JsonKey(name: 'is_available') required bool isAvailable,
  }) = _UserUsernameIsAvailableOutout;

  factory UserUsernameIsAvailableOutout.fromJson(Map<String, dynamic> json) =>
      _$UserUsernameIsAvailableOutoutFromJson(json);
}

extension CheckUsernameAvailabilty on SupabaseClient {
  Future<UserUsernameIsAvailableOutout> userUsernameIsAvailable({
    required UserUsernameIsAvailableInput body,
  }) async {
    try {
      final res = await functions.invoke(user_username_is_available,
          body: body.toJson());
      return UserUsernameIsAvailableOutout.fromJson(res.data);
    } catch (e) {
      locator.logger.error(e);
      return const UserUsernameIsAvailableOutout(isAvailable: false);
    }
  }
}
