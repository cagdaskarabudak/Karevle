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

 Date: 19/09/2024 17:01:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
COMMIT;

-- ----------------------------
-- Table structure for comment_images
-- ----------------------------
DROP TABLE IF EXISTS `comment_images`;
CREATE TABLE `comment_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_images_comment_id_foreign` (`comment_id`),
  CONSTRAINT `comment_images_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `product_comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comment_images
-- ----------------------------
BEGIN;
INSERT INTO `comment_images` (`id`, `comment_id`, `name`, `created_at`, `updated_at`) VALUES (1, 1, 'comimage2.webp', NULL, NULL);
INSERT INTO `comment_images` (`id`, `comment_id`, `name`, `created_at`, `updated_at`) VALUES (2, 6, 'comimage1.webp', NULL, NULL);
INSERT INTO `comment_images` (`id`, `comment_id`, `name`, `created_at`, `updated_at`) VALUES (7, 7, 'comimage4.webp', NULL, NULL);
INSERT INTO `comment_images` (`id`, `comment_id`, `name`, `created_at`, `updated_at`) VALUES (8, 8, 'comimage3.webp', NULL, NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_users
-- ----------------------------
BEGIN;
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
  `expiration_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupons
-- ----------------------------
BEGIN;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of favorited_products
-- ----------------------------
BEGIN;
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (60, 2, 1, '2024-09-19 00:10:56', '2024-09-19 00:10:56');
INSERT INTO `favorited_products` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES (62, 1, 1, '2024-09-19 00:11:06', '2024-09-19 00:11:06');
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
INSERT INTO `lists` (`id`, `name`, `slug`, `short_name`, `sort`, `icon`, `color`, `created_at`, `updated_at`) VALUES (2, 'İndirimli Ürünler', 'indirimli-urunler', 'İndirim', 3, 'fa-tag', 'warning', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2024_08_07_134038_create_products_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2024_08_07_134157_create_product_images_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2024_08_07_134444_create_product_contents_table', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2024_08_07_141510_create_product_comments_table', 3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2024_08_07_141845_create_comment_images_table', 3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2024_08_07_210630_create_categories_table', 4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2024_08_07_212737_create_lists_table', 5);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2024_08_07_210824_create_products_and_lists_table', 6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2024_08_11_103917_create_sliders_table', 7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2024_08_11_132824_create_sessions_table', 8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2024_08_11_133609_create_user_baskets_table', 9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2024_08_12_134638_create_favorited_products_table', 10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15, '2024_08_15_003635_create_permissions_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16, '2024_08_15_003635_create_roles_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17, '2024_08_15_003636_create_user_roles_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18, '2024_08_15_003716_create_role_permissions_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21, '2024_08_18_121839_create_offers_table', 12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22, '2024_08_18_123528_create_offer_products_table', 12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23, '2024_08_23_155853_create_coupons_table', 12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25, '2024_08_23_160144_create_coupon_users_table', 13);
COMMIT;

-- ----------------------------
-- Table structure for offer_products
-- ----------------------------
DROP TABLE IF EXISTS `offer_products`;
CREATE TABLE `offer_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_products_offer_id_foreign` (`offer_id`),
  KEY `offer_products_product_id_foreign` (`product_id`),
  CONSTRAINT `offer_products_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offer_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of offer_products
-- ----------------------------
BEGIN;
INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES (2, 1, 2, NULL, NULL);
INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES (3, 1, 17, NULL, NULL);
INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES (4, 2, 1, NULL, NULL);
INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES (5, 2, 2, NULL, NULL);
INSERT INTO `offer_products` (`id`, `offer_id`, `product_id`, `created_at`, `updated_at`) VALUES (6, 2, 17, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for offers
-- ----------------------------
DROP TABLE IF EXISTS `offers`;
CREATE TABLE `offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `amount_type` enum('rate','price') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of offers
-- ----------------------------
BEGIN;
INSERT INTO `offers` (`id`, `name`, `content`, `amount`, `amount_type`, `expiration_time`, `created_at`, `updated_at`) VALUES (1, 'Deneme İndirim', 'Deneme İndirim Açıklaması', 10.00, 'rate', NULL, NULL, NULL);
INSERT INTO `offers` (`id`, `name`, `content`, `amount`, `amount_type`, `expiration_time`, `created_at`, `updated_at`) VALUES (2, 'Deneme İndirim 2', 'Deneme İndirim 2 Açıklama', 10.00, 'price', NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_contents
-- ----------------------------
BEGIN;
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (1, 1, 'Deneme Ürün Açıklaması', NULL, NULL);
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (2, 2, 'Content', NULL, NULL);
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (14, 17, 'Deneme Açıklama', '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `product_contents` (`id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES (15, 18, 'Deneme AÇılama', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_images
-- ----------------------------
BEGIN;
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (1, 1, 'pr2_1.webp', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (2, 1, 'pr2_2.webp', 2, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (3, 1, 'pr2_3.webp', 3, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (4, 1, 'pr2_4.webp', 4, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (5, 2, 'pr1.webp', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (6, 2, 'pr1_2.webp', 2, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (7, 2, 'pr1_3.webp', 3, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (8, 2, 'pr1_4.webp', 4, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (22, 17, '0VkMvSgUHUsGlxwP5YApqBKYjrPUJF9RQa56APlJ.jpg', 0, '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (23, 17, 'hOIif1vH4GkOm7BuztO69a4IGfTi4zfqh4hsgfvY.jpg', 1, '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (24, 18, 'pr3_1.webp', 0, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (25, 18, 'pr3_2.webp', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (26, 18, 'pr3_3.webp', 2, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (27, 18, 'pr3_4.webp', 3, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (28, 19, 'pr4_1.webp', 0, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (29, 19, 'pr4_2.webp', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (30, 19, 'pr4_3.jpg', 2, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (31, 19, 'pr4_4.webp', 3, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (32, 19, 'pr4_5.webp', 4, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (33, 20, 'pr5_1.webp', 0, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (34, 20, 'pr5_2.webp', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (35, 20, 'pr5_3.webp', 2, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (36, 20, 'pr5_4.webp', 3, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (37, 20, 'pr5_5.webp', 4, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (38, 20, 'pr5_6.webp', 5, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (39, 20, 'pr5_7.webp', 6, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (40, 20, 'pr5_8.webp', 7, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (41, 21, 'pr6_1.jpg', 0, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (42, 21, 'pr6_2.jpg', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (43, 22, 'pr7_1.webp', 0, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (44, 22, 'pr7_2.webp', 1, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (45, 22, 'pr7_3.webp', 2, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (46, 22, 'pr7_4.webp', 3, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (47, 22, 'pr7_5.webp', 4, NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `name`, `sort`, `created_at`, `updated_at`) VALUES (48, 22, 'pr7_6.webp', 5, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `products_ibfk_1` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (1, 'Erkek Keten Oversize Geniş Kesim Dökümlü Gömlek', 'erkek-keten-oversize-genis-kesim-dokumlu-gomlek', 356.16, 3, '2024-08-01 19:06:30', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (2, 'Keten Karışımlı Bol Kesim Pantolon', 'keten-karisimli-bol-kesim-pantolon', 890.00, 4, '2024-08-12 19:06:38', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (17, 'Salaş Gömlek', 'salas-gomlek', 199.98, 3, '2024-08-15 22:02:13', '2024-08-15 22:02:13');
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (18, 'bilekten taşlı saten malzeme topuklu kadin abiye ayakkabı', 'bilekten-tasli-saten-malzeme-topuklu-kadin-abiye-ayakkabi', 410.00, 10, '2024-09-18 16:30:17', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (19, 'Bogota Erkek Çocuk Nakış Işlemeli Bisiklet Yaka Bej Eşofman Takımı', 'bogota-erkek-cocuk-nakis-islemeli-bisiklet-yaka-bej-esofman-takimi', 629.99, 14, '2024-09-18 20:25:23', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (20, 'Kadın Siyah Sırt Dekolte Yırtmaçlı Elbise', 'kadin-siyah-sirt-dekolte-yirtmacli-elbise', 105.00, 15, '2024-09-18 20:33:10', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (21, 'Bebek Patikli Tulum 1-6 Ay Pembe', 'bebek-patikli-tulum-1-6-ay-pembe', 159.12, 18, '2024-09-18 20:40:13', NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `created_at`, `updated_at`) VALUES (22, 'Slim Fit Siyah Düz Mono Yaka Çift Yırtmaçlı Astarlı Takim Elbise', 'slim-fit-siyah-duz-mono-yaka-cift-yirtmacli-astarli-takim-elbise', 2599.99, 19, '2024-09-18 20:45:42', NULL);
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
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('0AKfMfMx85M60y9DJY82yiPg1TWVUztOalo6OoFd', 1, 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNVB3NXdURW9HQnFKSlNtSlpiemVBY1NJeFo4aEIwSU9CODJ6S1RPZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xOTIuMTY4LjEuODY6ODAwMC9wcm9maWxpbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1726711155, '192.168.1.86', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('6hiVC8obmlKKfXg0y8VUE2WpSeb2WIAjgzOv1E1V', NULL, 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHE2c3JpWVFldDVXYWRVRkpwbkJuakhqcXBDWTFlVmc2VDBnV0NQWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjEuODY6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1726710754, '192.168.1.39', 'Mozilla/5.0 (Linux; Android 10; MAR-LX1A Build/HUAWEIMAR-L21A; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/128.0.6613.146 Mobile Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('fITTF22E7ft5oyTAdlUufl2OLOLf8jhYyCmcDoFq', 1, 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN1kxd2o5V2RwemRtekRGMEkwRVJMellEYzNodG1yUU5DcEhkREJMdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xOTIuMTY4LjEuODY6ODAwMC9wcm9maWxpbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1726711148, '192.168.1.39', 'Mozilla/5.0 (Linux; Android 10; MAR-LX1A Build/HUAWEIMAR-L21A; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/128.0.6613.146 Mobile Safari/537.36', NULL, NULL);
INSERT INTO `sessions` (`id`, `user_id`, `payload`, `last_activity`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES ('hDEUe3si11gONHHONjlCGtlpFjDJi7Q59gXnWBe0', 1, 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQXVhekpyblFkVkRSWlRnV1BtOENObjNuZjF6Tk45VE5HYXFFT0JiWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xOTIuMTY4LjEuODY6ODAwMC9rYXRlZ29yaWxlci9rYWRpbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1726711200, '192.168.1.39', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sliders
-- ----------------------------
BEGIN;
INSERT INTO `sliders` (`id`, `image_name`, `title`, `content`, `text_position`, `theme`, `created_at`, `updated_at`) VALUES (1, 'slide_img_1.webp', 'Slide 1', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis excepturi aperiam obcaecati, dicta fuga, nobis asperiores modi nemo nesciunt eum soluta tempora sequi, nisi corporis eveniet saepe delectus non voluptatem?', 'center-center', 'dark', NULL, NULL);
INSERT INTO `sliders` (`id`, `image_name`, `title`, `content`, `text_position`, `theme`, `created_at`, `updated_at`) VALUES (2, 'slide_img_2.webp', 'Slide 2', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis excepturi aperiam obcaecati, dicta fuga, nobis asperiores modi nemo nesciunt eum soluta tempora sequi, nisi corporis eveniet saepe delectus non voluptatem?', 'center-center', 'dark', NULL, NULL);
INSERT INTO `sliders` (`id`, `image_name`, `title`, `content`, `text_position`, `theme`, `created_at`, `updated_at`) VALUES (3, 'slide_img_3.jpg', 'Slide 3', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis excepturi aperiam obcaecati, dicta fuga, nobis asperiores modi nemo nesciunt eum soluta tempora sequi, nisi corporis eveniet saepe delectus non voluptatem?', 'center-center', 'dark', NULL, NULL);
INSERT INTO `sliders` (`id`, `image_name`, `title`, `content`, `text_position`, `theme`, `created_at`, `updated_at`) VALUES (4, 'slide_img_4.jpg', 'Slide 4', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis excepturi aperiam obcaecati, dicta fuga, nobis asperiores modi nemo nesciunt eum soluta tempora sequi, nisi corporis eveniet saepe delectus non voluptatem?', 'center-center', 'dark', NULL, NULL);
INSERT INTO `sliders` (`id`, `image_name`, `title`, `content`, `text_position`, `theme`, `created_at`, `updated_at`) VALUES (5, 'slide_img_5.jpg', 'Slide 5', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis excepturi aperiam obcaecati, dicta fuga, nobis asperiores modi nemo nesciunt eum soluta tempora sequi, nisi corporis eveniet saepe delectus non voluptatem?', 'center-center', 'dark', NULL, NULL);
INSERT INTO `sliders` (`id`, `image_name`, `title`, `content`, `text_position`, `theme`, `created_at`, `updated_at`) VALUES (6, 'slide_img_6.jpg', 'Slide 6', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis excepturi aperiam obcaecati, dicta fuga, nobis asperiores modi nemo nesciunt eum soluta tempora sequi, nisi corporis eveniet saepe delectus non voluptatem?', 'center-center', 'dark', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_baskets
-- ----------------------------
DROP TABLE IF EXISTS `user_baskets`;
CREATE TABLE `user_baskets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `user_baskets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_baskets_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_baskets_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_baskets
-- ----------------------------
BEGIN;
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
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `avatar`) VALUES (1, 'Çağdaş', 'Karabudak', 'cagdaskarabudak@outlook.com', 'cagdaskarabudak', '5059991134', '$2y$12$SL.SMAquLYJwI/tzE7aEd.wmm7qaicrAtinzM4GH6ixW/BKvVNEXq', 1, '2024-08-05 09:28:57', '2024-09-19 04:59:08', 'avatars/u1rqrF0CYRkECODWgBcTBIs5M9G5niPKcPTAwmAH.jpg');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `avatar`) VALUES (3, 'Deneme', 'User', 'deneme@deneme.com', 'denemeuser', '5050000000', '$2y$12$V24R7umC9vnuEsEzVNtbneaCaaY/aET0VPYxIR3rCZBCUlO65hqZO', 2, '2024-08-05 16:13:38', '2024-08-05 16:13:38', NULL);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `phone`, `password`, `role_id`, `created_at`, `updated_at`, `avatar`) VALUES (4, 'çağdaş', 'kkkkk', 'cagdas@cagdas.com', 'CAGDASKK', '5559991134', '$2y$12$D5GZxmuzonrDUEqpbh2BZeOOIDXlFiWSqBym8tDKeORT.ft05yJBG', 2, '2024-09-17 13:04:18', '2024-09-17 13:04:18', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
