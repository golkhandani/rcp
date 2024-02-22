import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/types/uuid_extention.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

extension UserNestedData on User {
  String? get username => userMetadata?[UserMetadata.usernameKey];
  String? get avatarUrl => userMetadata?[UserMetadata.avatarUrlKey];
  String get avatarFilePath => '$id/${(username ?? id).hashCode.toString()}';
}

@freezed
abstract class UserMetadata with _$UserMetadata {
  static const usernameKey = 'username';
  static const avatarUrlKey = 'avatar_url';
  static const tableName = '_';
  const factory UserMetadata({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
  }) = _UserMetadata;

  factory UserMetadata.fromJson(Map<String, dynamic> json) =>
      _$UserMetadataFromJson(json);
}

@freezed
abstract class UserInfo with _$UserInfo {
  static const tableName = 'profiles';
  const factory UserInfo({
    required UUID id,
    required String? email,
    required String? phone,
    required UserMetadata metadata,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
