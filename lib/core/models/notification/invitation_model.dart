import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/participant_model.dart';

part 'invitation_model.freezed.dart';
part 'invitation_model.g.dart';

@freezed
class Invitation with _$Invitation {
  @JsonSerializable(explicitToJson: true)
  factory Invitation({
    required String id,
    required Participant invited,
    required Participant invitedBy,
    required String shoppingListId,
    required String name,
    required String? description,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _Invitation;

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

List<Invitation> generateFakeInvitationData(int count) {
  List<Invitation> fakeData = [];
  Faker faker = Faker();

  for (int i = 0; i < count; i++) {
    String id = faker.guid.guid();
    List<Participant> participants = generateFakeParticipantData(2);

    String shoppingListId = faker.guid.guid();
    String name = faker.company.name();
    String? description = faker.lorem.sentence();
    DateTime createdAt = faker.date.dateTime();
    String createdBy = faker.person.name();
    DateTime updatedAt = faker.date.dateTime();
    String updatedBy = faker.person.name();

    fakeData.add(Invitation(
      id: id,
      invited: participants[0],
      invitedBy: participants[1],
      shoppingListId: shoppingListId,
      name: name,
      description: description,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
    ));
  }

  return fakeData;
}
