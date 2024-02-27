// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeBlocStateImpl _$$HomeBlocStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeBlocStateImpl(
      isLoading: json['isLoading'] as bool,
      shoppingLists: (json['shoppingLists'] as List<dynamic>)
          .map((e) => ShoppingListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeBlocStateImplToJson(_$HomeBlocStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'shoppingLists': instance.shoppingLists,
    };
