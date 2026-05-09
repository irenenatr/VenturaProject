import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';

import { ItineraryService } from './itinerary.service';
import { CreateItineraryDto } from './dto/create-itinerary.dto';

@Controller('itineraries')
export class ItineraryController {
  constructor(
    private readonly itineraryService: ItineraryService,
  ) {}

  @Post()
  create(@Body() body: CreateItineraryDto) {
    return this.itineraryService.create(body);
  }

  @Get()
  findAll() {
    return this.itineraryService.findAll();
  }

  @Get(':id')
  findById(@Param('id') id: string) {
    return this.itineraryService.findById(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() body: any,
  ) {
    return this.itineraryService.update(id, body);
  }

  @Delete(':id')
  delete(@Param('id') id: string) {
    return this.itineraryService.delete(id);
  }
}