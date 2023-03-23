import { IsEnum, isNotEmpty, IsNotEmpty, IsString } from 'class-validator';
import { SusReason } from '../types/SusReason.enum';

export class ReportClientDto {
	@IsNotEmpty()
	@IsString()
	username: string;

	@IsNotEmpty()
	@IsString()
	reason: SusReason;
}
