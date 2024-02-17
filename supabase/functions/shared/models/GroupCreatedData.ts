import logger from '../logger.ts';
import Group from './Group.ts';
import UserGroup from './UserGroup.ts';

class GroupCreatedData {
	group!: Group;
	userGroup!: UserGroup;

	constructor(data: GroupCreatedData) {
		logger.info('GROUP_CREATED_DATA CREATED', data);
		Object.assign(this, data);
		return this;
	}
}

export default GroupCreatedData;
