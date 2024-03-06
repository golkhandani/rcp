// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationImpl _$$InvitationImplFromJson(Map<String, dynamic> json) =>
    _$InvitationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      email: json['email'] as String,
      userProfileId: json['userProfileId'] as String,
      status: json['status'] as String,
      invitedAt: DateTime.parse(json['invitedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      shoppingList: ShoppingListSummary.fromJson(
          json['shoppingList'] as Map<String, dynamic>),
      invitedBy:
          UserProfile2.fromJson(json['invitedBy'] as Map<String, dynamic>),
      createdBy:
          UserProfile2.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedBy:
          UserProfile2.fromJson(json['updatedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvitationImplToJson(_$InvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'userProfileId': instance.userProfileId,
      'status': instance.status,
      'invitedAt': instance.invitedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'shoppingList': instance.shoppingList.toJson(),
      'invitedBy': instance.invitedBy.toJson(),
      'createdBy': instance.createdBy.toJson(),
      'updatedBy': instance.updatedBy.toJson(),
    };

_$ShoppingListSummaryImpl _$$ShoppingListSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingListSummaryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ShoppingListSummaryImplToJson(
        _$ShoppingListSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
