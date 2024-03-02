import 'dart:math';

import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/shopping_list_model.dart';

part 'participant_model.freezed.dart';
part 'participant_model.g.dart';

@freezed
class Participant with _$Participant {
  @JsonSerializable(explicitToJson: true)
  factory Participant({
    required String id,
    required String userId,
    required String email,
    required UserProfile2 profile,
    required ParticipantStatus status,
    required DateTime createdAt,
    required UserProfile2 createdBy,
    required DateTime updatedAt,
    required UserProfile2 updatedBy,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

enum ParticipantStatus {
  @JsonValue("invited")
  invited,
  @JsonValue("joined")
  joined,
}

List<Participant> generateFakeParticipantData(int count) {
  List<Participant> fakeData = [];
  Faker faker = Faker();
  Random random = Random();

  for (int i = 0; i < count; i++) {
    String id = faker.guid.guid();
    String userId = faker.guid.guid();
    String email = faker.internet.email();

    DateTime createdAt = faker.date.dateTime();
    DateTime updatedAt = faker.date.dateTime();
    ParticipantStatus status = random.nextBool()
        ? ParticipantStatus.joined
        : ParticipantStatus.invited;

    fakeData.add(Participant(
      id: id,
      userId: userId,
      email: email,
      profile: generateFakeUserProfileData(),
      createdAt: createdAt,
      createdBy: generateFakeUserProfileData(),
      updatedAt: updatedAt,
      updatedBy: generateFakeUserProfileData(),
      status: status,
    ));
  }

  return fakeData;
}
