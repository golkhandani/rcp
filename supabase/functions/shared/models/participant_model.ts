import { faker } from 'npm:@faker-js/faker';
import { UserProfile } from './user_profile_model.ts';
import { Database } from '../../types.ts';

interface Participant {
	id: string;
	userId: string;
	email: string;
	profile: UserProfile;
	status: ParticipantStatus;
	createdAt: Date;
	createdBy: UserProfile;
	updatedAt: Date;
	updatedBy: UserProfile;
}

export type ParticipantRow =
	Database['public']['Tables']['participants']['Row'];

export enum ParticipantStatus {
	joined = 'joined',
	invited = 'invited',
}

export const participantTable = 'participants';

export const participantSelect = `
id: id,
userId: user_id,
email: user_email,
profile: user_profile_id (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
shoppingListId: shopping_list_id,
status: status,
invitedAt: invited_at,
invitedBy: invited_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
createdAt: created_at,
createdBy: created_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
updatedAt: updated_at,
updatedBy: updated_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
)
`;
export interface ParticipantInvitation extends Participant {
	email: string;
}
export const participantInvitationSelect = `
id: id,
userId: user_id,
email: user_email,
userProfileId: user_profile_id,
shoppingList: shopping_list_id (
	id,
	name,
	description
),
status: status,
invitedAt: invited_at,
invitedBy: invited_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
createdAt: created_at,
createdBy: created_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
),
updatedAt: updated_at,
updatedBy: updated_by (
	id: id,
	userId: user_id,
	username: username,
	fullName: full_name,
	avatarUrl: avatar_url,
	createdAt: created_at,
	updatedAt: updated_at
)
`;

export type { Participant };
