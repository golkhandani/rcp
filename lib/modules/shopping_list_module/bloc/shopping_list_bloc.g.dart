// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingListBlocStateImpl _$$ShoppingListBlocStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingListBlocStateImpl(
      isLoading: json['isLoading'] as bool,
      isLoadingItems: json['isLoadingItems'] as bool,
      isAddingItem: json['isAddingItem'] as bool,
      isDeletingItem: Map<String, bool>.from(json['isDeletingItem'] as Map),
      shoppingList: json['shoppingList'] == null
          ? null
          : ShoppingList.fromJson(json['shoppingList'] as Map<String, dynamic>),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      shoppingItems: (json['shoppingItems'] as List<dynamic>)
          .map((e) => ShoppingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      listQueryState: ListQueryState.fromJson(
          json['listQueryState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShoppingListBlocStateImplToJson(
        _$ShoppingListBlocStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isLoadingItems': instance.isLoadingItems,
      'isAddingItem': instance.isAddingItem,
      'isDeletingItem': instance.isDeletingItem,
      'shoppingList': instance.shoppingList,
      'participants': instance.participants,
      'shoppingItems': instance.shoppingItems,
      'listQueryState': instance.listQueryState,
    };
