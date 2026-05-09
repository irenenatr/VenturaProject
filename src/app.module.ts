import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import { ExpenseModule } from './modules/expense/expense.module';
import { BudgetModule } from './modules/budget/budget.module';
import { ItineraryModule } from './modules/itinerary/itinerary.module';

@Module({
  imports: [
  ConfigModule.forRoot({
    isGlobal: true,
  }),

  ExpenseModule,
  BudgetModule,
  ItineraryModule,
  ],
})
export class AppModule {}