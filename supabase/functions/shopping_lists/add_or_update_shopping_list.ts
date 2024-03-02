// @deno-types="npm:@types/express@4"
import { Request } from 'npm:express@4.18.2';
import { getClients, getUserProfile } from '../shared/admin_client.ts';
import { generateFakeShoppingListData } from '../shared/models/shopping_list_model.ts';

export async function addOrUpdateShoppingListById(req: Request) {
	const { admin, supabase } = getClients(req);
	const userProfile = await getUserProfile(req);

	const body = req.body;
	const id = body.id;
	const name = body.name;
	const description = body.description;

	const shoppingLists = generateFakeShoppingListData(1);

	const shoppingList = shoppingLists[0];
	if (id) {
		shoppingList.id = id;
	}
	shoppingList.name = name;
	if (description) {
		shoppingList.description = description;
	}
	shoppingList.createdBy = userProfile;
	shoppingList.updatedBy = userProfile;

	return shoppingList;
}
