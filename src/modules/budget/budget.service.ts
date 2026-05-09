import { Injectable } from '@nestjs/common';
import { BudgetRepository } from './repositories/budget.repository';

@Injectable()
export class BudgetService {
  constructor(
    private readonly budgetRepository: BudgetRepository,
  ) {}

  create(data: any) {
    return this.budgetRepository.create(data);
  }

  findAll() {
    return this.budgetRepository.findAll();
  }

  findById(id: string) {
    return this.budgetRepository.findById(id);
  }

  update(id: string, data: any) {
    return this.budgetRepository.update(id, data);
  }

  delete(id: string) {
    return this.budgetRepository.delete(id);
  }
}