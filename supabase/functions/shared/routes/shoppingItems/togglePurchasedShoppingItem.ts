import {
	ShoppingItem,
	ShoppingItemRow,
	shoppingItemSelect,
	shoppingItemTable,
} from '../../models/shopping_item_model.ts';
import { ExpressRequest } from '../../anything.ts';
import { getClientInfo } from '../../admin_client.ts';
import { ApiError } from '../../express_app.ts';

export async function togglePurchasedShoppingItem(
	req: ExpressRequest,
): Promise<ShoppingItem> {
	// Parse and validate inputs
	// params
	const shoppingListId = req.params.id;
	const shoppingItemId = req.params.shoppingItemId;

	// body
	const body = req.body;
	const id = shoppingItemId;
	const isPurchased = body.isPurchased ?? false;
	const date = (new Date()).toISOString();

	// Get supabase client and required user data
	const { supabase, user, profile } = await getClientInfo(req);

	const { data: existsShoppingItem, error: eError } = await supabase
		.from(shoppingItemTable).select('*').eq('id', id).single<
		ShoppingItemRow
	>();

	if (eError) {
		console.error(eError);
		throw new ApiError(
			'Cannot get data! Please try again!',
			500,
			201500,
		);
	}

	if (
		!existsShoppingItem ||
		existsShoppingItem?.shopping_list_id != shoppingListId
	) {
		throw new ApiError('No item found!', 404, 202404);
	}

	const shoppingItemInput: Partial<ShoppingItemRow> = {
		purchased_by: isPurchased ? user.id : null,
		purchased_at: isPurchased ? date : null,
		//
		updated_at: date,
		updated_by: user.id,
	};

	const { data: updatedShoppingItem, error: uError } = await supabase.from(
		shoppingItemTable,
	)
		.update(
			shoppingItemInput,
		).eq('id', shoppingItemId)
		.select(shoppingItemSelect).single<ShoppingItem>();

	if (!updatedShoppingItem || uError) {
		console.error(eError);
		throw new ApiError(
			'Cannot get data! Please try again!',
			500,
			203500,
		);
	}

	return updatedShoppingItem;
}
