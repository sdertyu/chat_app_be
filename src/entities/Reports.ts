import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Users } from "./Users";
import { Participants } from "./Participants";

@Index("participants_id", ["participantsId"], {})
@Index("users_id", ["usersId"], {})
@Entity("reports", { schema: "chat_app" })
export class Reports {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "users_id", nullable: true })
  usersId: number | null;

  @Column("int", { name: "participants_id", nullable: true })
  participantsId: number | null;

  @Column("varchar", { name: "report_type", nullable: true, length: 45 })
  reportType: string | null;

  @Column("text", { name: "notes", nullable: true })
  notes: string | null;

  @Column("enum", {
    name: "status",
    nullable: true,
    enum: ["pending", "reviewed", "resolved"],
    default: () => "'pending'",
  })
  status: "pending" | "reviewed" | "resolved" | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @ManyToOne(() => Users, (users) => users.reports, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "users_id", referencedColumnName: "id" }])
  users: Users;

  @ManyToOne(() => Participants, (participants) => participants.reports, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "participants_id", referencedColumnName: "id" }])
  participants: Participants;
}
