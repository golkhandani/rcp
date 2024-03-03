import {
	participantSelect,
	participantTable,
} from './../shared/models/participant_model.ts';
// @deno-types="npm:@types/express@4"
import { Request } from 'npm:express@4.18.2';
import { getClientInfo } from '../shared/admin_client.ts';
import {
	generateFakeShoppingListData,
	shoppingListTable,
} from '../shared/models/shopping_list_model.ts';
import { shoppingListSelect } from '../shared/models/shopping_list_model.ts';

export async function getShoppingListById(req: Request) {
	const { supabase, user, profile } = await getClientInfo(req);
	const id = req.params.id;
	const { data: existsShoppingList, error: existsError } = await supabase
		.from(shoppingListTable).select(shoppingListSelect).eq('id', id)
		.single();
	return existsShoppingList;
}

export async function getShoppingListParticipantsById(req: Request) {
	const { supabase, user, profile } = await getClientInfo(req);
	const id = req.params.id;
	const { data: existsShoppingList, error: existsError } = await supabase
		.from(participantTable).select(participantSelect).eq(
			'shopping_list_id',
			id,
		);
	return existsShoppingList;
}
