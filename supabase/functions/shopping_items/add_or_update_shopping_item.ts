import { BasicException } from './../shared/exceptions/client_info_exception.ts';
import {
	ShoppingItemRow,
	shoppingItemSelect,
	shoppingItemTable,
} from './../shared/models/shopping_item_model.ts';
import { ExpressRequest } from './../shared/anything.ts';

import { getClientInfo } from '../shared/admin_client.ts';
import { FunctionException } from '../shared/exceptions/client_info_exception.ts';

export async function addOrUpdateShoppingItem(req: ExpressRequest) {
	try {
		const { supabase, user, profile } = await getClientInfo(req);

		// params
		const shoppingListId = req.params.id;
		const shoppingItemId = req.params.shoppingItemId;

		// body
		const body = req.body;
		const id = shoppingItemId;
		const name = body.name;
		const quantity = body.quantity;
		const date = (new Date()).toISOString();

		const { data: existsShoppingItem, error: existsError } = await supabase
			.from(shoppingItemTable).select('*').eq('id', id).single<
			ShoppingItemRow
		>();

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
				//
				updated_at: date,
				updated_by: user.id,
			};
		} // handle insert data
		else {
			shoppingItemInput = {
				shopping_list_id: shoppingListId,
				name: name,
				quantity: quantity,
				//
				updated_at: date,
				updated_by: user.id,
				created_at: date,
				created_by: user.id,
				purchased_at: null,
				purchased_by: null,
			};
		}

		const { data: insertedShoppingItem, error } = await supabase.from(
			shoppingItemTable,
		)
			.upsert(
				shoppingItemInput,
			)
			.select(shoppingItemSelect).single();

		return insertedShoppingItem;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}

export async function togglePurchasedShoppingItem(req: ExpressRequest) {
	try {
		const { supabase, user, profile } = await getClientInfo(req);
		// params
		const shoppingListId = req.params.id;
		const shoppingItemId = req.params.shoppingItemId;

		// body
		const body = req.body;
		const id = shoppingItemId;
		const isPurchased = body.isPurchased ?? false;
		const date = (new Date()).toISOString();

		const { data: existsShoppingItem, error: existsError } = await supabase
			.from(shoppingItemTable).select('*').eq('id', id).single<
			ShoppingItemRow
		>();

		if (
			!existsShoppingItem ||
			existsShoppingItem?.shopping_list_id != shoppingListId
		) {
			throw new BasicException('No item found!', 404);
		}

		const shoppingItemInput: Partial<ShoppingItemRow> = {
			purchased_by: isPurchased ? user.id : null,
			purchased_at: isPurchased ? date : null,
			//
			updated_at: date,
			updated_by: user.id,
		};

		const { data: updatedShoppingItem, error } = await supabase.from(
			shoppingItemTable,
		)
			.update(
				shoppingItemInput,
			).eq('id', shoppingItemId)
			.select(shoppingItemSelect).single();

		return updatedShoppingItem;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}
