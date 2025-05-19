import { ChatService } from './chat.service';
import { Req, UseGuards } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import {
  ConnectedSocket,
  MessageBody,
  OnGatewayConnection,
  OnGatewayDisconnect,
  OnGatewayInit,
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { subscribe } from 'diagnostics_channel';
import { Server, Socket } from 'socket.io';
import { Conversation } from 'src/entities/Conversation';
import { JwtAuthGuard } from 'src/guards/jwt-auth.guard';
// import { JwtAuthGuard } from 'src/guards/jwt-auth.guard';

// @UseGuards(JwtAuthGuard)
@WebSocketGateway({
  cors: {
    origin: '*',
  },
})
export class ChatGateway
  implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect
{
  @WebSocketServer()
  server: Server;
  constructor(
    private configService: ConfigService,
    private readonly chatService: ChatService,
    // private jwtService: JwtService,
  ) {}

  afterInit(server: Socket) {
    // console.log('Server initialized');
  }

  handleConnection(client: Socket, ...args: any[]) {
    // console.log('Client connected ' + client.id);
  }

  handleDisconnect(client: Socket) {
    // console.log('Client disconnected ' + client.id);
  }

  @SubscribeMessage('typing')
  handleTyping(
    @MessageBody() data: { conversationId: string; senderId: number },
  ) {
    // console.log(data.conversationId);
    this.server.to(data.conversationId).emit('typing2', data);
  }

  @SubscribeMessage('join_room')
  handleJoinRoom(
    @MessageBody()
    data: { conversationId: string },
    @ConnectedSocket() client: Socket,
  ) {
    client.join(data.conversationId);
  }

  @SubscribeMessage('read_message')
  handleReadMessage(
    @MessageBody()
    data: { conversationId: string; lastMessageId: number; userId: number },
    @ConnectedSocket() client: Socket,
  ) {
    this.chatService.readMessage(
      Number(data.conversationId),
      data.lastMessageId,
      data.userId,
    );
    this.server.to(data.conversationId).emit('read_message', data);
  }

  //   @UseGuards(JwtAuthGuard)
  @SubscribeMessage('joinUserRoom')
  handleJoinUserRoom(
    @ConnectedSocket() client: Socket,
    @MessageBody() data: { userId: number },
  ) {
    client.join(data.userId.toString());
    // console.log('object');
  }

  //   @UseGuards(JwtAuthGuard)
  @SubscribeMessage('sendMessage')
  async handleMessage(
    @MessageBody()
    message: {
      id: number;
      senderId: number;
      content: string;
      conversationId: number;
      createdAt: Date | null;
    },
    @ConnectedSocket() client: Socket,
    // @Req() req: any,
  ) {
    const newMess = await this.chatService.saveMessage(message);
    message.id = newMess.id;
    message.createdAt = newMess.createdAt;

    const userRoom = await this.chatService.getUserInConversation(
      message.conversationId,
    );
    userRoom.forEach((userId) => {
      if (userId) {
        this.server.to(userId.toString()).emit('receive_message', message);
        console.log('object');
      }
    });
  }
}
