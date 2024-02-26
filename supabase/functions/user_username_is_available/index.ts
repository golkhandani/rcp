// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { FunctionsError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { getClients } from '../shared/admin_client.ts';
import { corsHeaders, UserProfile, userProfileDb } from '../shared/anything.ts';

Deno.serve(async (req) => {
	// This is needed if you're planning to invoke your function from a browser.
	if (req.method === 'OPTIONS') {
		return new Response('ok', { headers: corsHeaders });
	}

	console.log('TEST 1');

	const { admin } = getClients(req);

	const body = await req.json();

	const { data: userProfile } = await admin.from(userProfileDb).select()
		.eq(
			'username',
			body.username,
		)
		.single<UserProfile>();

	if (userProfile) {
		throw new FunctionsError('Username is already taken');
	}

	const data = {
		is_available: true,
	};

	return new Response(
		JSON.stringify(data),
		{ headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
	);
});
