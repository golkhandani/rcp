import { getClients } from '../shared/admin_client.ts';
import { ExpressApp, expressApp } from '../shared/anything.ts';

import { sendDataResponse, sendErrorResponse } from '../shared/express_app.ts';
import { getUserProfile } from '../shared/routes/users/getUserProfile.ts';
import { upsertProfile } from '../shared/routes/users/upsertProfile.ts';
import { deleteUserProfile } from '../shared/routes/users/deleteUserProfile.ts';
import { getUserInvitations } from '../shared/routes/participants/getUserInvitations.ts';
import { invitationIsAvailable } from '../shared/routes/participants/invitationIsAvailable.ts';
import { usernameIsAvailable } from '../shared/routes/users/usernameIsAvailable.ts';

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
		try {
			const result = await getUserProfile(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.put(`/${prefix}/me`, async (req, res) => {
		try {
			const result = await upsertProfile(req);
			return sendDataResponse(res, result, 201);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.delete(`/${prefix}/me`, async (req, res) => {
		try {
			const result = await deleteUserProfile(req);
			return sendDataResponse(res, result, 204);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	// CHECK FOR PROFILE CREATION
	app.get(`/${prefix}/username_is_available`, async (req, res) => {
		try {
			const result = await usernameIsAvailable(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	// CHECK FOR INVITATION CREATION
	app.get(`/${prefix}/invitation_is_available`, async (req, res) => {
		try {
			const result = await invitationIsAvailable(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.get(`/${prefix}/me/invitations`, async (req, res) => {
		try {
			const result = await getUserInvitations(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});
});
