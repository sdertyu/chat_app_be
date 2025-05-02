import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config'; // Import ConfigService

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private configService: ConfigService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: configService.get<string>('JWT_SECRET_KEY', ''), // Lấy từ ConfigService
    });
    console.log(configService.get<string>('JWT_SECRET_KEY', 'default-secret'));
  }

  async validate(payload: { sub: number; email?: string }) {
    return { id: payload.sub, email: payload.email ?? 'null' };
  }
}