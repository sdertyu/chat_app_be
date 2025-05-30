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
    // const convers = await this.conversationRepository.find({
    //   relations: ['participants', 'messages'],
    //   where: {
    //     participants: {
    //       usersId: user.id,
    //     },
    //   },
    //   order: {
    //     createdAt: 'ASC',
    //     messages: {
    //       createdAt: 'ASC',
    //     },
    //   },
    // });
    const convers = await this.conversationRepository
      .createQueryBuilder('conversation')
      .leftJoinAndSelect('conversation.participants', 'participant')
      .leftJoinAndSelect('conversation.messages', 'message')
      .leftJoinAndSelect('participant.users', 'user')
      .where((qb) => {
        const subQuery = qb
          .subQuery()
          .select('participantSub.conversationId')
          .from('participants', 'participantSub')
          .where('participantSub.usersId = :userId')
          .getQuery();
        return 'conversation.id IN ' + subQuery;
      })
      .setParameter('userId', user.id)
      .orderBy('conversation.createdAt', 'ASC')
      .addOrderBy('message.createdAt', 'ASC')
      .getMany();

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

  async getUserInConversation(conversationId: number) {
    const participants = await this.participantsRepository.find({
      where: {
        conversationId: conversationId,
      },
    });

    return participants.map((participant) => participant.usersId);
  }
}
