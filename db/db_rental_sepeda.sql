/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : db_rental_sepeda

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 07/07/2023 07:32:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2023_05_09_013019_create_permission_tables', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 3);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 4);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 7);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'role-list', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (2, 'role-create', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (3, 'role-edit', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (4, 'role-delete', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (5, 'product-list', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (6, 'product-create', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (7, 'product-edit', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');
INSERT INTO `permissions` VALUES (8, 'product-delete', 'web', '2023-05-09 03:03:35', '2023-05-09 03:03:35');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (2, 2);
INSERT INTO `role_has_permissions` VALUES (3, 2);
INSERT INTO `role_has_permissions` VALUES (4, 2);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (1, 3);
INSERT INTO `role_has_permissions` VALUES (2, 3);
INSERT INTO `role_has_permissions` VALUES (3, 3);
INSERT INTO `role_has_permissions` VALUES (4, 3);
INSERT INTO `role_has_permissions` VALUES (5, 3);
INSERT INTO `role_has_permissions` VALUES (6, 3);
INSERT INTO `role_has_permissions` VALUES (7, 3);
INSERT INTO `role_has_permissions` VALUES (8, 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', 'web', '2023-05-09 03:05:47', '2023-05-09 03:05:47');
INSERT INTO `roles` VALUES (2, 'Staff', 'web', '2023-05-11 08:48:14', '2023-05-11 08:48:14');
INSERT INTO `roles` VALUES (3, 'Member', 'web', '2023-05-11 08:48:48', '2023-05-11 08:48:48');

-- ----------------------------
-- Table structure for setting_menu
-- ----------------------------
DROP TABLE IF EXISTS `setting_menu`;
CREATE TABLE `setting_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `menu_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_parent` int NULL DEFAULT NULL,
  `menu_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` enum('label','menu','submenu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'label',
  `ord` int NULL DEFAULT NULL,
  `extensiontarget` int NULL DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting_menu
-- ----------------------------
INSERT INTO `setting_menu` VALUES (1, 'MASTER', NULL, '#', NULL, 0, NULL, 'label', 1, NULL, NULL, NULL, NULL, '2023-05-23 02:26:29');
INSERT INTO `setting_menu` VALUES (2, 'Auth', NULL, '#', NULL, 1, 'ki-address-book', 'menu', 1, NULL, NULL, NULL, NULL, '2023-05-23 01:39:56');
INSERT INTO `setting_menu` VALUES (3, 'Users', NULL, 'users', NULL, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-05-22 09:56:14');
INSERT INTO `setting_menu` VALUES (4, 'Roles', NULL, 'roles', NULL, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-05-23 03:37:13');
INSERT INTO `setting_menu` VALUES (5, 'Product', NULL, '#', NULL, 1, 'ki-element-7', 'menu', 2, NULL, NULL, NULL, NULL, '2023-05-23 01:39:56');
INSERT INTO `setting_menu` VALUES (6, 'Category Product', NULL, '#', NULL, 5, NULL, 'menu', 1, NULL, NULL, NULL, NULL, '2023-05-23 03:37:13');
INSERT INTO `setting_menu` VALUES (7, 'Product', NULL, '#', NULL, 5, NULL, 'menu', 2, NULL, NULL, NULL, NULL, '2023-05-23 03:37:13');
INSERT INTO `setting_menu` VALUES (8, 'APPS', NULL, '#', NULL, 0, NULL, 'label', 2, NULL, NULL, NULL, NULL, '2023-05-23 02:26:30');
INSERT INTO `setting_menu` VALUES (9, 'News', NULL, '#', NULL, 8, 'ki-book', 'menu', 1, NULL, NULL, NULL, NULL, '2023-05-23 03:23:28');
INSERT INTO `setting_menu` VALUES (10, 'News Category', NULL, 'news_category', NULL, 8, 'ki-abstract-26', 'menu', 2, NULL, NULL, NULL, NULL, '2023-05-23 03:23:28');
INSERT INTO `setting_menu` VALUES (11, 'Store', NULL, NULL, NULL, 8, 'ki-html', 'menu', 3, NULL, NULL, NULL, NULL, '2023-05-23 03:23:28');
INSERT INTO `setting_menu` VALUES (12, 'Edit Stock', NULL, NULL, NULL, 12, NULL, 'menu', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `setting_menu` VALUES (13, 'Order History', NULL, NULL, NULL, 12, NULL, 'menu', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `setting_menu` VALUES (14, 'Discount Product', NULL, NULL, NULL, 12, NULL, 'menu', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for setting_route
-- ----------------------------
DROP TABLE IF EXISTS `setting_route`;
CREATE TABLE `setting_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grp` enum('web','api') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'web',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `controller_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stats` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'false',
  `deleted` enum('false','true') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'false',
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting_route
-- ----------------------------
INSERT INTO `setting_route` VALUES (1, 'setting_web', 'web', 'resources', 'App\\Http\\Controllers\\Back\\Setting_web\\Setting_webController', NULL, NULL, 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (2, 'setting_web', 'web', 'resources', 'AppHttpControllersBackSetting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (3, 'setting_web', 'web', 'resources', 'AppHttpControllersBackSetting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (4, 'setting_web', 'web', 'resources', 'AppHttpControllersBackSetting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (5, 'setting_web', 'web', 'resources', 'AppHttpControllersBackSetting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (6, 'setting_web', 'web', 'resources', 'App\\Http\\Controllers\\BackSetting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (7, 'setting_web', 'web', 'resources', 'App\\Http\\Controllers\\Back\\Setting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (8, 'setting_web', 'web', 'resources', 'App\\Http\\Controllers\\Back\\Setting_webSetting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (9, 'setting_web', 'web', 'resources', 'App\\Http\\Controllers\\Back\\Setting_web\\Setting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (10, 'setting_web', 'web', 'resources', 'App\\Http\\Controllers\\Back\\Setting_web\\Setting_webController', '', '', 'true', NULL, NULL);
INSERT INTO `setting_route` VALUES (11, 'setting_menu', 'web', 'resources', 'App\\Http\\Controllers\\Back\\Setting_menu\\Setting_menuController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (12, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (13, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (14, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (15, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (16, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (17, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (18, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (19, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (20, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (21, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (22, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (23, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (24, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (25, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (26, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (27, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (28, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (29, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (30, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (31, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (32, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (33, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (34, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (35, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (36, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (37, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (38, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (39, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (40, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (41, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (42, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (43, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (44, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (45, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (46, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (47, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (48, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (49, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (50, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (51, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (52, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (53, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (54, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (55, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (56, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (57, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (58, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (59, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (60, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (61, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (62, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (63, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (64, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (65, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (66, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (67, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (68, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (69, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (70, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (71, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (72, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (73, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (74, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (75, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (76, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (77, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (78, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);
INSERT INTO `setting_route` VALUES (79, 'news', 'web', 'resources', 'App\\Http\\Controllers\\Back\\News\\NewsController', '', '', 'false', NULL, NULL);

-- ----------------------------
-- Table structure for setting_web
-- ----------------------------
DROP TABLE IF EXISTS `setting_web`;
CREATE TABLE `setting_web`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `site_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_logo_front` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_logo_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stripe_screet_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stripe_publishable_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stripe_webhook_screet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gst` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting_web
-- ----------------------------
INSERT INTO `setting_web` VALUES (4, 'Supresso', 'supresso branch singapore', '1', '2', '', '', 'qwerty', 'asdfg', 'zxcvb', 'poiuyt', 'lkjhgf', 8, NULL, NULL);
INSERT INTO `setting_web` VALUES (5, 'qwerty gaes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 07:13:34', '2023-05-16 07:14:20');

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telepon` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `codename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES (1, 'son goku', 'jalan darmabahasa nomer 10, suryakarta', '6285334876123', 'sg01', 'sgadmin@gmail.com', 'sgrs1234');
INSERT INTO `tbl_admin` VALUES (2, 'vegetta', 'jalan kubeli dengan uang sendiri nomer 19, suryakarta', '6281456987453', 'vg01', 'vgadmin@gmail.com', 'vgrs1234');

-- ----------------------------
-- Table structure for tbl_category_sepeda
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category_sepeda`;
CREATE TABLE `tbl_category_sepeda`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_category_sepeda
-- ----------------------------
INSERT INTO `tbl_category_sepeda` VALUES (1, 'bmx');
INSERT INTO `tbl_category_sepeda` VALUES (2, 'sepeda gunung');
INSERT INTO `tbl_category_sepeda` VALUES (3, 'sepeda lipat');
INSERT INTO `tbl_category_sepeda` VALUES (4, 'fixie');
INSERT INTO `tbl_category_sepeda` VALUES (5, 'motor');
INSERT INTO `tbl_category_sepeda` VALUES (6, 'muluk');

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tanggal lahir` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_member
-- ----------------------------
INSERT INTO `tbl_member` VALUES (1, 'joko', 'jalan kok sama mantan nomer 10 blok g, suryakarta', '1993-05-10');
INSERT INTO `tbl_member` VALUES (2, 'uciha dash', 'jalan in aja dulu nomer 98 blok z, suryakarta', '2003-01-31');
INSERT INTO `tbl_member` VALUES (3, 'uzumaki jokowi', 'jalan kok sendirian aja nomer 145 blok m, suryakarta', '1975-07-24');
INSERT INTO `tbl_member` VALUES (4, 'cristiano maradono', 'jalan anmalam no 10, tokekdadi', '1988-07-20');

-- ----------------------------
-- Table structure for tbl_pengembalian
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pengembalian`;
CREATE TABLE `tbl_pengembalian`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sewa_sepeda` int NULL DEFAULT NULL,
  `id_sewa` int NULL DEFAULT NULL,
  `id_member` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_pengembalian
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sepeda
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sepeda`;
CREATE TABLE `tbl_sepeda`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `nama_sepeda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sepeda
-- ----------------------------
INSERT INTO `tbl_sepeda` VALUES (1, 1, 'Be Em Ex');
INSERT INTO `tbl_sepeda` VALUES (2, 1, 'TDR 3000');
INSERT INTO `tbl_sepeda` VALUES (3, 2, 'Wimcycle 500 CC');
INSERT INTO `tbl_sepeda` VALUES (4, 2, 'Polygon Mount 123');
INSERT INTO `tbl_sepeda` VALUES (5, 3, 'Trondol 1998');
INSERT INTO `tbl_sepeda` VALUES (6, 4, 'Wimcycle FX 87');
INSERT INTO `tbl_sepeda` VALUES (7, 5, 'Astrea Legenda');
INSERT INTO `tbl_sepeda` VALUES (8, 6, 'Sukhoi Superjet');

-- ----------------------------
-- Table structure for tbl_sewa
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sewa`;
CREATE TABLE `tbl_sewa`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_member` int NULL DEFAULT NULL,
  `tanggal_sewa` date NULL DEFAULT NULL,
  `tanggal_pengembalian` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sewa
-- ----------------------------
INSERT INTO `tbl_sewa` VALUES (1, 1, '2023-06-20', '2023-06-27');
INSERT INTO `tbl_sewa` VALUES (2, 2, '2023-06-17', '2023-06-24');
INSERT INTO `tbl_sewa` VALUES (3, 3, '2023-06-20', '2023-06-27');

-- ----------------------------
-- Table structure for tbl_sewa_sepeda
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sewa_sepeda`;
CREATE TABLE `tbl_sewa_sepeda`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sewa` int NULL DEFAULT NULL,
  `id_sepeda` int NULL DEFAULT NULL,
  `qty_sewa` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sewa_sepeda
-- ----------------------------
INSERT INTO `tbl_sewa_sepeda` VALUES (1, 1, 1, 1);
INSERT INTO `tbl_sewa_sepeda` VALUES (2, 2, 2, 1);
INSERT INTO `tbl_sewa_sepeda` VALUES (3, 3, 3, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@gmail.com', NULL, NULL, '081217173406', '$2y$10$d5/YyDOALW5i/9CxEsbdsOaYrmMa6VrYY5MttBTlCFxfSeAKut3kW', 'superwpdev.png', NULL, '2023-05-09 02:43:39', '2023-05-09 02:43:39');
INSERT INTO `users` VALUES (2, 'Suryo Atmojo', 'suryoatm@gmail.com', NULL, NULL, '085649224822', '$2y$10$NQfNc3uN3U3t5IzfPiN2ZuGkikVH2uzq2Y3oTx84lXF3.h6dB2P9S', 'superwpdev.png', NULL, '2023-05-09 03:05:47', '2023-05-09 03:05:47');
INSERT INTO `users` VALUES (3, 'atmojo', 'suryoatmojo@uwp.ac.id', NULL, NULL, NULL, '$2y$10$z/jeK7/cfQ.eGQuAP74wDOr53nmui.OiR9JYlQ6lMDaP85F.tAuey', NULL, NULL, '2023-05-11 08:37:39', '2023-05-12 02:44:03');
INSERT INTO `users` VALUES (4, 'sigit', 'sigitwahyu05@gmail.com', NULL, NULL, NULL, '$2y$10$//L19Sf8c7gpp6RMstpgkulVv89vs96NZI19K2rPq.P.Q4qgwy08a', '', NULL, '2023-05-11 09:09:28', '2023-05-12 06:03:18');

SET FOREIGN_KEY_CHECKS = 1;
