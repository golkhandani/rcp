import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_item_model.dart';

part 'shopping_list_model.freezed.dart';
part 'shopping_list_model.g.dart';

@freezed
abstract class UserProfile2 with _$UserProfile2 {
  @JsonSerializable(explicitToJson: true)
  const UserProfile2._();
  @JsonSerializable(explicitToJson: true)
  const factory UserProfile2({
    required String id,
    required String userId,
    required String username,
    String? fullName,
    String? avatarUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile2;

  String get safeName => fullName ?? username;

  factory UserProfile2.fromJson(Map<String, dynamic> json) =>
      _$UserProfile2FromJson(json);
}

UserProfile2 generateFakeUserProfileData() {
  Faker faker = Faker();
  String id = faker.guid.guid();
  String userId = faker.guid.guid();
  String name = faker.internet.userName();
  String? fullName = faker.person.name();

  String avatarUrl = faker.image.image();
  DateTime createdAt = faker.date.dateTime();

  DateTime updatedAt = faker.date.dateTime();

  UserProfile2 fakeData = UserProfile2(
    id: id,
    userId: userId,
    username: name,
    fullName: fullName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  return fakeData;
}

@freezed
class ShoppingListResponse with _$ShoppingListResponse {
  @JsonSerializable(explicitToJson: true)
  factory ShoppingListResponse({
    required List<ShoppingList> shoppingLists,
  }) = _ShoppingListResponse;

  factory ShoppingListResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListResponseFromJson(json);
}

@freezed
class ShoppingList with _$ShoppingList {
  @JsonSerializable(explicitToJson: true)
  factory ShoppingList({
    required String id,
    required String name,
    String? description,
    required List<Participant> participants,
    required List<ShoppingItem> items,
    required DateTime createdAt,
    required UserProfile2 createdBy,
    required DateTime updatedAt,
    required UserProfile2 updatedBy,
  }) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
}

List<ShoppingList> generateFakeShoppingListData(int count) {
  List<ShoppingList> fakeData = [];
  Faker faker = Faker();

  for (int i = 0; i < count; i++) {
    String id = faker.guid.guid();
    String name = faker.company.name();
    String? description = faker.lorem.sentence();
    List<Participant> participants = generateFakeParticipantData(5);
    List<ShoppingItem> items = generateFakeShoppingItemData(5);
    DateTime createdAt = faker.date.dateTime();
    UserProfile2 createdBy = generateFakeUserProfileData();
    DateTime updatedAt = faker.date.dateTime();
    UserProfile2 updatedBy = generateFakeUserProfileData();

    fakeData.add(ShoppingList(
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
