import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("activities", { schema: "chat_app" })
export class Activities {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("varchar", { name: "activity_type", nullable: true, length: 45 })
  activityType: string | null;

  @Column("int", { name: "activity_id", nullable: true })
  activityId: number | null;

  @Column("varchar", { name: "title", nullable: true, length: 45 })
  title: string | null;

  @Column("text", { name: "detail", nullable: true })
  detail: string | null;

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
}
