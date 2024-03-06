import { getClientInfo } from '../shared/admin_client.ts';
import { ApiError, ExpressRequest } from '../shared/express_app.ts';
import { userProfileTable } from '../shared/models/user_profile_model.ts';

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
	if (files) {
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

	// delete user profile
	await admin.from(userProfileTable).delete().eq(
		'user_id',
		user.id,
	);

	// delete auth
	await admin.auth.admin.deleteUser(user.id);
	await supabase.auth.admin.signOut(authHeader);

	return;
}
