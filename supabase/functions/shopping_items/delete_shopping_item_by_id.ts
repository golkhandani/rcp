import { BasicException } from './../shared/exceptions/client_info_exception.ts';
import {
	ShoppingItemRow,
	shoppingItemSelect,
	shoppingItemTable,
} from './../shared/models/shopping_item_model.ts';
import { ExpressRequest } from './../shared/anything.ts';

import { getClientInfo } from '../shared/admin_client.ts';
import { FunctionException } from '../shared/exceptions/client_info_exception.ts';

export async function deleteShoppingItemById(req: ExpressRequest) {
	try {
		const { supabase, user, profile } = await getClientInfo(req);

		// params
		const shoppingListId = req.params.id;
		const shoppingItemId = req.params.shoppingItemId;

		const { data: existsShoppingItem, error: existsError } = await supabase
			.from(shoppingItemTable).select('*').eq('id', shoppingItemId)
			.single<
				ShoppingItemRow
			>();

		if (
			!existsShoppingItem ||
			existsShoppingItem?.shopping_list_id != shoppingListId
		) {
			throw new BasicException('No item found!', 404);
		}

		const { data: deleted, error } = await supabase.from(
			shoppingItemTable,
		)
			.delete().eq('id', shoppingItemId)
			.select(shoppingItemSelect).single();
		return deleted;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}
