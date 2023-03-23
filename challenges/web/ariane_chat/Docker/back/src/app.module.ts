import { join } from 'path';
import { Module } from '@nestjs/common';
import { ServeStaticModule } from '@nestjs/serve-static';
import { ChatModule } from './chat/chat.module';

@Module({
	imports: [
		ServeStaticModule.forRoot({
			rootPath: join(__dirname, '..', '..', 'front'),
		}),
		ChatModule,
	],
	controllers: [],
})
export class AppModule {}
