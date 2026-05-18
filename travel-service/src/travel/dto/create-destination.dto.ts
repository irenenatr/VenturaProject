import { IsString } from 'class-validator';

export class CreateDestinationDto {
  @IsString()
  country!: string;

  @IsString()
  city!: string;
}