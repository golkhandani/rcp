// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateNewGroupReqImpl _$$CreateNewGroupReqImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateNewGroupReqImpl(
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
      userGroup: UserGroup.fromJson(json['userGroup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateNewGroupReqImplToJson(
        _$CreateNewGroupReqImpl instance) =>
    <String, dynamic>{
      'group': instance.group,
      'userGroup': instance.userGroup,
    };
