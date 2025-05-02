import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Users } from "./Users";

@Index("provider_id", ["providerId"], { unique: true })
@Index("users_id", ["usersId"], {})
@Entity("auth_providers", { schema: "chat_app" })
export class AuthProviders {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "users_id", nullable: true })
  usersId: number | null;

  @Column("varchar", { name: "provider", comment: "eg: google", length: 50 })
  provider: string;

  @Column("varchar", {
    name: "provider_id",
    unique: true,
    comment: "Google/Facebook ID",
    length: 100,
  })
  providerId: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @ManyToOne(() => Users, (users) => users.authProviders, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "users_id", referencedColumnName: "id" }])
  users: Users;
}
