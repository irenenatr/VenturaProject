import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { LoginDto } from './dto/login.dto';

@Injectable()
export class AuthService {
  register(createUserDto: CreateUserDto) {
    return {
      message: 'User registered',
      data: createUserDto,
    };
  }

  login(loginDto: LoginDto) {
    return {
      message: 'Login success',
      data: loginDto,
    };
  }

  logout() {
    return {
      message: 'Logout success',
    };
  }
}