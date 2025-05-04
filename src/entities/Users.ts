import {
  Column,
  Entity,
  Index,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { AuthProviders } from './AuthProviders';
import { BlockList } from './BlockList';
import { Conversation } from './Conversation';
import { DeletedConversations } from './DeletedConversations';
import { DeletedMessages } from './DeletedMessages';
import { Messages } from './Messages';
import { Participants } from './Participants';
import { Reports } from './Reports';
import { UserContact } from './UserContact';
import { UserVerification } from './UserVerification';
import { RefreshTokens } from './RefreshTokens';

@Index('email', ['email'], { unique: true })
@Entity('users', { schema: 'chat_app' })
export class Users {
  @PrimaryGeneratedColumn({ type: 'int', name: 'id' })
  id: number;

  @Column('varchar', { name: 'phone', nullable: true, length: 16 })
  phone: string | null;

  @Column('varchar', { name: 'email', unique: true, length: 255 })
  email: string;

  @Column('varchar', {
    name: 'password',
    nullable: true,
    comment: 'Nullable nếu dùng OAuth',
    length: 100,
  })
  password: string | null;

  @Column('varchar', { name: 'first_name', nullable: true, length: 20 })
  firstName: string | null;

  @Column('varchar', { name: 'middle_name', nullable: true, length: 20 })
  middleName: string | null;

  @Column('varchar', { name: 'last_name', nullable: true, length: 20 })
  lastName: string | null;

  @Column('varchar', { name: 'avatar_url', nullable: true, length: 255 })
  avatarUrl: string | null;

  @Column('tinyint', {
    name: 'is_active',
    nullable: true,
    width: 1,
    default: () => "'1'",
  })
  isActive: boolean | null;

  @Column('tinyint', {
    name: 'is_reported',
    nullable: true,
    width: 1,
    default: () => "'0'",
  })
  isReported: boolean | null;

  @Column('tinyint', {
    name: 'is_blocked',
    nullable: true,
    width: 1,
    default: () => "'0'",
  })
  isBlocked: boolean | null;

  @Column('text', { name: 'preferences', nullable: true })
  preferences: string | null;

  @Column('datetime', {
    name: 'created_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date | null;

  @Column('datetime', {
    name: 'updated_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date | null;

  @OneToMany(() => AuthProviders, (authProviders) => authProviders.users)
  authProviders: AuthProviders[];

  @OneToMany(() => BlockList, (blockList) => blockList.users)
  blockLists: BlockList[];

  @OneToMany(() => Conversation, (conversation) => conversation.createdBy2)
  conversations: Conversation[];

  @OneToMany(
    () => DeletedConversations,
(deletedConversations) => deletedConversations.users,
  )
  deletedConversations: DeletedConversations[];

  @OneToMany(() => DeletedMessages, (deletedMessages) => deletedMessages.users)
  deletedMessages: DeletedMessages[];

  @OneToMany(() => Messages, (messages) => messages.sender)
  messages: Messages[];

  @OneToMany(() => Participants, (participants) => participants.users)
  participants: Participants[];

  @OneToMany(() => Reports, (reports) => reports.users)
  reports: Reports[];

  @OneToMany(() => UserContact, (userContact) => userContact.user)
  userContacts: UserContact[];

  @OneToMany(() => UserContact, (userContact) => userContact.contact)
  userContacts2: UserContact[];

  @OneToOne(
    () => UserVerification,
    (userVerification) => userVerification.users,
  )
  userVerification: UserVerification;

  @OneToMany(() => RefreshTokens, (refreshTokens) => refreshTokens.users)
  refreshTokens: RefreshTokens[];
}
