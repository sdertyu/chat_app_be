import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Users } from 'src/entities/Users';
import { UserService } from '../user/user.service';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService, // Assuming UserService is imported correctly
    private readonly jwtService: JwtService, // Uncomment if using JWT
  ) {}

  login(user: any) {
    const payload = { email: user.email, sub: user.id };
    return {
      access_token: this.jwtService.sign(payload), // Replace with actual JWT token generation logic
    };
  }
}
