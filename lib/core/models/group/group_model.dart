import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/types/uuid_extention.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
abstract class Group with _$Group {
  const factory Group({
    @JsonKey(name: 'id') required UUID id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'created_by') required UUID createdBy,
    @JsonKey(name: 'updated_by') required UUID updatedBy,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@freezed
abstract class UserGroup with _$UserGroup {
  const factory UserGroup({
    @JsonKey(name: 'id') required UUID id,
    @JsonKey(name: 'user_id') required UUID userId,
    @JsonKey(name: 'group_id') required UUID groupId,
    @JsonKey(name: 'access_level') required String accessLevel,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserGroup;

  factory UserGroup.fromJson(Map<String, dynamic> json) =>
      _$UserGroupFromJson(json);
}

//
@freezed
abstract class JoinedGroup with _$JoinedGroup {
  const factory JoinedGroup({
    @JsonKey(name: 'user_id') required UUID userId,
    required Group group,
  }) = _JoinedGroup;

  factory JoinedGroup.fromJson(Map<String, dynamic> json) =>
      _$JoinedGroupFromJson(json);
}

@freezed
abstract class InvitedGroup with _$InvitedGroup {
  const factory InvitedGroup({
    @JsonKey(name: 'user_id') required UUID userId,
    required Group group,
  }) = _InvitedGroup;

  factory InvitedGroup.fromJson(Map<String, dynamic> json) =>
      _$InvitedGroupFromJson(json);
}
