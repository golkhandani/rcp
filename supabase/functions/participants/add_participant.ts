import { ExpressApp, ExpressRequest } from './../shared/anything.ts';
import { getClientInfo, userProfileDb } from '../shared/admin_client.ts';
import {
	ParticipantRow,
	participantSelect,
	ParticipantStatus,
	participantTable,
} from '../shared/models/participant_model.ts';
import { BasicException } from '../shared/exceptions/client_info_exception.ts';
import { UserProfile } from '../shared/models/user_profile_model.ts';

export async function addShoppingListParticipantsById(req: ExpressRequest) {
	const { admin, supabase, user, profile } = await getClientInfo(req);

	// params
	const shoppingListId = req.params.id;
	// body
	const requestedUserId = req.body.userId;
	const requestedUserEmail = req.body.email;
	const date = (new Date()).toISOString();

	if (requestedUserId == user.id || requestedUserEmail == user.email) {
		throw new BasicException('Cannot invite yourself', 400);
	}

	const { data: requestedUser, error: uError } = await admin.rpc(
		'get_user_by_email',
		{
			p_email: requestedUserEmail,
		},
	).select(`
			id:id,
			email:email,
			emailConfirmedAt: email_confirmed_at,
			createdAt:created_at,
			updatedAt:updated_at,
			phone:phone,
			phoneConfirmedAt:phone_confirmed_at,
			confirmedAt:confirmed_at,
			bannedUntil:banned_until,
			deletedAt:deleted_at
		`)
		.single();

	if (requestedUser == null || requestedUserId == requestedUser.id) {
		throw new BasicException('Requested user not found!', 400);
	}

	console.log(requestedUser.id);

	const { data: requestedUserProfile, error: pError } = await admin.from(
		userProfileDb,
	)
		.select('*')
		.eq(
			'user_id',
			requestedUser.id,
		).single<UserProfile>();

	console.log(requestedUserProfile, pError);
	if (requestedUserProfile == null || pError) {
		throw new BasicException(
			pError.message ?? 'Requested user not registered yet!',
			parseInt(pError.code) ?? 400,
		);
	}

	console.log(requestedUserProfile);

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

	const { data: insertedParticipant, error: participantError } =
		await supabase.from(
			'participants',
		)
			.insert(
				participant,
			).select(
				participantSelect,
			).single<ParticipantRow>();

	if (insertedParticipant == null) {
		// TODO(@golkhandani): revert the changes and remove insertedShoppingList
		throw new BasicException(
			'Cannot create new shopping list, please try again!' +
				participant.status,
			500,
		);
	}

	return insertedParticipant;
}

export async function updateStatusShoppingListParticipantsById(
	req: ExpressRequest,
) {
	const { admin, supabase, user, profile } = await getClientInfo(req);

	// params
	const shoppingListId = req.params.id;
	const participantId = req.params.participantId;
	// body
	const status = req.body.status;
	const date = (new Date()).toISOString();

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
		).single();

	if (exists == null || eError) {
		throw new BasicException(
			eError?.message ?? 'Cannot invite yourself',
			400,
		);
	}

	const participant: Partial<ParticipantRow> = {
		...exists,
		status: ParticipantStatus.joined,
		//
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
		.select(participantSelect).single();

	if (updated == null || uError) {
		throw new BasicException(uError.message ?? 'Something is wrong!', 500);
	}

	return updated;
}

export async function deleteShoppingListParticipantsById(
	req: ExpressRequest,
) {
	const { admin, supabase, user, profile } = await getClientInfo(req);

	// params
	const shoppingListId = req.params.id;
	const participantId = req.params.participantId;

	const { data: exists, error: eError } = await supabase.from(
		participantTable,
	)
		.select()
		.eq(
			'id',
			participantId,
		)
		.single();

	if (exists == null || eError) {
		throw new BasicException(
			eError?.message ?? 'Not found!',
			400,
		);
	}

	const { data: updated, error: uError } = await supabase.from(
		participantTable,
	)
		.delete()
		.eq(
			'id',
			exists.id,
		)
		.select(participantSelect).single();

	if (updated == null || uError) {
		throw new BasicException(uError.message ?? 'Something is wrong!', 500);
	}

	return updated;
}
