// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_tenancy_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppTenancyStateImpl _$$AppTenancyStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AppTenancyStateImpl(
      isLoading: json['isLoading'] as bool,
      user: json['user'] == null
          ? null
          : UserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppTenancyStateImplToJson(
        _$AppTenancyStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'user': instance.user,
    };
