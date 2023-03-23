import { WsException } from '@nestjs/websockets';
import { Socket } from 'socket.io';

export enum ClientClass {
	BOT = 'bot',
	HUMAN = 'human',
}

export class Client {
	private _username: string;

	get username() {
		return this._username;
	}
	/**
	 * Checks the username against a regex to ensure it's sage to be shown
	 */
	set username(username: string) {
		if (!username.match(/[a-z0-9-]+/)) {
			throw new WsException('Your username contains invalid characters');
		}
		this._username = username;
	}

	public isAdmin: boolean;

	constructor(
		public readonly socket: Socket,
		public readonly classType: ClientClass
		) {}

	public welcome() {
		if (!this.username) {
			throw new WsException('User is not logged in');
		}

		this.socket.emit('chat', {
			username: 'Server',
			content: `Welcome home ${this.username}`,
		});
	}
}
