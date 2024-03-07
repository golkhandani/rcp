import {
	getClientInfo,
	getClients,
	userProfileDb,
} from '../../admin_client.ts';
import { UsernameAvailability } from '../../models/user_profile_model.ts';
import { UserProfileRow } from '../../anything.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';

export async function usernameIsAvailable(
	req: ExpressRequest,
): Promise<UsernameAvailability> {
	// TODO(@golkhandani): parse and validate input
	const query = req.query;
	// Get supabase client and required user data
	const { admin, supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();
	const { data: userProfiles, error } = await admin.from(userProfileDb)
		.select()
		.eq(
			'username',
			query.username,
		).neq('user_id', user!.id)
		.limit(1)
		.returns<UserProfileRow[]>();

	const data = {
		isAvailable: false,
	};

	if (error) {
		if (error.code == 'PGRST116' && !userProfiles || userProfiles) {
			// "The result contains 0 rows" => safe error

			data.isAvailable = true;
		} else {
			console.error(error);
			throw new ApiError(
				'Cannot get data! Please try again!',
				500,
				20500,
			);
		}
	}
	if (userProfiles?.length == 0) {
		data.isAvailable = true;
	}

	return data;
}
