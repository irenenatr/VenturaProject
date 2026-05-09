import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';

import { BudgetService } from './budget.service';
import { CreateBudgetDto } from './dto/create-budget.dto';

@Controller('budgets')
export class BudgetController {
  constructor(
    private readonly budgetService: BudgetService,
  ) {}

  @Post()
  create(@Body() body: CreateBudgetDto) {
    return this.budgetService.create(body);
  }

  @Get()
  findAll() {
    return this.budgetService.findAll();
  }

  @Get(':id')
  findById(@Param('id') id: string) {
    return this.budgetService.findById(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() body: any,
  ) {
    return this.budgetService.update(id, body);
  }

  @Delete(':id')
  delete(@Param('id') id: string) {
    return this.budgetService.delete(id);
  }
}