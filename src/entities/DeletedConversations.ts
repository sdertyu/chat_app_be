import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Conversation } from "./Conversation";
import { Users } from "./Users";

@Index("conversation_id", ["conversationId"], {})
@Index("users_id", ["usersId"], {})
@Entity("deleted_conversations", { schema: "chat_app" })
export class DeletedConversations {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "conversation_id", nullable: true })
  conversationId: number | null;

  @Column("int", { name: "users_id", nullable: true })
  usersId: number | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @ManyToOne(
    () => Conversation,
    (conversation) => conversation.deletedConversations,
    { onDelete: "CASCADE", onUpdate: "NO ACTION" }
  )
  @JoinColumn([{ name: "conversation_id", referencedColumnName: "id" }])
  conversation: Conversation;

  @ManyToOne(() => Users, (users) => users.deletedConversations, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "users_id", referencedColumnName: "id" }])
  users: Users;
}
