// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserGroupsReqImpl _$$GetUserGroupsReqImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserGroupsReqImpl(
      joinedGroups: (json['joinedGroups'] as List<dynamic>)
          .map((e) => JoinedGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      invitedGroups: (json['invitedGroups'] as List<dynamic>)
          .map((e) => InvitedGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUserGroupsReqImplToJson(
        _$GetUserGroupsReqImpl instance) =>
    <String, dynamic>{
      'joinedGroups': instance.joinedGroups,
      'invitedGroups': instance.invitedGroups,
    };
