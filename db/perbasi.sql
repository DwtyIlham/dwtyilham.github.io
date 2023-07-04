/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : perbasi

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 18/06/2023 13:36:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_activation_attempts
-- ----------------------------
DROP TABLE IF EXISTS `auth_activation_attempts`;
CREATE TABLE `auth_activation_attempts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_activation_attempts
-- ----------------------------

-- ----------------------------
-- Table structure for auth_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups`;
CREATE TABLE `auth_groups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_groups_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_permissions`;
CREATE TABLE `auth_groups_permissions`  (
  `group_id` int UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int UNSIGNED NOT NULL DEFAULT 0,
  INDEX `auth_groups_permissions_permission_id_foreign`(`permission_id` ASC) USING BTREE,
  INDEX `group_id_permission_id`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_groups_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE `auth_groups_users`  (
  `group_id` int UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  INDEX `auth_groups_users_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `group_id_user_id`(`group_id` ASC, `user_id` ASC) USING BTREE,
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups_users
-- ----------------------------

-- ----------------------------
-- Table structure for auth_logins
-- ----------------------------
DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE `auth_logins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `email`(`email` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_logins
-- ----------------------------
INSERT INTO `auth_logins` VALUES (1, '::1', 'skada', NULL, '2023-06-14 15:06:02', 0);
INSERT INTO `auth_logins` VALUES (2, '::1', 'skada', NULL, '2023-06-14 15:46:49', 0);
INSERT INTO `auth_logins` VALUES (3, '::1', 'skada@gmail.com', 1, '2023-06-14 15:48:09', 1);
INSERT INTO `auth_logins` VALUES (4, '::1', 'ext@gmail.com', 5, '2023-06-14 15:56:59', 1);
INSERT INTO `auth_logins` VALUES (5, '::1', 'skada@gmail.com', 4, '2023-06-14 15:59:13', 1);
INSERT INTO `auth_logins` VALUES (6, '::1', 'skada@gmail.com', 4, '2023-06-14 15:59:38', 1);
INSERT INTO `auth_logins` VALUES (7, '::1', 'skada@gmail.com', 4, '2023-06-14 16:02:04', 1);
INSERT INTO `auth_logins` VALUES (8, '::1', 'skada@gmail.com', 4, '2023-06-14 16:05:42', 1);
INSERT INTO `auth_logins` VALUES (9, '::1', 'skada@gmail.com', 4, '2023-06-14 16:07:01', 1);
INSERT INTO `auth_logins` VALUES (10, '::1', 'skada@gmail.com', 4, '2023-06-14 16:07:47', 1);
INSERT INTO `auth_logins` VALUES (11, '::1', 'skada@gmail.com', 4, '2023-06-14 16:08:12', 1);
INSERT INTO `auth_logins` VALUES (12, '::1', 'skada@gmail.com', 4, '2023-06-14 16:09:33', 1);
INSERT INTO `auth_logins` VALUES (13, '::1', 'skada@gmail.com', 4, '2023-06-14 16:09:52', 1);
INSERT INTO `auth_logins` VALUES (14, '::1', 'skada@gmail.com', 4, '2023-06-14 16:10:25', 1);
INSERT INTO `auth_logins` VALUES (15, '::1', 'skada@gmail.com', 4, '2023-06-14 16:10:42', 1);
INSERT INTO `auth_logins` VALUES (16, '::1', 'skada@gmail.com', 4, '2023-06-14 16:11:03', 1);
INSERT INTO `auth_logins` VALUES (17, '::1', 'skada@gmail.com', 4, '2023-06-14 16:11:28', 1);
INSERT INTO `auth_logins` VALUES (18, '::1', 'skada@gmail.com', 4, '2023-06-14 16:11:50', 1);
INSERT INTO `auth_logins` VALUES (19, '::1', 'skada@gmail.com', 4, '2023-06-14 16:12:07', 1);
INSERT INTO `auth_logins` VALUES (20, '::1', 'skada@gmail.com', 4, '2023-06-14 16:12:21', 1);
INSERT INTO `auth_logins` VALUES (21, '::1', 'skada@gmail.com', 4, '2023-06-14 16:36:00', 1);
INSERT INTO `auth_logins` VALUES (22, '::1', 'skada@gmail.com', 4, '2023-06-14 16:43:20', 1);
INSERT INTO `auth_logins` VALUES (23, '::1', 'skada@gmail.com', 4, '2023-06-14 22:44:34', 1);
INSERT INTO `auth_logins` VALUES (24, '::1', 'skada@gmail.com', 4, '2023-06-15 16:11:48', 1);
INSERT INTO `auth_logins` VALUES (25, '::1', 'cbr', NULL, '2023-06-15 18:30:17', 0);
INSERT INTO `auth_logins` VALUES (26, '::1', 'canbara', NULL, '2023-06-15 18:30:24', 0);
INSERT INTO `auth_logins` VALUES (27, '::1', 'ext@gmail.com', 5, '2023-06-15 18:30:37', 1);
INSERT INTO `auth_logins` VALUES (28, '::1', 'ext@gmail.com', 5, '2023-06-15 18:54:52', 1);
INSERT INTO `auth_logins` VALUES (29, '::1', 'skada@gmail.com', 4, '2023-06-15 19:06:35', 1);
INSERT INTO `auth_logins` VALUES (30, '::1', 'test@mail.com', 6, '2023-06-15 19:21:04', 1);
INSERT INTO `auth_logins` VALUES (31, '::1', 'test@mail.com', 6, '2023-06-15 19:21:19', 1);
INSERT INTO `auth_logins` VALUES (32, '::1', 'skada@gmail.com', 4, '2023-06-15 19:22:27', 1);
INSERT INTO `auth_logins` VALUES (33, '127.0.0.1', 'skada@gmail.com', 4, '2023-06-16 01:27:14', 1);
INSERT INTO `auth_logins` VALUES (34, '::1', 'skada@gmail.com', 4, '2023-06-16 01:58:33', 1);
INSERT INTO `auth_logins` VALUES (35, '::1', 'skada@gmail.com', 4, '2023-06-16 07:46:00', 1);
INSERT INTO `auth_logins` VALUES (36, '::1', 'skada@gmail.com', 4, '2023-06-16 07:47:10', 1);
INSERT INTO `auth_logins` VALUES (37, '::1', 'skada', NULL, '2023-06-18 03:25:34', 0);
INSERT INTO `auth_logins` VALUES (38, '::1', 'skada@gmail.com', 4, '2023-06-18 03:25:39', 1);
INSERT INTO `auth_logins` VALUES (39, '::1', 'skada', NULL, '2023-06-18 03:28:56', 0);
INSERT INTO `auth_logins` VALUES (40, '::1', '123', NULL, '2023-06-18 03:29:31', 0);
INSERT INTO `auth_logins` VALUES (41, '::1', 'skada@gmail.com', 4, '2023-06-18 03:29:37', 1);
INSERT INTO `auth_logins` VALUES (42, '::1', 'skada', NULL, '2023-06-18 03:29:45', 0);

-- ----------------------------
-- Table structure for auth_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_permissions`;
CREATE TABLE `auth_permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_reset_attempts
-- ----------------------------
DROP TABLE IF EXISTS `auth_reset_attempts`;
CREATE TABLE `auth_reset_attempts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_reset_attempts
-- ----------------------------

-- ----------------------------
-- Table structure for auth_tokens
-- ----------------------------
DROP TABLE IF EXISTS `auth_tokens`;
CREATE TABLE `auth_tokens`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashedValidator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_tokens_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `selector`(`selector` ASC) USING BTREE,
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for auth_users_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_users_permissions`;
CREATE TABLE `auth_users_permissions`  (
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int UNSIGNED NOT NULL DEFAULT 0,
  INDEX `auth_users_permissions_permission_id_foreign`(`permission_id` ASC) USING BTREE,
  INDEX `user_id_permission_id`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_users_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1686491076, 1);

-- ----------------------------
-- Table structure for pendataan_atlet
-- ----------------------------
DROP TABLE IF EXISTS `pendataan_atlet`;
CREATE TABLE `pendataan_atlet`  (
  `id_pendaftaran_atlet` int NOT NULL AUTO_INCREMENT,
  `nik` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `asal_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tingkat` int NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `akun_ig` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_time` datetime NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `id_club` int NOT NULL,
  PRIMARY KEY (`id_pendaftaran_atlet`) USING BTREE,
  UNIQUE INDEX `nik`(`nik` ASC) USING BTREE,
  UNIQUE INDEX `file_foto`(`file_foto` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pendataan_atlet
-- ----------------------------
INSERT INTO `pendataan_atlet` VALUES (1, '9830948234098109', 'Fulanah', 'P', 'Banjarnegara', '2022-04-15', 'SMPN 1 BANJARNEGARA', 9, '081203810239', 'anone', '9830948234098109_04-27-30.jpeg', '2023-06-16 14:42:32', 4);
INSERT INTO `pendataan_atlet` VALUES (2, '5262262455245352', 'Anoo', 'L', 'Banjarnegara', '2021-04-15', 'SMPN 1 BANJARNEGARA', 8, '0810810810810', 'anoo', '5262262455245352_04-28-13.jpeg', '2023-06-16 14:42:34', 4);
INSERT INTO `pendataan_atlet` VALUES (3, '7909810274912374', 'Anoo', 'L', 'Banjarnegara', '2023-06-15', 'SMP DI BANJAR', 7, '0812378973192', 'anoo', '7909810274912374_05-49-34.jpeg', '2023-06-16 14:42:36', 4);
INSERT INTO `pendataan_atlet` VALUES (4, '8907913847137409', 'Fulan', 'L', 'Banjarnegara', '2022-02-15', 'SMP DI BANJAR', 7, '0810810810810', 'fulan', '8907913847137409_05-58-58.jpeg', '2023-06-16 14:42:37', 4);
INSERT INTO `pendataan_atlet` VALUES (5, '0985089704218317', 'Fulanah', 'P', 'Banjarnegara', '2018-03-14', 'SMP DI BANJAR', 7, '0808082018182', 'ikr', '0985089704218317_06-01-50.jpeg', '2023-06-16 14:42:38', 4);
INSERT INTO `pendataan_atlet` VALUES (6, '9024892315097579', 'Testing Nama', 'L', 'Banjarnegara', '2023-06-06', 'SD DI BANJAR', 3, '0981239273921', '23IG', '9024892315097579_06-20-26.jpeg', '2023-06-16 14:42:40', 4);

-- ----------------------------
-- Table structure for pendataan_official
-- ----------------------------
DROP TABLE IF EXISTS `pendataan_official`;
CREATE TABLE `pendataan_official`  (
  `id_pendataan_official` int NOT NULL AUTO_INCREMENT,
  `id_club` int NOT NULL,
  `nik` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jk` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `akun_ig` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pendataan_official`) USING BTREE,
  UNIQUE INDEX `nik`(`nik` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pendataan_official
-- ----------------------------
INSERT INTO `pendataan_official` VALUES (1, 4, '1231231231231232', 'Fulanah', 'Sekretaris', 'P', 'Banjarnegara', '2022-05-15', '0810810810811', 'ikr', NULL, '2023-06-16 01:33:31');
INSERT INTO `pendataan_official` VALUES (6, 4, '1231231231232312', 'Fulan', 'Ketua', 'L', 'Banjarnegara', '2021-05-14', '0810810810810', 'ikl', NULL, '2023-06-16 01:33:35');
INSERT INTO `pendataan_official` VALUES (7, 4, '9999999999999999', 'Erwin', 'Bendahara', 'L', 'Banjarnegara', '2009-03-07', '0808082018182', 'erwin', '9999999999999999_17-29-22.jpeg', '2023-06-16 01:33:37');
INSERT INTO `pendataan_official` VALUES (8, 4, '1238192380213870', 'Erwin Lagi', 'Sekretaris', 'L', 'Banjarnegara', '2022-05-15', '0808082018182', 'erwin', '1238192380213870_17-37-21.jpeg', '2023-06-16 01:33:41');
INSERT INTO `pendataan_official` VALUES (10, 4, '3300341092387498', 'ilham', 'Ketua', 'L', 'Banjarnegara', '2022-05-15', '0808082018182', 'ilham', '3300341092387498_07-57-34.jpeg', '2023-06-16 14:57:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama_club` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reset_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_at` datetime NULL DEFAULT NULL,
  `reset_expires` datetime NULL DEFAULT NULL,
  `activate_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `nama_club`(`nama_club` ASC) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (4, 'skada@gmail.com', 'skada', '$2y$10$4QazJ4tksfHCuunMCHZtcu6BmlqPAVWHLeqSgS/ngscxwqCLplzP2', 'skada', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-14 15:55:42', '2023-06-14 15:55:42', NULL);
INSERT INTO `users` VALUES (5, 'ext@gmail.com', 'exiton', '$2y$10$vXx0tzFrtRqOOZMRWtX1x.Q0FKAiU1BDZCP1FF8okbX2TDhWHOWSi', 'exiton', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-14 15:56:51', '2023-06-14 15:56:51', NULL);
INSERT INTO `users` VALUES (6, 'test@mail.com', 'test', '$2y$10$QM7tUoKrFDUPBkimqzbHFe575BpTkAEUJ5iamhNSvLiI1a9nVwCue', 'test', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-15 19:20:57', '2023-06-15 19:20:57', NULL);

SET FOREIGN_KEY_CHECKS = 1;
