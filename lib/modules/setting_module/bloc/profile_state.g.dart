// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileBlocStateImpl _$$ProfileBlocStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileBlocStateImpl(
      isLoading: json['isLoading'] as bool,
      isLoadingAvatar: json['isLoadingAvatar'] as bool,
      user: json['user'] == null
          ? null
          : UserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileBlocStateImplToJson(
        _$ProfileBlocStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isLoadingAvatar': instance.isLoadingAvatar,
      'user': instance.user,
    };
