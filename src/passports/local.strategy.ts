import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-local';
import { AuthService } from 'src/modules/auth/auth.service';
// import { UsersService } from 'src/modules/users/users.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
//   constructor(private readonly userService: UsersService) {
//     super({
//       usernameField: 'email', // Specify the field to be used as the username (email in this case)
//       passwordField: 'password', // Specify the field to be used as the password
//     });
//   }

  async validate(email: string, password: string): Promise<any> {
    // const user = await this.userService.validateUser(email, password); // Gọi đến userService để xác thực
    // if (!user) {
    //   throw new UnauthorizedException('Invalid credentials');
    // }
    // return user; // Return the user object if validation is successful
  }
}
