import { Injectable } from '@nestjs/common';

@Injectable()
export class TravelService {
  addDestination(dto: any) {
    return {
      message: 'Destination saved',
      data: dto,
    };
  }

  createItinerary(dto: any) {
    return {
      message: 'Itinerary created',
      data: dto,
    };
  }

  recommendation() {
    return {
      message: 'Cheaper destination suggestion',
    };
  }
}