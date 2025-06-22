export interface ISendMessage {
  id: number;
  conversationId: string;
  senderId: number;
  content: string;
  createdAt: Date | null;
}

export interface ITyping {
  senderId: number;
  conversationId: string;
}
