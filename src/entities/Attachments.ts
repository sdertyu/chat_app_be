import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Messages } from "./Messages";

@Index("messages_id", ["messagesId"], {})
@Entity("attachments", { schema: "chat_app" })
export class Attachments {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "messages_id", nullable: true })
  messagesId: number | null;

  @Column("varchar", { name: "thumb_url", nullable: true, length: 255 })
  thumbUrl: string | null;

  @Column("varchar", { name: "file_url", nullable: true, length: 255 })
  fileUrl: string | null;

  @Column("timestamp", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("timestamp", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @ManyToOne(() => Messages, (messages) => messages.attachments, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "messages_id", referencedColumnName: "id" }])
  messages: Messages;
}
