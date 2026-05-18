import { IsNumber } from 'class-validator';

export class CreateBudgetDto {
  @IsNumber()
  totalBudget!: number;
}