import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bnf/core/types/uuid_extention.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required UUID id,
    required String? email,
    required String? phone,
    required String name,
    required String imageUrl,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
