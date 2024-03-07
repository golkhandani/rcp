import { ExpressRequest } from '../../anything.ts';
import { getClientInfo } from '../../admin_client.ts';
import {
	Participant,
	ParticipantRow,
	participantSelect,
	ParticipantStatus,
	participantTable,
} from '../../models/participant_model.ts';
import { ApiError } from '../../express_app.ts';

export async function updateStatusShoppingListParticipantsById(
	req: ExpressRequest,
): Promise<Participant> {
	// Parse and validate inputs
	const shoppingListId = req.params.id;
	const participantId = req.params.participantId;
	// body
	const date = (new Date()).toISOString();

	// Get supabase client and required user data
	const { supabase, user } = await getClientInfo(req);

	const { data: exists, error: eError } = await supabase.from(
		participantTable,
	)
		.select()
		.eq(
			'id',
			participantId,
		)
		.eq(
			'status',
			ParticipantStatus.invited,
		)
		.eq(
			'shopping_list_id',
			shoppingListId,
		)
		.eq(
			'user_id',
			user?.id,
		).single<ParticipantRow>();

	if (!exists || eError) {
		console.error(eError);
		throw new ApiError(
			eError?.message ?? 'Cannot Update participant!',
			400,
			201400,
		);
	}

	const participant: Partial<ParticipantRow> = {
		...exists,
		// update status
		status: ParticipantStatus.joined,
		// regular updates
		updated_at: date,
		updated_by: user.id,
	};

	const { data: updated, error: uError } = await supabase.from(
		participantTable,
	)
		.update(participant)
		.eq(
			'id',
			exists.id,
		)
		.select(participantSelect).single<Participant>();

	if (!updated || uError) {
		console.error(uError);
		throw new ApiError(
			uError.message ?? 'Something is wrong!',
			500,
			202500,
		);
	}

	return updated;
}
