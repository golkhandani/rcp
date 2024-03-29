import {
	createClient,
	FunctionsError,
	SupabaseClient,
	User,
} from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { UserProfile } from './models/user_profile_model.ts';
import { ExpressRequest, UserProfileRow } from './anything.ts';

import { ClientException } from './exceptions/client_info_exception.ts';

export const supabaseAdminClient = () => {
	const supabaseClient = createClient(
		Deno.env.get('SUPABASE_URL') ?? '',
		Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
	);
	return supabaseClient;
};

export const supabaseUserClient = (userAuthHeader: string) => {
	const supabaseClient = createClient(
		Deno.env.get('SUPABASE_URL') ?? '',
		Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
		{ global: { headers: { Authorization: userAuthHeader } } },
	);
	return supabaseClient;
};

export const jsonResponse = (data: object, status = 200) => {
	return new Response(JSON.stringify({ ...data }), {
		headers: { 'Content-Type': 'application/json' },
		status: status,
	});
};

export const getClients = (req: ExpressRequest) => {
	const authHeader = req.headers['authorization']! as string;
	const admin = supabaseAdminClient();
	const supabase = supabaseUserClient(authHeader);
	return {
		authHeader,
		admin,
		supabase,
	};
};

export const getClientInfo = async (
	req: ExpressRequest,
): Promise<
	{
		admin: SupabaseClient;
		supabase: SupabaseClient;
		user: User;
		profile: UserProfile;
		authHeader: string;
	}
> => {
	try {
		const { admin, supabase, authHeader } = getClients(req);

		const [user, userProfile] = await Promise.all([
			supabase.auth.getUser(),
			getUserProfile(req),
		]);
		return {
			authHeader,
			admin,
			supabase,
			user: user.data.user as User,
			profile: userProfile,
		};
	} catch (error) {
		throw new ClientException('Could not get client info!', 500);
	}
};

export const getFunctionName = (req: ExpressRequest, prefix: string) => {
	const fnWithPrefix = req.headers['x-function-name']! as string;
	const fn = fnWithPrefix.split(`${prefix}--`)[1];
	return fn;
};

export const userProfileDb = 'user_profile';
export const getUserProfile = async (req: ExpressRequest) => {
	const { admin, supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();
	const { data: userProfileRow } = await admin.from('user_profile').select()
		.eq('user_id', user?.id)
		.single<UserProfileRow>();

	if (!userProfileRow) {
		throw new FunctionsError('UserProfile not found!');
	}
	const userProfile: UserProfile = {
		id: userProfileRow.id,
		userId: userProfileRow.user_id,
		username: userProfileRow.username,
		fullName: userProfileRow.full_name,
		avatarUrl: userProfileRow.avatar_url,
		createdAt: new Date(userProfileRow.created_at),
		updatedAt: new Date(userProfileRow.updated_at),
	};
	return userProfile;
};
