// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_tenancy_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppTenancyStateImpl _$$AppTenancyStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AppTenancyStateImpl(
      isLoading: json['isLoading'] as bool,
      selectedGroupId: json['selectedGroupId'] as String?,
      selectedGroup: json['selectedGroup'] == null
          ? null
          : Group.fromJson(json['selectedGroup'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppTenancyStateImplToJson(
        _$AppTenancyStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'selectedGroupId': instance.selectedGroupId,
      'selectedGroup': instance.selectedGroup,
      'user': instance.user,
    };
