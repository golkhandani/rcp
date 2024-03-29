import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/models/uuid_extention.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

extension UserNestedData on UserInfo {
  String? get username => profile.username;
  String? get avatarUrl => profile.avatarUrl;
  String? get fullName => profile.fullName;
}

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required UUID id,
    required String? email,
    required String? phone,
    required UserProfile2 profile,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
