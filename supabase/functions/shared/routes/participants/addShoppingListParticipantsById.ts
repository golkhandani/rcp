import { ExpressRequest } from '../../anything.ts';
import { getClientInfo, userProfileDb } from '../../admin_client.ts';
import {
	Participant,
	ParticipantRow,
	participantSelect,
	ParticipantStatus,
	participantTable,
} from '../../models/participant_model.ts';
import {
	authUserSelect,
	getUserByEmailCall,
	UserProfile,
} from '../../models/user_profile_model.ts';
import { ApiError } from '../../express_app.ts';
import { AuthUser } from '../../models/user_profile_model.ts';

export async function addShoppingListParticipantsById(
	req: ExpressRequest,
): Promise<Participant> {
	// Parse and validate inputs
	const shoppingListId = req.params.id;
	if (!shoppingListId) {
		throw new ApiError('Id is not valid!', 404);
	}

	// body
	const requestedUserId = req.body.userId;
	const requestedUserEmail = req.body.email;
	const date = (new Date()).toISOString();

	// Get supabase client and required user data
	const { admin, supabase, user } = await getClientInfo(req);

	if (requestedUserId == user.id || requestedUserEmail == user.email) {
		throw new ApiError('Cannot invite yourself', 400, 201400);
	}

	const { data: requestedUser, error: uError } = await admin.rpc(
		getUserByEmailCall,
		{
			p_email: requestedUserEmail,
		},
	).select(authUserSelect)
		.single<AuthUser>();

	if (uError) {
		console.error(uError);
		throw new ApiError(
			'Cannot get requested user! Please try again!',
			500,
			202500,
		);
	}

	if (requestedUser == null || requestedUserId == requestedUser.id) {
		throw new ApiError('Requested user not found!', 400, 203400);
	}

	const { data: requestedUserProfile, error: pError } = await admin.from(
		userProfileDb,
	)
		.select('*')
		.eq(
			'user_id',
			requestedUser.id,
		).single<UserProfile>();

	if (pError) {
		console.error(pError);
		throw new ApiError('Cannot get data! Please try again!', 500, 204500);
	}

	if (!requestedUserProfile) {
		console.error(pError);
		throw new ApiError(
			'Requested user not registered yet!',
			400,
			205500,
		);
	}

	// create new participant as invited member
	const participant: Omit<ParticipantRow, 'id'> = {
		user_id: requestedUser.id,
		user_profile_id: requestedUserProfile.id,
		shopping_list_id: shoppingListId,
		user_email: requestedUser.email,
		status: ParticipantStatus.invited,
		invited_at: date,
		invited_by: user.id,
		//
		updated_at: date,
		updated_by: user.id,
		created_at: date,
		created_by: user.id,
	};

	const { data: insertedParticipant, error: iError } = await supabase.from(
		participantTable,
	)
		.insert(
			participant,
		).select(
			participantSelect,
		).single<Participant>();

	if (!insertedParticipant || iError) {
		console.error(iError);
		throw new ApiError('Cannot get data! Please try again!', 500, 206500);
	}

	return insertedParticipant;
}
