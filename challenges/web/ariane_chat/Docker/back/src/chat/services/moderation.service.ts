import { Injectable } from '@nestjs/common';
import { Client } from '../types/client.class';
import { Message } from '../types/message.class';
import { SusReason } from '../types/SusReason.enum';

@Injectable()
export class ModerationService {
	/**
	 * List of banned users
	 * For each user, store the original message with the reason to be banned
	 */

	/**
	 * A set a suspicious usernames
	 */
	private reportedUsers = new Set<string>();

	/**
	 * A map of banned username with their message and the banning reason
	 * username => [message, reason]
	 */
	private bannedUsers = new Map<string, [string, string]>();

	/**
	 * Report a suspicious user
	 * @param client The reported client
	 * @param reason The reason provided by an admin
	 */
	public sus(client: Client, reason: SusReason) {
		client[reason] = 'suspicious';
		this.reportedUsers.add(client.username);
	}

	/**
	 * Ban a user
	 * @param userId The banned user UUID
	 * @param message The original problematic message
	 * @param reason The reason from a moderator
	 */
	public auGoulag(message: Message, reason: string) {
		this.bannedUsers.set(message.author, [message.content, reason]);
	}

	public getCanceledPeople(): {
		[username: string]: {
			[reason: string]: string;
		};
	} {
		const list: {
			[username: string]: {
				[reason: string]: string;
			};
		} = {};

		for (const [username, [message, reason]] of this.bannedUsers) {
			if (!list[username]) {
				list[username] = {};
			}
			list[username][message] = reason;
		}

		return list;
	}
}
