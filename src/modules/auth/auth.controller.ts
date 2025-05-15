import {
  Body,
  Controller,
  Get,
  Post,
  Req,
  Res,
  UnauthorizedException,
  UploadedFile,
  UseGuards,
  UseInterceptors,
  ValidationPipe,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { UserService } from '../user/user.service';
import { LocalAuthGuard } from 'src/guards/local-auth.guard';
import { CreateUserDto } from '../user/dto/create-user.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { fileNameEditor, imageFileFilter } from 'src/utils/file.utils';
import { Request, Response } from 'express';
import { JwtAuthGuard } from 'src/guards/jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(
    private readonly authService: AuthService,
    private readonly userService: UserService,
  ) {}

  @Post('register')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './uploads/avatars',
        filename: fileNameEditor,
      }),
      fileFilter: imageFileFilter,
    }),
  )
  register(
    @Body(new ValidationPipe()) user: CreateUserDto,
    @UploadedFile() file: Express.Multer.File,
  ) {
    user.avatarUrl = file.path;
    return this.userService.create(user);
  }

  @UseGuards(LocalAuthGuard)
  @Post('login')
  async login(@Req() req: any, @Res({ passthrough: true }) res: Response) {
    const jwtToken = this.authService.login(req.user);
    res.cookie('jwt', jwtToken.access_token, {
      httpOnly: true,
      secure: false, // Chuyển thành true nếu dùng HTTPS
      sameSite: 'lax',
      maxAge: 1000 * 60 * 60 * 24, // 1 ngày
    });
    res.cookie('refjwt', jwtToken.refresh_token, {
      httpOnly: true,
      secure: false, // Chuyển thành true nếu dùng HTTPS
      sameSite: 'lax',
      maxAge: 1000 * 60 * 60 * 24 * 7, // 7 ngày
    });
    return {
      user: req.user,
    };
  }

  @Post('logout')
  async logout(@Req() req, @Res({ passthrough: true }) res: Response) {
    const refreshToken = req.cookies['refjwt'];
    if (refreshToken) {
      await this.userService.revokeToken(refreshToken);
    }

    // Xóa cookie trên trình duyệt
    res.clearCookie('jwt');
    res.clearCookie('refjwt');

    return { message: 'Logged out successfully' };
  }

  @Get('verify-token')
  @UseGuards(JwtAuthGuard)
  verifyToken() {
    // Nếu guard cho phép request đi qua, token hợp lệ
    return { status: 'authenticated' };
  }

  @Post('refresh-token')
  async refreshToken(
    @Req() req: Request,
    @Res({ passthrough: true }) res: Response,
  ) {
    const refreshToken = req.cookies['refjwt']; // Lấy refresh token từ cookie
    if (!refreshToken) {
      throw new UnauthorizedException('No refresh token');
    }

    const result = await this.authService.refreshToken(refreshToken);
    if (!result || !result.access_token) {
      throw new UnauthorizedException('Invalid refresh token');
    }

    res.cookie('jwt', result.access_token, {
      httpOnly: true,
      secure: false, // true nếu dùng HTTPS
      sameSite: 'lax',
      maxAge: 1000 * 60 * 60 * 24, // 15 phút
    });

    return { message: 'Refresh token successful' };
  }

  @Get('me2')
  @UseGuards(JwtAuthGuard) // Sử dụng JwtAuthGuard để bảo vệ route này
  getMe(@Req() req: any) {
    console.log(req.user); // In ra thông tin người dùng đã xác thực
    return req.user; // Trả về thông tin người dùng đã xác thực
  }
}
