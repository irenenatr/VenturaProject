import { IsString } from 'class-validator';

export class CreateItineraryDto {
  @IsString()
  destination!: string;

  @IsString()
  activity!: string;

  @IsString()
  date!: string;

  @IsString()
  time!: string;
}