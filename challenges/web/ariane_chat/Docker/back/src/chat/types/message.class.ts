/**
 * Les messages publiques sont à destination de la plebe
 * Les message privées ont pour objectif de faciliter la communication entre les modération et avec les robots
 */
export type MessagePrivacy = 'public' | 'private';

/**
 * Data class message
 */
export class Message {
	constructor(
		public author: string,
		public content: string,
		public type: MessagePrivacy,
	) {}
}
