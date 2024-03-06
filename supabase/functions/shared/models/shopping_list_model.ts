import { Participant, participantSelect } from './participant_model.ts';
import { ShoppingItem, shoppingItemSelect } from './shopping_item_model.ts';
import { UserProfile } from './user_profile_model.ts';
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
	owner!: UserProfile;
	createdAt!: Date;
	createdBy!: UserProfile;
	updatedAt!: Date;
	updatedBy!: UserProfile;
	isOwner!: boolean;
	constructor(input: ShoppingList) {
		Object.assign(this, input);
		return this;
	}
}

export type ShoppingListWithoutIsOwner = Omit<ShoppingList, 'isOwner'>;

const shoppingListSelect = `
id: id,
name: name,
description: description,
owner: owner_id (
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

export { shoppingListSelect };
export type { ShoppingList };
