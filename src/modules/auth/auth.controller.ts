import { Body, Controller, Post, Req, UploadedFile, UseGuards, UseInterceptors, ValidationPipe } from '@nestjs/common';
import { AuthService } from './auth.service';
import { register } from 'module';
import { AuthGuard } from '@nestjs/passport';
import { Users } from 'src/entities/Users';
import { UserService } from '../user/user.service';
import { LocalAuthGuard } from 'src/guards/local-auth.guard';
import { CreateUserDto } from '../user/dto/create-user.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { fileNameEditor, imageFileFilter } from 'src/utils/file.utils';

@Controller('auth')
export class AuthController {
  constructor(
    private readonly authService: AuthService,
    private readonly userService: UserService,
  ) {}

  @Post('register')
  @UseInterceptors(FileInterceptor('file', {
    storage: diskStorage({
      destination: './uploads/avatars',
      filename: fileNameEditor,
    }),
    fileFilter: imageFileFilter,
  }))
  register(@Body(new ValidationPipe()) user: CreateUserDto, @UploadedFile() file: Express.Multer.File) {
    user.avatarUrl = file.path;
    return this.userService.create(user);
  }

  @UseGuards(LocalAuthGuard)
  @Post('login')
  async login(@Req() req: any) {
    return this.authService.login(req.user);
  }
}
