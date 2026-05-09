import { IsNumber, IsOptional } from 'class-validator';

export class UpdateBudgetDto {
  @IsOptional()
  @IsNumber()
  totalBudget?: number;
}