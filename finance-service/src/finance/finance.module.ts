import { Module } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';

import { FinanceController } from './finance.controller';
import { FinanceService } from './finance.service';

import { JwtStrategy } from '../auth/jwt.strategy';

@Module({
  imports: [PassportModule],
  controllers: [FinanceController],
  providers: [FinanceService, JwtStrategy],
})
export class FinanceModule {}