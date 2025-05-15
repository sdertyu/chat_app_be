/*
 Navicat Premium Dump SQL

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : tdkt6

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 06/05/2025 22:58:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2025_03_11_074941_add_api_token_to_tbltaikhoan', 1);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for tblcanhan
-- ----------------------------
DROP TABLE IF EXISTS `tblcanhan`;
CREATE TABLE `tblcanhan`  (
  `PK_MaCaNhan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FK_MaDonVi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sTenCaNhan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sTenChucVu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bGioiTinh` tinyint(1) NULL DEFAULT NULL,
  `FK_MaTaiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaCaNhan`) USING BTREE,
  INDEX `FK_MaDonVi`(`FK_MaDonVi` ASC) USING BTREE,
  INDEX `FK_MaTaiKhoan`(`FK_MaTaiKhoan` ASC) USING BTREE,
  CONSTRAINT `tblcanhan_ibfk_1` FOREIGN KEY (`FK_MaDonVi`) REFERENCES `tbldonvi` (`PK_MaDonVi`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblcanhan_ibfk_2` FOREIGN KEY (`FK_MaTaiKhoan`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblcanhan
-- ----------------------------
INSERT INTO `tblcanhan` VALUES ('CN0001', 'dv_1', 'Ngô Minh Phương', 'giảng viên', 0, 'user5');
INSERT INTO `tblcanhan` VALUES ('CN0002', 'dv_1', 'Phạm Duy Trường', 'hé hé', 0, 'user7');
INSERT INTO `tblcanhan` VALUES ('CN0003', 'dv_1', 'Nguyễn Thị Thương', 'fsdfsdfds', 0, 'user8');
INSERT INTO `tblcanhan` VALUES ('CN0004', 'dv_1', 'Nguyễn Đình Khương', 'giảng viên', 0, 'usercanhan04');
INSERT INTO `tblcanhan` VALUES ('CN0005', 'dv_2', 'Nguyễn Thị Bích', 'giảng viên', 1, 'usertcnh_nv01');
INSERT INTO `tblcanhan` VALUES ('CNSH0001', 'congnghesinhhoc', 'Nguyễn Thị Uyên', 'Giảng viên', 0, 'cnsh_cn01');
INSERT INTO `tblcanhan` VALUES ('CNSH0002', 'congnghesinhhoc', 'Trần Văn Vũ', 'Giảng viên', 1, 'cnsh_cn02');
INSERT INTO `tblcanhan` VALUES ('CNSH0003', 'congnghesinhhoc', 'Lê Thị Xuân', 'Trợ giảng', 0, 'cnsh_cn03');
INSERT INTO `tblcanhan` VALUES ('CNSH0004', 'congnghesinhhoc', 'Phạm Minh Ý', 'Giảng viên', 1, 'cnsh_cn04');
INSERT INTO `tblcanhan` VALUES ('CNSH0005', 'congnghesinhhoc', 'Hoàng Thị Z', 'Giảng viên', 0, 'cnsh_cn05');
INSERT INTO `tblcanhan` VALUES ('DDT0001', 'diendientu', 'Nguyễn Văn Phong', 'Giảng viên', 1, 'ddt_cn01');
INSERT INTO `tblcanhan` VALUES ('DDT0002', 'diendientu', 'Trần Thị Quyên', 'Giảng viên', 0, 'ddt_cn02');
INSERT INTO `tblcanhan` VALUES ('DDT0003', 'diendientu', 'Lê Minh Sơn', 'Trợ giảng', 1, 'ddt_cn03');
INSERT INTO `tblcanhan` VALUES ('DDT0004', 'diendientu', 'Phạm Thị Thảo', 'Giảng viên', 0, 'ddt_cn04');
INSERT INTO `tblcanhan` VALUES ('DDT0005', 'diendientu', 'Hoàng Văn Tú', 'Giảng viên', 1, 'ddt_cn05');
INSERT INTO `tblcanhan` VALUES ('DL0001', 'dulich', 'Phạm Cơ Hoàng', 'Giảng viên', 1, 'user9');
INSERT INTO `tblcanhan` VALUES ('LUAT0001', 'luat', 'Nguyễn Văn An', 'Giảng viên', 1, 'luat_cn01');
INSERT INTO `tblcanhan` VALUES ('LUAT0002', 'luat', 'Trần Thị Bình', 'Giảng viên', 0, 'luat_cn02');
INSERT INTO `tblcanhan` VALUES ('LUAT0003', 'luat', 'Lê Minh Chính', 'Trợ giảng', 1, 'luat_cn03');
INSERT INTO `tblcanhan` VALUES ('LUAT0004', 'luat', 'Phạm Thị Dung', 'Giảng viên', 0, 'luat_cn04');
INSERT INTO `tblcanhan` VALUES ('LUAT0005', 'luat', 'Hoàng Văn Em', 'Giảng viên', 1, 'luat_cn05');
INSERT INTO `tblcanhan` VALUES ('sèwr', 'congnghesinhhoc', 'ẻwerwer', 'sdfsdfsdf', 0, 'usercanhan04r');
INSERT INTO `tblcanhan` VALUES ('TA0001', 'tienganh', 'Nguyễn Văn Anh', 'Giảng viên', 1, 'ta_cn01');
INSERT INTO `tblcanhan` VALUES ('TA0002', 'tienganh', 'Trần Thị Bích', 'Giảng viên', 0, 'ta_cn02');
INSERT INTO `tblcanhan` VALUES ('TA0003', 'tienganh', 'Lê Minh Châu', 'Trợ giảng', 1, 'ta_cn03');
INSERT INTO `tblcanhan` VALUES ('TA0004', 'tienganh', 'Phạm Quốc Đạt', 'Giảng viên', 1, 'ta_cn04');
INSERT INTO `tblcanhan` VALUES ('TA0005', 'tienganh', 'Hoàng Thị E', 'Giảng viên', 0, 'ta_cn05');
INSERT INTO `tblcanhan` VALUES ('TQ0001', 'tiengtrung', 'Nguyễn Thị Hoa', 'Giảng viên', 0, 'tq_cn01');
INSERT INTO `tblcanhan` VALUES ('TQ0002', 'tiengtrung', 'Trần Văn Hùng', 'Giảng viên', 1, 'tq_cn02');
INSERT INTO `tblcanhan` VALUES ('TQ0003', 'tiengtrung', 'Lê Thị Kim', 'Trợ giảng', 0, 'tq_cn03');
INSERT INTO `tblcanhan` VALUES ('TQ0004', 'tiengtrung', 'Phạm Văn Long', 'Giảng viên', 1, 'tq_cn04');
INSERT INTO `tblcanhan` VALUES ('TQ0005', 'tiengtrung', 'Hoàng Minh Nam', 'Giảng viên', 1, 'tq_cn05');
INSERT INTO `tblcanhan` VALUES ('ttcanhan5', 'dv_1', 'Nguyễn Thị Thương', 'sin viên', 1, 'usercanhan05');

-- ----------------------------
-- Table structure for tblcapdanhhieu
-- ----------------------------
DROP TABLE IF EXISTS `tblcapdanhhieu`;
CREATE TABLE `tblcapdanhhieu`  (
  `PK_MaCap` int NOT NULL AUTO_INCREMENT,
  `sTenCap` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaCap`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblcapdanhhieu
-- ----------------------------
INSERT INTO `tblcapdanhhieu` VALUES (1, 'Cấp trường');
INSERT INTO `tblcapdanhhieu` VALUES (2, 'Cấp Bộ');

-- ----------------------------
-- Table structure for tbldanhhieu
-- ----------------------------
DROP TABLE IF EXISTS `tbldanhhieu`;
CREATE TABLE `tbldanhhieu`  (
  `PK_MaDanhHieu` int NOT NULL AUTO_INCREMENT,
  `sTenDanhHieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaHinhThuc` int NULL DEFAULT NULL,
  `FK_MaLoaiDanhHieu` int NULL DEFAULT NULL,
  `FK_MaCap` int NULL DEFAULT NULL,
  `bTrangThai` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaDanhHieu`) USING BTREE,
  INDEX `FK_MaHinhThuc`(`FK_MaHinhThuc` ASC) USING BTREE,
  INDEX `FK_MaLoaiDanhHieu`(`FK_MaLoaiDanhHieu` ASC) USING BTREE,
  INDEX `FK_MaCap`(`FK_MaCap` ASC) USING BTREE,
  CONSTRAINT `tbldanhhieu_ibfk_1` FOREIGN KEY (`FK_MaHinhThuc`) REFERENCES `tblhinhthuc` (`PK_MaHinhThuc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbldanhhieu_ibfk_2` FOREIGN KEY (`FK_MaLoaiDanhHieu`) REFERENCES `tblloaidanhhieu` (`PK_MaLoaiDanhHieu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbldanhhieu_ibfk_3` FOREIGN KEY (`FK_MaCap`) REFERENCES `tblcapdanhhieu` (`PK_MaCap`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldanhhieu
-- ----------------------------
INSERT INTO `tbldanhhieu` VALUES (1, 'Lao động tiên tiến', 1, 1, 1, 1);
INSERT INTO `tbldanhhieu` VALUES (2, 'Chiến sĩ thi đua cơ sở', 1, 1, 1, 1);
INSERT INTO `tbldanhhieu` VALUES (3, 'Giấy khen của hiệu trưởng', 1, 1, 1, 1);
INSERT INTO `tbldanhhieu` VALUES (4, 'Tập thể lao động tiên tiến', 1, 2, 1, 1);
INSERT INTO `tbldanhhieu` VALUES (5, 'Tập thể lao động xuất sắc', 1, 2, 2, 1);
INSERT INTO `tbldanhhieu` VALUES (6, 'Giấy khen của hiệu trưởng', 1, 2, 1, 1);
INSERT INTO `tbldanhhieu` VALUES (15, 'Chiến sĩ thi đua toàn quốc', 2, 1, 2, 0);
INSERT INTO `tbldanhhieu` VALUES (16, 'Chiến sĩ thi đua Bộ, ban, ngành, tỉnh', 2, 1, 2, 0);
INSERT INTO `tbldanhhieu` VALUES (17, 'Cờ thi đua của Chính phủ', 2, 2, 2, 0);
INSERT INTO `tbldanhhieu` VALUES (18, 'Cờ thi đua của Bộ, ban, ngành, tỉnh', 2, 2, 2, 0);
INSERT INTO `tbldanhhieu` VALUES (22, 'Giấy khen của hiệu trưởng', 2, 1, 1, 1);
INSERT INTO `tbldanhhieu` VALUES (23, 'Giấy khen của hiệu trưởng', 2, 2, 1, 1);

-- ----------------------------
-- Table structure for tbldexuat
-- ----------------------------
DROP TABLE IF EXISTS `tbldexuat`;
CREATE TABLE `tbldexuat`  (
  `PK_MaDeXuat` int NOT NULL AUTO_INCREMENT,
  `FK_User` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaHoiDong` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaDanhHieu` int NULL DEFAULT NULL,
  `iSoNguoiBau` int NULL DEFAULT NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  `FK_NguoiTao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaDot` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaDeXuat`) USING BTREE,
  INDEX `FK_User`(`FK_User` ASC) USING BTREE,
  INDEX `FK_MaDanhHieu`(`FK_MaDanhHieu` ASC) USING BTREE,
  INDEX `FK_MaHoiDong`(`FK_MaHoiDong` ASC) USING BTREE,
  INDEX `FK_NguoiTao`(`FK_NguoiTao` ASC) USING BTREE,
  INDEX `tbldexuat_ibfk_5`(`FK_MaDot` ASC) USING BTREE,
  CONSTRAINT `tbldexuat_ibfk_1` FOREIGN KEY (`FK_User`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbldexuat_ibfk_2` FOREIGN KEY (`FK_MaDanhHieu`) REFERENCES `tbldanhhieu` (`PK_MaDanhHieu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbldexuat_ibfk_3` FOREIGN KEY (`FK_MaHoiDong`) REFERENCES `tblhoidongdonvi` (`PK_MaHoiDong`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbldexuat_ibfk_4` FOREIGN KEY (`FK_NguoiTao`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbldexuat_ibfk_5` FOREIGN KEY (`FK_MaDot`) REFERENCES `tbldotthiduakhenthuong` (`PK_MaDot`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldexuat
-- ----------------------------
INSERT INTO `tbldexuat` VALUES (1, 'user5', 'dv_1-2024-2025', 1, 3, '2025-04-23 08:01:32', NULL, '2024-2025');
INSERT INTO `tbldexuat` VALUES (2, 'user7', 'dv_1-2024-2025', 2, 4, '2025-04-23 08:01:32', NULL, '2024-2025');
INSERT INTO `tbldexuat` VALUES (3, 'user8', 'dv_1-2024-2025', 3, 4, '2025-04-23 08:01:32', NULL, '2024-2025');
INSERT INTO `tbldexuat` VALUES (4, 'user2', 'dv_1-2024-2025', 6, 4, '2025-04-23 08:01:32', NULL, '2024-2025');
INSERT INTO `tbldexuat` VALUES (17, 'user5', NULL, 22, NULL, '2025-04-25 23:51:47', 'user2', '2024-2025');
INSERT INTO `tbldexuat` VALUES (18, 'user7', NULL, 22, NULL, '2025-04-25 23:51:47', 'user2', '2024-2025');
INSERT INTO `tbldexuat` VALUES (19, 'user8', NULL, 22, NULL, '2025-04-25 23:51:47', 'user2', '2024-2025');
INSERT INTO `tbldexuat` VALUES (20, 'user2', NULL, 23, NULL, '2025-04-25 23:51:47', 'user2', '2024-2025');

-- ----------------------------
-- Table structure for tbldonvi
-- ----------------------------
DROP TABLE IF EXISTS `tbldonvi`;
CREATE TABLE `tbldonvi`  (
  `PK_MaDonVi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sTenDonVi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaTaiKhoan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaDonVi`) USING BTREE,
  INDEX `FK_MaTaiKhoan`(`FK_MaTaiKhoan` ASC) USING BTREE,
  CONSTRAINT `tbldonvi_ibfk_1` FOREIGN KEY (`FK_MaTaiKhoan`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldonvi
-- ----------------------------
INSERT INTO `tbldonvi` VALUES ('congnghesinhhoc', 'Khoa Công Nghệ Sinh Học', 'dv_congnghesinhhoc');
INSERT INTO `tbldonvi` VALUES ('diendientu', 'Khoa Điện Điện Tử', 'dv_diendientu');
INSERT INTO `tbldonvi` VALUES ('dulich', 'Quản trị du lịch và lữ hành', 'userdv_dulich');
INSERT INTO `tbldonvi` VALUES ('dv_1', 'Công nghệ thông tin', 'user2');
INSERT INTO `tbldonvi` VALUES ('dv_2', 'Tài chính ngân hàng', 'user3');
INSERT INTO `tbldonvi` VALUES ('ketoan', 'Kế toán', 'user6');
INSERT INTO `tbldonvi` VALUES ('luat', 'Khoa Luật', 'dv_luat');
INSERT INTO `tbldonvi` VALUES ('tienganh', 'Khoa Tiếng Anh', 'dv_tienganh');
INSERT INTO `tbldonvi` VALUES ('tiengtrung', 'Khoa Tiếng Trung Quốc', 'dv_tiengtrung');

-- ----------------------------
-- Table structure for tbldotthiduakhenthuong
-- ----------------------------
DROP TABLE IF EXISTS `tbldotthiduakhenthuong`;
CREATE TABLE `tbldotthiduakhenthuong`  (
  `PK_MaDot` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  `bTrangThai` tinyint(1) NULL DEFAULT NULL,
  `iNamBatDau` int NULL DEFAULT NULL,
  `iNamKetThuc` int NULL DEFAULT NULL,
  `dHanBienBanDonVi` date NULL DEFAULT NULL,
  `dHanNopMinhChung` date NULL DEFAULT NULL,
  `dHanBienBanHoiDong` date NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaDot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldotthiduakhenthuong
-- ----------------------------
INSERT INTO `tbldotthiduakhenthuong` VALUES ('1999-2000', '2025-03-26 15:55:43', 0, 1999, 2000, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2000-2001', '2025-04-06 00:48:15', 0, 2000, 2001, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2001-2002', '2025-04-06 01:12:52', 0, 2001, 2002, '2025-04-18', '2025-04-30', '2025-04-13');
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2002-2003', '2025-04-12 00:57:58', 0, 2002, 2003, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2003-2004', '2025-03-26 16:17:01', 0, 2003, 2004, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2007-2008', '2025-03-27 00:37:49', 0, 2007, 2008, '2025-04-24', '2025-04-17', NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2008-2009', '2025-03-27 00:38:17', 0, 2008, 2009, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2010-2011', '2025-03-26 08:52:39', 0, 2010, 2011, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2023-2024', '2025-03-26 04:49:16', 0, 2023, 2024, NULL, NULL, NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2024-2025', '2025-03-26 16:07:49', 0, 2024, 2025, '2025-04-26', '2025-04-16', NULL);
INSERT INTO `tbldotthiduakhenthuong` VALUES ('2025-2026', '2025-05-06 16:11:56', 1, 2025, 2026, '2025-10-28', '2025-10-28', '2025-10-28');

-- ----------------------------
-- Table structure for tblhinhthuc
-- ----------------------------
DROP TABLE IF EXISTS `tblhinhthuc`;
CREATE TABLE `tblhinhthuc`  (
  `PK_MaHinhThuc` int NOT NULL,
  `sTenHinhThuc` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaHinhThuc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhinhthuc
-- ----------------------------
INSERT INTO `tblhinhthuc` VALUES (1, 'Theo đợt');
INSERT INTO `tblhinhthuc` VALUES (2, 'Đột xuất');

-- ----------------------------
-- Table structure for tblhoidongdonvi
-- ----------------------------
DROP TABLE IF EXISTS `tblhoidongdonvi`;
CREATE TABLE `tblhoidongdonvi`  (
  `PK_MaHoiDong` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FK_MaTaiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaDot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  `FK_ChuTri` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_ThuKy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dThoiGianHop` datetime NULL DEFAULT NULL,
  `sDiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iSoNguoiThamDu` int NULL DEFAULT NULL,
  `iSoThanhVien` int NULL DEFAULT NULL,
  `sDuongDanBienBan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sTenBienBan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sSoHD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sGhiChu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaHinhThuc` int NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaHoiDong`) USING BTREE,
  INDEX `FK_ChuTri`(`FK_ChuTri` ASC) USING BTREE,
  INDEX `FK_ThuKy`(`FK_ThuKy` ASC) USING BTREE,
  INDEX `FK_MaDot`(`FK_MaDot` ASC) USING BTREE,
  INDEX `FK_MaTaiKhoan`(`FK_MaTaiKhoan` ASC) USING BTREE,
  INDEX `FK_MaHinhThuc`(`FK_MaHinhThuc` ASC) USING BTREE,
  CONSTRAINT `tblhoidongdonvi_ibfk_1` FOREIGN KEY (`FK_ChuTri`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongdonvi_ibfk_2` FOREIGN KEY (`FK_ThuKy`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongdonvi_ibfk_3` FOREIGN KEY (`FK_MaDot`) REFERENCES `tbldotthiduakhenthuong` (`PK_MaDot`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongdonvi_ibfk_4` FOREIGN KEY (`FK_MaTaiKhoan`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongdonvi_ibfk_5` FOREIGN KEY (`FK_MaHinhThuc`) REFERENCES `tblhinhthuc` (`PK_MaHinhThuc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhoidongdonvi
-- ----------------------------
INSERT INTO `tblhoidongdonvi` VALUES ('dv_1-2024-2025', 'user2', '2024-2025', '2025-04-23 15:13:14', 'user5', 'user8', '2025-04-15 14:56:00', '96 Định công', 4, 4, 'vanBanHoiDong/2024-2025/h7tSbxjzZpn7Zu0gw56uigpGK2DRszXY0b119k75.pdf', '21A100100291_NgoMinhPhuong_BTTH.pdf', '2346', 'ghi chú gì đó', 1);
INSERT INTO `tblhoidongdonvi` VALUES ('dv_1-2025-2026', 'user2', '2025-2026', '2025-05-06 16:12:38', 'user7', 'usercanhan04', '2025-05-15 16:12:00', 'zdfasfsdf', 5, 5, 'vanBanHoiDong/2025-2026/AcXTGGFAdJtPLh9Oz7IGSHzDCptBxal5967Fw8O8.pdf', 'HĐ 05_0002.pdf', 'eeee', 'gdffgdsfg', 1);

-- ----------------------------
-- Table structure for tblhoidongtruong
-- ----------------------------
DROP TABLE IF EXISTS `tblhoidongtruong`;
CREATE TABLE `tblhoidongtruong`  (
  `PK_MaHoiDong` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FK_MaTaiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaDot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  `dThoiGianHop` datetime NULL DEFAULT NULL,
  `sDiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iSoNguoiThamDu` int NULL DEFAULT NULL,
  `sDuongDanBienBan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sTenBienBan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sDuongDanKiemPhieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sTenKiemPhieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sGhiChu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaHinhThuc` int NULL DEFAULT NULL,
  `FK_MaKienToan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sSoHD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaHoiDong`) USING BTREE,
  INDEX `FK_MaDot`(`FK_MaDot` ASC) USING BTREE,
  INDEX `FK_MaTaiKhoan`(`FK_MaTaiKhoan` ASC) USING BTREE,
  INDEX `FK_MaHinhThuc`(`FK_MaHinhThuc` ASC) USING BTREE,
  INDEX `FK_MaKienToan`(`FK_MaKienToan` ASC) USING BTREE,
  CONSTRAINT `tblhoidongtruong_ibfk_1` FOREIGN KEY (`FK_MaDot`) REFERENCES `tbldotthiduakhenthuong` (`PK_MaDot`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongtruong_ibfk_2` FOREIGN KEY (`FK_MaTaiKhoan`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongtruong_ibfk_3` FOREIGN KEY (`FK_MaHinhThuc`) REFERENCES `tblhinhthuc` (`PK_MaHinhThuc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblhoidongtruong_ibfk_4` FOREIGN KEY (`FK_MaKienToan`) REFERENCES `tblkientoan` (`PK_MaKienToan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblhoidongtruong
-- ----------------------------
INSERT INTO `tblhoidongtruong` VALUES ('tdkt-2024-2025', 'user4', '2024-2025', '2025-04-25 01:15:44', '2025-04-23 01:15:00', 'định công', 3, 'vanBanHoiDong//3RNzQEEfsgf6yvAPQzNEAPPz0fha6rbXn9cgprKC.pdf', 'Ngo-Minh-Phuong-CV.pdf', 'vanBanHoiDong//v76hWWiwnKlcinPdqyY9LzL8SVXAOzAWyqJcmc39.pdf', 'Ngo-Minh-Phuong-CV.pdf', 'fsdf', 1, '2345', '2346');
INSERT INTO `tblhoidongtruong` VALUES ('tdkt-2024-2025-2025-05-01T17:18', 'user4', '2024-2025', '2025-04-26 17:18:25', '2025-05-01 17:18:00', 'sdfsdf', 3, 'vanBanHoiDong//ZulZGvt9ZJAvMnuFEypWI6DUJMUKxKmNZsSjCpdb.pdf', 'Ngo-Minh-Phuong-CV.pdf', 'vanBanHoiDong//3NbN2Cvbqn8mX4FhQZSI29AYStt2k4FdVVYtEWac.pdf', 'Ngo-Minh-Phuong-CV.pdf', 'sdf', 2, '2345', 'sdf');

-- ----------------------------
-- Table structure for tblketqua
-- ----------------------------
DROP TABLE IF EXISTS `tblketqua`;
CREATE TABLE `tblketqua`  (
  `PK_MaKetQua` int NOT NULL AUTO_INCREMENT,
  `FK_MaDeXuat` int NULL DEFAULT NULL,
  `FK_MaHoiDong` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iSoNguoiBau` int NULL DEFAULT NULL,
  `bDuyet` tinyint(1) NULL DEFAULT NULL,
  `dNgayDuyet` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaKetQua`) USING BTREE,
  INDEX `FK_MaDeXuat`(`FK_MaDeXuat` ASC) USING BTREE,
  INDEX `FK_MaHoiDong`(`FK_MaHoiDong` ASC) USING BTREE,
  CONSTRAINT `tblketqua_ibfk_1` FOREIGN KEY (`FK_MaDeXuat`) REFERENCES `tbldexuat` (`PK_MaDeXuat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblketqua_ibfk_2` FOREIGN KEY (`FK_MaHoiDong`) REFERENCES `tblhoidongtruong` (`PK_MaHoiDong`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblketqua
-- ----------------------------
INSERT INTO `tblketqua` VALUES (1, 1, 'tdkt-2024-2025', 3, 1, '2025-04-25 01:17:27');
INSERT INTO `tblketqua` VALUES (2, 3, 'tdkt-2024-2025', 3, 1, '2025-04-25 01:17:27');
INSERT INTO `tblketqua` VALUES (3, 2, 'tdkt-2024-2025', 3, 1, '2025-04-25 01:17:27');
INSERT INTO `tblketqua` VALUES (4, 4, 'tdkt-2024-2025', 3, 1, '2025-04-25 01:17:27');
INSERT INTO `tblketqua` VALUES (9, 17, 'tdkt-2024-2025-2025-05-01T17:18', 3, 1, '2025-04-26 17:20:07');
INSERT INTO `tblketqua` VALUES (10, 19, 'tdkt-2024-2025-2025-05-01T17:18', 3, 1, '2025-04-26 17:20:07');
INSERT INTO `tblketqua` VALUES (11, 18, 'tdkt-2024-2025-2025-05-01T17:18', 3, 1, '2025-04-26 17:20:07');
INSERT INTO `tblketqua` VALUES (12, 20, 'tdkt-2024-2025-2025-05-01T17:18', 3, 1, '2025-04-26 17:20:07');

-- ----------------------------
-- Table structure for tblkientoan
-- ----------------------------
DROP TABLE IF EXISTS `tblkientoan`;
CREATE TABLE `tblkientoan`  (
  `PK_MaKienToan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dNgayTao` date NULL DEFAULT NULL,
  `sTenFile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sDuongDan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `bTrangThai` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaKienToan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblkientoan
-- ----------------------------
INSERT INTO `tblkientoan` VALUES ('2345', '2025-04-24', 'Ngo-Minh-Phuong-CV.pdf', 'kientoan//kOIq6uxo3ua7jUHR6mRzhrBWBtu4jLlTNMSrq2jM.pdf', 1);

-- ----------------------------
-- Table structure for tblloaidanhhieu
-- ----------------------------
DROP TABLE IF EXISTS `tblloaidanhhieu`;
CREATE TABLE `tblloaidanhhieu`  (
  `PK_MaLoaiDanhHieu` int NOT NULL,
  `sTenLoaiDanhHieu` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaLoaiDanhHieu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblloaidanhhieu
-- ----------------------------
INSERT INTO `tblloaidanhhieu` VALUES (1, 'Cá nhân');
INSERT INTO `tblloaidanhhieu` VALUES (2, 'Đơn vị');

-- ----------------------------
-- Table structure for tblminhchung
-- ----------------------------
DROP TABLE IF EXISTS `tblminhchung`;
CREATE TABLE `tblminhchung`  (
  `PK_MaMinhChung` int NOT NULL AUTO_INCREMENT,
  `sTenFile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sDuongDan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FK_MaDeXuat` int NULL DEFAULT NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaMinhChung`) USING BTREE,
  INDEX `FK_MaDeXuat`(`FK_MaDeXuat` ASC) USING BTREE,
  CONSTRAINT `tblminhchung_ibfk_1` FOREIGN KEY (`FK_MaDeXuat`) REFERENCES `tbldexuat` (`PK_MaDeXuat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblminhchung
-- ----------------------------
INSERT INTO `tblminhchung` VALUES (3, '21A100100291+Ngô_Minh_Phương.pdf', 'minhchung/2024-2025/canhan01/1/t3VMVGykxampASy5b3YnuAvizHLYGNAuWx3MPP25.pdf', 1, '2025-04-28 21:39:30');
INSERT INTO `tblminhchung` VALUES (4, 'Xây dựng hệ quản lý thi đua khen thưởng tại Trường Đại học Mở Hà Nội - Ngô Minh Phương - Phạm Duy Trường.pdf', 'minhchung/2024-2025/canhan01/1/GpgauiRaGAlw4Ri8mood8o4Oh9dvB7BoH2j4bF8s.pdf', 1, '2025-04-28 21:39:41');

-- ----------------------------
-- Table structure for tblnhiemvuhoidong
-- ----------------------------
DROP TABLE IF EXISTS `tblnhiemvuhoidong`;
CREATE TABLE `tblnhiemvuhoidong`  (
  `PK_MaNhiemVu` int NOT NULL AUTO_INCREMENT,
  `sTenNhiemVu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaNhiemVu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblnhiemvuhoidong
-- ----------------------------
INSERT INTO `tblnhiemvuhoidong` VALUES (1, 'Chủ tịch Hội đồng');
INSERT INTO `tblnhiemvuhoidong` VALUES (2, 'Phó Chủ tịch Thường trực HĐ');
INSERT INTO `tblnhiemvuhoidong` VALUES (3, 'Phó Chủ tịch HĐ');
INSERT INTO `tblnhiemvuhoidong` VALUES (4, 'Ủy viên');
INSERT INTO `tblnhiemvuhoidong` VALUES (5, 'Thư ký');

-- ----------------------------
-- Table structure for tblquyen
-- ----------------------------
DROP TABLE IF EXISTS `tblquyen`;
CREATE TABLE `tblquyen`  (
  `PK_MaQuyen` int NOT NULL,
  `sTenQuyen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaQuyen`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblquyen
-- ----------------------------
INSERT INTO `tblquyen` VALUES (1, 'admin');
INSERT INTO `tblquyen` VALUES (2, 'TCHC');
INSERT INTO `tblquyen` VALUES (3, 'HĐTĐKT');
INSERT INTO `tblquyen` VALUES (4, 'Đơn vị');
INSERT INTO `tblquyen` VALUES (5, 'Cá nhân');

-- ----------------------------
-- Table structure for tbltaikhoan
-- ----------------------------
DROP TABLE IF EXISTS `tbltaikhoan`;
CREATE TABLE `tbltaikhoan`  (
  `PK_MaTaiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sUsername` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaQuyen` int NOT NULL,
  `bTrangThai` tinyint(1) NOT NULL,
  `sEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaTaiKhoan`) USING BTREE,
  UNIQUE INDEX `sUsername`(`sUsername` ASC) USING BTREE,
  UNIQUE INDEX `sEmail`(`sEmail` ASC) USING BTREE,
  INDEX `FK_MaQuyen`(`FK_MaQuyen` ASC) USING BTREE,
  CONSTRAINT `tbltaikhoan_ibfk_1` FOREIGN KEY (`FK_MaQuyen`) REFERENCES `tblquyen` (`PK_MaQuyen`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbltaikhoan
-- ----------------------------
INSERT INTO `tbltaikhoan` VALUES ('cnsh_cn01', 'cnsh_cn01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'cnsh_cn01@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('cnsh_cn02', 'cnsh_cn02', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'cnsh_cn02@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('cnsh_cn03', 'cnsh_cn03', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'cnsh_cn03@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('cnsh_cn04', 'cnsh_cn04', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'cnsh_cn04@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('cnsh_cn05', 'cnsh_cn05', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'cnsh_cn05@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ddt_cn01', 'ddt_cn01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ddt_cn01@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ddt_cn02', 'ddt_cn02', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ddt_cn02@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ddt_cn03', 'ddt_cn03', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ddt_cn03@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ddt_cn04', 'ddt_cn04', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ddt_cn04@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ddt_cn05', 'ddt_cn05', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ddt_cn05@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('dv_congnghesinhhoc', 'dv_congnghesinhhoc', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'congnghesinhhoc@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('dv_diendientu', 'dv_diendientu', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'diendientu@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('dv_luat', 'dv_luat', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'luat@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('dv_tienganh', 'dv_tienganh', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'tienganh@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('dv_tiengtrung', 'dv_tiengtrung', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'tiengtrung@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('luat_cn01', 'luat_cn01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'luat_cn01@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('luat_cn02', 'luat_cn02', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'luat_cn02@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('luat_cn03', 'luat_cn03', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'luat_cn03@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('luat_cn04', 'luat_cn04', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'luat_cn04@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('luat_cn05', 'luat_cn05', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'luat_cn05@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ta_cn01', 'ta_cn01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ta_cn01@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ta_cn02', 'ta_cn02', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ta_cn02@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ta_cn03', 'ta_cn03', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ta_cn03@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ta_cn04', 'ta_cn04', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ta_cn04@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('ta_cn05', 'ta_cn05', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'ta_cn05@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('tq_cn01', 'tq_cn01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'tq_cn01@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('tq_cn02', 'tq_cn02', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'tq_cn02@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('tq_cn03', 'tq_cn03', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'tq_cn03@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('tq_cn04', 'tq_cn04', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'tq_cn04@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('tq_cn05', 'tq_cn05', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'tq_cn05@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user1', 'tchc', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', '4wjhjzn46sGO8rfyrqtrr7QiRL8CcsMveehCeN2tijuv9oj9yGAif21OYpqD', 2, 1, 'tchc@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user2', 'dv_cntt', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'cntt@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user3', 'dv_tcnh', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'tcnh@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user4', 'tdkt', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 3, 1, 'tdkt@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user5', 'canhan01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'canhan01@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user6', 'dv_ketoan', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'ketoan@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('user7', 'canhan02', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'canhan02@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user8', 'canhan03', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'canhan03@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('user9', 'dl_cn01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, NULL);
INSERT INTO `tbltaikhoan` VALUES ('usercanhan04', 'canhan04', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'canhan04@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('usercanhan04r', 'canhan04r', '$2y$12$6ni4TIWAgOSI6632exvr5ua23fwK5y.TLw8CV0old9yzrjbGSZfk.', NULL, 5, 1, 'dulich@hou.edu.vnr');
INSERT INTO `tbltaikhoan` VALUES ('usercanhan05', 'canhan05', '$2y$12$.8nPORrPj8gtz4alCZyGHufiYuOF5SiPKDOPXNevLL3gtQJG1v1cC', NULL, 5, 1, 'ntthuong@gmail.com');
INSERT INTO `tbltaikhoan` VALUES ('userdv_dulich', 'dv_dulich', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 4, 1, 'dulich@hou.edu.vn');
INSERT INTO `tbltaikhoan` VALUES ('usertcnh_nv01', 'tcnh_nv01', '$2y$12$ruSEB4Fzv4teXtujES6Pm.ix.HkPbAr.XdaKNZnmxFdcHHjh6hQD2', NULL, 5, 1, 'tcnh_nv01@gmail.com');

-- ----------------------------
-- Table structure for tblthanhvienhoidong
-- ----------------------------
DROP TABLE IF EXISTS `tblthanhvienhoidong`;
CREATE TABLE `tblthanhvienhoidong`  (
  `PK_MaThanhVienHoiDong` int NOT NULL AUTO_INCREMENT,
  `FK_TaiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaKienToan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FK_MaNhiemVu` int NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaThanhVienHoiDong`) USING BTREE,
  INDEX `FK_MaNhiemVu`(`FK_MaNhiemVu` ASC) USING BTREE,
  INDEX `FK_MaKienToan`(`FK_MaKienToan` ASC) USING BTREE,
  INDEX `FK_TaiKhoan`(`FK_TaiKhoan` ASC) USING BTREE,
  CONSTRAINT `tblthanhvienhoidong_ibfk_1` FOREIGN KEY (`FK_MaNhiemVu`) REFERENCES `tblnhiemvuhoidong` (`PK_MaNhiemVu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblthanhvienhoidong_ibfk_2` FOREIGN KEY (`FK_MaKienToan`) REFERENCES `tblkientoan` (`PK_MaKienToan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblthanhvienhoidong_ibfk_3` FOREIGN KEY (`FK_TaiKhoan`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthanhvienhoidong
-- ----------------------------
INSERT INTO `tblthanhvienhoidong` VALUES (37, 'cnsh_cn02', '2345', 1);
INSERT INTO `tblthanhvienhoidong` VALUES (38, 'cnsh_cn03', '2345', 2);
INSERT INTO `tblthanhvienhoidong` VALUES (39, 'ddt_cn01', '2345', 3);

-- ----------------------------
-- Table structure for tblthongbao
-- ----------------------------
DROP TABLE IF EXISTS `tblthongbao`;
CREATE TABLE `tblthongbao`  (
  `PK_MaThongBao` int NOT NULL AUTO_INCREMENT,
  `sTieuDe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sNoiDung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  `FK_NguoiTao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PK_MaThongBao`) USING BTREE,
  INDEX `FK_NguoiTao`(`FK_NguoiTao` ASC) USING BTREE,
  CONSTRAINT `tblthongbao_ibfk_1` FOREIGN KEY (`FK_NguoiTao`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthongbao
-- ----------------------------
INSERT INTO `tblthongbao` VALUES (12, 'sdf', 'sdf', '2025-05-02 10:04:23', NULL);

-- ----------------------------
-- Table structure for tblthongbao_quyen
-- ----------------------------
DROP TABLE IF EXISTS `tblthongbao_quyen`;
CREATE TABLE `tblthongbao_quyen`  (
  `FK_MaQuyen` int NOT NULL,
  `FK_MaThongBao` int NOT NULL,
  PRIMARY KEY (`FK_MaQuyen`, `FK_MaThongBao`) USING BTREE,
  INDEX `FK_MaThongBao`(`FK_MaThongBao` ASC) USING BTREE,
  CONSTRAINT `tblthongbao_quyen_ibfk_1` FOREIGN KEY (`FK_MaThongBao`) REFERENCES `tblthongbao` (`PK_MaThongBao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblthongbao_quyen_ibfk_2` FOREIGN KEY (`FK_MaQuyen`) REFERENCES `tblquyen` (`PK_MaQuyen`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthongbao_quyen
-- ----------------------------
INSERT INTO `tblthongbao_quyen` VALUES (4, 12);

-- ----------------------------
-- Table structure for tblthongbao_taikhoan
-- ----------------------------
DROP TABLE IF EXISTS `tblthongbao_taikhoan`;
CREATE TABLE `tblthongbao_taikhoan`  (
  `FK_MaThongBao` int NOT NULL,
  `FK_MaTaiKhoan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bTrangThai` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`FK_MaTaiKhoan`, `FK_MaThongBao`) USING BTREE,
  INDEX `FK_MaThongBao`(`FK_MaThongBao` ASC) USING BTREE,
  CONSTRAINT `tblthongbao_taikhoan_ibfk_1` FOREIGN KEY (`FK_MaTaiKhoan`) REFERENCES `tbltaikhoan` (`PK_MaTaiKhoan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tblthongbao_taikhoan_ibfk_2` FOREIGN KEY (`FK_MaThongBao`) REFERENCES `tblthongbao` (`PK_MaThongBao`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthongbao_taikhoan
-- ----------------------------
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'dv_congnghesinhhoc', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'dv_diendientu', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'dv_luat', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'dv_tienganh', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'dv_tiengtrung', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'user2', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'user3', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'user6', 0);
INSERT INTO `tblthongbao_taikhoan` VALUES (12, 'userdv_dulich', 0);

-- ----------------------------
-- Table structure for tblvanbandinhkem
-- ----------------------------
DROP TABLE IF EXISTS `tblvanbandinhkem`;
CREATE TABLE `tblvanbandinhkem`  (
  `PK_MaVanBan` int NOT NULL AUTO_INCREMENT,
  `sTenVanBan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FK_MaDot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sTenFile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dNgayTao` datetime NULL DEFAULT NULL,
  `sDuongDan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`PK_MaVanBan`) USING BTREE,
  INDEX `FK_MaDot`(`FK_MaDot` ASC) USING BTREE,
  CONSTRAINT `tblvanbandinhkem_ibfk_1` FOREIGN KEY (`FK_MaDot`) REFERENCES `tbldotthiduakhenthuong` (`PK_MaDot`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblvanbandinhkem
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
