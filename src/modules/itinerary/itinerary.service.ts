import { Injectable } from '@nestjs/common';
import { ItineraryRepository } from './repositories/itinerary.repository';

@Injectable()
export class ItineraryService {
  constructor(
    private readonly itineraryRepository: ItineraryRepository,
  ) {}

  create(data: any) {
    return this.itineraryRepository.create(data);
  }

  findAll() {
    return this.itineraryRepository.findAll();
  }

  findById(id: string) {
    return this.itineraryRepository.findById(id);
  }

  update(id: string, data: any) {
    return this.itineraryRepository.update(id, data);
  }

  delete(id: string) {
    return this.itineraryRepository.delete(id);
  }
}