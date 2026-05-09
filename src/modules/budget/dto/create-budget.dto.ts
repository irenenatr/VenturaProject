import { IsNumber, IsString } from 'class-validator';

export class CreateBudgetDto {
  @IsString()
  tripName!: string;

  @IsNumber()
  totalBudget!: number;

  @IsString()
  startDate!: string;
}