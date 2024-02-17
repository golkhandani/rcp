// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      createdBy: json['created_by'] as String,
      updatedBy: json['updated_by'] as String,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

_$UserGroupImpl _$$UserGroupImplFromJson(Map<String, dynamic> json) =>
    _$UserGroupImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      groupId: json['group_id'] as String,
      accessLevel: json['access_level'] as String,
      createdAt: json['created_at'] as String,
      status: json['status'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserGroupImplToJson(_$UserGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'access_level': instance.accessLevel,
      'created_at': instance.createdAt,
      'status': instance.status,
      'updated_at': instance.updatedAt,
    };

_$JoinedGroupImpl _$$JoinedGroupImplFromJson(Map<String, dynamic> json) =>
    _$JoinedGroupImpl(
      userId: json['user_id'] as String,
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JoinedGroupImplToJson(_$JoinedGroupImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'group': instance.group,
    };

_$InvitedGroupImpl _$$InvitedGroupImplFromJson(Map<String, dynamic> json) =>
    _$InvitedGroupImpl(
      userId: json['user_id'] as String,
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvitedGroupImplToJson(_$InvitedGroupImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'group': instance.group,
    };
