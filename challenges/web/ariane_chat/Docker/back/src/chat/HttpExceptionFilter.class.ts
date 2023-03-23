import { ArgumentsHost, BadRequestException, Catch } from '@nestjs/common';
import { BaseWsExceptionFilter, WsException } from '@nestjs/websockets';

@Catch(BadRequestException)
export class HttpExceptionFilter extends BaseWsExceptionFilter {
	catch(exception: BadRequestException, host: ArgumentsHost) {
		const properError = new WsException(exception.getResponse());
		super.catch(properError, host);
	}
}
