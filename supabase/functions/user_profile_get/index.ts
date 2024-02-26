// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { getClients } from '../shared/admin_client.ts';
import { corsHeaders, UserProfile, userProfileDb } from '../shared/anything.ts';

Deno.serve(async (req) => {
	// This is needed if you're planning to invoke your function from a browser.
	if (req.method === 'OPTIONS') {
		return new Response('ok', { headers: corsHeaders });
	}

	const { supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();

	const res = await supabase.from(userProfileDb).select()
		.eq(
			'user_id',
			user?.id,
		)
		.single<UserProfile>();

	const upserted = res.data;

	return new Response(
		JSON.stringify(upserted),
		{ headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
	);
});
