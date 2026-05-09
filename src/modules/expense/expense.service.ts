import { Injectable } from '@nestjs/common';
import { ExpenseRepository } from './repositories/expense.repository';

@Injectable()
export class ExpenseService {
  constructor(
    private readonly expenseRepository: ExpenseRepository,
  ) {}

  create(data: any) {
    return this.expenseRepository.create(data);
  }

  findAll() {
    return this.expenseRepository.findAll();
  }

  findById(id: string) {
    return this.expenseRepository.findById(id);
  }

  update(id: string, data: any) {
    return this.expenseRepository.update(id, data);
  }

  delete(id: string) {
    return this.expenseRepository.delete(id);
  }
}