import { faker } from 'npm:@faker-js/faker';
import {
	generateFakeParticipantData,
	Participant,
} from './participant_model.ts';
import {
	generateFakeShoppingItemData,
	ShoppingItem,
} from './shopping_item_model.ts';
import { UserProfile } from './user_profile_model.ts';
import { generateFakeUserProfileData } from './user_profile_model.ts';

interface ShoppingList {
	id: string;
	name: string;
	description?: string | null;
	participants: Participant[];
	items: ShoppingItem[];
	createdAt: Date;
	createdBy: UserProfile;
	updatedAt: Date;
	updatedBy: UserProfile;
}

function generateFakeShoppingListData(count: number): ShoppingList[] {
	const fakeData: ShoppingList[] = [];

	for (let i = 0; i < count; i++) {
		const id = faker.string.uuid();
		const name = faker.company.name();
		const description = faker.lorem.sentence();
		const participants: Participant[] = generateFakeParticipantData(
			faker.number.int({ max: 11 }),
		);
		const items: ShoppingItem[] = generateFakeShoppingItemData(
			faker.number.int({ max: 11 }),
		);
		const createdAt = faker.date.recent();
		const createdBy = generateFakeUserProfileData();
		const updatedAt = faker.date.recent();
		const updatedBy = generateFakeUserProfileData();

		fakeData.push({
			id,
			name,
			description,
			participants,
			items,
			createdAt,
			createdBy,
			updatedAt,
			updatedBy,
		});
	}

	return fakeData;
}

export { generateFakeShoppingListData };
export type { ShoppingList };
