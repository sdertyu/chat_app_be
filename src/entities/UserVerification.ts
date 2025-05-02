import { Column, Entity, JoinColumn, OneToOne } from "typeorm";
import { Users } from "./Users";

@Entity("user_verification", { schema: "chat_app" })
export class UserVerification {
  @Column("int", { primary: true, name: "users_id" })
  usersId: number;

  @Column("varchar", { name: "verification_code", nullable: true, length: 45 })
  verificationCode: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @OneToOne(() => Users, (users) => users.userVerification, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "users_id", referencedColumnName: "id" }])
  users: Users;
}
