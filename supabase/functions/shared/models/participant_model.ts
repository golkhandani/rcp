import { faker } from 'npm:@faker-js/faker';
import {
	generateFakeUserProfileData,
	UserProfile,
} from './user_profile_model.ts';

interface Participant {
	id: string;
	userId: string;
	email: string;
	profile: UserProfile;
	status: ParticipantStatus;
	createdAt: Date;
	createdBy: UserProfile;
	updatedAt: Date;
	updatedBy: UserProfile;
}

enum ParticipantStatus {
	invited = 'invited',
	joined = 'joined',
}

function generateFakeParticipantData(count: number): Participant[] {
	const fakeData: Participant[] = [];

	for (let i = 0; i < count; i++) {
		const id = faker.string.uuid();
		const userId = faker.string.uuid();
		const email = faker.internet.email();
		const profile = generateFakeUserProfileData();

		const createdAt = faker.date.recent();
		const createdBy = generateFakeUserProfileData();
		const updatedAt = faker.date.recent();
		const updatedBy = generateFakeUserProfileData();
		const status = faker.datatype.boolean()
			? ParticipantStatus.joined
			: ParticipantStatus.invited;

		fakeData.push({
			id,
			userId,
			email,
			profile,
			createdAt,
			createdBy,
			updatedAt,
			updatedBy,
			status,
		});
	}

	return fakeData;
}

export { generateFakeParticipantData, ParticipantStatus };
export type { Participant };
