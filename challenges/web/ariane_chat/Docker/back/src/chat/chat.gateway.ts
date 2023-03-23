import crypto from 'crypto';
import { Logger, UseFilters, UsePipes, ValidationPipe } from '@nestjs/common';
import {
	ConnectedSocket,
	MessageBody,
	OnGatewayConnection,
	OnGatewayDisconnect,
	SubscribeMessage,
	WebSocketGateway,
	WebSocketServer,
	WsException,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { HttpExceptionFilter } from './HttpExceptionFilter.class';
import { LoginDto } from './dto/Login.dto';
import { ChatService } from './services/chat.service';
import { Client, ClientClass } from './types/client.class';
import { ModerationService } from './services/moderation.service';
import { ReportClientDto } from './dto/ReportClient.dto';
import { BanClientDto } from './dto/BanClient.dto';

@UseFilters(new HttpExceptionFilter())
@WebSocketGateway({ cors: true })
export class ChatGateway implements OnGatewayConnection, OnGatewayDisconnect {
	private readonly logger = new Logger('ChatGateway');

	@WebSocketServer()
	server: Server;

	constructor(private chatService: ChatService, private moderationService: ModerationService) {}

	/**
	 * New socket.io connection
	 * @param socket Socket instance of the client
	 */
	async handleConnection(@ConnectedSocket() socket: Socket) {
		this.logger.log(`New connection from ${socket.handshake.address}`);
	}

	async handleDisconnect(@ConnectedSocket() socket: Socket) {
		this.chatService.removeClient(socket.id);
		this.logger.log('Socket disconnected');
	}

	@UsePipes(new ValidationPipe())
	@SubscribeMessage('login')
	async loginAsHuman(@ConnectedSocket() socket: Socket, @MessageBody() body: LoginDto) {
		const { username } = body;
		const client = new Client(socket, ClientClass.HUMAN);
		client.username = username;
		this.chatService.addClient(socket.id, client);
	}

	@UsePipes(new ValidationPipe())
	@SubscribeMessage('loginAsBot')
	async loginAsBot(@ConnectedSocket() socket: Socket, @MessageBody() body: LoginDto) {
		const ip = [
			...socket.handshake.headers['x-forwarded-for'].toString().split(',').map(s => s.trim()),
			socket.handshake.address
		];

		if (!ip.includes('127.0.0.1')) {
			throw new WsException('Unauthorized');
		}

		const client = new Client(socket, ClientClass.BOT);
		client.username = body.username;
		this.chatService.addClient(socket.id, client);
	}

	@UsePipes(new ValidationPipe())
	@SubscribeMessage('loginAsAdmin')
	async loginAsAdmin(@ConnectedSocket() socket: Socket, @MessageBody() body: LoginDto) {
		if (!body.password) {
			throw new WsException('A password is required to authenticate as admin');
		}
		if (this.chatService.getClientBySocket(socket.id)) {
			throw new WsException('You are already logged in');
		}

		const client = new Client(socket, ClientClass.HUMAN);
		client.username = body.username;
		this.chatService.addClient(socket.id, client);

		// TODO: Admin authentication
		// if (crypto.createHash('sha512').update(body.password).digest('hex') === 'TODO') {
		// 	client.isAdmin = true;
		// }

		if (client.isAdmin) {
			socket.emit('onmessage', 'Welcome home admin, BZHCTF{DontPutUserInputIntoYourKeys}');
		}
	}

	@UsePipes(new ValidationPipe())
	@SubscribeMessage('sendMessage')
	async onChat(@ConnectedSocket() socket: Socket, @MessageBody('message') messageStr: string) {
		const messageInstance = this.chatService.processMessage(socket.id, messageStr);

		this.server.emit('onMessage', {
			authorName: messageInstance.author,
			message: messageInstance.content,
		});
	}

	/**
	 * Report a user
	 * Can be called by bot to flag a user as suspicious
	 * A suspicious user is not banned, but could be ban later
	 */
	@UsePipes(new ValidationPipe())
	@SubscribeMessage('reportClient')
	async reportClient(@ConnectedSocket() socket: Socket, @MessageBody() body: ReportClientDto) {
		const { username, reason } = body;

		// Authenticate client
		const client = this.chatService.getClientBySocket(socket.id);
		if (!client) {
			throw new WsException('Not authenticated');
		}
		if (client.classType !== ClientClass.BOT) {
			throw new WsException('Not a bot');
		}
		if (client.username === username) {
			throw new WsException('You cannot report yourself');
		}

		const suspected = this.chatService.getClientByUsername(username);
		if (suspected.classType === ClientClass.BOT || suspected.isAdmin) {
			throw new WsException('You cannot report admins or bots');
		}
		if (!suspected) {
			throw new WsException('This user does not exist');
		}
		this.moderationService.sus(suspected, reason);
	}

	/**
	 * Ban a user based on one of a message
	 * Can be called by admin only, since bots are not trusted
	 * To prevent false positive, the user must have been reported by an admin before
	 */
	@UsePipes(new ValidationPipe())
	@SubscribeMessage('banClient')
	async banClient(@ConnectedSocket() socket: Socket, @MessageBody() body: BanClientDto) {
		const { message, reason } = body;
		const client = this.chatService.getClientBySocket(socket.id);
		if (!(client.isAdmin && client.classType === ClientClass.HUMAN)) {
			throw new WsException('Only moderator or bots are allowed to report messages');
		}

		const messageInstance = this.chatService.getMessageByContent(message);
		if (!messageInstance) {
			throw new WsException('Unable to find message');
		}
		if (client.username === messageInstance.author) {
			throw new WsException('You cannot ban yourself');
		}

		this.moderationService.auGoulag(messageInstance, reason);
	}

	@SubscribeMessage('getBanList')
	async getBanList(@ConnectedSocket() socket: Socket) {
		const client = this.chatService.getClientBySocket(socket.id);
		if (!client) {
			throw new WsException('Not authenticated');
		}
		if (!client.isAdmin) {
			throw new WsException('Only moderators are allowed to list banned people');
		}

		socket.emit('setBanList', this.moderationService.getCanceledPeople());
	}
}
