import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Users } from "./Users";
import { DeletedConversations } from "./DeletedConversations";
import { Messages } from "./Messages";
import { Participants } from "./Participants";

@Index("created_by", ["createdBy"], {})
@Entity("conversation", { schema: "chat_app" })
export class Conversation {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("varchar", { name: "name", nullable: true, length: 40 })
  name: string | null;

  @Column("varchar", { name: "title_id", nullable: true, length: 45 })
  titleId: string | null;

  @Column("varchar", { name: "channel_id", nullable: true, length: 45 })
  channelId: string | null;

  @Column("int", { name: "created_by", nullable: true })
  createdBy: number | null;

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

  @ManyToOne(() => Users, (users) => users.conversations, {
    onDelete: "SET NULL",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "created_by", referencedColumnName: "id" }])
  createdBy2: Users;

  @OneToMany(
    () => DeletedConversations,
    (deletedConversations) => deletedConversations.conversation
  )
  deletedConversations: DeletedConversations[];

  @OneToMany(() => Messages, (messages) => messages.conversation)
  messages: Messages[];

  @OneToMany(() => Participants, (participants) => participants.conversation)
  participants: Participants[];
}
