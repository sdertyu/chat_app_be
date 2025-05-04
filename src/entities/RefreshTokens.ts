import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Users } from './Users';

@Entity('refresh_tokens', { schema: 'chat_app' })
export class RefreshTokens {
  @PrimaryGeneratedColumn({ type: 'int', name: 'id' })
  id: number;

  @Column('int', { name: 'user_id' })
  userId: number;

  @Column('text', { name: 'token' })
  token: string;

  @Column('datetime', { name: 'expires_at' })
  expiresAt: Date;

  @Column('datetime', {
    name: 'created_at',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date;

  @Column('tinyint', { name: 'revoked' })
  revoked: boolean | null; // true nếu đã thu hồi, false nếu chưa thu hồi

  @Column('varchar', { name: 'ip_address', nullable: true })
  ipAddress: string | null; // Địa chỉ IP của người dùng khi tạo refresh token

  @Column('varchar', { name: 'user_agent', nullable: true })
  userAgent: string | null; // Thông tin về trình duyệt hoặc thiết bị của người dùng khi tạo refresh token

  @ManyToOne(() => Users, (users) => users.refreshTokens, {
    onDelete: 'CASCADE',
    onUpdate: 'NO ACTION',
  })
  @JoinColumn([{ name: 'user_id', referencedColumnName: 'id' }])
  users: Users;
}
