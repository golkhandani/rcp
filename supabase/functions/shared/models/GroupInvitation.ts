import logger from '../logger.ts';

class GroupInvitation {
	group_id!: string;
	user_email!: string;

	constructor(data: GroupInvitation) {
		logger.info('GROUP INVITATION CREATED ', data);
		Object.assign(this, data);
		return this;
	}
}

export default GroupInvitation;
