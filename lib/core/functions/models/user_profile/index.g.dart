// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileUpdateInputImpl _$$UserProfileUpdateInputImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileUpdateInputImpl(
      username: json['username'] as String,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$UserProfileUpdateInputImplToJson(
        _$UserProfileUpdateInputImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      username: json['username'] as String,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'username': instance.username,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
