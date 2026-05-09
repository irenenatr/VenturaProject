import { IsString, IsNumber, IsOptional } from 'class-validator';

export class UpdateExpenseDto {
  @IsOptional()
  @IsString()
  title?: string;

  @IsOptional()
  @IsNumber()
  amount?: number;
}