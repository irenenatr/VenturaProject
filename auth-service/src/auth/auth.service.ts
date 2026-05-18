import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { db } from '../config/firebase.config';

@Injectable()
export class AuthService {
  constructor(private jwtService: JwtService) {}

  async register(dto: any) {
    const hashedPassword = await bcrypt.hash(
      dto.password,
      10,
    );

    const userData = {
      email: dto.email,
      username: dto.username,
      password: hashedPassword,
    };

    await db.collection('users').add(userData);

    return {
      message: 'Register success',
      data: {
        email: dto.email,
        username: dto.username,
      },
    };
  }

    async login(dto: any) {
        const snapshot = await db
            .collection('users')
            .where('email', '==', dto.email)
            .get();

        if (snapshot.empty) {
            return {
            message: 'User not found',
            };
        }

        const user = snapshot.docs[0].data();

        const isPasswordValid = await bcrypt.compare(
            dto.password,
            user.password,
        );

        if (!isPasswordValid) {
            return {
            message: 'Invalid credentials',
            };
        }

        const payload = {
            email: user.email,
        };

        const token = await this.jwtService.signAsync(
            payload,
        );

        return {
            message: 'Login success',
            access_token: token,
        };
    }
}