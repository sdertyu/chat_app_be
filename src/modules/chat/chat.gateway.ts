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
import { Server, Socket } from 'socket.io';
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
    data: { conversationId: string; lastMessageId: number; userId: number },
    @ConnectedSocket() client: Socket,
  ) {
    this.chatService.readMessage(
      Number(data.conversationId),
      data.lastMessageId,
      data.userId,
    );
    client.join(data.conversationId);
    console.log(data);
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
    },
    @ConnectedSocket() client: Socket,
    // @Req() req: any,
  ) {
    // console.log('Received message:', message);
    // // message.senderId = req.user.id;
    const newMess = await this.chatService.saveMessage(message);

    message.id = newMess.id;
    this.server
      .to(message.conversationId.toString())
      .emit('receive_message', message); //
  }
}
