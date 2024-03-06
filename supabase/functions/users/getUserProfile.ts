import { getClientInfo } from '../shared/admin_client.ts';
import { UserProfile } from '../shared/models/user_profile_model.ts';
import { ApiError, ExpressRequest } from '../shared/express_app.ts';
import { userProfileTable } from '../shared/models/user_profile_model.ts';
import { userProfileSelect } from '../shared/models/user_profile_model.ts';

export async function getUserProfile(
	req: ExpressRequest,
): Promise<UserProfile> {
	const { supabase, user } = await getClientInfo(req);
	const { data: profile, error } = await supabase.from(userProfileTable)
		.select(userProfileSelect)
		.eq(
			'user_id',
			user.id,
		)
		.single<UserProfile>();
	if (error) {
		console.error(error);
		throw new ApiError('Cannot get data! Please try again!', 500, 20500);
	}
	return profile;
}
