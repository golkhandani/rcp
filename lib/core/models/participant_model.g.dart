// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      email: json['email'] as String,
      profile: UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'profile': instance.profile.toJson(),
      'status': _$ParticipantStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.invited: 'invited',
  ParticipantStatus.joined: 'joined',
};
