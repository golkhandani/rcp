// @deno-types="npm:@types/express@4"
import express, { Express, Request, Response } from 'npm:express@4.18.2';
import cors from 'npm:cors@2.8.5';

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

// ----------------------- REQUIRED TYPES ------------------//

export type ExpressRequest = Request;
export type ExpressResponse = Response;
export type ExpressApp = Express;

export interface IApiError {
	message: string;
	statusCode: number;
	errorCode: number;
}

export class ApiError extends Error implements IApiError {
	message: string;
	statusCode: number;
	errorCode: number;
	constructor(message: string, statusCode: number, errorCode?: number) {
		super();
		this.message = message;
		this.statusCode = statusCode;
		this.errorCode = errorCode ?? 10000 + statusCode;
		return this;
	}
}

export class ApiValidationError extends ApiError implements IApiError {
	constructor(message: string) {
		super(message, 400, 10400);
		return this;
	}
}

export interface IApiResponse<T> {
	doc?: T;
	docs?: Array<T>;
	error?: IApiError;
	status: number;
}

export class ApiResponse<T> implements IApiResponse<T> {
	doc?: T | undefined;
	docs?: T[] | undefined;
	error?: IApiError | undefined;
	status: number;
	constructor(
		{ data, error, status = 200 }: {
			data: T | Array<T> | undefined;
			error: IApiError | undefined;
			status: number;
		},
	) {
		if (Array.isArray(data)) {
			this.docs = data as T[];
		} else if (typeof data === 'object') {
			this.doc = data as T;
		}

		this.error = error;
		this.status = status;
		return this;
	}
}

// ------------ REQUEST MIDDLEWARE HELPERS --------------------- //

export function sendErrorResponse(res: ExpressResponse, error: Error) {
	if (error instanceof ApiError) {
		return res.status(error.statusCode).send(
			new ApiResponse({
				data: null,
				error: error,
				status: error.statusCode,
			}),
		);
	}
	const apiError = new ApiError('Something is wrong!', 500, 10500);
	return res.status(500).send(
		new ApiResponse({
			data: null,
			error: apiError,
			status: apiError.statusCode,
		}),
	);
}

export function sendDataResponse<T>(
	res: ExpressResponse,
	data: T | T[],
	status: number,
) {
	return res.status(status).send(
		new ApiResponse<T>({ data: data, error: undefined, status: status }),
	);
}

// --------------- PAGINATION QUERY ------------------ //

export const sortOrders = ['asc', 'desc'] as const;
export type SortOrder = typeof sortOrders[number];

export class Pagination {
	public page: number = 1;
	public pageSize: number = 10;
	public sortKey?: string;
	public sortOrder?: SortOrder;

	constructor(data: Partial<Pagination>) {
		Object.assign(this, data);
		this.validate();
		return this;
	}

	get from(): number {
		return (this.page - 1) * this.pageSize;
	}

	get to(): number {
		return this.from + (this.pageSize - 1);
	}

	private validate(): void {
		if (typeof this.page == 'string') {
			this.page = isNaN(this.page) || isNaN(parseFloat(this.page))
				? 1
				: parseInt(this.page);
		}

		if (typeof this.page !== 'number' || this.page <= 0) {
			throw new ApiValidationError('Page must be a positive number');
		}

		if (typeof this.pageSize == 'string') {
			this.pageSize =
				isNaN(this.pageSize) || isNaN(parseFloat(this.pageSize))
					? 1
					: parseInt(this.pageSize);
		}

		if (
			typeof this.pageSize !== 'number' || this.pageSize <= 0 ||
			this.pageSize > 100
		) {
			throw new ApiValidationError('Page size must be a positive number');
		}

		if (
			this.sortKey &&
			(typeof this.sortKey !== 'string' || this.sortKey.trim() === '')
		) {
			throw new ApiValidationError('Sort key must be a non-empty string');
		}

		if (
			this.sortOrder &&
			!Object.values(sortOrders).includes(this.sortOrder as SortOrder)
		) {
			throw new ApiValidationError('Invalid sort order');
		}
	}
}
