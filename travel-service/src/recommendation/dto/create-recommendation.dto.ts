import { IsNumber, IsString } from 'class-validator';

export class CreateRecommendationDto {
  @IsString()
  destination!: string;

  @IsNumber()
  budget!: number;

  @IsNumber()
  days!: number;

  @IsString()
  style!: string;
}