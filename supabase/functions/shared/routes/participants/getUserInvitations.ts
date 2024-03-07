import { getClientInfo } from '../../admin_client.ts';
import {
	ParticipantInvitation,
	participantInvitationSelect,
	ParticipantStatus,
	participantTable,
} from '../../models/participant_model.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';

export async function getUserInvitations(
	req: ExpressRequest,
): Promise<ParticipantInvitation[]> {
	const { supabase, user, profile } = await getClientInfo(req);

	const { data: invitations, error: existsError } = await supabase
		.from(participantTable).select(participantInvitationSelect).eq(
			'user_id',
			user.id,
		).eq('status', ParticipantStatus.invited).returns<
		ParticipantInvitation[]
	>();

	if (existsError) {
		console.log(existsError);
		throw new ApiError('Cannot get data! Please try again!', 500, 201500);
	}

	return invitations;
}
