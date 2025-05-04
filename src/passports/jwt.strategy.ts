import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config'; // Import ConfigService

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private configService: ConfigService) {
    super({
      jwtFromRequest: ExtractJwt.fromExtractors([
        (req) => {
        //   console.log(req?.cookies?.jwt);
          return req?.cookies?.jwt;
        },
      ]),

      ignoreExpiration: false,
      secretOrKey: configService.get<string>('JWT_SECRET_KEY', ''), // Lấy từ ConfigService
    });
  }

  async validate(payload: { email?: string, sub: number, firstName: string, middleName: string, lastName: string }) {
    return { id: payload.sub, email: payload.email, firstName: payload.firstName, middleName: payload.middleName, lastName: payload.lastName };
  }
}
