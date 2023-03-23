import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class LoginDto {
	@IsNotEmpty()
	@IsString()
	username: string;

	@IsOptional()
	@IsString()
	password: string;
}
