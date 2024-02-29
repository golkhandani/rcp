import 'dart:math';

import 'package:faker/faker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/functions/user_profile/index.dart';

part 'participant_model.freezed.dart';
part 'participant_model.g.dart';

@freezed
class Participant with _$Participant {
  @JsonSerializable(explicitToJson: true)
  factory Participant({
    required String id,
    required String userId,
    required String email,
    required UserProfile profile,
    required ParticipantStatus status,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

enum ParticipantStatus {
  invited,
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
    UserProfile profile = UserProfile(
      id: faker.guid.guid(),
      userId: userId,
      username: faker.internet.userName(),
      createdAt: faker.date.dateTime().toString(),
      updatedAt: faker.date.dateTime().toString(),
    );

    DateTime createdAt = faker.date.dateTime();
    String createdBy = faker.person.name();
    DateTime updatedAt = faker.date.dateTime();
    String updatedBy = faker.person.name();
    ParticipantStatus status = random.nextBool()
        ? ParticipantStatus.joined
        : ParticipantStatus.invited;

    fakeData.add(Participant(
      id: id,
      userId: userId,
      email: email,
      profile: profile,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
      updatedBy: updatedBy,
      status: status,
    ));
  }

  return fakeData;
}
