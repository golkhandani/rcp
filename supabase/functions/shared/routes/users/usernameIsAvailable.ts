import { getClientInfo, userProfileDb } from '../../admin_client.ts';
import { UsernameAvailability } from '../../models/user_profile_model.ts';
import { UserProfileRow } from '../../anything.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';

export async function usernameIsAvailable(
	req: ExpressRequest,
): Promise<UsernameAvailability> {
	// TODO: parse and validate input
	const query = req.query;
	// Get supabase client and required user data
	const { admin, supabase, user, authHeader } = await getClientInfo(req);

	const { data: userProfile, error } = await admin.from(userProfileDb)
		.select()
		.eq(
			'username',
			query.username,
		).neq('user_id', user.id)
		.single<UserProfileRow>();

	if (error) {
		console.error(error);
		throw new ApiError('Cannot get data! Please try again!', 500, 20500);
	}
	const data = {
		isAvailable: false,
	};

	if (!userProfile) {
		data.isAvailable = true;
	}

	return data;
}
