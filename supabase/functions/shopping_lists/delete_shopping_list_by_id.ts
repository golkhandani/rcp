import { getClientInfo } from '../shared/admin_client.ts';
import { ExpressRequest } from '../shared/anything.ts';
import { shoppingListTable } from '../shared/models/shopping_list_model.ts';
import { participantTable } from '../shared/models/participant_model.ts';
export async function deleteShoppingListById(req: ExpressRequest) {
	const { supabase, user, profile } = await getClientInfo(req);

	const id = req.params.id;

	// remove all particpants first
	const { data: participants, error: pError } = await supabase.from(
		participantTable,
	).delete().eq(
		'shopping_list_id',
		id,
	).select().single();

	const { data: shoppingList, error: sError } = await supabase.from(
		shoppingListTable,
	)
		.delete().eq(
			'id',
			id,
		).select().single();

	return shoppingList;
}
