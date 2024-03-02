// @deno-types="npm:@types/express@4"
import { Request } from 'npm:express@4.18.2';
import { getClients, getUserProfile } from '../shared/admin_client.ts';
import { generateFakeShoppingItemData } from '../shared/models/shopping_item_model.ts';

export async function addOrUpdateShoppingItem(req: Request) {
	const { admin, supabase } = getClients(req);
	const userProfile = await getUserProfile(req);

	const body = req.body;
	const id = body.id;
	const name = body.name;
	const quantity = body.quantity;

	const shoppingItems = generateFakeShoppingItemData(1);

	const shoppingItem = shoppingItems[0];
	if (id) {
		shoppingItem.id = id;
		shoppingItem.updatedBy = userProfile;
	} else {
		shoppingItem.createdBy = userProfile;
		shoppingItem.updatedBy = userProfile;
		shoppingItem.purchasedAt = null;
		shoppingItem.purchasedBy = null;
	}

	shoppingItem.name = name;
	if (quantity) {
		shoppingItem.quantity = quantity;
	}

	return shoppingItem;
}

export async function togglePurchasedShoppingItem(req: Request) {
	const { admin, supabase } = getClients(req);
	const userProfile = await getUserProfile(req);

	const body = req.body;
	const id = body.id;
	const isPurchased = body.isPurchased;

	const shoppingItems = generateFakeShoppingItemData(1);

	const shoppingItem = shoppingItems[0];
	shoppingItem.id = id;
	if (isPurchased) {
		shoppingItem.purchasedAt = null;
		shoppingItem.purchasedBy = null;
	} else {
		shoppingItem.purchasedAt = new Date();
		shoppingItem.purchasedBy = userProfile;
	}

	return shoppingItem;
}
