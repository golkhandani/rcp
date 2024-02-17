// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupStateImpl _$$GroupStateImplFromJson(Map<String, dynamic> json) =>
    _$GroupStateImpl(
      isLoading: json['isLoading'] as bool,
      joinedGroups: (json['joinedGroups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingGroups: (json['pendingGroups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupId: json['groupId'] as String?,
    );

Map<String, dynamic> _$$GroupStateImplToJson(_$GroupStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'joinedGroups': instance.joinedGroups,
      'pendingGroups': instance.pendingGroups,
      'groupId': instance.groupId,
    };
