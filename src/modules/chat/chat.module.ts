import { Module } from '@nestjs/common';
import { ChatService } from './chat.service';
import { ChatController } from './chat.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Conversation } from 'src/entities/Conversation';
import { ChatGateway } from './chat.gateway';
import { JwtAuthGuard } from 'src/guards/jwt-auth.guard';
import { Messages } from 'src/entities/Messages';
import { Participants } from 'src/entities/Participants';
import { JwtStrategy } from 'src/passports/jwt.strategy';
import { AuthModule } from '../auth/auth.module';

@Module({
  imports: [
    // AuthModule,
    TypeOrmModule.forFeature([Conversation, Messages, Participants]), // Import the Conversation entity here
    // TypeOrmModule.forFeature([Messages]), // Uncomment if you have a Messages entity
  ],
  controllers: [ChatController],
  providers: [ChatService, ChatGateway],
})
export class ChatModule {}
