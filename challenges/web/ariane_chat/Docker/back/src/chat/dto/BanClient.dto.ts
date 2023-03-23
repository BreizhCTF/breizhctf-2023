import { IsNotEmpty, IsString } from 'class-validator';
import { SusReason } from '../types/SusReason.enum';

export class BanClientDto {
	@IsNotEmpty()
	@IsString()
	message: string;

	@IsNotEmpty()
	@IsString()
	reason: SusReason;
}
