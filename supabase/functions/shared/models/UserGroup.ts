import logger from '../logger.ts';

//User Group relation
class UserGroup {
	group_id!: string;
	user_id!: string;
	access_level!: 'owner' | 'editor' | 'viewer';
	status!: string;

	constructor(data: UserGroup) {
		logger.info('USER GROUP CREATED ', data);
		Object.assign(this, data);
		return this;
	}
}

export default UserGroup;
