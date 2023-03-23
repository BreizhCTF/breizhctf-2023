import { Module } from '@nestjs/common';
import { ChatGateway } from './chat.gateway';
import { ChatService } from './services/chat.service';
import { ModerationService } from './services/moderation.service';

@Module({
	providers: [ChatGateway, ChatService, ModerationService],
})
export class ChatModule {}
