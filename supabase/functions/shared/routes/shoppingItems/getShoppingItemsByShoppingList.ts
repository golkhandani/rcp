import { FunctionException } from '../../exceptions/client_info_exception.ts';
import { ExpressRequest } from '../../anything.ts';
import {
	ShoppingItem,
	shoppingItemSelect,
	shoppingItemTable,
} from '../../models/shopping_item_model.ts';
import { getClientInfo } from '../../admin_client.ts';
import { ApiError, Pagination } from '../../express_app.ts';

export async function getShoppingItemsByShoppingList(
	req: ExpressRequest,
): Promise<ShoppingItem[]> {
	try {
		// Parse and validate inputs
		const shoppingListId = req.params.id;
		if (!shoppingListId) {
			throw new ApiError('Id is not valid!', 404);
		}
		// pagination
		// Parse and validate inputs
		const pagination = new Pagination(req.query);

		const { supabase } = await getClientInfo(req);

		const { data: list = [], error: error } = await supabase
			.from(shoppingItemTable).select(shoppingItemSelect).range(
				pagination.from,
				pagination.to,
			)
			.eq(
				'shopping_list_id',
				shoppingListId,
			).order('purchased_at', { ascending: false }).returns<
			ShoppingItem[]
		>();

		if (!list || error) {
			console.error(error);
			throw new ApiError(
				'Cannot get data! Please try again!',
				500,
				201500,
			);
		}

		return list;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}
