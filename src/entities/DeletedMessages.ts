import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Messages } from "./Messages";
import { Users } from "./Users";

@Index("messages_id", ["messagesId"], {})
@Index("users_id", ["usersId"], {})
@Entity("deleted_messages", { schema: "chat_app" })
export class DeletedMessages {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "messages_id", nullable: true })
  messagesId: number | null;

  @Column("int", { name: "users_id", nullable: true })
  usersId: number | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @ManyToOne(() => Messages, (messages) => messages.deletedMessages, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "messages_id", referencedColumnName: "id" }])
  messages: Messages;

  @ManyToOne(() => Users, (users) => users.deletedMessages, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "users_id", referencedColumnName: "id" }])
  users: Users;
}
