export class BasicException extends Error {
	public message: string;
	public status: number;
	constructor(message: string, status: number) {
		super();
		this.message = message;
		this.status = status;
	}
}

export class ClientException extends BasicException {
	constructor(message: string, status: number) {
		super(message, status);
		return this;
	}
}

export class FunctionException extends BasicException {
	constructor(message: string = 'Something is wrong!', status: number = 500) {
		super(message, status);
		return this;
	}
}
