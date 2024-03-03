// @deno-types="npm:@types/express@4"
import express, { Express, Request } from 'npm:express@4.18.2';
import cors from 'npm:cors@2.8.5';
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

export type ExpressRequest = Request;
export type ExpressApp = Express;

export function expressApp(cb: (app: ExpressApp) => void) {
	const app = express();
	app.use(express.json());
	app.use(cors());
	app.use(express.urlencoded({ extended: true }));
	const port = 3000;
	cb(app);
	app.listen(port, () => {
		console.log(`Example app listening on port ${port}`);
	});
}
