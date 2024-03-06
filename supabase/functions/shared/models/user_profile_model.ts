import { faker } from 'npm:@faker-js/faker';
import { Database } from '../../types.ts';

export const userProfileTable = 'user_profile';
export type UserProfileRow =
	Database['public']['Tables']['user_profile']['Row'];
export abstract class UserProfile {
	id!: string;
	userId!: string;
	username!: string;
	fullName?: string | null;
	avatarUrl?: string | null;
	createdAt!: Date;
	updatedAt!: Date;
	constructor(input: UserProfile) {
		Object.assign(this, input);
		return this;
	}
}

export const userProfileSelect = `
id: id,
userId: user_id,
username: username,
fullName: full_name,
avatarUrl: avatar_url,
createdAt: created_at,
updatedAt: updated_at
`;

export interface UsernameAvailability {
	isAvailable: boolean;
}

export interface AuthUser {
	id: string;
	email: string;
	emailConfirmedAt: string;
	createdAt: string;
	updatedAt: string;
	phone: string;
	phoneConfirmedAt: string;
	confirmedAt: string;
	bannedUntil: string;
	deletedAt: string;
}
export const getUserByEmailCall = 'get_user_by_email';

export const authUserSelect = `
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
`;

export interface InvitationCandidate {
	id: string;
	email: string;
	userId: string;
	username: string;
	fullName?: string | null | undefined;
	avatarUrl?: string | null | undefined;
	createdAt: Date;
	updatedAt: Date;
}
