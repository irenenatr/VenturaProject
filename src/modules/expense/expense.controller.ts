import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';

import { ExpenseService } from './expense.service';
import { CreateExpenseDto } from './dto/create-expense.dto';

@Controller('expenses')
export class ExpenseController {
  constructor(
    private readonly expenseService: ExpenseService,
  ) {}

  @Post()
  create(@Body() body: CreateExpenseDto) {
    return this.expenseService.create(body);
  }

  @Get()
  findAll() {
    return this.expenseService.findAll();
  }

  @Get(':id')
  findById(@Param('id') id: string) {
    return this.expenseService.findById(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() body: any,
  ) {
    return this.expenseService.update(id, body);
  }

  @Delete(':id')
  delete(@Param('id') id: string) {
    return this.expenseService.delete(id);
  }
}