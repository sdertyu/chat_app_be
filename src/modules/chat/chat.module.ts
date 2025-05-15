import { Module } from '@nestjs/common';
import { ChatService } from './chat.service';
import { ChatController } from './chat.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Conversation } from 'src/entities/Conversation';
import { ChatGateway } from './chat.gateway';
import { JwtAuthGuard } from 'src/guards/jwt-auth.guard';
import { Messages } from 'src/entities/Messages';

@Module({
  imports: [
    TypeOrmModule.forFeature([Conversation, Messages]), // Import the Conversation entity here
    // TypeOrmModule.forFeature([Messages]), // Uncomment if you have a Messages entity
  ],
  controllers: [ChatController],
  providers: [ChatService, ChatGateway, JwtAuthGuard],
})
export class ChatModule {}
