import 'dart:math';

import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_model.freezed.dart';
part 'shopping_item_model.g.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();

  factory ShoppingItem({
    required String id,
    required String name,
    String? quantity,
    String? purchasedBy,
    DateTime? purchasedAt,
    required DateTime createdAt,
    required String createdBy,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);

  bool get isPurchased => purchasedBy != null && purchasedAt != null;
}

List<ShoppingItem> generateFakeShoppingItemData(int count) {
  List<ShoppingItem> fakeData = [];
  Faker faker = Faker();
  Random random = Random();

  for (int i = 0; i < count; i++) {
    String id = faker.guid.guid();
    String name = faker.food.cuisine();

    DateTime createdAt = faker.date.dateTime();
    String createdBy = faker.person.name();
    DateTime updatedAt = faker.date.dateTime();
    String updatedBy = faker.person.name();
    bool isPurchased = random.nextBool();

    fakeData.add(ShoppingItem(
      id: id,
      name: name,
      createdAt: createdAt,
      createdBy: createdBy,
      quantity: '2 box',
      purchasedAt: isPurchased ? updatedAt : null,
      purchasedBy: isPurchased ? updatedBy : null,
    ));
  }

  return fakeData;
}
