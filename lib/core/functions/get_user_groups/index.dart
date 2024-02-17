import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bnf/core/models/group/group_model.dart';

part 'index.freezed.dart';
part 'index.g.dart';

@freezed
abstract class GetUserGroupsReq with _$GetUserGroupsReq {
  static String fn = 'get_user_groups';
  const factory GetUserGroupsReq({
    required List<JoinedGroup> joinedGroups,
    required List<InvitedGroup> invitedGroups,
  }) = _GetUserGroupsReq;

  factory GetUserGroupsReq.fromJson(Map<String, dynamic> json) =>
      _$GetUserGroupsReqFromJson(json);
}
