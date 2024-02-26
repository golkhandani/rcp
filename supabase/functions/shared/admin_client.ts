import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.3';

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

export const getClients = (req: Request) => {
	const authHeader = req.headers.get('Authorization')!;
	const admin = supabaseAdminClient();
	const supabase = supabaseUserClient(authHeader);
	return {
		authHeader,
		admin,
		supabase,
	};
};

export const getGroupId = (req: Request) => {
	const groupIdHeader = req.headers.get('x-group-id')!;
	return groupIdHeader;
};
