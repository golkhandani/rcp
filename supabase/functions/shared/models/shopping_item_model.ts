import { faker } from 'npm:@faker-js/faker';
import {
	generateFakeUserProfileData,
	UserProfile,
} from './user_profile_model.ts';
import { Database } from '../../types.ts';

export type ShoppingItemRow =
	Database['public']['Tables']['shopping_items']['Row'];

export const shoppingItemTable = 'shopping_items';

export const shoppingItemSelect = `
id: id,
shoppingListId: shopping_list_id,
name: name,
quantity: quantity,
purchasedAt: purchased_at,
purchasedBy: purchased_by (
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
)
`;

interface ShoppingItem {
	id: string;
	shoppingListId: string;
	name: string;
	quantity?: string | null;
	purchasedAt?: Date | null;
	purchasedBy?: UserProfile | null;
	createdAt: Date;
	createdBy: UserProfile;
	updatedAt: Date;
	updatedBy: UserProfile;
}

function generateFakeShoppingItemData(count: number): ShoppingItem[] {
	const fakeData: ShoppingItem[] = [];

	for (let i = 0; i < count; i++) {
		const id = faker.string.uuid();
		const shoppingListId = faker.string.uuid();
		const name = faker.animal.fish();

		const createdAt = faker.date.recent();
		const createdBy = generateFakeUserProfileData();
		const updatedAt = faker.date.recent();
		const updatedBy = generateFakeUserProfileData();
		const isPurchased = faker.datatype.boolean();

		fakeData.push({
			id,
			shoppingListId,
			name,
			quantity: '2 box',
			purchasedAt: isPurchased ? updatedAt : null,
			purchasedBy: isPurchased ? updatedBy : null,
			createdAt,
			createdBy,
			updatedAt,
			updatedBy,
		});
	}

	return fakeData;
}

export { generateFakeShoppingItemData };
export type { ShoppingItem };
