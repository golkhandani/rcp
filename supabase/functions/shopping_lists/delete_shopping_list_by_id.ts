import { shoppingItemTable } from './../shared/models/shopping_item_model.ts';
import { getClientInfo } from '../shared/admin_client.ts';
import { ExpressRequest } from '../shared/anything.ts';
import { shoppingListTable } from '../shared/models/shopping_list_model.ts';
import { participantTable } from '../shared/models/participant_model.ts';
export async function deleteShoppingListById(req: ExpressRequest) {
	const { supabase, user, profile } = await getClientInfo(req);

	const id = req.params.id;

	// remove all participants first
	const { data: participants, error: pError } = await supabase.from(
		participantTable,
	).delete().eq(
		'shopping_list_id',
		id,
	).select().single();

	// remove all items then
	const { data: items, error: iError } = await supabase.from(
		shoppingItemTable,
	).delete().eq(
		'shopping_list_id',
		id,
	).select().single();

	// remove list
	const { data: shoppingList, error: sError } = await supabase.from(
		shoppingListTable,
	)
		.delete().eq(
			'id',
			id,
		).select().single();

	return shoppingList;
}
