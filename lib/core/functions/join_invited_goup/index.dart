import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/group/group_model.dart';

part 'index.freezed.dart';
part 'index.g.dart';

@freezed
abstract class JoinInvitedGroupReq with _$JoinInvitedGroupReq {
  static String fn = 'join_invited_group';
  const factory JoinInvitedGroupReq({
    required JoinedGroup joinedGroup,
  }) = _JoinInvitedGroupReq;

  factory JoinInvitedGroupReq.fromJson(Map<String, dynamic> json) =>
      _$JoinInvitedGroupReqFromJson(json);
}
