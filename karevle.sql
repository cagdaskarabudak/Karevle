/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : karevle

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 05/10/2024 12:05:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cargos
-- ----------------------------
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cargos
-- ----------------------------
BEGIN;
INSERT INTO `cargos` (`id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES (1, 'Kargo', 35.00, 'active', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_category_id` bigint unsigned DEFAULT NULL,
  `sort` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_uniqu` (`slug`) USING BTREE,
  KEY `categories_parent_category_id_foreign` (`parent_category_id`),
  CONSTRAINT `categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (1, 'Erkek', 'erkek', NULL, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (2, 'Kadın', 'kadin', NULL, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (3, 'Gömlek', 'erkek-gomlek', 20, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (4, 'Pantolon', 'kadin-pantolon', 21, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (6, 'Pantolon', 'erkek-pantolon', 20, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (9, 'Ayakkabı', 'kadin-ayakkabi', 2, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (10, 'Topuklu Ayakkabı', 'kadin-topuklu-ayakkabi', 9, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (11, 'Erkek Çocuk', 'erkek-cocuk', 16, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (12, 'Kız Çocuk', 'kiz-cocuk', 16, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (14, 'Eşofman Takımı', 'erkek-cocuk-esofman-takimi', 11, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (15, 'Elbise', 'kadin-elbise', 21, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (16, 'Anne & Çocuk', 'anne-cocuk', NULL, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (17, 'Bebek', 'bebek', 16, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (18, 'Tulum', 'bebek-tulum', 17, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (19, 'Takım Elbise', 'erkek-takim-elbise', 20, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (20, 'Giyim', 'erkek-giyim', 1, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (21, 'Giyim', 'kadin-giyim', 2, 1, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `slug`, `parent_category_id`, `sort`, `created_at`, `updated_at`) VALUES (23, 'Takım', 'kadin-takim', 21, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for comment_medias
-- ----------------------------
DROP TABLE IF EXISTS `comment_medias`;
CREATE TABLE `comment_medias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_images_comment_id_foreign` (`comment_id`),
  CONSTRAINT `comment_images_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `product_comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comment_medias
-- ----------------------------
BEGIN;
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (1, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (2, 6, 'comimage1.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (7, 7, 'comimage4.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (8, 8, 'comimage3.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (9, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (10, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (11, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (12, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (13, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (14, 1, 'comimage2.webp', 'image', NULL, NULL);
INSERT INTO `comment_medias` (`id`, `comment_id`, `name`, `type`, `created_at`, `updated_at`) VALUES (15, 1, 'comvideo_1.mp4', 'video', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for coupon_users
-- ----------------------------
DROP TABLE IF EXISTS `coupon_users`;
CREATE TABLE `coupon_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `coupon_id` bigint unsigned NOT NULL,
  `is_used` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_users_user_id_foreign` (`user_id`),
  KEY `coupon_users_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `coupon_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_users
-- ----------------------------
BEGIN;
INSERT INTO `coupon_users` (`id`, `user_id`, `coupon_id`, `is_used`, `created_at`, `updated_at`) VALUES (2, 1, 2, 1, NULL, NULL);
INSERT INTO `coupon_users` (`id`, `user_id`, `coupon_id`, `is_used`, `created_at`, `updated_at`) VALUES (4, 1, 3, 0, NULL, NULL);
INSERT INTO `coupon_users` (`id`, `user_id`, `coupon_id`, `is_used`, `created_at`, `updated_at`) VALUES (6, 1, 6, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` decimal(11,2) NOT NULL,
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'currency',
  `user_use_limit` int NOT NULL DEFAULT '1',
  `expiration_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupons
-- ----------------------------
BEGIN;
INSERT INTO `coupons` (`id`, `name`, `content`, `code`, `coupon_amount`, `coupon_type`, `user_use_limit`, `expiration_time`, `created_at`, `updated_at`) VALUES (2, 'Deneme İndirim 1000', '1000 TL değerinde deneme indirim', 'DENEME1000', 1000.00, 'currency', 1, '2024-09-30 01:01:19', NULL, NULL);
INSERT INTO `coupons` (`id`, `name`, `content`, `code`, `coupon_amount`, `coupon_type`, `user_use_limit`, `expiration_time`, `created_at`, `updated_at`) VALUES (3, 'Deneme İndirim 20%', '20% değerinde deneme indirim', 'DENEME20', 20.00, 'percentage', 1, '2024-09-30 01:57:32', NULL, NULL);
INSERT INTO `coupons` (`id`, `name`, `content`, `code`, `coupon_amount`, `coupon_type`, `user_use_limit`, `expiration_time`, `created_at`, `updated_at`) VALUES (4, 'Deneme İndirim 500', '500 TL değerinde deneme indirim', 'DENEME500', 500.00, 'currency', 1, '2024-09-30 01:57:36', NULL, NULL);
INSERT INTO `coupons` (`id`, `name`, `content`, `code`, `coupon_amount`, `coupon_type`, `user_use_limit`, `expiration_time`, `created_at`, `updated_at`) VALUES (6, 'Deneme İndirim 200', '200 TL değerinde deneme indirim', 'DENEME200', 200.00, 'currency', 1, '2024-09-30 02:32:43', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for favorited_products
-- ----------------------------
DROP TABLE IF EXISTS `favorited_products`;
CREATE TABLE `favorited_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorited_products_product_id_foreign` (`product_id`),
  KEY `favorited_products_user_id_foreign` (`user_id`),
  CONSTRAINT `favorited_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorited_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of favorited_products
-- ----------------------------
BEGIN;
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (66, 18, 1, '2024-09-21 09:44:48', '2024-09-21 09:44:48');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (67, 22, 1, '2024-09-21 09:50:49', '2024-09-21 09:50:49');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (68, 20, 1, '2024-09-21 12:55:58', '2024-09-21 12:55:58');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (69, 21, 1, '2024-09-21 12:55:58', '2024-09-21 12:55:58');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (70, 19, 1, '2024-09-21 12:56:08', '2024-09-21 12:56:08');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (75, 23, 1, '2024-09-27 02:33:24', '2024-09-27 02:33:24');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (77, 1, 1, '2024-09-28 00:09:21', '2024-09-28 00:09:21');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (78, 2, 1, '2024-09-28 06:36:46', '2024-09-28 06:36:46');
COMMIT;

-- ----------------------------
-- Table structure for lists
-- ----------------------------
DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lists_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lists
-- ----------------------------
BEGIN;
INSERT INTO `lists` (`id`, `name`, `slug`, `short_name`, `sort`, `icon`, `color`, `created_at`, `updated_at`) VALUES (1, 'Popüler Ürünler', 'populer-urunler', 'Popüler', 2, 'fa-fire-flame-curved', 'primary', NULL, NULL);
INSERT INTO `lists` (`id`, `name`, `slug`, `short_name`, `sort`, `icon`, `color`, `created_at`, `updated_at`) VALUES (2, 'İndirimli Ürünler', 'indirimli-urunler', 'İndirimli', 3, 'fa-tag', 'warning', NULL, NULL);
INSERT INTO `lists` (`id`, `name`, `slug`, `short_name`, `sort`, `icon`, `color`, `created_at`, `updated_at`) VALUES (3, 'Yeni Ürünler', 'yeni-urunler', 'Yeni', 1, 'fa-sparkles', 'success', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2024_08_07_134038_create_products_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2024_09_24_191606_create_product_medias_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2024_08_07_134444_create_product_contents_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2024_08_07_141510_create_product_comments_table', 3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2024_08_07_141845_create_comment_images_table', 3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2024_08_07_210630_create_categories_table', 4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2024_08_07_212737_create_lists_table', 5);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2024_08_07_210824_create_products_and_lists_table', 6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2024_08_11_132824_create_sessions_table', 8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2024_08_12_134638_create_favorited_products_table', 10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15, '2024_08_15_003635_create_permissions_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16, '2024_08_15_003635_create_roles_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17, '2024_08_15_003636_create_user_roles_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18, '2024_08_15_003716_create_role_permissions_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23, '2024_08_23_155853_create_coupons_table', 12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25, '2024_08_23_160144_create_coupon_users_table', 13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26, '2024_09_21_102441_create_user_addresses_table', 14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28, '2024_09_26_231236_create_taxes_table', 15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29, '2024_09_26_232413_create_product_taxes_table', 15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30, '2024_09_26_235108_create_cargos_table', 16);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31, '2024_09_27_000133_create_stores_table', 17);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32, '2024_09_27_000134_create_store_cargos_table', 17);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33, '2024_09_27_001719_create_store_products_table', 18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34, '2024_09_27_014832_create_search_terms_table', 19);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37, '2024_09_27_030128_create_shopping_carts_table', 20);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38, '2024_09_27_030140_create_shopping_cart_product_table', 20);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39, '2024_09_28_013651_create_shopping_cart_coupons_table', 21);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40, '2024_09_28_030404_create_offers_table', 22);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41, '2024_09_28_030655_create_product_offers_table', 23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (42, '2024_09_28_033000_create_order_status_table', 24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (43, '2024_09_28_034832_create_orders_table', 24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (44, '2024_09_28_035754_create_order_products_table', 24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (45, '2024_09_28_035844_create_order_addresses_table', 24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46, '2024_09_28_040122_create_order_coupons_table', 24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (47, '2024_09_28_050212_create_order_invoice_addresses_table', 24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48, '2024_09_28_103724_create_shopping_cart_addresses_table', 25);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49, '2024_09_28_104343_create_shopping_cart_invoice_addresses_table', 25);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50, '2024_10_01_220723_create_shoppingcart_delivery_addresses_table', 26);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51, '2024_10_01_220733_create_shoppingcart_invoice_addresses_table', 26);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52, '2024_10_04_060847_create_order_cargos_table', 27);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53, '2024_10_04_061356_create_shoppingcart_cargos_table', 28);
COMMIT;

-- ----------------------------
-- Table structure for offers
-- ----------------------------
DROP TABLE IF EXISTS `offers`;
CREATE TABLE `offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` enum('currency','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `media_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of offers
-- ----------------------------
BEGIN;
INSERT INTO `offers` (`id`, `name`, `content`, `amount`, `type`, `media_name`, `created_at`, `updated_at`) VALUES (1, '10% İndirim', 'Seçili ürünlerde 10% indirim kampanyası', 10.00, 'percentage', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_addresses
-- ----------------------------
DROP TABLE IF EXISTS `order_addresses`;
CREATE TABLE `order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'personal',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_office` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mersis_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_addresses
-- ----------------------------
BEGIN;
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (8, 14, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 07:20:51', '2024-10-04 07:20:51');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (22, 28, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 07:50:34', '2024-10-04 07:50:34');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (23, 29, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 07:57:11', '2024-10-04 07:57:11');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (24, 30, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 07:57:59', '2024-10-04 07:57:59');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (25, 31, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 07:59:34', '2024-10-04 07:59:34');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (26, 32, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:00:11', '2024-10-04 08:00:11');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (27, 33, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:00:41', '2024-10-04 08:00:41');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (28, 34, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:00:50', '2024-10-04 08:00:50');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (29, 35, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:01:51', '2024-10-04 08:01:51');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (30, 36, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:02:13', '2024-10-04 08:02:13');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (31, 37, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:05:21', '2024-10-04 08:05:21');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (32, 38, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:05:51', '2024-10-04 08:05:51');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (33, 39, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:06:20', '2024-10-04 08:06:20');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (34, 40, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:09:26', '2024-10-04 08:09:26');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (35, 41, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:09:41', '2024-10-04 08:09:41');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (36, 42, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:10:19', '2024-10-04 08:10:19');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (37, 43, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:10:33', '2024-10-04 08:10:33');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (38, 44, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:17:33', '2024-10-04 08:17:33');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (39, 45, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:19:20', '2024-10-04 08:19:20');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (40, 46, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:19:42', '2024-10-04 08:19:42');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (41, 47, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:20:30', '2024-10-04 08:20:30');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (42, 48, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-04 08:20:51', '2024-10-04 08:20:51');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (43, 49, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türiye', 'İstanbul', 'Sultangazi', 'Gazi', '34260', '2024-10-05 01:43:49', '2024-10-05 01:43:49');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (44, 50, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:50:46', '2024-10-05 01:50:46');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (45, 51, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:51:14', '2024-10-05 01:51:14');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (46, 52, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:58:20', '2024-10-05 01:58:20');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (47, 53, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:58:51', '2024-10-05 01:58:51');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (48, 54, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:01:40', '2024-10-05 02:01:40');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (49, 55, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:19:06', '2024-10-05 02:19:06');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (50, 56, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:19:39', '2024-10-05 02:19:39');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (51, 57, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:20:22', '2024-10-05 02:20:22');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (52, 58, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:20:38', '2024-10-05 02:20:38');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (53, 59, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:21:44', '2024-10-05 02:21:44');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (54, 60, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:22:03', '2024-10-05 02:22:03');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (55, 61, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:23:38', '2024-10-05 02:23:38');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (56, 62, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:26:43', '2024-10-05 02:26:43');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (57, 63, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:27:13', '2024-10-05 02:27:13');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (58, 64, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:27:23', '2024-10-05 02:27:23');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (59, 65, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:27:36', '2024-10-05 02:27:36');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (60, 66, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:27:59', '2024-10-05 02:27:59');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (61, 67, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:28:17', '2024-10-05 02:28:17');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (62, 68, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:28:48', '2024-10-05 02:28:48');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (63, 69, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:28:57', '2024-10-05 02:28:57');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (64, 70, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:29:28', '2024-10-05 02:29:28');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (65, 71, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:29:35', '2024-10-05 02:29:35');
INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (66, 72, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', '2024-10-05 02:33:03', '2024-10-05 02:33:03');
COMMIT;

-- ----------------------------
-- Table structure for order_cargos
-- ----------------------------
DROP TABLE IF EXISTS `order_cargos`;
CREATE TABLE `order_cargos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `cargo_id` bigint unsigned NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `tracking_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_cargos_order_id_foreign` (`order_id`),
  KEY `order_cargos_cargo_id_foreign` (`cargo_id`),
  CONSTRAINT `order_cargos_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_cargos_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_cargos
-- ----------------------------
BEGIN;
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (6, 14, 1, 35.00, NULL, '2024-10-04 07:20:51', '2024-10-04 07:20:51');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (20, 28, 1, 35.00, NULL, '2024-10-04 07:50:34', '2024-10-04 07:50:34');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (21, 29, 1, 35.00, NULL, '2024-10-04 07:57:11', '2024-10-04 07:57:11');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (22, 30, 1, 35.00, NULL, '2024-10-04 07:57:59', '2024-10-04 07:57:59');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (23, 31, 1, 35.00, NULL, '2024-10-04 07:59:34', '2024-10-04 07:59:34');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (24, 32, 1, 35.00, NULL, '2024-10-04 08:00:11', '2024-10-04 08:00:11');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (25, 33, 1, 35.00, NULL, '2024-10-04 08:00:41', '2024-10-04 08:00:41');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (26, 34, 1, 35.00, NULL, '2024-10-04 08:00:50', '2024-10-04 08:00:50');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (27, 35, 1, 35.00, NULL, '2024-10-04 08:01:51', '2024-10-04 08:01:51');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (28, 36, 1, 35.00, NULL, '2024-10-04 08:02:13', '2024-10-04 08:02:13');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (29, 37, 1, 35.00, NULL, '2024-10-04 08:05:21', '2024-10-04 08:05:21');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (30, 38, 1, 35.00, NULL, '2024-10-04 08:05:51', '2024-10-04 08:05:51');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (31, 39, 1, 35.00, NULL, '2024-10-04 08:06:20', '2024-10-04 08:06:20');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (32, 40, 1, 35.00, NULL, '2024-10-04 08:09:26', '2024-10-04 08:09:26');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (33, 41, 1, 35.00, NULL, '2024-10-04 08:09:41', '2024-10-04 08:09:41');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (34, 42, 1, 35.00, NULL, '2024-10-04 08:10:19', '2024-10-04 08:10:19');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (35, 43, 1, 35.00, NULL, '2024-10-04 08:10:33', '2024-10-04 08:10:33');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (36, 44, 1, 35.00, NULL, '2024-10-04 08:17:33', '2024-10-04 08:17:33');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (37, 45, 1, 35.00, NULL, '2024-10-04 08:19:20', '2024-10-04 08:19:20');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (38, 46, 1, 35.00, NULL, '2024-10-04 08:19:42', '2024-10-04 08:19:42');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (39, 47, 1, 35.00, NULL, '2024-10-04 08:20:30', '2024-10-04 08:20:30');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (40, 48, 1, 35.00, NULL, '2024-10-04 08:20:51', '2024-10-04 08:20:51');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (41, 49, 1, 35.00, NULL, '2024-10-05 01:43:49', '2024-10-05 01:43:49');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (42, 50, 1, 35.00, NULL, '2024-10-05 01:50:46', '2024-10-05 01:50:46');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (43, 51, 1, 35.00, NULL, '2024-10-05 01:51:14', '2024-10-05 01:51:14');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (44, 52, 1, 35.00, NULL, '2024-10-05 01:58:20', '2024-10-05 01:58:20');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (45, 53, 1, 35.00, NULL, '2024-10-05 01:58:51', '2024-10-05 01:58:51');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (46, 54, 1, 35.00, NULL, '2024-10-05 02:01:40', '2024-10-05 02:01:40');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (47, 55, 1, 35.00, NULL, '2024-10-05 02:19:06', '2024-10-05 02:19:06');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (48, 56, 1, 35.00, NULL, '2024-10-05 02:19:39', '2024-10-05 02:19:39');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (49, 57, 1, 35.00, NULL, '2024-10-05 02:20:22', '2024-10-05 02:20:22');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (50, 58, 1, 35.00, NULL, '2024-10-05 02:20:38', '2024-10-05 02:20:38');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (51, 59, 1, 35.00, NULL, '2024-10-05 02:21:44', '2024-10-05 02:21:44');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (52, 60, 1, 35.00, NULL, '2024-10-05 02:22:03', '2024-10-05 02:22:03');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (53, 61, 1, 35.00, NULL, '2024-10-05 02:23:38', '2024-10-05 02:23:38');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (54, 62, 1, 35.00, NULL, '2024-10-05 02:26:43', '2024-10-05 02:26:43');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (55, 63, 1, 35.00, NULL, '2024-10-05 02:27:13', '2024-10-05 02:27:13');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (56, 64, 1, 35.00, NULL, '2024-10-05 02:27:23', '2024-10-05 02:27:23');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (57, 65, 1, 35.00, NULL, '2024-10-05 02:27:36', '2024-10-05 02:27:36');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (58, 66, 1, 35.00, NULL, '2024-10-05 02:27:59', '2024-10-05 02:27:59');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (59, 67, 1, 35.00, NULL, '2024-10-05 02:28:17', '2024-10-05 02:28:17');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (60, 68, 1, 35.00, NULL, '2024-10-05 02:28:48', '2024-10-05 02:28:48');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (61, 69, 1, 35.00, NULL, '2024-10-05 02:28:57', '2024-10-05 02:28:57');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (62, 70, 1, 35.00, NULL, '2024-10-05 02:29:28', '2024-10-05 02:29:28');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (63, 71, 1, 35.00, NULL, '2024-10-05 02:29:36', '2024-10-05 02:29:36');
INSERT INTO `order_cargos` (`id`, `order_id`, `cargo_id`, `price`, `tracking_number`, `created_at`, `updated_at`) VALUES (64, 72, 1, 35.00, NULL, '2024-10-05 02:33:03', '2024-10-05 02:33:03');
COMMIT;

-- ----------------------------
-- Table structure for order_coupons
-- ----------------------------
DROP TABLE IF EXISTS `order_coupons`;
CREATE TABLE `order_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `coupon_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_coupons_order_id_foreign` (`order_id`),
  KEY `order_coupons_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `order_coupons_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_coupons_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_coupons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_invoice_addresses
-- ----------------------------
DROP TABLE IF EXISTS `order_invoice_addresses`;
CREATE TABLE `order_invoice_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'personal',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_office` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mersis_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_invoice_addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `order_invoice_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_invoice_addresses
-- ----------------------------
BEGIN;
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (8, 14, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 07:20:51', '2024-10-04 07:20:51');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (22, 28, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 07:50:34', '2024-10-04 07:50:34');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (23, 29, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 07:57:11', '2024-10-04 07:57:11');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (24, 30, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 07:57:59', '2024-10-04 07:57:59');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (25, 31, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 07:59:34', '2024-10-04 07:59:34');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (26, 32, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:00:11', '2024-10-04 08:00:11');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (27, 33, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:00:41', '2024-10-04 08:00:41');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (28, 34, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:00:50', '2024-10-04 08:00:50');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (29, 35, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:01:51', '2024-10-04 08:01:51');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (30, 36, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:02:13', '2024-10-04 08:02:13');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (31, 37, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:05:21', '2024-10-04 08:05:21');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (32, 38, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:05:51', '2024-10-04 08:05:51');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (33, 39, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:06:20', '2024-10-04 08:06:20');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (34, 40, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:09:26', '2024-10-04 08:09:26');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (35, 41, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:09:41', '2024-10-04 08:09:41');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (36, 42, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:10:19', '2024-10-04 08:10:19');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (37, 43, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:10:33', '2024-10-04 08:10:33');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (38, 44, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:17:33', '2024-10-04 08:17:33');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (39, 45, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:19:20', '2024-10-04 08:19:20');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (40, 46, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:19:42', '2024-10-04 08:19:42');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (41, 47, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:20:30', '2024-10-04 08:20:30');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (42, 48, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-04 08:20:51', '2024-10-04 08:20:51');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (43, 49, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development A.Ş.', 'Küçükköy V.D.', '3905689023168', '139867928768', 'alpagudev@alpagu.net', '5059991134', 'Türkiye', 'İstanbul', 'Kağıthane', 'Levent', '34000', '2024-10-05 01:43:49', '2024-10-05 01:43:49');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (44, 50, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:50:46', '2024-10-05 01:50:46');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (45, 51, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:51:14', '2024-10-05 01:51:14');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (46, 52, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:58:20', '2024-10-05 01:58:20');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (47, 53, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 01:58:51', '2024-10-05 01:58:51');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (48, 54, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:01:40', '2024-10-05 02:01:40');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (49, 55, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:19:06', '2024-10-05 02:19:06');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (50, 56, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:19:39', '2024-10-05 02:19:39');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (51, 57, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:20:22', '2024-10-05 02:20:22');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (52, 58, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:20:38', '2024-10-05 02:20:38');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (53, 59, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:21:44', '2024-10-05 02:21:44');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (54, 60, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:22:03', '2024-10-05 02:22:03');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (55, 61, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:23:38', '2024-10-05 02:23:38');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (56, 62, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:26:43', '2024-10-05 02:26:43');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (57, 63, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:27:13', '2024-10-05 02:27:13');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (58, 64, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:27:23', '2024-10-05 02:27:23');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (59, 65, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:27:36', '2024-10-05 02:27:36');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (60, 66, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:27:59', '2024-10-05 02:27:59');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (61, 67, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:28:17', '2024-10-05 02:28:17');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (62, 68, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:28:48', '2024-10-05 02:28:48');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (63, 69, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:28:57', '2024-10-05 02:28:57');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (64, 70, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:29:28', '2024-10-05 02:29:28');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (65, 71, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, 'cagdaskbudak@gmail.com', '5059991134', 'Türkiye', 'Sultangazi', 'Sultangazi', 'Yunus Emre Mahallesi', '34260', '2024-10-05 02:29:35', '2024-10-05 02:29:35');
INSERT INTO `order_invoice_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `created_at`, `updated_at`) VALUES (66, 72, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', '2024-10-05 02:33:03', '2024-10-05 02:33:03');
COMMIT;

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `sale_price` decimal(11,2) NOT NULL,
  `vat_price` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_products_order_id_foreign` (`order_id`),
  KEY `order_products_product_id_foreign` (`product_id`),
  CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_products
-- ----------------------------
BEGIN;
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (6, 14, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 07:20:51', '2024-10-04 07:20:51');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (20, 28, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 07:50:34', '2024-10-04 07:50:34');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (21, 29, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 07:57:11', '2024-10-04 07:57:11');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (22, 30, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 07:57:59', '2024-10-04 07:57:59');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (23, 31, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 07:59:34', '2024-10-04 07:59:34');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (24, 32, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:00:11', '2024-10-04 08:00:11');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (25, 33, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:00:41', '2024-10-04 08:00:41');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (26, 34, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:00:50', '2024-10-04 08:00:50');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (27, 35, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:01:51', '2024-10-04 08:01:51');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (28, 36, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:02:13', '2024-10-04 08:02:13');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (29, 37, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:05:21', '2024-10-04 08:05:21');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (30, 38, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:05:51', '2024-10-04 08:05:51');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (31, 39, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:06:20', '2024-10-04 08:06:20');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (32, 40, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:09:26', '2024-10-04 08:09:26');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (33, 41, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:09:41', '2024-10-04 08:09:41');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (34, 42, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:10:19', '2024-10-04 08:10:19');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (35, 43, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:10:33', '2024-10-04 08:10:33');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (36, 44, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:17:33', '2024-10-04 08:17:33');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (37, 45, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:19:20', '2024-10-04 08:19:20');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (38, 46, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:19:42', '2024-10-04 08:19:42');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (39, 47, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:20:30', '2024-10-04 08:20:30');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (40, 47, 2, 890.00, 148.33, 801.00, 1, '2024-10-04 08:20:30', '2024-10-04 08:20:30');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (41, 48, 1, 356.16, 59.36, 320.54, 1, '2024-10-04 08:20:51', '2024-10-04 08:20:51');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (42, 48, 18, 410.00, 68.33, 410.00, 1, '2024-10-04 08:20:51', '2024-10-04 08:20:51');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (43, 49, 17, 199.98, 33.33, 199.98, 3, '2024-10-05 01:43:49', '2024-10-05 01:43:49');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (44, 49, 1, 356.16, 59.36, 320.54, 3, '2024-10-05 01:43:49', '2024-10-05 01:43:49');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (45, 50, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 01:50:46', '2024-10-05 01:50:46');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (46, 50, 1, 356.16, 59.36, 320.54, 1, '2024-10-05 01:50:46', '2024-10-05 01:50:46');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (47, 51, 1, 356.16, 59.36, 320.54, 1, '2024-10-05 01:51:14', '2024-10-05 01:51:14');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (48, 51, 2, 890.00, 148.33, 801.00, 1, '2024-10-05 01:51:14', '2024-10-05 01:51:14');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (49, 52, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 01:58:20', '2024-10-05 01:58:20');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (50, 53, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 01:58:51', '2024-10-05 01:58:51');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (51, 54, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:01:40', '2024-10-05 02:01:40');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (52, 55, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:19:06', '2024-10-05 02:19:06');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (53, 56, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:19:39', '2024-10-05 02:19:39');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (54, 57, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:20:22', '2024-10-05 02:20:22');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (55, 58, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:20:38', '2024-10-05 02:20:38');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (56, 59, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:21:44', '2024-10-05 02:21:44');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (57, 60, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:22:03', '2024-10-05 02:22:03');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (58, 61, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:23:38', '2024-10-05 02:23:38');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (59, 62, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:26:43', '2024-10-05 02:26:43');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (60, 63, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:27:13', '2024-10-05 02:27:13');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (61, 64, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:27:23', '2024-10-05 02:27:23');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (62, 65, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:27:36', '2024-10-05 02:27:36');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (63, 66, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:27:59', '2024-10-05 02:27:59');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (64, 67, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:28:17', '2024-10-05 02:28:17');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (65, 68, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:28:48', '2024-10-05 02:28:48');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (66, 69, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:28:57', '2024-10-05 02:28:57');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (67, 70, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:29:28', '2024-10-05 02:29:28');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (68, 71, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:29:36', '2024-10-05 02:29:36');
INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `sale_price`, `vat_price`, `price`, `count`, `created_at`, `updated_at`) VALUES (69, 72, 17, 199.98, 33.33, 199.98, 1, '2024-10-05 02:33:03', '2024-10-05 02:33:03');
COMMIT;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_status
-- ----------------------------
BEGIN;
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (1, 'PENDING', 'Pending (Sipariş Alındı)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (2, 'PAYMENT_PENDING', 'Payment Pending (Ödeme Bekleniyor)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (3, 'PAYMENT_CONFIRMED', 'Payment Confirmed (Ödeme Onaylandı)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (4, 'PROCESSING', 'Processing (Sipariş Hazırlanıyor)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (5, 'SHIPPED', 'Shipped (Kargoya Verildi)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (6, 'DELIVERED', 'Delivered (Teslim Edildi)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (7, 'CANCELLED', 'Cancelled (İptal Edildi)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (8, 'RETURN_PENDING', 'Return Pending (İade Bekleniyor)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (9, 'RETURNED', 'Returned (İade Edildi)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (10, 'REFUNDED', 'Refunded (İade Tamamlandı)', NULL, NULL);
INSERT INTO `order_status` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES (11, 'PAYMENT_FAILED', 'Payment Failed (Ödeme Başarısız)', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_status_id_foreign` (`status_id`),
  CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (14, 1, 3, '2024-10-04 07:20:51', '2024-10-04 07:20:51');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (28, 1, 3, '2024-10-04 07:50:34', '2024-10-04 07:50:44');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (29, 1, 3, '2024-10-04 07:57:11', '2024-10-04 07:57:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (30, 1, 3, '2024-10-04 07:57:59', '2024-10-04 07:58:03');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (31, 1, 3, '2024-10-04 07:59:34', '2024-10-04 07:59:38');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (32, 1, 3, '2024-10-04 08:00:11', '2024-10-04 08:00:15');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (33, 1, 3, '2024-10-04 08:00:41', '2024-10-04 08:00:45');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (34, 1, 3, '2024-10-04 08:00:50', '2024-10-04 08:00:50');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (35, 1, 3, '2024-10-04 08:01:51', '2024-10-04 08:01:55');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (36, 1, 3, '2024-10-04 08:02:13', '2024-10-04 08:02:17');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (37, 1, 3, '2024-10-04 08:05:21', '2024-10-04 08:05:25');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (38, 1, 3, '2024-10-04 08:05:51', '2024-10-04 08:05:55');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (39, 1, 3, '2024-10-04 08:06:20', '2024-10-04 08:06:26');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (40, 1, 3, '2024-10-04 08:09:26', '2024-10-04 08:09:30');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (41, 1, 3, '2024-10-04 08:09:41', '2024-10-04 08:09:45');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (42, 1, 3, '2024-10-04 08:10:19', '2024-10-04 08:10:23');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (43, 1, 3, '2024-10-04 08:10:33', '2024-10-04 08:10:38');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (44, 1, 3, '2024-10-04 08:17:33', '2024-10-04 08:17:38');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (45, 1, 3, '2024-10-04 08:19:20', '2024-10-04 08:19:25');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (46, 1, 3, '2024-10-04 08:19:42', '2024-10-04 08:19:47');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (47, 1, 3, '2024-10-04 08:20:30', '2024-10-04 08:20:35');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (48, 1, 3, '2024-10-04 08:20:51', '2024-10-04 08:20:51');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (49, NULL, 3, '2024-10-05 01:43:49', '2024-10-05 01:43:55');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (50, NULL, 3, '2024-10-05 01:50:46', '2024-10-05 01:50:46');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (51, NULL, 3, '2024-10-05 01:51:14', '2024-10-05 01:51:22');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (52, NULL, 1, '2024-10-05 01:58:20', '2024-10-05 01:58:20');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (53, NULL, 3, '2024-10-05 01:58:51', '2024-10-05 01:59:02');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (54, 1, 3, '2024-10-05 02:01:40', '2024-10-05 02:01:44');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (55, 1, 1, '2024-10-05 02:19:06', '2024-10-05 02:19:06');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (56, 1, 1, '2024-10-05 02:19:39', '2024-10-05 02:19:39');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (57, 1, 1, '2024-10-05 02:20:22', '2024-10-05 02:20:22');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (58, 1, 1, '2024-10-05 02:20:38', '2024-10-05 02:20:38');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (59, 1, 1, '2024-10-05 02:21:44', '2024-10-05 02:21:44');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (60, 1, 1, '2024-10-05 02:22:03', '2024-10-05 02:22:03');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (61, 1, 1, '2024-10-05 02:23:38', '2024-10-05 02:23:38');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (62, 1, 3, '2024-10-05 02:26:42', '2024-10-05 02:26:48');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (63, 1, 11, '2024-10-05 02:27:13', '2024-10-05 02:27:14');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (64, 1, 11, '2024-10-05 02:27:23', '2024-10-05 02:27:28');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (65, 1, 3, '2024-10-05 02:27:36', '2024-10-05 02:27:42');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (66, 1, 3, '2024-10-05 02:27:59', '2024-10-05 02:28:00');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (67, 1, 11, '2024-10-05 02:28:17', '2024-10-05 02:28:18');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (68, NULL, 11, '2024-10-05 02:28:48', '2024-10-05 02:28:48');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (69, NULL, 3, '2024-10-05 02:28:57', '2024-10-05 02:29:02');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (70, NULL, 11, '2024-10-05 02:29:28', '2024-10-05 02:29:28');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (71, NULL, 3, '2024-10-05 02:29:35', '2024-10-05 02:29:36');
INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES (72, 1, 3, '2024-10-05 02:33:03', '2024-10-05 02:33:13');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_comments_product_id_foreign` (`product_id`),
  KEY `product_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `product_comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_comments
-- ----------------------------
BEGIN;
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (1, 2, 1, 'Süper !! Bir beden küçük alınabilir', 5, '2024-08-07 18:27:00', NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (4, 2, 3, 'Doğru iç çamaşırıyla iç göstermiyor 62 kilo 1.70 38 beden tam oldu bayıldım', 5, '2024-08-07 18:27:04', NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (5, 2, 1, 'çekiyor yorumları için bir beden büyük aldım 172 olmama rağmen paçaları çoook uzun. onun dışında güzel. yıkayınca çekmezse terziye veririm s’nin stoğu asla yok çünkü🙄', 3, '2024-08-07 18:27:07', NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (6, 2, 3, 'Ürün yırtık geldi iade', 1, '2024-08-07 18:27:10', NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (7, 1, 1, 'Yazlık harika bir gömlek bence bir beden ya da yarım beden büyüğünü alın daha da salaş dursun.', 5, '2024-08-07 18:27:13', NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (8, 1, 3, 'Kesinlikle keten değil bildiğin naylon', 2, '2024-08-07 18:27:15', NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (9, 18, 1, 'Süper', 5, NULL, NULL);
INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES (10, 18, 1, 'İdare eder', 4, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_contents
-- ----------------------------
DROP TABLE IF EXISTS `product_contents`;
CREATE TABLE `product_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_contents_product_id_foreign` (`product_id`),
  CONSTRAINT `product_contents_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_contents
-- ----------------------------
BEGIN;
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (1, 1, 'Deneme Ürün Açıklaması', NULL, NULL);
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (2, 2, 'Content', NULL, NULL);
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (14, 17, 'Deneme Açıklama', '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (15, 18, 'Deneme AÇılama', NULL, NULL);
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (16, 20, 'aslkmgladmglam', NULL, NULL);
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (17, 22, 'aşgmlaaşaşşaaşaa', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_medias
-- ----------------------------
DROP TABLE IF EXISTS `product_medias`;
CREATE TABLE `product_medias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_medias
-- ----------------------------
BEGIN;
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (1, 1, 'pr2_1.webp', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (2, 1, 'pr2_2.webp', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (3, 1, 'pr2_3.webp', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (4, 1, 'pr2_4.webp', 4, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (5, 2, 'pr1.webp', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (6, 2, 'pr1_2.webp', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (7, 2, 'pr1_3.webp', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (8, 2, 'pr1_4.webp', 4, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (22, 17, '0VkMvSgUHUsGlxwP5YApqBKYjrPUJF9RQa56APlJ.jpg', 0, 'image', '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (23, 17, 'hOIif1vH4GkOm7BuztO69a4IGfTi4zfqh4hsgfvY.jpg', 1, 'image', '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (24, 18, 'pr3_1.webp', 0, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (25, 18, 'pr3_2.webp', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (26, 18, 'pr3_3.webp', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (27, 18, 'pr3_4.webp', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (28, 19, 'pr4_1.webp', 0, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (29, 19, 'pr4_2.webp', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (30, 19, 'pr4_3.jpg', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (31, 19, 'pr4_4.webp', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (32, 19, 'pr4_5.webp', 4, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (33, 20, 'pr5_1.webp', 0, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (34, 20, 'pr5_2.webp', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (35, 20, 'pr5_3.webp', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (36, 20, 'pr5_4.webp', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (37, 20, 'pr5_5.webp', 4, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (38, 20, 'pr5_6.webp', 5, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (39, 20, 'pr5_7.webp', 6, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (40, 20, 'pr5_8.webp', 7, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (41, 21, 'pr6_1.jpg', 0, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (42, 21, 'pr6_2.jpg', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (43, 22, 'pr7_1.webp', 0, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (44, 22, 'pr7_2.webp', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (45, 22, 'pr7_3.webp', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (46, 22, 'pr7_4.webp', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (47, 22, 'pr7_5.webp', 4, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (48, 22, 'pr7_6.webp', 5, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (49, 23, 'pr8_1.avif', 1, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (50, 23, 'pr8_2.avif', 2, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (51, 23, 'pr8_3.avif', 3, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (52, 23, 'pr8_4.avif', 4, 'image', NULL, NULL);
INSERT INTO `product_medias` (`id`, `product_id`, `name`, `sort`, `type`, `created_at`, `updated_at`) VALUES (53, 23, 'pr8_5.mp4', 0, 'video', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_offers
-- ----------------------------
DROP TABLE IF EXISTS `product_offers`;
CREATE TABLE `product_offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `offer_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_offers_product_id_foreign` (`product_id`),
  KEY `product_offers_offer_id_foreign` (`offer_id`),
  CONSTRAINT `product_offers_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_offers
-- ----------------------------
BEGIN;
INSERT INTO `product_offers` (`id`, `product_id`, `offer_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `product_offers` (`id`, `product_id`, `offer_id`, `created_at`, `updated_at`) VALUES (2, 2, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_taxes
-- ----------------------------
DROP TABLE IF EXISTS `product_taxes`;
CREATE TABLE `product_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `tax_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `tax_id` (`tax_id`),
  CONSTRAINT `product_taxes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_taxes_ibfk_2` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_taxes
-- ----------------------------
BEGIN;
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (2, 2, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (3, 17, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (4, 18, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (5, 19, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (6, 20, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (8, 22, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (9, 23, 1, NULL, NULL);
INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `created_at`, `updated_at`) VALUES (11, 21, 3, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` decimal(8,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `products_ibfk_1` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (1, 'Erkek Keten Oversize Geniş Kesim Dökümlü Gömlek', 'erkek-keten-oversize-genis-kesim-dokumlu-gomlek', 356.16, 3, '2024-08-01 19:06:30', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (2, 'Keten Karışımlı Bol Kesim Pantolon', 'keten-karisimli-bol-kesim-pantolon', 890.00, 4, '2024-08-12 19:06:38', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (17, 'Salaş Gömlek', 'salas-gomlek', 199.98, 3, '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (18, 'bilekten taşlı saten malzeme topuklu kadin abiye ayakkabı', 'bilekten-tasli-saten-malzeme-topuklu-kadin-abiye-ayakkabi', 410.00, 10, '2024-09-18 16:30:17', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (19, 'Bogota Erkek Çocuk Nakış Işlemeli Bisiklet Yaka Bej Eşofman Takımı', 'bogota-erkek-cocuk-nakis-islemeli-bisiklet-yaka-bej-esofman-takimi', 629.99, 14, '2024-09-18 20:25:23', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (20, 'Kadın Siyah Sırt Dekolte Yırtmaçlı Elbise', 'kadin-siyah-sirt-dekolte-yirtmacli-elbise', 105.00, 15, '2024-09-18 20:33:10', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (21, 'Bebek Patikli Tulum 1-6 Ay Pembe', 'bebek-patikli-tulum-1-6-ay-pembe', 159.12, 18, '2024-09-18 20:40:13', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (22, 'Slim Fit Siyah Düz Mono Yaka Çift Yırtmaçlı Astarlı Takim Elbise', 'slim-fit-siyah-duz-mono-yaka-cift-yirtmacli-astarli-takim-elbise', 2599.99, 19, '2024-09-18 20:45:42', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `sale_price`, `category_id`, `created_at`, `updated_at`) VALUES (23, 'Boat Neck Pamela Set', 'boat-neck-pamela-set', 478.48, 23, '2024-09-24 18:39:25', NULL);
COMMIT;

-- ----------------------------
-- Table structure for products_and_lists
-- ----------------------------
DROP TABLE IF EXISTS `products_and_lists`;
CREATE TABLE `products_and_lists` (
  `list_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `products_and_lists_list_id_foreign` (`list_id`),
  KEY `products_and_lists_product_id_foreign` (`product_id`),
  CONSTRAINT `products_and_lists_list_id_foreign` FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_and_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products_and_lists
-- ----------------------------
BEGIN;
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (1, 1, NULL, NULL);
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (2, 1, NULL, NULL);
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (1, 2, NULL, NULL);
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (2, 2, NULL, NULL);
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (3, 1, NULL, NULL);
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (3, 2, NULL, NULL);
INSERT INTO `products_and_lists` (`list_id`, `product_id`, `created_at`, `updated_at`) VALUES (3, 17, '2024-08-15 22:02:13', '2024-08-15 22:02:13');
COMMIT;

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_role_id_foreign` (`role_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'Administrator', NULL, NULL);
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'Customer', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for search_terms
-- ----------------------------
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE `search_terms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of search_terms
-- ----------------------------
BEGIN;
INSERT INTO `search_terms` (`id`, `term`, `search_count`, `created_at`, `updated_at`) VALUES (1, 'Deneme Arama', 5, '2024-09-27 01:53:31', '2024-09-27 01:57:51');
INSERT INTO `search_terms` (`id`, `term`, `search_count`, `created_at`, `updated_at`) VALUES (2, 'denemearama', 1, '2024-09-27 01:57:56', '2024-09-27 01:57:56');
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('0iLgAfH6SmmeMlzuhQXyBH9ghfXBxMORBkxsXAYg', NULL, 'ZXlKcGRpSTZJbVZRY1hCc2JqUk5RVWxMTDJwM0sxWnVWVmw2WTJjOVBTSXNJblpoYkhWbElqb2lka05xWW1KRWNWUnJSbTlVYVhSM1N5dE5lbU5aTW1WVGMxUlVRM0kwYVd4RlpIaDJja051UmsxSU5FeE1MemhGYlZsb2FscG1Relo0UjBZMmVIWlFWRGRxU2xwVE5UWkdTR0ZEY1ZsblZIWk1haTlRZEhVNFYySlZkVkF6SzI1SWMxTXljMFp6UkhjNGFsTlRObmRJVDNKeVVrTmhhVFIzTkhKd1VUQTBVWFJxUkRNNFNHVXpNVkYwV2pjclpWVjRORmxzWjI4cmFsbDZOMmwzWkZoMmVYWmFMek5ET0d0SlNVdFpQU0lzSW0xaFl5STZJbU0wWm1GaE1ESmxZelkwTmpKalltUTNabVkzWmpsbE9XRXdZelV3TWpNeU5ETTJZMlJoTmpjNU5qSmtaRE16TXpVMU16Y3laakkxWVdVNVpqWmxaamdpTENKMFlXY2lPaUlpZlE9PQ==', 1728081835, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('6KcvsjY5JJEDx0X8Dnq5ftuUIgA12QmkxBFf8F5y', 1, 'ZXlKcGRpSTZJamRDVUUxaFF5OUJOSEE0ZVVGd0swTm1WVmN3YWxFOVBTSXNJblpoYkhWbElqb2lOamxxTTFaeFJrOWFlbGRGUmxGcGVWQTJOa0puUzJkelRVUkNNM2MyY0U1VFRHUnlRbk4zVnpnNWRuWjBjelV5ZGtOTWJWSlVNRzlzUW1SRGFsWktVUzlhY1c1clRuTjVSRGhNZG0xSVV6VTFXR2t6WTFZM2JEa3ZlVUV4UmtjelYwOU9UMEZYWnpjMU9FTTNhbGxyWlZCWlkyMTZlbFprTHpKc2NITjRNblpEVlZkYVJqaE5VMW8yUTJob1VsWm9iV2hVZEUxcGQzWkxPVFpTUm1GVGVtSkhTSEJZTTFWcGRtbFVPV05xUVVjd1IzaHpla3BhTDFZNVlXVjBiV0pHUlVoYVNuVlpaelpSTmk5d1dGQmlTM05HYm5SU1oyMUNRMnR5TmtSSmJXWTRTemxSV2xWeVdtczVNRFpIU1RoNlpsbzNSRkJMWkhSNE5XVXJOWGw2VXpsdFVGcFZZMVpzYWpWTU9FeDBWWEJOVDBKVWJYQkVOVGhhWTBsd2MzRTVXVTlvTHlzMVlWVk9SMGhZUldocFFsRklTRkZLV1VOYVpUVlRPV1p0WVdKTEswWmlTR2gyVm5sNldtWXJNME42ZHpGSlIyZEJQVDBpTENKdFlXTWlPaUl6TURoaFlUZzRObU13TTJVd1lqSXlaVEpoTlRJM016TXdPV1UyTkdJM09ETmhNbVUzTXpnMk1qYzFOalEwWVdRMk5UVmlPVGs1Tm1FMU5tSmtaVEEwSWl3aWRHRm5Jam9pSW4wPQ==', 1728084805, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('HDq1ARZ47pCeBaIAe31kwtjZnfBRU3Rj0Ixg6Bek', NULL, 'ZXlKcGRpSTZJbXRqTTJ0Q1luZElkR3BzU1VWRVVtcFZXR050Y0hjOVBTSXNJblpoYkhWbElqb2lXVUpMVUdKYWEzcExjRXQwTXpONFYyNXRURGMxYzBwdmQzTkpRalZYYUVwRVQwRXZaazVuU2s0M1dGcFJSM1pSVFRkSmEyRkthVEJ1YUZWNU0ybFFlbFJyTlhwd1NsZGtUVEYzU2twUVFsRlBWbFV2TlVwc01uSTNPR0pyT1d4a2JXb3hibFJuWVhVM2RtMU1TblIxWkZCdk0zWlJSRmRtVnpjd1dXazJhVlZ0WVhaa1JtSXpjbEJEUVVjdlNuQjVZa2swV1Roa2JEQnRNMnR3UjBkWlNDdFBPU3RsZWpoM01WazRQU0lzSW0xaFl5STZJalZsT0dWaFpqbG1Zamt5TTJVMk1XVXlaRFl4TURneU4yTXhabVJpTnpKaVpEUTFOMlZrTWpjM01qbGlOMlkwTWpaaE5qUmpNR0ZsTW1KallqUTJOV01pTENKMFlXY2lPaUlpZlE9PQ==', 1728084793, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('HgrZKwU4fzfGuMIsurW6iuBYqCVJkgiWhPNkkGES', NULL, 'ZXlKcGRpSTZJamh0ZGtSMVdVOUVTRmxtZUcxdFFpOXFPSEJyWWxFOVBTSXNJblpoYkhWbElqb2lTWE0xY0ZJMVVFMXljMXBKUjFoWGNteFljekUyTjFkb2MyaHNiVkZ4WkdOd1RYaHphbWwwYUZrMlJrOUROMkZMU0VWRFR5dHBaRUl2ZWpSeE1rWXdZMkpZYlRWVFdFUXpabkV4ZEZCbVJscDZjMnhZYW1KR1FuSTJUR2xhY3pOM1EzbFZVM0IyUTNZMWJraHVjWE5xY0ZFd1dUVmxNR1pLWlcxMWMwSlJkbkJYVEN0aE1HWjFZVWhKWjBadVJGQlhORzVyYVZJNVZHdzFLemxZUVZGc1lsbDRSbGhFY1VkV1lsRTBQU0lzSW0xaFl5STZJbVJqWVdReE5ESmhNREEyWTJFeE5HUTBZV0ZrWlRaaE16Y3dPVE5sTmpJd01HVmhOR1pqT1RVMU5UVm1OelF4WVdNMU5EQTVOR0k1WkdFelltVmxORFVpTENKMFlXY2lPaUlpZlE9PQ==', 1728082282, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('iBZ8dViHW7ljR19GQF8S8LvtZESg2k4gc5y1Qi6j', NULL, 'ZXlKcGRpSTZJbGxPUTA5V1preEVSSFJVVFVkVmVGRTJTSGxxU0ZFOVBTSXNJblpoYkhWbElqb2lVVEJUV1ZaSE9GZzRaVFJpY0Zjek9UWndLMnRQUzJ4MVJGWlhiRFZpU3poTmFHRnpOVW80Vnl0WVdYSkVVWFp6TjJKM1YyVXlSekI0YURWbWNuUmlLMm93TVZSeFlYTk9ORWxLZFU1M2FFVlBhVEZaWkhOemIzSjVSVmhUUkM5MFJHbE1hVlJvWVdneFNtcEZhbFoyYzNCS05XWlVZMWhTVWpGVVRHVnhjR3h5VEdoVmQyWkVMMGczTjBOeVRXOTZkamgwT1doeksxVndNRVZPUVRWamFGQkRTRkZ6VmsxSVYzSnZQU0lzSW0xaFl5STZJall5Wm1NMU5XRmpNVE5sTlRkaVlUaGxZMlJsTjJGaFlqSTBOemt4T0RGbE1UUm1NVGcwTkRNNVpXTXdOV05tWmpNeE16QXhaVE5qTkdNMVpqVXpNRElpTENKMFlXY2lPaUlpZlE9PQ==', 1728084448, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('lH1qmhrOiWEpVgW266UUL6u4YGPdkkHvlUb5JHOZ', NULL, 'ZXlKcGRpSTZJa014Vm5waWNEQjNjMEZQZUU4M2FHMUhPVGc1UzBFOVBTSXNJblpoYkhWbElqb2lOVGxtYlRCa1ozTmtNak5IVjNNd1IwSTVXRGt2YTAxbFVscHpSVmRxU1VGRFEzSTJTR2RPV0U0MlNWZFRaRTFCYUV4aE1EVlpLemd6ZHpKaFEzSldNamRuTDNWNmRHdEJVR2d5T0UxclIzcHpiekEzVW1GRVNVRlhOM0ZRYzBSRGRFaFVhRk14YjA1bU0wdHZVMGxsWmpCaVp5OTVjVFZvVTNGWmMzcEVSbGwyVDBnMU5GUlhSSEpoYVU5MFpFVktVR0pqVDNCRE1FOVlOVTVMY2tvcmNGZHphelJSVW5sM2FqWnZQU0lzSW0xaFl5STZJbUZqWlRsaE16QTVaR1EzTnpFd09EUXhOVEEzTlRaak1EazFOMkkwWkdFMU5tVmpOVFkyTmpVNE9Ua3daRGMzWkdZNU56SXlabVV6WkdJNE9EYzBNekVpTENKMFlXY2lPaUlpZlE9PQ==', 1728084137, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('oqVUqk1cESj5MTRNlBFjpQvClJ09Edfnj0ksZIIY', NULL, 'ZXlKcGRpSTZJa0ZsWm1aalRUTlZWRXN5ZG0xb1RXRjNObE53VDFFOVBTSXNJblpoYkhWbElqb2lSM050WWtGMFRqQlRaVlZrTWpKUlZGSkpVMGhCTmxOR1NURnVMMUprZGtzeVFTOTJhaXRHTkhVNGVrNVVRMHRtZWpCRVNHRkNOamg2TjFWeVIxVnBSVFZRYjBWdVFtOUpVREpGWW5OM0wzSlFOSFZyT0VaS2IwTkZUbWwyV2k4clRsTTNPSGMwYjFsT1NFNUZSVkZXTDNReVNteHpUR1JQYmt0aVpFNVlXWGRLY2xCR2NHSkVNMGgwYm1oYVp5OTRaV1ZOVDBsTFFXRXpZVVJDTmk5YVJXWnFTRTl3WkdoMmIweGpQU0lzSW0xaFl5STZJbVZsTW1ZME1URXlPVFkxTTJFeE5USXpZMlkzTVdZek9EZ3dPRGRpTUdRek1HUTNZMkpoT0RZMU1qUm1NelE0T1Rka00ySXpaRGsxWXpaa09XRmpPR01pTENKMFlXY2lPaUlpZlE9PQ==', 1728082904, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('rJOb8R6zYKNBDXz1nFOTyhI6u6SV3nDHg3RGO1Kg', NULL, 'ZXlKcGRpSTZJbE5TU0RabGJWY3lla05QYjNNelR6QlNkRzQzTDNjOVBTSXNJblpoYkhWbElqb2lkRmh2WlRsbFNuYzNSMkpoZG5OdlNVMUNRbGQ0UVcxbVNHRkhOR2hKY0hreWR6RjVjQ3M0YVVodlIyOUxjVlIwTVc5MlduZFpRMHBMYXpaRldqSnNVME5SY0hkR1FreHVOMnhrWm1kS1RFVnRTRFJwVG0xTmVHNUxOU3RVTUhGNmVFSlhaV2RMVG5wb2FWSjFhMjlhYzNORmVETlVORTFMUVRWRWQzSjBiMDFDY0hwNWFXVlJiRGxDV1VWemRVOXpaSE0xVUN0WlIycHFOM1pCU2tSVVdtTk9lbnBoY0dkVlREazRQU0lzSW0xaFl5STZJbVJtWkRBMU9EWTNNMk5rTlRsa1pUVTNaR013TXpnek5USmhPVGxrWTJVeU1XVTVNek0yWkRFeE5qUTVPR05pTVdZeFlXWTRPVEppWVRsak9ESmhOMlVpTENKMFlXY2lPaUlpZlE9PQ==', 1728082742, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('SVWjSHvWzII6ClyEHHvtjIV1AsCFHuw9vhSDihba', NULL, 'ZXlKcGRpSTZJblZrVTFObFR6WXZlbGRvZDFKUmMyUnFTMmhUT1VFOVBTSXNJblpoYkhWbElqb2llQzh2U0VwTGQyMVpXRWwwTlZwTVNrdGFabmxwZHpVMGVtSlVNVEpYZUhoNEx6WlRMM2hMVFZCVU5IRTNOVTF2YmxKTWRXazRWVnBTVW14NWJsSjNZM05HT1ZkT01XWnpWVTVGVGs1UWVsSlZNVll6VlVaSFpUUnFSREphTTJWMlRWVXJkM2hNUVVWVlduZHBlSEZUTlhkclUzVlVjakUwY25wVlZVcDFVa0YzUzNoWWJXVlRLM2xHTURCUGNYSm1ZamhVYUZKeFNtOVZkRkZvZFVSbmVUSlRTMlpQTlRCb01VVlZQU0lzSW0xaFl5STZJakkwTldNMVptTmlObVZpTjJKaVpqQXlNamhoTlRka1lUWTVOek5sWTJKa1ltWTJNR1E0TkRNNU1HWmtabVExTURZMFl6Y3pORFF3TjJVNE5qYzJPVGtpTENKMFlXY2lPaUlpZlE9PQ==', 1728084407, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('te4M2I35kVU2W1rKmWYbIjca4ZbbxEJ5lX5Vrx0f', NULL, 'ZXlKcGRpSTZJblppYWxCTFJ5c3pVa3h6Ykc0MGMxUXdaREZsVm5jOVBTSXNJblpoYkhWbElqb2lRV3AzV0ZKT1NsTXhWbEJKV2xJeFJuZFVRMEZ2WjNKUVdGZGlZbVZUTkV0d1ZHaFBkVTVCYVZSTE5rcHFiSHBOV1VkTkwyUnJSbkJWYzFveUwxSldVa0VyTjNCUlZuTnliMGR5VWpoM2NIY3JVM1F5VFdwM1pqUTBXREJEUlN0b2JXeEdhMU5LVFc1cFpucFhPVTVsWnpjMWJXMDBSWG92UXpsdWVIZGpOMjFITVRSVGNscGhSMmhvZFRSalJHaDFNekp2V1ZJclZFTjVjM013Vm5WS2RVYzBSM0JQZVhScmEwSjNQU0lzSW0xaFl5STZJakppWTJFNU5EQTROVFl6T0RjNE1UWmpPV1kzTWpneE9UZG1PREZrWmpabU16WTJZelk0TnpRMVlqSmtaR1V4WVRrMk5EVmlZV0U1WWpKbU5tWTBOVGtpTENKMFlXY2lPaUlpZlE9PQ==', 1728084461, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('VOh64sgn4MKig1uWep0l8ioknEgP2epXbCjVTYFO', NULL, 'ZXlKcGRpSTZJbGxsTlcxaVpWZ3ZUR2xVVUU0NU1uQkdabUZTYkhjOVBTSXNJblpoYkhWbElqb2lNVlpRZENzMU5ESmxlRmQzWkZGTFdEYzFXV2wzU2pndk5sSldXRUV3T0dvMlZFWlpOVTU1U0ZoU1UxTTRVREk0VDJaUVUybFFWa0YxT1RSMEwxWnlRM1psUTJRdmRIUXljMjFGVEdZNE1IZ3dXVVpNWjAxbFoyVktWU3RyWml0eFVXNXpTM05xWkZkWlpuazNiVU5wZGtsRU5VSnFUemRwTVRkbVFVaFFlRXhLZVRKekwzbDBUMjk0TmpsR1Rqa3pTSEJWTW14dWIyNXFSMEZNV0c1WWR5c3dhRTFCWVN0eVJYZHJQU0lzSW0xaFl5STZJbVJpTVdVMk16RmtOalUyTWpVek1qVmhNbVEyT0RrNFpqQXlaR1JsTURBNE5tRXdObVV4WXpFMU4yRmtaamc1WkdWaE16QTFNVGN4TTJZeFlXTXdNbVVpTENKMFlXY2lPaUlpZlE9PQ==', 1728084542, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('ynbKw9o6KtBirdSw6ni9OpKagsxiLwEykAA2BPds', NULL, 'ZXlKcGRpSTZJa1p2VVRaWmFHTkJOMmhVV1V4clYyRnRNV3BVVVhjOVBTSXNJblpoYkhWbElqb2lZbVpCVTJaM2FYZHlWMGM0VjNWd1JYaDFSa3hUVm1keVIzRk9WemhOTmxZM1oyMDRXbUpKYlRGeGFtMUtMMUpoUnpkaVQwVk5TMEo0TTBNeFRHaENZM3BXUlc5T1NsWXllRko2UTJaV1FuaHlaRmxMYVVOdFFXUnlOMjkxUjFWQ1kwSjZlSFI1YTBoNU5HdEVWVFZRUjJSTmVuTndUVlY1YVRkT05qRnVjWHBZYTA1cldIbDRjbEpRWVRsWVJ6QmFPV1ZDYldGU2VtTm9Sak5rYURST2VtaHViRFIyVVRObE9TdG5QU0lzSW0xaFl5STZJamd6TjJZM016TXhZV1JqTkRsa01EaG1ORGt4TVRJNVpEa3pZV1ZsTURKaE1tVXdNbUk0TmpJeE5UQXdNalE0TVRoa04yRTBZVEJtWkRRME5qYzVaamtpTENKMFlXY2lPaUlpZlE9PQ==', 1728084231, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
INSERT INTO `settings` (`id`) VALUES (1);
COMMIT;

-- ----------------------------
-- Table structure for shopping_cart_coupons
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_coupons`;
CREATE TABLE `shopping_cart_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` bigint unsigned NOT NULL,
  `coupon_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_cart_coupons_shopping_cart_id_foreign` (`shopping_cart_id`),
  KEY `shopping_cart_coupons_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `shopping_cart_coupons_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_cart_coupons_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shopping_cart_coupons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shopping_cart_product
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_product`;
CREATE TABLE `shopping_cart_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_cart_product_shopping_cart_id_foreign` (`shopping_cart_id`),
  KEY `shopping_cart_product_product_id_foreign` (`product_id`),
  CONSTRAINT `shopping_cart_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_cart_product_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shopping_cart_product
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shopping_carts
-- ----------------------------
DROP TABLE IF EXISTS `shopping_carts`;
CREATE TABLE `shopping_carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_carts_user_id_foreign` (`user_id`),
  KEY `shopping_carts_session_id_foreign` (`session_id`),
  CONSTRAINT `shopping_carts_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shopping_carts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shoppingcart_cargos
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart_cargos`;
CREATE TABLE `shoppingcart_cargos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` bigint unsigned NOT NULL,
  `cargo_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_cargos_shopping_cart_id_foreign` (`shopping_cart_id`),
  KEY `shoppingcart_cargos_cargo_id_foreign` (`cargo_id`),
  CONSTRAINT `shoppingcart_cargos_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shoppingcart_cargos_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shoppingcart_cargos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shoppingcart_delivery_addresses
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart_delivery_addresses`;
CREATE TABLE `shoppingcart_delivery_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` bigint unsigned NOT NULL,
  `address_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_office` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mersis_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopping_cart_id` (`shopping_cart_id`) USING BTREE,
  KEY `shoppingcart_delivery_addresses_address_id_foreign` (`address_id`),
  CONSTRAINT `shoppingcart_delivery_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shoppingcart_delivery_addresses_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shoppingcart_delivery_addresses
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shoppingcart_invoice_addresses
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart_invoice_addresses`;
CREATE TABLE `shoppingcart_invoice_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` bigint unsigned NOT NULL,
  `address_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_office` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mersis_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopping_cart_id` (`shopping_cart_id`) USING BTREE,
  KEY `shoppingcart_invoice_addresses_address_id_foreign` (`address_id`),
  CONSTRAINT `shoppingcart_invoice_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shoppingcart_invoice_addresses_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shoppingcart_invoice_addresses
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for store_cargos
-- ----------------------------
DROP TABLE IF EXISTS `store_cargos`;
CREATE TABLE `store_cargos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `cargo_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_cargos_store_id_foreign` (`store_id`),
  KEY `store_cargos_cargo_id_foreign` (`cargo_id`),
  CONSTRAINT `store_cargos_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `store_cargos_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of store_cargos
-- ----------------------------
BEGIN;
INSERT INTO `store_cargos` (`id`, `store_id`, `cargo_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for store_products
-- ----------------------------
DROP TABLE IF EXISTS `store_products`;
CREATE TABLE `store_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `stock` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of store_products
-- ----------------------------
BEGIN;
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (2, 1, 2, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (3, 1, 17, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (4, 1, 18, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (5, 1, 19, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (6, 1, 20, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (7, 1, 21, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (8, 1, 22, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (9, 1, 23, 1, NULL, NULL);
INSERT INTO `store_products` (`id`, `store_id`, `product_id`, `stock`, `created_at`, `updated_at`) VALUES (10, 2, 1, 5, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stores
-- ----------------------------
BEGIN;
INSERT INTO `stores` (`id`, `name`, `short_name`, `address`, `created_at`, `updated_at`) VALUES (1, 'Sultangazi', 'sgazi', 'İstanbul(Avrupa)', NULL, NULL);
INSERT INTO `stores` (`id`, `name`, `short_name`, `address`, `created_at`, `updated_at`) VALUES (2, 'Fatih', 'fatih', 'İstanbul(Avrupa)', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for taxes
-- ----------------------------
DROP TABLE IF EXISTS `taxes`;
CREATE TABLE `taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of taxes
-- ----------------------------
BEGIN;
INSERT INTO `taxes` (`id`, `amount`) VALUES (1, 20);
INSERT INTO `taxes` (`id`, `amount`) VALUES (3, 1);
COMMIT;

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `type` enum('personal','personal_company','company') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'personal',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_number` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_office` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mersis_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` int NOT NULL,
  `is_invoice_default` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
BEGIN;
INSERT INTO `user_addresses` (`id`, `title`, `user_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `is_default`, `is_invoice_default`, `created_at`, `updated_at`) VALUES (5, 'Ev', 1, 'personal', 'Çağdaş', 'Karabudak', NULL, NULL, NULL, NULL, NULL, '', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus emre 1392/3 4/1', '34260', 1, 0, '2024-09-21 12:33:29', '2024-09-28 07:44:55');
INSERT INTO `user_addresses` (`id`, `title`, `user_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `is_default`, `is_invoice_default`, `created_at`, `updated_at`) VALUES (7, 'Çağdaş Şahıs', 1, 'personal_company', 'Çağdaş', 'Karabudak', '32419110360', NULL, NULL, NULL, NULL, 'cagdaskarabudak@outlook.com', '5059991134', 'Türkiye', 'İstanbul', 'Sultangazi', 'Yunus Emre Mahallesi 1392/3 Sokak no:4 D:1 Sultangazi İstanbul TR34260', '34260', 0, 0, '2024-09-28 07:13:23', '2024-09-28 07:44:55');
INSERT INTO `user_addresses` (`id`, `title`, `user_id`, `type`, `first_name`, `last_name`, `ID_number`, `company_name`, `tax_office`, `tax_number`, `mersis_number`, `email`, `phone`, `country`, `city`, `district`, `address`, `postal_code`, `is_default`, `is_invoice_default`, `created_at`, `updated_at`) VALUES (8, 'ALPAGU DEVELOPMENT', 1, 'company', 'Çağdaş', 'Karabudak', NULL, 'Alpagu Development Bilişim Yazılım A.Ş.', 'Küçükköy V.D.', '764901353261262616163131', '1365316136146416111111', 'alpagudevelopment@gmail.com', '5325191134', 'Türkiye', 'İstanbul', 'Beşiktaş', 'Levent Mahallesi Levent Loft Kat:30 Ofis:52 TR34260', '34260', 0, 1, '2024-09-28 07:15:09', '2024-09-28 07:44:53');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint unsigned NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_avatar_unique` (`avatar`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `avatar`) VALUES (1, 'Çağdaş', 'Karabudak', 'cagdaskarabudak@outlook.com', 'cagdaskarabudak', '5059991134', '$2y$12$SL.SMAquLYJwI/tzE7aEd.wmm7qaicrAtinzM4GH6ixW/BKvVNEXq', 1, '2024-08-05 09:28:57', '2024-09-21 10:23:37', 'avatars/hPNJD0PnAg02YsCKsQOdWNblTanD2afM2TZVQmvn.jpg');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `avatar`) VALUES (3, 'Deneme', 'User', 'deneme@deneme.com', 'denemeuser', '5050000000', '$2y$12$V24R7umC9vnuEsEzVNtbneaCaaY/aET0VPYxIR3rCZBCUlO65hqZO', 2, '2024-08-05 16:13:38', '2024-08-05 16:13:38', NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `avatar`) VALUES (4, 'çağdaş', 'kkkkk', 'cagdas@cagdas.com', 'CAGDASKK', '5559991134', '$2y$12$D5GZxmuzonrDUEqpbh2BZeOOIDXlFiWSqBym8tDKeORT.ft05yJBG', 2, '2024-09-17 13:04:18', '2024-09-17 13:04:18', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
