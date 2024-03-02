// @deno-types="npm:@types/express@4"
import express from 'npm:express@4.18.2';
import { getClients, userProfileDb } from '../shared/admin_client.ts';
import { UserProfile } from '../shared/models/user_profile_model.ts';
import { UserProfileRow } from '../shared/anything.ts';
import {
	AuthError,
	FunctionsError,
} from 'https://esm.sh/@supabase/supabase-js@2.39.3';

const app = express();
app.use(express.json());
const port = 3000;
const prefix = 'users';

app.get(`/${prefix}/me`, async (req, res) => {
	const { supabase, authHeader } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();

	const result = await supabase.from(userProfileDb).select()
		.eq(
			'user_id',
			user?.id,
		)
		.single<UserProfile>();

	const upserted = result.data;
	res.send(upserted);
});

app.put(`/${prefix}/me`, async (req, res) => {
	const { supabase } = getClients(req);
	const body = req.body;
	const { data: { user } } = await supabase.auth.getUser();

	const { data: userProfile } = await supabase.from(userProfileDb).select()
		.eq(
			'user_id',
			user?.id,
		)
		.single<UserProfileRow>();

	const data = {
		...userProfile,
		'username': body.username,
		'avatar_url': body.avatar_url,
		'full_name': body.full_name,
	};

	const { data: upserted, error } = await supabase.from(userProfileDb).upsert(
		data,
		{
			onConflict: 'id',
		},
	).select('*')
		.single<UserProfile>();

	if (!upserted) {
		throw new FunctionsError(error.message);
	}
	res.send(upserted);
});

app.get(`/${prefix}/username_is_available`, async (req, res) => {
	const { admin, supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();

	const query = req.query;

	const { data: userProfile } = await admin.from(userProfileDb).select()
		.eq(
			'username',
			query.username,
		).neq('user_id', user?.id)
		.single<UserProfileRow>();

	if (userProfile) {
		throw new FunctionsError('Username is already taken');
	}

	const data = {
		is_available: true,
	};
	res.send(data);
});

app.delete(`/${prefix}/me`, async (req, res) => {
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
	res.send();
});

app.listen(port, () => {
	console.log(`Example app listening on port ${port}`);
});
