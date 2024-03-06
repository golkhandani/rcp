// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfile2Impl _$$UserProfile2ImplFromJson(Map<String, dynamic> json) =>
    _$UserProfile2Impl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfile2ImplToJson(_$UserProfile2Impl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'username': instance.username,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$InvitationCandidateImpl _$$InvitationCandidateImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationCandidateImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$InvitationCandidateImplToJson(
        _$InvitationCandidateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ShoppingListResponseImpl _$$ShoppingListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingListResponseImpl(
      shoppingLists: (json['shoppingLists'] as List<dynamic>)
          .map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShoppingListResponseImplToJson(
        _$ShoppingListResponseImpl instance) =>
    <String, dynamic>{
      'shoppingLists': instance.shoppingLists.map((e) => e.toJson()).toList(),
    };

_$ShoppingListImpl _$$ShoppingListImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingListImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ShoppingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      ownerId: UserProfile2.fromJson(json['ownerId'] as Map<String, dynamic>),
      createdBy:
          UserProfile2.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedBy:
          UserProfile2.fromJson(json['updatedBy'] as Map<String, dynamic>),
      isOwner: json['isOwner'] as bool,
    );

Map<String, dynamic> _$$ShoppingListImplToJson(_$ShoppingListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'participants': instance.participants.map((e) => e.toJson()).toList(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'ownerId': instance.ownerId.toJson(),
      'createdBy': instance.createdBy.toJson(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedBy': instance.updatedBy.toJson(),
      'isOwner': instance.isOwner,
    };
