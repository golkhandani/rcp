// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { FunctionsError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { getClients } from '../shared/admin_client.ts';
import {
	corsHeaders,
	StorageServie,
	UserProfile,
	userProfileDb,
} from '../shared/anything.ts';

Deno.serve(async (req) => {
	// This is needed if you're planning to invoke your function from a browser.
	if (req.method === 'OPTIONS') {
		return new Response('ok', { headers: corsHeaders });
	}

	console.log('TEST 1');

	const { supabase } = getClients(req);

	const body = await req.json();
	console.log('TEST 2');

	const { data: { user } } = await supabase.auth.getUser();

	const { data: userProfile } = await supabase.from(userProfileDb).select()
		.eq(
			'user_id',
			user?.id,
		)
		.single<UserProfile>();

	const data = {
		...userProfile,
		'username': body.username,
		'avatar_url': body.avatar_url,
		'full_name': body.full_name,
	};

	console.log('TEST data', data);

	const { data: upserted, error } = await supabase.from(userProfileDb).upsert(
		data,
		{
			onConflict: 'id',
		},
	).select('*')
		.single<UserProfile>();
	console.log('TEST 3');

	console.log('upserted', upserted);

	if (!upserted) {
		throw new FunctionsError(error.message);
	}

	return new Response(
		JSON.stringify(upserted),
		{ headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
	);
});
