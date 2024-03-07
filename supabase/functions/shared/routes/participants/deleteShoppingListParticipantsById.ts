import { ExpressRequest } from '../../anything.ts';
import { getClientInfo } from '../../admin_client.ts';
import {
	Participant,
	ParticipantRow,
	participantSelect,
	participantTable,
} from '../../models/participant_model.ts';
import { ApiError } from '../../express_app.ts';

export async function deleteShoppingListParticipantsById(
	req: ExpressRequest,
): Promise<Participant> {
	// Parse and validate inputs
	const participantId = req.params.participantId;

	const { supabase } = await getClientInfo(req);

	const { data: exists, error: eError } = await supabase.from(
		participantTable,
	)
		.select()
		.eq(
			'id',
			participantId,
		)
		.single<ParticipantRow>();

	if (!exists || eError) {
		console.error(eError);
		throw new ApiError(
			eError?.message ?? 'Not found!',
			exists ? 500 : 404,
			201500,
		);
	}

	const { data: deleted, error: dError } = await supabase.from(
		participantTable,
	)
		.delete()
		.eq(
			'id',
			exists.id,
		)
		.select(participantSelect).single<Participant>();

	if (!deleted || dError) {
		console.error(dError);
		throw new ApiError(
			dError?.message ?? 'Not found!',
			500,
			202500,
		);
	}

	return deleted;
}
