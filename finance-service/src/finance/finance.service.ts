import { Injectable } from '@nestjs/common';
import { db } from '../config/firebase.config';

@Injectable()
export class FinanceService {
  async addExpense(dto: any) {
    await db.collection('expenses').add(dto);

    return {
      message: 'Expense added',
      data: dto,
    };
  }

  addBudget(dto: any) {
    return {
      message: 'Budget added',
      data: dto,
    };
  }

  getAll() {
    return {
      message: 'Finance data',
    };
  }
}