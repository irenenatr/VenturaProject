import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import OpenAI from 'openai';

@Injectable()
export class RecommendationService {
  private openai: OpenAI;

  constructor(private configService: ConfigService) {
    this.openai = new OpenAI({
      apiKey: this.configService.get<string>(
        'OPENAI_API_KEY',
      ),
    });
  }

  async generateRecommendation(dto: any) {
    const prompt = `
    Create a travel recommendation for:
    
    Destination: ${dto.destination}
    Budget: ${dto.budget}
    Days: ${dto.days}
    Travel Style: ${dto.style}

    Give itinerary suggestions and budget-saving tips.
    `;

    const response =
      await this.openai.chat.completions.create({
        model: 'gpt-3.5-turbo',
        messages: [
          {
            role: 'user',
            content: prompt,
          },
        ],
      });

    return {
      message: 'AI recommendation generated',
      result: response.choices[0].message.content,
    };
  }
}