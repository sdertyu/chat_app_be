import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Attachments } from "./Attachments";
import { DeletedMessages } from "./DeletedMessages";
import { Conversation } from "./Conversation";
import { Users } from "./Users";

@Index("conversation_id", ["conversationId"], {})
@Index("sender_id", ["senderId"], {})
@Entity("messages", { schema: "chat_app" })
export class Messages {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "conversation_id", nullable: true })
  conversationId: number | null;

  @Column("int", { name: "sender_id", nullable: true })
  senderId: number | null;

  @Column("varchar", { name: "content", nullable: true, length: 255 })
  content: string | null;

  @Column("enum", {
    name: "message_type",
    nullable: true,
    enum: ["text", "image", "file"],
  })
  messageType: "text" | "image" | "file" | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", { name: "deleted_at", nullable: true })
  deletedAt: Date | null;

  @OneToMany(() => Attachments, (attachments) => attachments.messages)
  attachments: Attachments[];

  @OneToMany(
    () => DeletedMessages,
    (deletedMessages) => deletedMessages.messages
  )
  deletedMessages: DeletedMessages[];

  @ManyToOne(() => Conversation, (conversation) => conversation.messages, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "conversation_id", referencedColumnName: "id" }])
  conversation: Conversation;

  @ManyToOne(() => Users, (users) => users.messages, {
    onDelete: "SET NULL",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "sender_id", referencedColumnName: "id" }])
  sender: Users;
}
