import { getClientInfo, userProfileDb } from '../../admin_client.ts';
import { UserProfile } from '../../models/user_profile_model.ts';
import { UserProfileRow } from '../../anything.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';
import { userProfileTable } from '../../models/user_profile_model.ts';
import { userProfileSelect } from '../../models/user_profile_model.ts';

export async function upsertProfile(req: ExpressRequest): Promise<UserProfile> {
	// TODO(@golkhandani): parse and validate the data
	const body = req.body;

	// Get supabase client and required user data
	const { supabase, user } = await getClientInfo(req);

	const { data: existsUserProfile, error: eError } = await supabase.from(
		userProfileDb,
	).select()
		.eq(
			'user_id',
			user?.id,
		)
		.single<UserProfileRow>();

	if (eError) {
		console.error(eError);
		throw new ApiError(
			'Cannot update data! Please try again!',
			500,
			201500,
		);
	}

	if (!existsUserProfile) {
		console.info('Adding UserProfile', existsUserProfile);
	} else {
		console.info('Updating UserProfile', existsUserProfile);
	}

	const data: UserProfileRow = {
		...existsUserProfile,
		'username': body.username,
		'avatar_url': body.avatar_url,
		'full_name': body.full_name,
	};

	const { data: upsertedProfile, error: uError } = await supabase.from(
		userProfileTable,
	)
		.upsert(
			data,
			{
				onConflict: 'id',
			},
		).select(userProfileSelect)
		.single<UserProfile>();

	if (!upsertedProfile || uError) {
		console.error(uError, upsertedProfile);
		throw new ApiError(
			'Cannot update data! Please try again!',
			500,
			202500,
		);
	}

	return upsertedProfile;
}
