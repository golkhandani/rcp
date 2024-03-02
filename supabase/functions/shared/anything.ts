import { Database } from '../types.ts';

export const corsHeaders = {
	'Access-Control-Allow-Origin': '*',
	'Access-Control-Allow-Headers':
		'authorization, content-type, x-client-info, apikey',
};
export const userProfileDb = 'user_profile';

export type UserProfileRow =
	Database['public']['Tables']['user_profile']['Row'];

export class StorageServie {
	static avatarsBucketId = 'avatars';
}
