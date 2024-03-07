import {
	ShoppingItem,
	ShoppingItemRow,
	shoppingItemSelect,
	shoppingItemTable,
} from '../../models/shopping_item_model.ts';
import { ExpressRequest } from '../../anything.ts';
import { getClientInfo } from '../../admin_client.ts';
import { ApiError } from '../../express_app.ts';

export async function addOrUpdateShoppingItem(
	req: ExpressRequest,
): Promise<ShoppingItem> {
	// Parse and validate inputs
	const shoppingListId = req.params.id;
	const shoppingItemId = req.params.shoppingItemId;
	if (typeof shoppingListId != 'string') {
		throw new ApiError(
			'Cannot get data! Please try again!',
			400,
			201400,
		);
	}
	console.log('shoppingListId', shoppingListId, typeof shoppingListId);
	console.log('shoppingItemId', shoppingItemId, typeof shoppingItemId);
	// body
	const body = req.body;
	const id = shoppingItemId;
	const name = body.name;
	const quantity = body.quantity;
	const date = (new Date()).toISOString();

	let existsShoppingItem: ShoppingItemRow | undefined;

	// Get supabase client and required user data
	const { supabase, user } = await getClientInfo(req);

	if (shoppingItemId && typeof shoppingItemId == 'string') {
		const { data: exists, error: eError } = await supabase
			.from(shoppingItemTable).select('*').eq('id', id).single<
			ShoppingItemRow
		>();

		if (eError) {
			console.error(eError);
			throw new ApiError(
				'Cannot get data! Please try again!',
				500,
				202500,
			);
		}
		existsShoppingItem = exists;
	}

	let shoppingItemInput: Omit<ShoppingItemRow, 'id'>;

	// handle update data
	if (
		existsShoppingItem &&
		existsShoppingItem.shopping_list_id == shoppingListId
	) {
		shoppingItemInput = {
			...existsShoppingItem,
			name: name,
			quantity: quantity,
			// regular updates
			updated_at: date,
			updated_by: user.id,
		};
	} // handle insert data
	else {
		shoppingItemInput = {
			shopping_list_id: shoppingListId,
			name: name,
			quantity: quantity,
			// regular data
			updated_at: date,
			updated_by: user.id,
			created_at: date,
			created_by: user.id,
			purchased_at: null,
			purchased_by: null,
		};
	}

	console.log(shoppingItemInput);

	const { data: insertedShoppingItem, error: iError } = await supabase
		.from(
			shoppingItemTable,
		)
		.upsert(
			shoppingItemInput,
		)
		.select(shoppingItemSelect).single<ShoppingItem>();

	if (!insertedShoppingItem || iError) {
		console.error(iError);
		throw new ApiError(
			'Cannot create item! Please try again!',
			500,
			202500,
		);
	}
	return insertedShoppingItem;
}
