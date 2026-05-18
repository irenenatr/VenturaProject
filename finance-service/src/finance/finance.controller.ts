import {
  Body,
  Controller,
  Get,
  Post,
  UseGuards,
} from '@nestjs/common';

import { FinanceService } from './finance.service';

import { JwtAuthGuard } from '../auth/jwt-auth.guard';

@Controller('finance')
export class FinanceController {
  constructor(
    private financeService: FinanceService,
  ) {}

  @UseGuards(JwtAuthGuard)
  @Post('expense')
  addExpense(@Body() dto: any) {
    return this.financeService.addExpense(dto);
  }

  @UseGuards(JwtAuthGuard)
  @Post('budget')
  addBudget(@Body() dto: any) {
    return this.financeService.addBudget(dto);
  }

  @Get()
  getFinanceData() {
    return this.financeService.getAll();
  }
}