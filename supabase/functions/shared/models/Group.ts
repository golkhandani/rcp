import logger from '../logger.ts';

//Group schema
class Group {
	name!: string;
	image_url!: URL;

	constructor(data: Group) {
		logger.info('GROUP CREATED ', data);
		Object.assign(this, data);
		return this;
	}
}

export default Group;
