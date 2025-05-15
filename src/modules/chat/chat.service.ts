import { Conversation } from './../../entities/Conversation';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Messages } from './../../entities/Messages';

@Injectable()
export class ChatService {
  constructor(
    @InjectRepository(Conversation)
    private readonly conversationRepository: Repository<Conversation>,
    @InjectRepository(Messages)
    private readonly messageRepository: Repository<Messages>,
  ) {}

  async findAllConversations(user: any) {
    const convers = await this.conversationRepository.find({
      relations: ['participants', 'messages'],
      where: {
        participants: {
          usersId: user.id,
        },
      },
      order: {
        messages: {
          createdAt: 'ASC',
        },
      },
    });

    console.log(convers);
    return convers;
  }

  async saveMessage(message: {
    senderId: number;
    content: string;
    conversationId: number;
  }) {
    const newMessage = this.messageRepository.create({
      senderId: message.senderId,
      content: message.content,
      conversationId: message.conversationId,
      messageType: 'text', // Assuming you have a messageType field in your Messages entity
    });

    await this.messageRepository.save(newMessage);
    return newMessage;
  }
}
