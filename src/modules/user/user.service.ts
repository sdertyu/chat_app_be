import { register } from 'module';
import { Users } from './../../entities/Users';
import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(Users)
    private readonly repository: Repository<Users>,
  ) {}

  findByEmail(email: string): Promise<Users | null> {
    return this.repository.findOneBy({ email });
  }

  async validateUser(email: string, password: string): Promise<Users | null> {
    const user = await this.findByEmail(email);
    if (!user) {
      return null; // User not found
    }
    const status = bcrypt.compareSync(password, user.password);
    if (!status) {
      return null; // Passwords do not match
    }
    return user; // User is valid
  }

  async create(createUserDto: CreateUserDto) {
    const hashedPassword = await bcrypt.hash(createUserDto.password, 10);
    const user = this.repository.create({
      ...createUserDto,
      password: hashedPassword,
    });
    return this.repository.save(user);
  }

  async register(user: Partial<CreateUserDto>): Promise<Users> {
    const newUser = this.repository.create(user);
    newUser.createdAt = new Date(); // Set createdAt to current date
    newUser.updatedAt = new Date(); // Set updatedAt to current date
    const hashedPassword = await bcrypt.hash(user.password, 10); // Hash the password
    newUser.password = hashedPassword; // Set the hashed password
    return this.repository.save(newUser);
  }

  findAll() {
    return `This action returns all user`;
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
