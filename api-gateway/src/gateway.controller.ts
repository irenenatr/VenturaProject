import { Body, Controller, Get, Post } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom } from 'rxjs';

@Controller()
export class GatewayController {
  constructor(private httpService: HttpService) {}

  @Post('auth/login')
  async login(@Body() dto: any) {
    const response = await firstValueFrom(
      this.httpService.post(
        'http://localhost:3001/auth/login',
        dto,
      ),
    );

    return response.data;
  }

  @Post('auth/register')
    async register(@Body() dto: any) {
    const response = await firstValueFrom(
        this.httpService.post(
        'http://localhost:3001/auth/register',
        dto,
        ),
    );

    return response.data;
    }

    @Post('finance/expense')
    async addExpense(@Body() dto: any) {
    const response = await firstValueFrom(
        this.httpService.post(
        'http://localhost:3002/finance/expense',
        dto,
        ),
    );

    return response.data;
    }

    @Post('finance/budget')
    async addBudget(@Body() dto: any) {
    const response = await firstValueFrom(
        this.httpService.post(
        'http://localhost:3002/finance/budget',
        dto,
        ),
    );

    return response.data;
    }

    @Get('travel/recommendation')
    async recommendation() {
    const response = await firstValueFrom(
        this.httpService.get(
        'http://localhost:3003/travel/recommendation',
        ),
    );

    return response.data;
    }
}