import { ExpressRequest } from '../shared/anything.ts';
import { getClientInfo } from '../shared/admin_client.ts';
import {
	ShoppingListRow,
	shoppingListSelect,
	shoppingListTable,
} from '../shared/models/shopping_list_model.ts';
import { FunctionsError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { ShoppingList } from '../shared/models/shopping_list_model.ts';
import { FunctionException } from '../shared/exceptions/client_info_exception.ts';

export async function updateShoppingListById(
	req: ExpressRequest,
): Promise<ShoppingList> {
	try {
		const { supabase, user, profile } = await getClientInfo(req);

		const body = req.body;
		const id = req.params.id;
		const name = body.name;
		const description = body.description;
		const date = (new Date()).toISOString();

		const { data: existsShoppingList, error: existsError } = await supabase
			.from(shoppingListTable).select('*').eq('id', id).single();
		if (existsShoppingList == null) {
			throw new FunctionsError('Shopping list not found!');
		}

		const shoppingListInput: Omit<ShoppingListRow, 'id'> = {
			...existsShoppingList,
			name: name,
			description: description,
			updated_at: date,
			updated_by: profile.userId,
		};

		const { data: insertedShoppingList, error } = await supabase.from(
			shoppingListTable,
		)
			.update(
				shoppingListInput,
			).eq('id', id)
			.select(shoppingListSelect).single();

		if (insertedShoppingList == null || error) {
			console.error(error);
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!',
			);
		}

		const result = {
			...insertedShoppingList,
			items: [],
		};

		return result as unknown as ShoppingList;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}
