import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Users } from 'src/entities/Users';
import { UserService } from '../user/user.service';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService, // Assuming UserService is imported correctly
    private readonly jwtService: JwtService, // Uncomment if using JWT
  ) {}

  login = (user: Users) => {
    const payload = {
      email: user.email,
      sub: user.id,
      firstName: user.firstName,
      middleName: user.middleName,
      lastName: user.lastName,
    };
    const refreshToken = this.jwtService.sign(payload, {
      expiresIn: '7d', // Set expiration time for refresh token
    });

    this.userService.saveRefreshToken(
      user.id,
      refreshToken,
      new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
    ); // Save refresh token to database
    return {
      access_token: this.jwtService.sign(payload),
      refresh_token: refreshToken,
    };
  };

  async refreshToken(refreshToken: string) {
    const decode = this.jwtService.decode(refreshToken);
    if (decode) {
      const user = await this.userService.findByEmail(decode.email);

      if (user) {
        const tokenRecord = user.refreshTokens[0]; // Giả sử bạn lấy token mới nhất
        if (tokenRecord) {
          const currentDate = new Date();

          // Kiểm tra xem token đã hết hạn chưa
          if (tokenRecord.expiresAt < currentDate) {
            // Nếu token đã hết hạn, thu hồi token và trả về lỗi
            await this.userService.revokeToken(tokenRecord.token);
            return { message: 'Token has expired and has been revoked' };
          }

          // Nếu token hợp lệ, tiếp tục quy trình refresh
          const isValid = await bcrypt.compare(refreshToken, tokenRecord.token);
          if (isValid) {
            const payload = {
              email: user.email,
              sub: user.id,
              firstName: user.firstName,
              middleName: user.middleName,
              lastName: user.lastName,
            };
            return {
              access_token: this.jwtService.sign(payload),
            };
          }
        }
      }
    }
    return false;
  }
}
