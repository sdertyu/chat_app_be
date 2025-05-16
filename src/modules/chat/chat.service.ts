import { Conversation } from './../../entities/Conversation';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';
import { Messages } from './../../entities/Messages';
import { Participants } from 'src/entities/Participants';

@Injectable()
export class ChatService {
  constructor(
    @InjectRepository(Conversation)
    private readonly conversationRepository: Repository<Conversation>,
    @InjectRepository(Messages)
    private readonly messageRepository: Repository<Messages>,
    @InjectRepository(Participants)
    private readonly participantsRepository: Repository<Participants>,
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
        createdAt: 'ASC',
        messages: {
          createdAt: 'ASC',
        },
      },
    });

    // console.log(convers);
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

    return await this.messageRepository.save(newMessage);
  }

  async readMessage(
    conversationId: number,
    messageId: number,
    senderId: number,
  ) {
    const participant = await this.participantsRepository.findOne({
      where: {
        usersId: senderId,
        conversationId: conversationId,
      },
    });

    if (participant) {
      participant.lastReadMessageId = messageId;
      await this.participantsRepository.save(participant);
    }
  }
}
