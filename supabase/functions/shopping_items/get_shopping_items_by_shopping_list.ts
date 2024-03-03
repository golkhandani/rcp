import { FunctionException } from './../shared/exceptions/client_info_exception.ts';
import { ExpressRequest } from './../shared/anything.ts';
import {
	ShoppingItemRow,
	shoppingItemSelect,
	shoppingItemTable,
} from '../shared/models/shopping_item_model.ts';
import { getClientInfo } from '../shared/admin_client.ts';

export async function getShoppingItemsByShoppingList(req: ExpressRequest) {
	try {
		const { supabase, user, profile } = await getClientInfo(req);
		// params
		const shoppingListId = req.params.id;

		// pagination

		const pagination = {
			page: 1,
			pageSize: 10,
			sortKey: null,
			sortOrder: 'asc',
			...req.query,
		};

		const from = (pagination.page - 1) * pagination.pageSize;
		const to = from + (pagination.pageSize - 1);

		const { data: list, error: error } = await supabase
			.from(shoppingItemTable).select(shoppingItemSelect).range(from, to)
			.eq(
				'shopping_list_id',
				shoppingListId,
			).order('purchased_at', { ascending: false });
		return list;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}
