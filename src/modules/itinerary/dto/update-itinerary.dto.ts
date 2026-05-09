import { IsString, IsOptional } from 'class-validator';

export class UpdateItineraryDto {
  @IsOptional()
  @IsString()
  destination?: string;

  @IsOptional()
  @IsString()
  date?: string;
}