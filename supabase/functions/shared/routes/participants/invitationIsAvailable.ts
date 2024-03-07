import { getClientInfo } from '../../admin_client.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';
import {
	authUserSelect,
	getUserByEmailCall,
	InvitationCandidate,
} from '../../models/user_profile_model.ts';
import { AuthUser } from '../../models/user_profile_model.ts';
import { userProfileTable } from '../../models/user_profile_model.ts';
import { userProfileSelect } from '../../models/user_profile_model.ts';
import { UserProfile } from '../../models/user_profile_model.ts';

export async function invitationIsAvailable(
	req: ExpressRequest,
): Promise<InvitationCandidate> {
	// parse query input
	const email = decodeURIComponent(req.query.email as string ?? '');

	const { admin, user } = await getClientInfo(req);

	const { data: requestedUser, error: uError } = await admin.rpc(
		getUserByEmailCall,
		{
			p_email: email,
		},
	).select(authUserSelect)
		.single<AuthUser>();

	if (requestedUser == null || uError || requestedUser.id === user.id) {
		console.log(uError);
		throw new ApiError('No user found!', 404);
	}

	const { data: userProfile, error } = await admin.from(
		userProfileTable,
	)
		.select(userProfileSelect)
		.eq(
			'user_id',
			requestedUser.id,
		)
		.single<UserProfile>();
	if (!userProfile || error) {
		console.error(error);
		throw new ApiError(
			'Cannot get data! Please try again!',
			500,
			202500,
		);
	}

	const invitationCandidate = {
		...userProfile,
		email: requestedUser.email,
	};

	return invitationCandidate;
}
