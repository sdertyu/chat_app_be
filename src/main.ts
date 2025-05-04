import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as cookieParser from 'cookie-parser';
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('api'); // Đặt prefix cho tất cả các route
  app.use(cookieParser()); // Sử dụng cookie-parser để xử lý cookie trong request
  app.enableCors({
    origin: 'http://localhost:5173', // hoặc domain của frontend
    methods: 'GET,POST,PUT,DELETE',
    credentials: true, // nếu frontend dùng cookie hoặc session
  });

  
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
