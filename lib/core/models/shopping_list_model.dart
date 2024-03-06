import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/extensions/string_extensions.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/environment.dart';

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

  String get safeName =>
      fullName?.dynamicSub(Environment.safeNameLimit) ?? username;

  factory UserProfile2.fromJson(Map<String, dynamic> json) =>
      _$UserProfile2FromJson(json);
}

@freezed
abstract class InvitationCandidate with _$InvitationCandidate {
  @JsonSerializable(explicitToJson: true)
  const InvitationCandidate._();
  @JsonSerializable(explicitToJson: true)
  const factory InvitationCandidate({
    required String id,
    required String userId,
    required String username,
    required String email,
    String? fullName,
    String? avatarUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _InvitationCandidate;

  String get safeName =>
      fullName?.dynamicSub(Environment.safeNameLimit) ?? username;

  factory InvitationCandidate.fromJson(Map<String, dynamic> json) =>
      _$InvitationCandidateFromJson(json);
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
    required UserProfile2 ownerId,
    required UserProfile2 createdBy,
    required DateTime updatedAt,
    required UserProfile2 updatedBy,
    required bool isOwner,
  }) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
}
