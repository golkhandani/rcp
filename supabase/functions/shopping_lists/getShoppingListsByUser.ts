import { ExpressRequest } from './../shared/anything.ts';
import { getClientInfo } from '../shared/admin_client.ts';
import {
	ShoppingList,
	shoppingListSelect,
} from '../shared/models/shopping_list_model.ts';
import { participantTable } from '../shared/models/participant_model.ts';
import { ParticipantStatus } from '../shared/models/participant_model.ts';
import { ApiError, Pagination } from '../shared/express_app.ts';

export async function getShoppingListsByUser(
	req: ExpressRequest,
): Promise<Array<ShoppingList>> {
	// Parse and validate inputs
	const pagination = new Pagination(req.query);

	// Get supabase client and required user data
	const { supabase, user } = await getClientInfo(req);

	// get query from participant table
	// use join to get list of user
	// map over items and add isOwner to model
	// isOwner => user.id == owner.userId
	// limit the number if items and participants as
	// this api only serve for summary and list data
	const { data: shoppingListRows, error } = await supabase.from(
		participantTable,
	)
		.select(
			`shoppingList: shopping_list_id (${shoppingListSelect})`,
		)
		.range(pagination.from, pagination.to)
		.eq(
			'status',
			ParticipantStatus.joined,
		)
		.eq(
			'user_id',
			user?.id,
		)
		.range(0, 4, {
			referencedTable: 'shopping_list_id.items',
		})
		.range(0, 4, { referencedTable: 'shopping_list_id.participants' })
		.order('created_at', {
			ascending: false,
		}).returns<{ shoppingList: Omit<ShoppingList, 'isOwner'> }[]>();

	if (error) {
		console.error(error);
		throw new ApiError('Cannot get data! Please try again!', 500, 20500);
	}

	const shoppingLists = shoppingListRows?.map((item) => {
		return {
			...item.shoppingList,
			isOwner: user.id ==
				item.shoppingList.owner.userId,
		};
	});
	return shoppingLists;
}
