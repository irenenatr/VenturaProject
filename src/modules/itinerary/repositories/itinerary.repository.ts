import { Injectable } from '@nestjs/common';
import { firestore } from 'src/config/firebase.config';

@Injectable()
export class ItineraryRepository {
  private collection = firestore.collection('itineraries');

  async create(data: any) {
    const docRef = await this.collection.add(data);

    return {
      id: docRef.id,
      ...data,
    };
  }

  async findAll() {
    const snapshot = await this.collection.get();

    return snapshot.docs.map(doc => ({
      id: doc.id,
      ...doc.data(),
    }));
  }

  async findById(id: string) {
    const doc = await this.collection.doc(id).get();

    if (!doc.exists) {
      return null;
    }

    return {
      id: doc.id,
      ...doc.data(),
    };
  }

  async update(id: string, data: any) {
    await this.collection.doc(id).update(data);

    return {
      id,
      ...data,
    };
  }

  async delete(id: string) {
    await this.collection.doc(id).delete();

    return {
      message: 'Itinerary deleted',
    };
  }
}