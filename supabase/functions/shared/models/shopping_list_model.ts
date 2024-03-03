import { faker } from 'npm:@faker-js/faker';
import {
	generateFakeParticipantData,
	Participant,
	participantSelect,
} from './participant_model.ts';
import {
	generateFakeShoppingItemData,
	ShoppingItem,
	shoppingItemSelect,
} from './shopping_item_model.ts';
import { UserProfile } from './user_profile_model.ts';
import { generateFakeUserProfileData } from './user_profile_model.ts';
import { Database } from '../../types.ts';

export type ShoppingListRow =
	Database['public']['Tables']['shopping_lists']['Row'];

export const shoppingListTable = 'shopping_lists';

abstract class ShoppingList {
	id!: string;
	name!: string;
	description?: string | null;
	participants!: Participant[];
	items!: ShoppingItem[];
	createdAt!: Date;
	createdBy!: UserProfile;
	updatedAt!: Date;
	updatedBy!: UserProfile;
	constructor(input: ShoppingList) {
		Object.assign(this, input);
		return this;
	}
}

const shoppingListSelect = `
id: id,
name: name,
description: description,
ownerId: owner_id (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
updatedAt: updated_at,
updatedBy: updated_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
createdAt: created_at,
createdBy: created_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
participants: participants(${participantSelect}),
items: shopping_items(${shoppingItemSelect})
`;
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

export { generateFakeShoppingListData, shoppingListSelect };
export type { ShoppingList };
