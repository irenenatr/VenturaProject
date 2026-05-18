import { IsNumber } from 'class-validator';

export class CreateItineraryDto {
  @IsNumber()
  days!: number;
}