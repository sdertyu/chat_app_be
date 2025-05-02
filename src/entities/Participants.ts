import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { BlockList } from "./BlockList";
import { Conversation } from "./Conversation";
import { Users } from "./Users";
import { Reports } from "./Reports";

@Index("conversation_id", ["conversationId"], {})
@Index("users_id", ["usersId"], {})
@Entity("participants", { schema: "chat_app" })
export class Participants {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "conversation_id", nullable: true })
  conversationId: number | null;

  @Column("int", { name: "users_id", nullable: true })
  usersId: number | null;

  @Column("enum", { name: "type", nullable: true, enum: ["admin", "member"] })
  type: "admin" | "member" | null;

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

  @OneToMany(() => BlockList, (blockList) => blockList.participants)
  blockLists: BlockList[];

  @ManyToOne(() => Conversation, (conversation) => conversation.participants, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "conversation_id", referencedColumnName: "id" }])
  conversation: Conversation;

  @ManyToOne(() => Users, (users) => users.participants, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "users_id", referencedColumnName: "id" }])
  users: Users;

  @OneToMany(() => Reports, (reports) => reports.participants)
  reports: Reports[];
}
