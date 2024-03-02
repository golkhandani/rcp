import { faker } from 'npm:@faker-js/faker';

interface UserProfile {
	id: string;
	userId: string;
	username: string;
	fullName: string | null;
	avatarUrl: string | null;
	createdAt: Date;
	updatedAt: Date;
}

function generateFakeUserProfileData(): UserProfile {
	const profile: UserProfile = {
		id: faker.string.uuid(),
		userId: faker.string.uuid(),
		username: faker.internet.userName(),
		fullName: faker.internet.displayName(),
		avatarUrl: faker.image.url(),
		createdAt: faker.date.recent(),
		updatedAt: faker.date.recent(),
	};

	return profile;
}

export { generateFakeUserProfileData };
export type { UserProfile };
