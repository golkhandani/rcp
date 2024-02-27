import 'dart:math';

import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list_model.freezed.dart';
part 'shopping_list_model.g.dart';

@freezed
class ShoppingListModel with _$ShoppingListModel {
  factory ShoppingListModel({
    required String id,
    required String name,
    String? description,
    required List<String> participantNames,
    required List<String> itemNames,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _ShoppingListModel;

  factory ShoppingListModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListModelFromJson(json);
}

List<ShoppingListModel> generateFakeShoppingListData(int count) {
  List<ShoppingListModel> fakeData = [];
  Faker faker = Faker();
  Random random = Random();

  for (int i = 0; i < count; i++) {
    String id = faker.guid.guid();
    String name = faker.lorem.words(3).join(' ');
    String? description = faker.lorem.sentence();
    List<String> participantNames =
        List.generate(random.nextInt(5) + 1, (index) => faker.person.name());
    List<String> itemNames =
        List.generate(random.nextInt(10) + 1, (index) => faker.food.dish());
    DateTime createdAt = faker.date.dateTime();
    String createdBy = faker.person.name();
    DateTime updatedAt = faker.date.dateTime();
    String updatedBy = faker.person.name();

    fakeData.add(ShoppingListModel(
      id: id,
      name: name,
      description: description,
      participantNames: participantNames,
      itemNames: itemNames,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
    ));
  }

  return fakeData;
}
