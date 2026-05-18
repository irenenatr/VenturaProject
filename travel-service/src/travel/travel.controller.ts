import { Body, Controller, Get, Post } from '@nestjs/common';
import { TravelService } from './travel.service';
import { CreateDestinationDto } from './dto/create-destination.dto';
import { CreateItineraryDto } from './dto/create-itinerary.dto';

@Controller('travel')
export class TravelController {
  constructor(private travelService: TravelService) {}

  @Post('destination')
  addDestination(@Body() dto: CreateDestinationDto) {
    return this.travelService.addDestination(dto);
  }

  @Post('itinerary')
  createItinerary(@Body() dto: CreateItineraryDto) {
    return this.travelService.createItinerary(dto);
  }

  @Get('recommendation')
  recommendation() {
    return this.travelService.recommendation();
  }
}