import { getClientInfo } from '../shared/admin_client.ts';
import {
	ShoppingList,
	shoppingListTable,
	ShoppingListWithoutIsOwner,
} from '../shared/models/shopping_list_model.ts';
import { shoppingListSelect } from '../shared/models/shopping_list_model.ts';
import { ApiError, ExpressRequest } from '../shared/express_app.ts';

export async function getShoppingListById(
	{ req }: { req: ExpressRequest },
): Promise<ShoppingList> {
	// Parse and validate inputs
	const id = req.params.id;
	if (!id) {
		throw new ApiError('Id is not valid!', 404);
	}

	// Get supabase client and required user data
	const { supabase, user } = await getClientInfo(req);

	const { data: existsShoppingList, error } = await supabase
		.from(shoppingListTable).select(shoppingListSelect).eq('id', id)
		.range(0, 4, { referencedTable: 'items' })
		.range(0, 4, { referencedTable: 'participants' })
		.single<ShoppingListWithoutIsOwner>();
	if (error) {
		console.error(error);
		throw new ApiError('Cannot get data! Please try again!', 500, 20500);
	}
	return {
		...existsShoppingList,
		isOwner: user.id == existsShoppingList.owner.userId,
	};
}
