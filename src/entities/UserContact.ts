import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Users } from "./Users";

@Index("contact_id", ["contactId"], {})
@Entity("user_contact", { schema: "chat_app" })
export class UserContact {
  @Column("int", { primary: true, name: "user_id" })
  userId: number;

  @Column("int", { primary: true, name: "contact_id" })
  contactId: number;

  @Column("varchar", { name: "first_name", nullable: true, length: 45 })
  firstName: string | null;

  @Column("varchar", { name: "last_name", nullable: true, length: 45 })
  lastName: string | null;

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

  @ManyToOne(() => Users, (users) => users.userContacts, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: Users;

  @ManyToOne(() => Users, (users) => users.userContacts2, {
    onDelete: "CASCADE",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "contact_id", referencedColumnName: "id" }])
  contact: Users;
}
