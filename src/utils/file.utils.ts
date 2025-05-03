import { BadRequestException } from "@nestjs/common";
import { Request } from "express";

export const fileNameEditor = (req: Request, file: Express.Multer.File, callback: (error: any, filename) => void) => {
    const fileName = file.originalname;
    callback(null, fileName);
}

export const imageFileFilter = (req: Request, file: Express.Multer.File, callback: (error: any, valid: boolean) => void) => {
    if (!file.originalname.match(/\.(jpg|jpeg|png|gif)$/)) {
        return callback(new BadRequestException('Only image files are allowed!'), false);
    }

    callback(null, true);
}
