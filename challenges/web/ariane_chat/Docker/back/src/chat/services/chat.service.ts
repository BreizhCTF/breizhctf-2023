import { Injectable, Logger } from '@nestjs/common';
import { WsException } from '@nestjs/websockets';
import { Client } from '../types/client.class';
import { Message } from '../types/message.class';

@Injectable()
export class ChatService {
	private readonly logger = new Logger('ChatService');

	/**
	 * Store informations about all clients
	 */
	// private clients: Array<{
	// 	name: string;
	// 	type: ClientClass;
	// 	[key: string]: any;
	// }>;

	private clients = new Map<string, Client>();

	private store: Array<Message> = [];

	public addClient(socketId: string, client: Client) {
		if (this.clients.has(socketId)) {
			throw new WsException('Already authenticated');
		}
		this.clients.set(socketId, client);

		this.logger.debug(`New client logged in : ${socketId}, ${client.username}`);
	}

	public removeClient(socketId: string) {
		this.clients.delete(socketId);
	}

	public processMessage(socketId: string, messageStr: string) {
		if (!this.clients.has(socketId)) {
			throw new WsException('Not authenticated');
		}

		const message = new Message(this.clients.get(socketId).username, messageStr, 'public');
		this.store = [...this.store.slice(-10), message];

		return message;
	}

	public getMessageByContent(content: string): Message | undefined {
		for (const message of this.store) {
			if (message.content === content) {
				return message;
			}
		}
	}

	public getClientBySocket(socketId: string): Client | undefined {
		return this.clients.get(socketId);
	}

	public getClientByUsername(username: string): Client | undefined {
		// eslint-disable-next-line @typescript-eslint/no-unused-vars
		for (const [_, client] of this.clients) {
			if (client.username === username) {
				return client;
			}
		}
	}
}
