import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_item_model.dart';

part 'shopping_list_model.freezed.dart';
part 'shopping_list_model.g.dart';

@freezed
class ShoppingListModel with _$ShoppingListModel {
  @JsonSerializable(explicitToJson: true)
  factory ShoppingListModel({
    required String id,
    required String name,
    String? description,
    required List<Participant> participants,
    required List<ShoppingItem> items,
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

  for (int i = 0; i < count; i++) {
    String id = faker.guid.guid();
    String name = faker.company.name();
    String? description = faker.lorem.sentence();
    List<Participant> participants = generateFakeParticipantData(5);
    List<ShoppingItem> items = generateFakeShoppingItemData(5);
    DateTime createdAt = faker.date.dateTime();
    String createdBy = faker.person.name();
    DateTime updatedAt = faker.date.dateTime();
    String updatedBy = faker.person.name();

    fakeData.add(ShoppingListModel(
      id: id,
      name: name,
      description: description,
      participants: participants,
      items: items,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
    ));
  }

  return fakeData;
}
