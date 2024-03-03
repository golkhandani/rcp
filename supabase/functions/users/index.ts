import { BasicException } from './../shared/exceptions/client_info_exception.ts';
import {
	getClientInfo,
	getClients,
	userProfileDb,
} from '../shared/admin_client.ts';
import { UserProfile } from '../shared/models/user_profile_model.ts';
import { ExpressApp, expressApp, UserProfileRow } from '../shared/anything.ts';
import {
	AuthError,
	FunctionsError,
} from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import {
	participantInvitationSelect,
	participantSelect,
	ParticipantStatus,
	participantTable,
} from '../shared/models/participant_model.ts';

const prefix = 'users';

expressApp((app: ExpressApp) => {
	app.post(`/${prefix}/signin`, async (req, res) => {
		const { supabase } = getClients(req);
		const userSession = await supabase.auth.signInWithPassword({
			email: req.body.email,
			password: req.body.password,
		});

		return res.status(200).send(userSession.data.session);
	});

	app.get(`/${prefix}/me`, async (req, res) => {
		const { supabase, authHeader } = getClients(req);
		const { data: { user } } = await supabase.auth.getUser();

		const { data: profile, error } = await supabase.from(userProfileDb)
			.select()
			.eq(
				'user_id',
				user?.id,
			)
			.single<UserProfile>();

		return res.status(200).send(profile);
	});

	app.put(`/${prefix}/me`, async (req, res) => {
		const { supabase } = getClients(req);
		const body = req.body;
		const { data: { user } } = await supabase.auth.getUser();

		try {
			const { data: userProfile, error: getError } = await supabase.from(
				userProfileDb,
			).select()
				.eq(
					'user_id',
					user?.id,
				)
				.single<UserProfileRow>();

			if (userProfile == null) {
				console.log('Create profile!');
			}

			const data = {
				...userProfile,
				'username': body.username,
				'avatar_url': body.avatar_url,
				'full_name': body.full_name,
			};

			const { data: profile, error } = await supabase.from(userProfileDb)
				.upsert(
					data,
					{
						onConflict: 'id',
					},
				).select('*')
				.single<UserProfile>();

			if (!profile) {
				throw new FunctionsError(error.message);
			}
			res.status(200).send(profile);
		} catch (error) {
			res.status(500).send({
				type: error.name,
				message: error.message,
				body,
			});
		}
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

		if (list) {
			const filesToRemove = list.map((file) =>
				`${user?.id}/${file.name}`
			);
			const { data, error } = await supabase.storage.from('avatars')
				.remove(
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

	// CHECK FOR PROFILE CREATION
	app.get(`/${prefix}/username_is_available`, async (req, res) => {
		const { admin, supabase } = getClients(req);
		const { data: { user } } = await supabase.auth.getUser();

		const query = req.query;

		const { data: userProfile, error } = await admin.from(userProfileDb)
			.select()
			.eq(
				'username',
				query.username,
			).neq('user_id', user?.id)
			.single<UserProfileRow>();

		const data = {
			is_available: false,
		};

		if (userProfile) {
			return res.status(400).send(data);
		}

		data.is_available = true;
		return res.status(200).send(data);
	});

	// CHECK FOR INVITATION CREATION
	app.get(`/${prefix}/invitation_is_available`, async (req, res) => {
		try {
			const { admin, supabase } = getClients(req);
			const { data: { user } } = await supabase.auth.getUser();

			const email = decodeURIComponent(req.query.email as string ?? '');
			console.log(email);

			const { data: requestedUser, error: uError } = await admin.rpc(
				'get_user_by_email',
				{
					p_email: email,
				},
			).select(`
				id:id,
				email:email,
				emailConfirmedAt: email_confirmed_at,
				createdAt:created_at,
				updatedAt:updated_at,
				phone:phone,
				phoneConfirmedAt:phone_confirmed_at,
				confirmedAt:confirmed_at,
				bannedUntil:banned_until,
				deletedAt:deleted_at
			`)
				.single();

			console.log(requestedUser);
			if (requestedUser == null || uError) {
				console.log(uError);
				throw new BasicException('No user found!', 404);
			}

			const { data: userProfile, error } = await admin.from(userProfileDb)
				.select(`
					id:id,
					createdAt: created_at,
					updatedAt: updated_at,
					username: username,
					avatarUrl: avatar_url,
					fullName: full_name,
					userId: user_id
					`)
				.eq(
					'user_id',
					requestedUser.id,
				)
				.single();

			const invitationCandidate = {
				...userProfile,
				email: requestedUser.email,
			};

			return res.status(200).send(invitationCandidate);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({
					error: error.message,
				});
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.get(`/${prefix}/me/invitations`, async (req, res) => {
		const { supabase, user, profile } = await getClientInfo(req);

		const { data: invitations, error: existsError } = await supabase
			.from(participantTable).select(participantInvitationSelect).eq(
				'user_id',
				user.id,
			).eq('status', ParticipantStatus.invited);

		return res.status(200).send(invitations);
	});
});
