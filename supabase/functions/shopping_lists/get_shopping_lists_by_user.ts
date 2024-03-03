import { shoppingListTable } from './../shared/models/shopping_list_model.ts';
import { ExpressRequest } from './../shared/anything.ts';

import { getClientInfo } from '../shared/admin_client.ts';
import { shoppingListSelect } from '../shared/models/shopping_list_model.ts';
import { participantTable } from '../shared/models/participant_model.ts';
import { generateFakeShoppingItemData } from '../shared/models/shopping_item_model.ts';
import { ParticipantStatus } from '../shared/models/participant_model.ts';

export async function getShoppingListsByUser(req: ExpressRequest) {
	const { supabase, user, profile } = await getClientInfo(req);

	const pagination = {
		page: 1,
		pageSize: 10,
		sortKey: null,
		sortOrder: 'asc',
		...req.query,
	};
	const from = (pagination.page - 1) * pagination.pageSize;
	const to = from + (pagination.pageSize - 1);
	const { data: data, error } = await supabase.from(participantTable)
		.select(
			`shoppingList: shopping_list_id (${shoppingListSelect})`,
		).range(from, to).range(0, 3, { referencedTable: 'shopping_list_id' })
		.eq(
			'status',
			ParticipantStatus.joined,
		)
		.eq(
			'user_id',
			user?.id,
		).order('created_at', {
			ascending: false,
		});
	const shoppingLists = data?.map((item) => {
		return {
			...item.shoppingList,
		};
	});
	return shoppingLists;
}
