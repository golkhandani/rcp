import { getClientInfo } from '../../admin_client.ts';
import { UserProfileRow } from '../../anything.ts';
import { ApiError, ExpressRequest } from '../../express_app.ts';
import {
	ParticipantRow,
	participantTable,
} from '../../models/participant_model.ts';
import {
	AuthUser,
	authUserSelect,
	getUserByEmailCall,
} from '../../models/user_profile_model.ts';
import { userProfileTable } from '../../models/user_profile_model.ts';
import { deleteShoppingListById } from '../shoppingLists/deleteShoppingListById.ts';

export async function deleteUserProfile(
	req: ExpressRequest,
): Promise<void> {
	//TODO(@golkhandani): move to constant
	const avatarBucket = 'avatars';
	// Get supabase client and required user data
	const { admin, supabase, user, authHeader } = await getClientInfo(req);

	// delete user files as they are preventive
	const { data: files, error: fError } = await admin.storage.from(
		avatarBucket,
	).list(
		`${user.id}/`,
	);
	if (fError) {
		console.error(fError);
		throw new ApiError(
			'Cannot delete data! Please try again!',
			500,
			201500,
		);
	}

	// TODO(@golkhandani): can be done parallel
	if (files.length > 0) {
		const filesToRemove = files.map((file) => `${user?.id}/${file.name}`);
		const { data: removedFiles, error: rfError } = await supabase.storage
			.from(avatarBucket)
			.remove(
				filesToRemove,
			);
		if (!removedFiles || rfError) {
			console.error(rfError);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				202500,
			);
		}
	}

	// TODO(@golkhandani): for now it's removing everything related to user

	const { data: userParticipation, error: pError } = await admin.from(
		participantTable,
	).delete().eq('user_id', user.id).select()
		.returns<ParticipantRow[]>();

	if (pError) {
		console.error(fError);
		throw new ApiError(
			'Cannot delete data! Please try again!',
			500,
			202500,
		);
	}

	if (userParticipation.length > 0) {
		await Promise.all(userParticipation.map(async (item) => {
			const shoppingListId = item.shopping_list_id;
			req.params.id = shoppingListId;
			//use already exits function

			await deleteShoppingListById(req);
		}));
	}

	const { data: safeDeleteUser, error: uError } = await admin.rpc(
		getUserByEmailCall,
		{
			p_email: 'deleted-user@rcp.com',
		},
	).select(authUserSelect)
		.single<AuthUser>();

	// delete user profile
	const date = (new Date()).toISOString();
	const updatedProfile: Partial<UserProfileRow> = {
		created_at: date,
		updated_at: date,
		avatar_url: null,
		full_name: null,
		username: 'deleted-user' + (new Date()).getMilliseconds(),
		user_id: safeDeleteUser?.id,
	};
	const { error: dError } = await admin.from(userProfileTable).update(
		updatedProfile,
	).eq(
		'user_id',
		user.id,
	);

	if (dError) {
		console.error(dError);
		throw new ApiError(
			'Cannot delete data! Please try again!',
			500,
			204500,
		);
	}

	// delete auth
	await admin.auth.admin.deleteUser(user.id);
	await supabase.auth.admin.signOut(authHeader);

	return;
}
