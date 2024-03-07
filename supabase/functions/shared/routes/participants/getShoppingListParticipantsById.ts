import {
	participantSelect,
	participantTable,
} from '../../models/participant_model.ts';
import { getClientInfo } from '../../admin_client.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';
import { Participant } from '../../models/participant_model.ts';

export async function getShoppingListParticipantsById(
	req: ExpressRequest,
): Promise<Participant[]> {
	// Parse and validate inputs
	const id = req.params.id;
	if (!id) {
		throw new ApiError('Id is not valid!', 404);
	}

	// Get supabase client and required user data
	const { supabase } = await getClientInfo(req);
	const { data: participants, error: error } = await supabase
		.from(participantTable).select(participantSelect).eq(
			'shopping_list_id',
			id,
		).returns<Participant[]>();

	if (error) {
		console.error(error);
		throw new ApiError('Cannot get data! Please try again!', 500, 201500);
	}
	return participants;
}
