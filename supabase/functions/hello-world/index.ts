import {
	jsonResponse,
	supabaseAdminClient,
	supabaseUserClient,
} from '../shared/admin_client.ts';
// hello-world
// golkhandani+viewer@gmail.com 33de6aeb-f4c0-4588-bd15-efa47061a756
// golkhandani+editor@gmail.com 7e072c9d-3aeb-4a5f-8377-455d2747b015
// golkhandani@gmail.com d85f836c-cf40-49c8-bff3-fe5dd13c3b4c

Deno.serve(async (req: Request) => {
	const authHeader = req.headers.get('Authorization')!;
	const admin = supabaseAdminClient();
	const supabase = supabaseUserClient(authHeader);

	const body = await req.json();

	const group = {
		name: body.name,
		image_url: body.imageUrl,
	};

	const { data: insertedGroups } = await supabase.from('groups').insert([
		group,
	])
		.select();

	const insertedGroup = insertedGroups![0];

	const userGroup = {
		group_id: insertedGroup.id,
		user_id: insertedGroup.created_by,
		access_level: 'owner' as const,
		status: 'joined' as const,
	};

	// create user group relations
	const { data: insertedUserGroups } = await admin.from('user_groups').insert(
		[
			userGroup,
		],
	)
		.select();
	const insertedUserGroup = insertedUserGroups![0];

	const data = {
		group: insertedGroup,
		userGroup: insertedUserGroup,
	};

	for await (const member of body.members) {
		const { data: users } = await admin.rpc('get_user_id_by_email', {
			email: member,
		}).select();
		const userId = users?.[0]?.id;
		if (userId == null) {
			// member is not user of the app
			// keep it in pending
			const pendingInvitation = {
				group_id: insertedGroup.id,
				user_email: member,
			};
			await admin.from('pending_user_invitations').insert([
				pendingInvitation,
			])
				.select();
		} else {
			const userGroup = {
				group_id: insertedGroup.id,
				user_id: userId,
				access_level: 'viewer' as const,
				status: 'invited' as const,
			};
			await admin.from('user_groups').insert([userGroup]).select();
		}
	}

	return jsonResponse(data, 200);
});
