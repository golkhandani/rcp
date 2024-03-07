import {
	ShoppingItem,
	ShoppingItemRow,
	shoppingItemSelect,
	shoppingItemTable,
} from '../../models/shopping_item_model.ts';
import { ExpressRequest } from '../../anything.ts';
import { getClientInfo } from '../../admin_client.ts';
import { ApiError } from '../../express_app.ts';

export async function deleteShoppingItemById(
	req: ExpressRequest,
): Promise<ShoppingItem> {
	// Parse and validate inputs
	// params
	const shoppingListId = req.params.id;
	const shoppingItemId = req.params.shoppingItemId;

	// Get supabase client and required user data
	const { supabase } = await getClientInfo(req);

	const { data: existsShoppingItem, error: eError } = await supabase
		.from(shoppingItemTable).select('*').eq('id', shoppingItemId)
		.single<
			ShoppingItemRow
		>();

	if (
		!existsShoppingItem ||
		existsShoppingItem?.shopping_list_id != shoppingListId || eError
	) {
		console.error(eError);
		throw new ApiError(
			'Cannot get data! Please try again!',
			404,
			201500,
		);
	}

	const { data: deleted, error: dError } = await supabase.from(
		shoppingItemTable,
	)
		.delete().eq('id', shoppingItemId)
		.select(shoppingItemSelect).single<ShoppingItem>();

	if (!deleted || dError) {
		console.error(dError);
		throw new ApiError(
			'Cannot delete data! Please try again!',
			500,
			202500,
		);
	}
	return deleted;
}
