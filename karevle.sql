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

 Date: 04/10/2024 08:26:06
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('5fuAi395VlaK2nr7M4Q1PP9vK2bFNhKFCrSsCOMn', NULL, 'ZXlKcGRpSTZJalZaTVdWTVFWbFFjemhXZVhoUFZUQklaRzgyZG5jOVBTSXNJblpoYkhWbElqb2lNVTB5YUhCWFFtWXpWRVJQWTBkdlVWY3pWbVJMUVRoaGNGVlNUMmhhVW13cmFGY3dOR281WkdSVFEzcE5iVTFQZUdsWWNsTnFSMWhsTnpWSVFWaE5PWGd5WVVaS1UyMHJUV1JRTkZrMGJreG9lWGRhVEZsNFMwTXlWM0JGVkdOWE1Dc3dWelpwWjJKR2RqZDFTMnRhUVhkT01HOUpSMjlyWVU5cmNHMXJkMmxMYUROVlptUk9lVGxSYkZCMFEyOUtLMUl4UkVKNk0yMU9UMnhHTDA0cmJXTXlMMW8yY1UxcVVEQlJQU0lzSW0xaFl5STZJalV5TnpNeVlXTXpOemcxT1dRMlltVmhNVGsyWldKbE1qazFNelkyT0RZd1kyTXhNREJqWVRVellXTmtaVGRoTUdaa1ptRTBOV1V6TW1Nd05UQm1ZVEVpTENKMFlXY2lPaUlpZlE9PQ==', 1728016112, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('8MTm9o9Nd9SlYD0cJzKG1uD4Tf3Gb9MiDG7kaWqb', NULL, 'ZXlKcGRpSTZJbkZNTTBaVlRqSlZibXQyWWpkaFVVRnFaVVJ5ZEhjOVBTSXNJblpoYkhWbElqb2lVMU5YVURZd05ucFNibHBtTUZodWJFOXZSVXBGUjNabkwwRnlXbXBZTXlzeVUyYzRTQ3Q1ZUVkdWNWRlFVbVpXTlRSU1RtZEdTbGhaZWpOMGVVNXJjbVZ6WTNwU0wxaG5ORzgzUWxad1NqRlhSemQ2ZEZBM1ltRXpVelpqVjFFeWNrdEthU3RvVVZkWlYyTnlXRkI1Y25oRFQzZE1TalJXVWxSSFVXNUJXbm8xZUVoelRtUTNXSFpvU2tjMmRrZHJOMFZwWVhGbWRrWlphVGx5VFZNelQyeERjSEpJVURkV1luUlZQU0lzSW0xaFl5STZJbVZoWW1NNFpERm1aVFprWXpobE1USTNZMlF4TmpCbFlXTXpaamxtWmpGbVpUQXlOMlF5Wmpsa09EaG1NREpqWlRWbVpEUmpObUl5WTJZeFpEWTJPV0VpTENKMFlXY2lPaUlpZlE9PQ==', 1728018570, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('9iHoaFrp79O3SoFsqcGvUnTuY2dKSt91xawjZ2Xn', NULL, 'ZXlKcGRpSTZJazA0VjJSTlJtOTRPSE5hZGpsdVptMVlhRlZvVmtFOVBTSXNJblpoYkhWbElqb2lOQzluTTFwM2F6aHhSSFo2UldRMGVrY3pOMEZLZFZSYVNtbHFiWFYzTlZvM2VqRTVhbU50UkdSR1dFaDJUbkJCY1ZsR2NreDZVSEJ0ZUd0cmMwdEJZekJLTmt3eWNFZHZSMWxWV205UVFYWkdTMGM0T1hscFZtaHhLM2x1V1hoTlRqQlVOR2c0WkdKMFJEWlBiRkpxYkVZMFNYUklkWGRCV0c4eFUzWkJUMDlQU1RsRVJ6ZENWMkpTWmtoVllqZDFUbnB3YkRoME1tWlVSSEp0VEZOc2RERmhSRVF4TlhGSlQwcFpQU0lzSW0xaFl5STZJamMyTnpGbU5qbGpaVEEwWVRRM056a3dZMll6TkROaE9XVmxaR1JqTXpKak1EaGhOVE5qWVRVNU9USmpObVUyT1RCbFptWXdPVEUwTVdKa05UVTVPV01pTENKMFlXY2lPaUlpZlE9PQ==', 1728017444, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('A02LhB4DhrBl9h0Q1isrZGXPTbb9KsOBLYgUsEQD', NULL, 'ZXlKcGRpSTZJbVV4TUVwclVsRlRiVU5YY0dnclNIVmFSbkY0U1ZFOVBTSXNJblpoYkhWbElqb2lhREk0VTB0RlIyZFpSVE5ZWkdSVmEzaHFOelkxYVV4Mk9XTmpUazl0V1U1eWNGSnJWVVZsTTFKUVYwVlpWbTVGTjJWbFNHcFJXSFl3VFVWdWExRkpZVlF4TlVzMWVsRm5jelZGSzNoVlpGZFlTMjlPZFVKT1RYZ3lTRTFGU0ZGeVpFeDFaVTAxWlZkR1ZscDJWaTkwWldoNVJsVkdUak5FTjFsemVqaHhaWEZ3TjBOdVRqWkhVRGMyZGpsM1RUbEpWelF6ZGpCUWVIZGhZMFZQU2pCcWVERkhXWHBtYW5aU1NVeEZQU0lzSW0xaFl5STZJbUptTURFeE1HTmlZalV5TW1RMlpEY3lNR0poWlRsbFpUUXpOakkyWW1NeU1qTTBabUZpTkRsaU4yUmhZell4WTJJMU1qWmlOemxtTW1SaFpHUm1aV01pTENKMFlXY2lPaUlpZlE9PQ==', 1728019235, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('BMfVrXn1GNc3cL6tqFnnwRixHHhqXmndvaypaoiR', NULL, 'ZXlKcGRpSTZJazl3VlhJdk15OHhVVTB5TlhjNWVWaFZXV05pY25jOVBTSXNJblpoYkhWbElqb2lkelo2TVVFeE1VNVlXWEpGY2tSamNVUkZVblIzZDFWaFozVllVelpPYTFsT1Z6UjVlbFUyZVd4RmExTlFaa1ZEU1M5cGJGTnVjak5CUVdWWU5qa3pRVTgwU1ROa2NUZEdkMFJyVTNNeVIzazRTVlpsVFVwdU9WbDNZMlU0ZDBkblZqUk5ka0pMWkdGcU5EaHhOVWxJV0ZOeFEwUlhiRXRZYkVOMWVXbHlXSGhpZGxkT016VkNUbUV6TlhGcWFVbGFkbUZsTUhWME5HcDNOVWRpYW1oTU1EWTFRM0prS3pCMlozVkpQU0lzSW0xaFl5STZJalZtT0dWbU4yUTROak0wTWpkalpXTmlZVEV6WlRCaU5XWTVZV1ppT1dJMFlqQXpOMlJpTWpVeU5EZzNaVFJsWWpreFlqRXpPREJpTnpRM1pqWTVNemtpTENKMFlXY2lPaUlpZlE9PQ==', 1728018638, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('DAEzZkqUYGLzVLGZCMhkjzQk1hrWyNwlI7WCyjlA', NULL, 'ZXlKcGRpSTZJbWhvUWpKemRXOURSVVJLTWxSYWNtOVVURXRqTm1jOVBTSXNJblpoYkhWbElqb2lUMHBGVVc5c1NqZ3dSM3BSYmpoSFRWQkpWMjVHYkZWeVRUVklZMXBGUkVGWFUxQjRkR2xTVG5seU9GaEZiVmQzTVRaU05uWjVaMkp2UmpKM1NUQkJTVWRSWTNkUWFrWklhREZUYUd4RGIycHhRMWRGWTBWa05GbGlTQzhyYVdNNWJpOWtiV2ROU0ZKS1p6RnBOWFJEU2xCcFMzYzRXRElyUkdWQlJuRXlPRFpLZGxJd2MzWTJZbHBFU3pZNVN6TktWemN4Y1dRMldFMUZjRU13Yms4eGRTODJheTlNZUdSeFRrcHZQU0lzSW0xaFl5STZJbUU1TkdFeFptVm1OelJtT1dFNU1UZzNObUV4WW1Vek1qTTJOekJoWTJZMU16ZzJNek0zWTJJeFlqTTNZelprWldZek5UUXpaRGxtWkRWbE5tRm1OakFpTENKMFlXY2lPaUlpZlE9PQ==', 1728007834, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('ePoJ7OZ1PcISIQaVUSU3ToSU3AKeRhX088itbADt', NULL, 'ZXlKcGRpSTZJazlxZUd0cFJITXpaRXRqZUhGQ1prOWlabkJITUhjOVBTSXNJblpoYkhWbElqb2lXbU5VVTIxRWNFNXpVWFJ3Vmt4S1YzaDBkMWRsY2xSVlQzaG1aalpqT1VwSlNWRkJhRWxsYW5WVlZqSllOMDl0TldGR2NYQkhURFp6VUZsUGEwVldUa1l3Y1hjNWF6SlVaVWhhY1VKSFJqZDJiSGhaVERkRmRtVkplakpJVFM4MVZsSkVWVkkzUTBWU1NWVnRWMEUxVFV3MFdFSjJUMVF3VUVWMllTdHRWSEZhZVhKNFpYQktVVmhhY3pjNU9WTXdTM0ZRVVZoeE1VRnpObUpMWVdsdU4za3hOM1phWkM5cVRIUlpQU0lzSW0xaFl5STZJalkwT0dVNE1XUXpPREZoTjJZd05HWmhNelV5WldGaE1UY3pZV1U0TVRJeU5tVXhNelZtWkRWalpHRTJPV016T1RkalpqRTVZVEE1WWpGaU5HSmpOV1FpTENKMFlXY2lPaUlpZlE9PQ==', 1728019187, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('GBCoW1F3dq3cSirJUb3OJv72NgXwN86lSuQLWDsF', NULL, 'ZXlKcGRpSTZJbXB6VVc0eksyRm9Na3hGYUdGME4wTk1ZbUZWTDFFOVBTSXNJblpoYkhWbElqb2lhVnBtZDBwTlVqbGFOMU56TDJONVpsWnhiRmh5TVdkeVlVeG1WSEZwT1hOck5YRnNNREZDVG5kR05VOXBVazlQUm1ZNFltZERXV2N3Y0RkeVZsRXlkWFppWjJSd0wySldSV1UyYW1wU2RqSllWRXgyZUVVMk5IQllSbVF4WTI1Q2RGQk5TbVUyZDI5SGNUTktjRkJEVUVab2RIcGhVa1JFUkRKT1owazJVMUZ3V1ZKS1ZWUndRM0pqV0ZaT1NuZFdTVXA1VW5ReFNtbDZTemRRWnpKRVJEbEVOakpTTmpJeFpsQm5QU0lzSW0xaFl5STZJakUzWkdKaU1HWTJZV0ZpWmpRMFpqaGlNbUV3WkRsbE5ESTRaRFl4TXpOa01qYzNNbUUxTURFNFl6WTNNRFEzWVdGbE5qUTNaRE13TURkallXWmxOMllpTENKMFlXY2lPaUlpZlE9PQ==', 1728018325, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('kzppL9sKJVumhmfatiBekZuyu2UpZuAIDrOG4xs3', 1, 'ZXlKcGRpSTZJa0l6WjFCS0wyMVNTREF2UWpkSmIxTlphMWQwT0djOVBTSXNJblpoYkhWbElqb2lNMnRVWjNkcVpHaG5la3AwZWs1cVEyMHlNSFZpVVVOeFJXaDFRblZ2VWs5d1NERm9ZemxrWVVsSFltRjRkRWRJYzJwUlVISTVRMGhrTUcxd1MwaG1LeXQ0UXpSdFVTOTFSSEE0VTJSNFZVOUVSRGhoYWtKMmNuUjRaaXQ0WkVaMFozSTVSbHBDZVc1UVZETkhWVzVRTVZoT1dHOTZXVGM0V0VsaE5ESTBiRVprUkcxM09FNTBkVTl1WW5OWFRHNUdTRGx4YVRGaU9GQnJkV2REYXpkR1RYVmhkVFUzTW1GbllVRkxWVE56YjBodmQxZHlRMjl2YkVGMlJHY3JkWEpVYnlzeUswOHljVXBuZVdzeGNtcFdhMFYwVFhGNVVHTXliSGt6WTAxSFdWQTVhbWhVVWtWb2JYVjNlWFppTWxwUGFHWmFRWFV4Um10QlJuVllTbVJ0ZDNadUx6TkJPV1pYVGtkSlZWSk5WSEYxUVVWWk4yeDJaMkYzUW5GaU9XTXlTSFptZWtab1dUTmtNMWxUTVRkME1qTkRjMDVyYUU1alVucDRabE5xYm5Sc2FUUm5WV2xDV25VMFpIaG1RblpuVUU1UVlUZHlTRTV5WlRkeU1Ha3ZUM2M1Tm1kdmRuRmhWMU5sZEhReFRFeGxPRVJNYW14UGJHNUdZa1JTYTJKMElpd2liV0ZqSWpvaU9HTmlNMk5rWm1VeFlXWTRZVEpqTm1Nell6SXpNRE0yWWpWalpEZGxNREl4T0RFd09EVTFZekUzWVRnMFl6WXlPR05qWWpsaE1qYzJOREkxTlRsbU9DSXNJblJoWnlJNklpSjk=', 1728019413, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('LhamHvreI0JU8hQkK1EBZ7Fp7H3RzBLrhBZw1wDR', NULL, 'ZXlKcGRpSTZJa3A2TDJvNVdFTk9PSEZPVFdOaFkzZ3JiMFkwUTBFOVBTSXNJblpoYkhWbElqb2lOVXBDYWsxMFNtMWpkbVIxUWtONVVDczJWR2RZUm1kTmJrcG5jV1J6VjNOSVlYTXJOWGMwUWxCM0wwRjBWbWxVYm5OT2VGcFhkVXhIWkVobllXdGljMmRXWmxVMmFERTJkRkZoUzBFelJEVmFSVVZOWWtKVk5VMTZlbTFWYWtSR1lXSkNjM1ZaY1had2JFdzRjRnBZVHpCTFJEVm1ZVmRJY3pKVE9DOUllR0ZRVnpGeVYwcFhRekJpU0ZoQ1pqZGlTbTlVZDNBclJ5dDJjV2x0TDJjM1Rrd3hkR3BFZFdwTVJHZDNQU0lzSW0xaFl5STZJamszTlRCbVptRTBZamd4WXpZd01UUTFZMlV4TjJSbVpUSTRZelV3TVROaE5UWmtPV1U1TXpNNU1qQXpPR0UzWVRjME9HVXlabVl5TURBeE16STROamNpTENKMFlXY2lPaUlpZlE9PQ==', 1728018585, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('Lrtnmxz9roqoSLFHKMSX8v0LejkAEODZcSGDrg2F', NULL, 'ZXlKcGRpSTZJbFZoUm1kVE15OTFiRU41UlZCSFdGTndNMU41SzJjOVBTSXNJblpoYkhWbElqb2lPRU5yVjJFeFNtZFRXRFJKZEVaTllUWjNhVTVRUlhaUVNVUllTRU5FTHk4MVprcHJlalpsWTJVeEszazVORWRpWjNNNFkwdERiVlJ3UnpCR09YQjVOa3g0V1dkRVFqWTRZek5hU2pCaFdFWkxSREowYjFjeUsyUlphRFJKTTJaS1pGQkJTakprUTJobFRFSnZPVkl3TkhoRlRVbHBjbEpvVkVoYVRXVndObTVhY1d0TmIySjFVbk5CZG5SclZHaENja0pLT0hCU2FUUjFjak5tUTFKM01YaFdiRXBCYVVoRlF6VlZQU0lzSW0xaFl5STZJbU0zTlRGaU1HUXpORGd3TldJME9HUTFObVEwWXpBek4ySTBORGRpWW1FeVpHRmpaV1U0WWpNMlpXTXlPVEl4TnpobFptRXpZVEJoTURabU9HSmpOR1FpTENKMFlXY2lPaUlpZlE9PQ==', 1728016189, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('nQj84d9eHabt4Mp6tvg6gSAxubXqitA82h8Ub77Q', NULL, 'ZXlKcGRpSTZJbWxVUlRkUmMyWkNZVk5QV1ZaRU1qQlhhM3BhTTJjOVBTSXNJblpoYkhWbElqb2lLMWMxYUU1UlpVSXdiV3hYVnpCSGIydFZVak51V21Oa1JuRm5WMkYzYWtrMFowODRPVFpyY0hnM1VWZzFNSFppUldWNldHd3ZSakl6V2xWQ1RtNXpWblJ2Y2pkMVYzVjVkRFJNY3l0TEwydEtTRE5FWTNOc1MwdHJkR2w1U1V4aFJFZGlXSFpGYkVOV1FWSktLM2RhZFhoYVJUWXdRVFpPVldoM1pWRnJia1pvYzBzMllWVnZNamhxV1VGaFJUVjRTV2cxTDBKTGJtazFUM1ZSYm1aVU1IVkNUR3BCU2pNMVNVSlJQU0lzSW0xaFl5STZJakptWVRSbFpUWTBObUpsWTJObU9HWmlNREk1WTJSaFpHWmtZalprTlRSak9EQmpaR1UwTVRZd016UTRaRFZrTm1ObE56ZzJOR0kwWVRNek9UYzFNamNpTENKMFlXY2lPaUlpZlE9PQ==', 1728018623, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('QOobBud8TDeuzobkzc2De2L6ww6s1DxuD20YwpBc', NULL, 'ZXlKcGRpSTZJbFZEYVZGd2JFZHlRblpFZEUxVGIzSklNR0ZOT1VFOVBTSXNJblpoYkhWbElqb2lLMFI2VGxGUmRUUlhjMngzU2pKS1ZXSk1kbXBWVWxCdVRXdExlRVVyYkRoNlMxTXpXVXRvYUU1SVVrcDVTemRZWm5BM01HVk1XWEVyYjNoVmRsTXZkMnA0U2sxbE5IZ3lZV2x4YTBaamRIZGFWRGhoUjJrMmIzQkdLMVExVFVZd05WTnpWblpwY21rMVYzcFBkamwzYldnM1UydFFhbkJaWjIxdFFWWjVZamswYUdVck1WaEROSE0zYlhORGRsZ3JjelZSV1VaWGNFOUZNMVpZZEV3eGNVZFlLMUl6VG1OSllqRjNQU0lzSW0xaFl5STZJalE1TldObE16azRNREF6TkdOaE56STRPR0ZrWmpNeE9UazBOemN3WkRnNVpUUTFNRGhpTXpjeE5tTm1aREV5WVRkak56Y3pZVFV6Wm1Kall6WmtOV0VpTENKMFlXY2lPaUlpZlE9PQ==', 1728018045, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('qQJREr04pJjqYp23MCrBk2F6rgxgJjaCWl1CY4EH', NULL, 'ZXlKcGRpSTZJbXBITVV0SWRHVmpWeXQwZEdOWk5WQlBPSFo1ZFdjOVBTSXNJblpoYkhWbElqb2lZa1UyZG5ocWFrMXBSemx3YlVsNVNGSlpXSGszVW5KVFkxVjFWRWxHWm14UllXVkRPRGRrZURGU2NXaE1UWEJSTVZNeWNGQk9UM2RUZWpkRVlsZFJWVGhQVUZkdWFFTk5VWEpMTTFSclNITldablIyTUhkd2RpOUdTbkp1UjBOemJWTkpNR0kzTkNzcmNFdFFOM05GYjFseVUxSnJZbVF5Y3pVd1dtUXpSR3BKWmtReFQxVkRNVmhWYVhkV0wxVTRhRXR0VGtGR1FucE5jbTl2Y25obEsweDFhRzAxUmxONVlXSkpQU0lzSW0xaFl5STZJamsyWXpjek9HTXhNbVJqTWpjM01Ea3hNVE15TVdGak1UVTVaRGcyT0RJelpqVTVaak5pT1RJM01qazNaV1V3TUdaaVlUY3labU5oWmpCak1tTTBOamdpTENKMFlXY2lPaUlpZlE9PQ==', 1728019165, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('S9pybrxSz17j8KYRQdUXfDUIdlhZ9jjJyPvR7fvD', NULL, 'ZXlKcGRpSTZJalV6UW5OSU5uTXhlRmg1TVVwc1MzSjFNa2hVTUZFOVBTSXNJblpoYkhWbElqb2lRMDlOU1ZaUmNHTlFjbk5ZVUZaNFdUVlZUVzVzTnpZemF6RnFlRXQ1U0ZvMWQxbHJPRkY0ZDBSbmVWTTJhR1oyY1ZZd1luZElRbmxpZWpkblFWcERObFpDY0ZWdlpIWkNZVEYwYkZodmFGbzBOVEI0VW1aRlEzZFRTRWg1ZDFsSWFHUldNV1JXUkN0TlFUUjNVbEpyU25acE5qUllZMVpaVWxaUlptaFBlWGd2T0Zad2NuRm1ia3g1ZUhWMWRtNXpVRWgyTWtocVYyRTVWQ3REU0VFdlJYQnNSVFIwUnpkcWNEUm5QU0lzSW0xaFl5STZJakZtTm1NNE1qRmpaR0UxTnpReFlUa3hNRFZpTkRrMU4yVTVaVGMxTW1Nd01UYzNPVFkxWW1NM01qa3lNR1l5TUdJME9ESXhNakEyTXpjMlpHWTBNamtpTENKMFlXY2lPaUlpZlE9PQ==', 1728016160, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('STbA7eRQdq9MgJiuA9Jq47yTRDt0I6N6gNuBNgkw', NULL, 'ZXlKcGRpSTZJa1ZKVWpsVVVrc3ZjVEZ6WVVrMFVuVmFSVTVvVmxFOVBTSXNJblpoYkhWbElqb2lNbkJIYW1WNlZHRXdiRkJPUm14V04wUlpkRmR3Tld3MlMyaEhVVk0xYzFReFYwVkxWMWhFYWxoV05raFBkMjFLY3pWT04yZE9PVWgzVjJJNFduZDBkVGx1TUc1NVFYUXdibEJuVEZsNFMwMUdSV1ZvU0ZZeVZXbGtVM0psWTNsQlVtbGpkRFpzZGxBeFdWSldkM1p5VTJWbVZWSkVhbTQ0YkZneVVtZEZaMGhDSzBSRFlqWmpTRll6ZW1scFNHbFZWVEpXYUUwd01HeFljME5FTnpaamR6RnJRa3cyY1hwV1oycEJQU0lzSW0xaFl5STZJbUppTkdNeE5UbGtZbVptTVRFMk1XWTFaamN3TkRrMU5XWTVNbU5oWXpkak9HTTFNVEk1T1RnM1pUTmlaREkyWW1JMVpESTNaR0U1WVRReFkyVTBZVFVpTENKMFlXY2lPaUlpZlE9PQ==', 1728018115, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('SZyjc8A9xcH93ON1Tx7knDlWfgIG5fmPS1j5WB1H', NULL, 'ZXlKcGRpSTZJbFZwWlRORFNIRXhUMmR3Ulc1blUyZE5NV2hITW1jOVBTSXNJblpoYkhWbElqb2lZalZhWlZkeWVXUkliVXh5YVhJM1owVnJOMEpuUVZocE5sb3JaRzlQZHpaSWJEQnpUMVJCTnk4d2NEbENWRk5zTVhaWmRqSnJWbkZzVDIwelJYQXJZek5JTkVrMFlsZ3djSEZCWTJwV2FtSkljMVZZSzFWcWRFdHRaalJFYmpKTWVpdEVPRGR6Y0c1M1RtVjJkVGQ2Ym1SMk1tOVNkVzlDVGtjMmFHMXdXRlJvYjJaR1pVYzJhMEpPTWxwYVVHTkxVa1ZZZVdKMFJ6RnhUVkowV0U0elEyRjNVbEV4U25oMlVGbG5QU0lzSW0xaFl5STZJamhtWlRRNU5XSTVZVE5qTkRZMk16TTJNelUxWm1JNU1UbGxZekJoWWpRM01ESmpPRE0wWVdKaU5qWXhZamxqTUdOa01XWTFOMlF5WlRKaE5qRmxNRGNpTENKMFlXY2lPaUlpZlE9PQ==', 1728016905, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('ucMyW0rTOUut1iX88GR8cNn1AdnAefyVjP98h1q0', NULL, 'ZXlKcGRpSTZJbWgxWTJScE5ubE9ZM0pXWVRkcVQzTnJUMXBwVDFFOVBTSXNJblpoYkhWbElqb2lNQzgwT1VwTmNXaDFSbUZFV2poTlFXeDVSblV2Y2s1eloxQnJPVlpuU1hWWlREaEdaRmRMYlVKb05HWmxiMEprVkRRdmVsbHdjMXBEY0hCak56RmtWR3BYVTJGTGMzRlVZVFJHWVc1MGVtbHVZbTQ1UWpWUk4wOTZSSGxyUlc0eFZsSjVOa292VlU1aGJWbExiM1F3ZDFWRU4zUjVTMnhyU1haSmEweG1NMjVyVFhSTFMyUnRURTVCYWs0M0swdHpjSGgxYjNFcmNFNXVUV3BKYTJwcE1pOU9USFpNVEVKWmIxaHZQU0lzSW0xaFl5STZJamsyTVdVNU1XUXlaRE14WVRrMU9XVmhaREkzTnpJME9XWXpNV1F6T0dObE5qQTFaalUwTlRFM01HSmhOVGxpWW1aaE56TmxaalJrTkdWak1XVmhNRFFpTENKMFlXY2lPaUlpZlE9PQ==', 1728015728, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('UKRQgrSJb0uqkc9K9gHHzrm3uh7zzjazArbgut4F', NULL, 'ZXlKcGRpSTZJakk0YzBOWGRVOXNSbU5QTlRkTGFFNDVUbVlyYm5jOVBTSXNJblpoYkhWbElqb2llV2hOZUdONk5WSTJWRUZLY2xGbWJHTkZRVlZYU1V4RGFVeGhNRThyUVdGeE9XMUNTemt3Vm1rNVlYQndiMmhzV1ZWakswUjBaMEUxZVV0MGFWSkJVMGxwTUhwVWFFcExTbUZvVm1SRFJrMTZSelJoZFhoWk5XYzFOSGxFVDAxRFNFeHNUa2hPT0hOMGMwUlhSVXc0Ym1OYVpERnpVRXhMTmtaclRsVkxhekZSUkZCWVVHZFNka2d6YTJkTVdXSjRVaXRPY0RWaGFsUjNRMkY2SzNReFdYVnJjRVpVVUdGUmNVdzBQU0lzSW0xaFl5STZJamN3TVdaa01UQmpOemhrTTJaa01tWmtOekE1TldSak5qQXdNalV6WmpneE9HWmhNVEExTkRVMVpqSmhORGc1WldNMU5EUTFZVGxoWm1ObU5UWTJNallpTENKMFlXY2lPaUlpZlE9PQ==', 1728017125, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('wcLMqYtk5C8dXm2MjIzW8QAiTyNadxxXBPGwUAip', NULL, 'ZXlKcGRpSTZJakpHYzBJNUsxbElWVVJ6UkUxSGNWQk9VbHBKZUZFOVBTSXNJblpoYkhWbElqb2lUR0p6SzJkWUwwVXlSVUpJVlVWbmRUWjRaM2hHTUZVelNqUXlUblpwZDJWd1N6SnBURFZpVFhSaGRFRkliMDl6UkhKaU9DdDZPVlJwUkU5c1JpdHNNbkpNZVc5UWNWSldVUzl5UTA5QlRIRlROVzlxYWxwWU9IRXhaRXBqT1RGUE5EbGtkMFZoVmpBdlF6ZFRkVTVqZDA1dldHcHlUSFpRVjA1WFIxcE1OSHBXUml0NlpuRlZWbFpyU0dFMmRsTjBVbE5sYVZsblJYUXdWV0UyT0dWa1VtdEROa1ZFWkRkWk1FUTBQU0lzSW0xaFl5STZJbVE0WVRnMU5qTTBaREF3TnpFM05tRTNNV1kwTUdZeFlUaGtZalUzTlRBMU1qQXdaVEl5WldWbE5URTROemczWm1Nek5tTTJNR0l5WmpCbU1HTXdObUVpTENKMFlXY2lPaUlpZlE9PQ==', 1728019058, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('XEQhedSc9g2sRBI8hbboX4Y89MUpqRmlGfSPor9n', NULL, 'ZXlKcGRpSTZJamhMU1V0U1ZEbFJXa3BzVGxjNU1HdGtRbTQyYzFFOVBTSXNJblpoYkhWbElqb2liemhXWTNKWmFXaERZakJ3ZEZkSFpXZFpaVWs1VUVkMldqTnZabmx6YTJKWVZFNVFNa0kyTW1zeGNWbGFXRlJPU210MlVrMU9WVFowUVZwVEsyNVZaMXBITTNCTFVHaHdaamgxTTNaclZWUm9SVE5uT0VOUFRrbHBNMjVJTlVkbU4wUjRMMGx5ZFRsUFowSXhhbXBJYmtONGFuRnlhM3AyVVVJNFQzbHdOMHgyTW5KRWVYaDJPV054ZDJKclJEQjZTR3NyWjFWamFsbFRUSHBMVlhKSVIyTjJNa1kzUmxWUlFXOUZQU0lzSW0xaFl5STZJamhtTmpZelkyVXlaamc0TXpjelpHVTVNbVV5Tmpnd09UQmxOVEpqTlRBNVlXRmhZams1TlRVek16VTNaakZtWmpVMFpUWmpZV1F4WkRreFlqWTJZamtpTENKMFlXY2lPaUlpZlE9PQ==', 1728009272, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('ZDBF3NNfLUhJIW7FV5y7Za8p1WkrmLYmXWm0DmjA', NULL, 'ZXlKcGRpSTZJbGRFUlVoWE5ETTNXa05HZGtKSlRGWkVVM2xzZUhjOVBTSXNJblpoYkhWbElqb2ljRzlyYTJaNlprcG5SeXQ2UTJ0VmRVazFTM2xQUWxaeVVVVndiREp3YTJWUVV6SnpWRzVVTW1SUFkwNHlkVVUzTUdKWmRDc3JWREpwU1VacVZtSklaRlUxZDI1WGFHTkxMMDFvYkM4d2RXTTFWR2RLVlZvelducGhPRXBwV0RGa1ZVNHZOekZZTjNjNWRrMXdVSEZFWjJoM1ptRmpTak50YW5KWFp5dE5URkZWV21WcFV6Sk1hWGxrYWk5WVNXdGFVblZaUlROck1HUTRka2swTjA5U1NteFJhazFuY0VjelUxRkpQU0lzSW0xaFl5STZJbVExWm1RNVlqVmxNMkV3WWpFNVptUXdPVFEwWmpKak5qWmhNMlkxTVRJNE5XRTJZakZsTm1VNU5tSTJPR1F5WVRJM09EZ3laakUzTmpVd1lUVmhaR0lpTENKMFlXY2lPaUlpZlE9PQ==', 1728017068, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shopping_carts
-- ----------------------------
BEGIN;
INSERT INTO `shopping_carts` (`id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES (40, 1, NULL, '2024-10-04 08:22:13', '2024-10-04 08:22:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shoppingcart_cargos
-- ----------------------------
BEGIN;
INSERT INTO `shoppingcart_cargos` (`id`, `shopping_cart_id`, `cargo_id`, `created_at`, `updated_at`) VALUES (5, 40, 1, '2024-10-04 08:22:13', '2024-10-04 08:22:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
