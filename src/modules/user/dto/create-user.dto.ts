import { IsOptional } from "class-validator";

export class CreateUserDto {

    id: number;

    @IsOptional()
    phone: string;

    email: string;
    password: string;

    @IsOptional()
    firstName: string;

    @IsOptional()
    middleName: string;

    @IsOptional()
    lastName: string;

    @IsOptional()
    avatarUrl: string;

    @IsOptional()
    isActive: boolean;

    @IsOptional()
    isReported: boolean;

    @IsOptional()
    isBlocked: boolean;

    @IsOptional()
    preferences: string;

    @IsOptional()
    createdAt: Date;

    @IsOptional()
    updatedAt: Date;
}
