
CREATE TABLE `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `phone` VARCHAR(16),
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(100) COMMENT 'Nullable nếu dùng OAuth',
  `first_name` VARCHAR(20),
  `middle_name` VARCHAR(20),
  `last_name` VARCHAR(20),
  `avatar_url` VARCHAR(255),
  `is_active` BOOLEAN DEFAULT TRUE,
  `is_reported` BOOLEAN DEFAULT FALSE,
  `is_blocked` BOOLEAN DEFAULT FALSE,
  `preferences` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `conversation` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(40),
  `title_id` VARCHAR(45),
  `channel_id` VARCHAR(45),
  `created_by` INT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
);

CREATE TABLE `participants` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `conversation_id` INT,
  `users_id` INT,
  `type` ENUM('admin','member'),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `auth_providers` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `users_id` INT,
  `provider` VARCHAR(50) NOT NULL COMMENT 'eg: google',
  `provider_id` VARCHAR(100) UNIQUE NOT NULL COMMENT 'Google/Facebook ID',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `user_verification` (
  `users_id` INT PRIMARY KEY,
  `verification_code` VARCHAR(45),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `user_contact` (
  `user_id` INT,
  `contact_id` INT,
  `first_name` VARCHAR(45),
  `last_name` VARCHAR(45),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `contact_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`contact_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `block_list` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `users_id` INT,
  `participants_id` INT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`participants_id`) REFERENCES `participants` (`id`) ON DELETE CASCADE
);

CREATE TABLE `messages` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `conversation_id` INT,
  `sender_id` INT,
  `content` VARCHAR(255),
  `message_type` ENUM('text','image','file'),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME,
  FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
);

CREATE TABLE `attachments` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `messages_id` INT,
  `thumb_url` VARCHAR(255),
  `file_url` VARCHAR(255),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
);

CREATE TABLE `deleted_conversations` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `conversation_id` INT,
  `users_id` INT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `deleted_messages` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `messages_id` INT,
  `users_id` INT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `reports` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `users_id` INT,
  `participants_id` INT,
  `report_type` VARCHAR(45),
  `notes` TEXT,
  `status` ENUM('pending','reviewed','resolved') DEFAULT 'pending',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`participants_id`) REFERENCES `participants` (`id`) ON DELETE CASCADE
);

CREATE TABLE `activities` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `activity_type` VARCHAR(45),
  `activity_id` INT,
  `title` VARCHAR(45),
  `detail` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
