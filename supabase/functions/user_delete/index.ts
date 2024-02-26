// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { AuthError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { getClients } from '../shared/admin_client.ts';
import { corsHeaders, userProfileDb } from '../shared/anything.ts';

Deno.serve(async (req) => {
	// This is needed if you're planning to invoke your function from a browser.
	if (req.method === 'OPTIONS') {
		return new Response('ok', { headers: corsHeaders });
	}

	const { authHeader, admin, supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();
	if (user == null) {
		throw new AuthError('No user found!');
	}

	// delete user files as they are preventive
	const { data: list, error } = await admin.storage.from('avatars').list(
		`${user.id}/`,
	);
	console.log(list, error);
	if (list) {
		const filesToRemove = list.map((file) => `${user?.id}/${file.name}`);
		const { data, error } = await supabase.storage.from('avatars').remove(
			filesToRemove,
		);
	}

	// delete user profile
	await admin.from(userProfileDb).delete().eq(
		'user_id',
		user?.id,
	);

	// delete auth
	await admin.auth.admin.deleteUser(user.id);
	await supabase.auth.admin.signOut(authHeader);

	return new Response(
		JSON.stringify({}),
		{ headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
	);
});
