import { Module } from '@nestjs/common';

import { ItineraryController } from './itinerary.controller';
import { ItineraryService } from './itinerary.service';
import { ItineraryRepository } from './repositories/itinerary.repository';

@Module({
  controllers: [ItineraryController],
  providers: [ItineraryService, ItineraryRepository],
})
export class ItineraryModule {}