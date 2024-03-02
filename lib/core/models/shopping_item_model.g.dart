// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemImpl _$$ShoppingItemImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingItemImpl(
      id: json['id'] as String,
      shoppingListId: json['shoppingListId'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as String?,
      purchasedBy: json['purchasedBy'] == null
          ? null
          : UserProfile2.fromJson(json['purchasedBy'] as Map<String, dynamic>),
      purchasedAt: json['purchasedAt'] == null
          ? null
          : DateTime.parse(json['purchasedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy:
          UserProfile2.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShoppingItemImplToJson(_$ShoppingItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shoppingListId': instance.shoppingListId,
      'name': instance.name,
      'quantity': instance.quantity,
      'purchasedBy': instance.purchasedBy?.toJson(),
      'purchasedAt': instance.purchasedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy.toJson(),
    };
