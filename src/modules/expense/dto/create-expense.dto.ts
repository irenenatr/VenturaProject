import { IsString, IsNumber } from 'class-validator';

export class CreateExpenseDto {
  @IsString()
  title!: string;

  @IsNumber()
  amount!: number;
}