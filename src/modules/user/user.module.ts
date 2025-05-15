import { forwardRef, Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Users } from 'src/entities/Users';
import { JwtStrategy } from 'src/passports/jwt.strategy';
import { AuthModule } from '../auth/auth.module';
import { RefreshTokens } from 'src/entities/RefreshTokens';
import { JwtAuthGuard } from 'src/guards/jwt-auth.guard';

@Module({
  imports: [
    forwardRef(() => AuthModule),
    TypeOrmModule.forFeature([Users]), // Import the Users entity here
    TypeOrmModule.forFeature([RefreshTokens]), // Import the Users entity here
  ],
  controllers: [UserController],
  providers: [UserService], // Add JwtStrategy here if needed
  exports: [UserService],
})
export class UserModule {}
