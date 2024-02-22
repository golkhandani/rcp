import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/group/group_model.dart';

part 'index.freezed.dart';
part 'index.g.dart';

@freezed
abstract class CreateNewGroupReq with _$CreateNewGroupReq {
  static String fn = 'create_new_group';
  const factory CreateNewGroupReq({
    required Group group,
    required UserGroup userGroup,
  }) = _CreateNewGroupReq;

  factory CreateNewGroupReq.fromJson(Map<String, dynamic> json) =>
      _$CreateNewGroupReqFromJson(json);
}
