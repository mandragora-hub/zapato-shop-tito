-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_account` (
  `id` tinyint(4) DEFAULT NULL,
  `password` varchar(88) DEFAULT NULL,
  `first_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(5) DEFAULT NULL,
  `username` varchar(5) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `phone_number` varchar(0) DEFAULT NULL,
  `date_joinded` varchar(10) DEFAULT NULL,
  `last_login` varchar(10) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_superadmin` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
INSERT INTO `accounts_account` VALUES (24,'pbkdf2_sha256$260000$uKsoleB5qKMwcUyfJ6VWM6$sF3mXu5lNkBFGx4XPivF3RpnN47jD7A/aOgrokrAcJU=','admin','admin','admin','admin@admin.com','','2024-07-09','2024-07-10',1,1,1,1);
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` tinyint(4) DEFAULT NULL,
  `address_line_1` varchar(24) DEFAULT NULL,
  `address_line_2` varchar(0) DEFAULT NULL,
  `profile_picture` varchar(53) DEFAULT NULL,
  `city` varchar(18) DEFAULT NULL,
  `state` varchar(0) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT INTO `accounts_userprofile` VALUES (17,'19 Calle Juan vasquez 19','','userprofile/Captura_de_pantalla_2023-09-08_215529.png','Santo Domingo Este','','República Dominicana',24);
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` varchar(0) DEFAULT NULL,
  `name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` tinyint(4) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `codename` varchar(21) DEFAULT NULL,
  `name` varchar(26) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry'),(2,1,'change_logentry','Can change log entry'),(3,1,'delete_logentry','Can delete log entry'),(4,1,'view_logentry','Can view log entry'),(5,2,'add_permission','Can add permission'),(6,2,'change_permission','Can change permission'),(7,2,'delete_permission','Can delete permission'),(8,2,'view_permission','Can view permission'),(9,3,'add_group','Can add group'),(10,3,'change_group','Can change group'),(11,3,'delete_group','Can delete group'),(12,3,'view_group','Can view group'),(13,4,'add_contenttype','Can add content type'),(14,4,'change_contenttype','Can change content type'),(15,4,'delete_contenttype','Can delete content type'),(16,4,'view_contenttype','Can view content type'),(17,5,'add_session','Can add session'),(18,5,'change_session','Can change session'),(19,5,'delete_session','Can delete session'),(20,5,'view_session','Can view session'),(21,6,'add_category','Can add Category'),(22,6,'change_category','Can change Category'),(23,6,'delete_category','Can delete Category'),(24,6,'view_category','Can view Category'),(25,7,'add_account','Can add account'),(26,7,'change_account','Can change account'),(27,7,'delete_account','Can delete account'),(28,7,'view_account','Can view account'),(29,8,'add_product','Can add product'),(30,8,'change_product','Can change product'),(31,8,'delete_product','Can delete product'),(32,8,'view_product','Can view product'),(33,9,'add_cartitem','Can add cart item'),(34,9,'change_cartitem','Can change cart item'),(35,9,'delete_cartitem','Can delete cart item'),(36,9,'view_cartitem','Can view cart item'),(37,10,'add_cart','Can add cart'),(38,10,'change_cart','Can change cart'),(39,10,'delete_cart','Can delete cart'),(40,10,'view_cart','Can view cart'),(41,11,'add_variation','Can add variation'),(42,11,'change_variation','Can change variation'),(43,11,'delete_variation','Can delete variation'),(44,11,'view_variation','Can view variation'),(45,12,'add_order','Can add order'),(46,12,'change_order','Can change order'),(47,12,'delete_order','Can delete order'),(48,12,'view_order','Can view order'),(49,13,'add_payment','Can add payment'),(50,13,'change_payment','Can change payment'),(51,13,'delete_payment','Can delete payment'),(52,13,'view_payment','Can view payment'),(53,14,'add_orderproduct','Can add order product'),(54,14,'change_orderproduct','Can change order product'),(55,14,'delete_orderproduct','Can delete order product'),(56,14,'view_orderproduct','Can view order product'),(57,15,'add_reviewrating','Can add review rating'),(58,15,'change_reviewrating','Can change review rating'),(59,15,'delete_reviewrating','Can delete review rating'),(60,15,'view_reviewrating','Can view review rating'),(61,16,'add_userprofile','Can add user profile'),(62,16,'change_userprofile','Can change user profile'),(63,16,'delete_userprofile','Can delete user profile'),(64,16,'view_userprofile','Can view user profile'),(65,17,'add_productgallery','Can add product gallery'),(66,17,'change_productgallery','Can change product gallery'),(67,17,'delete_productgallery','Can delete product gallery'),(68,17,'view_productgallery','Can view product gallery');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cart`
--

DROP TABLE IF EXISTS `carts_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts_cart` (
  `id` tinyint(4) DEFAULT NULL,
  `cart_id` varchar(32) DEFAULT NULL,
  `date_added` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cart`
--

LOCK TABLES `carts_cart` WRITE;
/*!40000 ALTER TABLE `carts_cart` DISABLE KEYS */;
INSERT INTO `carts_cart` VALUES (4,'yu7ipml4j1e0il1euw22v6shd51p8zko','');
/*!40000 ALTER TABLE `carts_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cartitem`
--

DROP TABLE IF EXISTS `carts_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts_cartitem` (
  `id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `cart_id` varchar(0) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cartitem`
--

LOCK TABLES `carts_cartitem` WRITE;
/*!40000 ALTER TABLE `carts_cartitem` DISABLE KEYS */;
INSERT INTO `carts_cartitem` VALUES (10,1,1,'',13,24);
/*!40000 ALTER TABLE `carts_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cartitem_variation`
--

DROP TABLE IF EXISTS `carts_cartitem_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts_cartitem_variation` (
  `id` smallint(6) DEFAULT NULL,
  `cartitem_id` tinyint(4) DEFAULT NULL,
  `variation_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cartitem_variation`
--

LOCK TABLES `carts_cartitem_variation` WRITE;
/*!40000 ALTER TABLE `carts_cartitem_variation` DISABLE KEYS */;
INSERT INTO `carts_cartitem_variation` VALUES (107,10,12),(108,10,15);
/*!40000 ALTER TABLE `carts_cartitem_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_category`
--

DROP TABLE IF EXISTS `category_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_category` (
  `id` tinyint(4) DEFAULT NULL,
  `category_name` varchar(6) DEFAULT NULL,
  `description` varchar(134) DEFAULT NULL,
  `slug` varchar(6) DEFAULT NULL,
  `cat_image` varchar(59) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category`
--

LOCK TABLES `category_category` WRITE;
/*!40000 ALTER TABLE `category_category` DISABLE KEYS */;
INSERT INTO `category_category` VALUES (9,'Adidas','Una marca icónica con una larga historia en el mundo del deporte, Adidas ofrece tenis de alta calidad con diseños clásicos y modernos.','adidas','photos/categories/images.png'),(10,'Nike','Lo mejor de Nike','nike','photos/categories/786NzPhpXo6G8hkutJkHTM-320-80_8cpdv6N.jpg');
/*!40000 ALTER TABLE `category_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` smallint(6) DEFAULT NULL,
  `object_id` tinyint(4) DEFAULT NULL,
  `object_repr` varchar(32) DEFAULT NULL,
  `action_flag` tinyint(4) DEFAULT NULL,
  `change_message` varchar(196) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `action_time` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (164,8,'Nike',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Description\", \"Slug\", \"Cat image\"]}}]',6,24,'2024-07-09'),(165,11,'Nike 1',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\", \"Description\", \"Images\"]}}, {\"added\": {\"name\": \"product gallery\", \"object\": \"Nike 1\"}}, {\"added\": {\"name\": \"product gallery\", \"object\": \"Nike 1\"}}]',8,24,'2024-07-09'),(166,11,'Nike 1',2,'[{\"deleted\": {\"name\": \"product gallery\", \"object\": \"Nike 1\"}}, {\"deleted\": {\"name\": \"product gallery\", \"object\": \"Nike 1\"}}]',8,24,'2024-07-09'),(167,11,'Nike 1',3,'',8,24,'2024-07-09'),(168,12,'Nike 1',1,'[{\"added\": {}}]',8,24,'2024-07-09'),(169,2,'Nirvana',3,'',16,24,'2024-07-09'),(170,1,'Pepe',3,'',16,24,'2024-07-09'),(171,23,'chiliswilians2@gmail.com',3,'',7,24,'2024-07-09'),(172,22,'nirvanabeleng@gmail.com',3,'',7,24,'2024-07-09'),(173,21,'nivaniz2019@gmail.com',3,'',7,24,'2024-07-09'),(174,19,'byteshopstore@gmail.com',3,'',7,24,'2024-07-09'),(175,13,'pepe@gmail.com',3,'',7,24,'2024-07-09'),(176,13,'Maria',3,'',12,24,'2024-07-10'),(177,12,'Nirvana',3,'',12,24,'2024-07-10'),(178,11,'Maria',3,'',12,24,'2024-07-10'),(179,10,'Maria',3,'',12,24,'2024-07-10'),(180,9,'Maria',3,'',12,24,'2024-07-10'),(181,8,'Maria',3,'',12,24,'2024-07-10'),(182,7,'Maria',3,'',12,24,'2024-07-10'),(183,6,'Maria',3,'',12,24,'2024-07-10'),(184,5,'Maria',3,'',12,24,'2024-07-10'),(185,4,'Maria',3,'',12,24,'2024-07-10'),(186,3,'Maria',3,'',12,24,'2024-07-10'),(187,2,'Nirvana',3,'',12,24,'2024-07-10'),(188,1,'Nirvana',3,'',12,24,'2024-07-10'),(189,12,'Nike 1',3,'',8,24,'2024-07-10'),(190,10,'Silla Gamer Razer',3,'',8,24,'2024-07-10'),(191,9,'Audifonos Bosé',3,'',8,24,'2024-07-10'),(192,8,'Audifonos Apple 1raGen',3,'',8,24,'2024-07-10'),(193,7,'Reloj Inteligente Huawei',3,'',8,24,'2024-07-10'),(194,6,'Sillón Gris Individual',3,'',8,24,'2024-07-10'),(195,5,'Short Jeans Mezclilla Levis',3,'',8,24,'2024-07-10'),(196,4,'Playera Polo',3,'',8,24,'2024-07-10'),(197,7,'Adidas',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Slug\"]}}]',6,24,'2024-07-09'),(198,8,'Nike',3,'',6,24,'2024-07-10'),(199,7,'Adidas',3,'',6,24,'2024-07-10'),(200,6,'Ropa Moda',3,'',6,24,'2024-07-10'),(201,5,'Auto / Transporte',3,'',6,24,'2024-07-10'),(202,4,'Electronica',3,'',6,24,'2024-07-09'),(203,9,'Adidas',1,'[{\"added\": {}}]',6,24,'2024-07-10'),(204,13,'Addidas 1',1,'[{\"added\": {}}]',8,24,'2024-07-10'),(205,4,'Jairo',3,'',16,24,'2024-07-10'),(206,3,'Jairo',3,'',16,24,'2024-07-10'),(207,26,'jeremy.cstro889@gmail.com',3,'',7,24,'2024-07-10'),(208,25,'jeremy.castro889@gmail.com',3,'',7,24,'2024-07-10'),(209,27,'lain.racaille@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',7,24,'2024-07-10'),(210,27,'lain.racaille@gmail.com',3,'',7,24,'2024-07-10'),(211,3,'jcq3l2ms37ivzb6ew1jxmmmulx4cqta6',3,'',10,24,'2024-07-10'),(212,2,'uqkb9pdv1a2w2jcrxnlne7b188xuz7uz',3,'',10,24,'2024-07-10'),(213,1,'btqjcq4vp31a7thlzocvcabpwyijrn43',3,'',10,24,'2024-07-10'),(214,7,'Addidas 1',1,'[{\"added\": {}}]',17,24,'2024-07-10'),(215,38,'jeremy.ro889@gmail.com',3,'',7,24,'2024-07-10'),(216,37,'jerecastro889@gmail.com',3,'',7,24,'2024-07-10'),(217,36,'jerem.castro889@gmail.com',3,'',7,24,'2024-07-10'),(218,35,'jeremy.cas889@gmail.com',3,'',7,24,'2024-07-10'),(219,34,'jeremy.cast889@gmail.com',3,'',7,24,'2024-07-10'),(220,33,'jeremy.castrsso889@gmail.com',3,'',7,24,'2024-07-10'),(221,32,'jeremy.castro89@gmail.com',3,'',7,24,'2024-07-10'),(222,31,'CONTACTO@sv3.com.do',3,'',7,24,'2024-07-10'),(223,30,'jeremy.castr889@gmail.com',3,'',7,24,'2024-07-10'),(224,29,'anderson.olivia9910@outlook.com',3,'',7,24,'2024-07-10'),(225,28,'jeremy.castro889@gmail.com',3,'',7,24,'2024-07-10'),(226,17,'admin',1,'[{\"added\": {}}]',16,24,'2024-07-10'),(227,20,'Jairo',3,'',16,24,'2024-07-10'),(228,19,'Jairo',3,'',16,24,'2024-07-10'),(229,18,'Jairo',3,'',16,24,'2024-07-10'),(230,17,'admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',16,24,'2024-07-10'),(231,17,'admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',16,24,'2024-07-10'),(232,13,'Addidas 1',2,'[{\"deleted\": {\"name\": \"product gallery\", \"object\": \"Addidas 1\"}}]',8,24,'2024-07-10'),(233,12,'talla : 39',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(234,12,'talla : 39',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,24,'2024-07-10'),(235,12,'talla : 39, 39, 35',2,'[{\"changed\": {\"fields\": [\"Variation value\", \"Is active\"]}}]',11,24,'2024-07-10'),(236,12,'talla : 38',2,'[{\"changed\": {\"fields\": [\"Variation value\"]}}]',11,24,'2024-07-10'),(237,13,'talla : 35',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(238,14,'talla : 40',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(239,15,'color : Dorado',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(240,13,'Addidas 1',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,24,'2024-07-10'),(241,13,'Addidas 1',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,24,'2024-07-10'),(242,41,'jeremy.@gmail.com',3,'',7,24,'2024-07-10'),(243,40,'jeremy.castro89@gmail.com',3,'',7,24,'2024-07-10'),(244,39,'jeremy.castro889@gmail.com',3,'',7,24,'2024-07-10'),(245,10,'Nike',1,'[{\"added\": {}}]',6,24,'2024-07-10'),(246,14,'Nike 1',1,'[{\"added\": {}}]',8,24,'2024-07-10'),(247,16,'color : blanco',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(248,17,'talla : 39',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(249,18,'talla : 38',1,'[{\"added\": {}}]',11,24,'2024-07-10'),(250,8,'Nike 1',1,'[{\"added\": {}}]',17,24,'2024-07-10'),(251,19,'color : negro',1,'[{\"added\": {}}]',11,24,'2024-07-10');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` tinyint(4) DEFAULT NULL,
  `app_label` varchar(12) DEFAULT NULL,
  `model` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'accounts','account'),(16,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'carts','cart'),(9,'carts','cartitem'),(6,'category','category'),(4,'contenttypes','contenttype'),(12,'orders','order'),(14,'orders','orderproduct'),(13,'orders','payment'),(5,'sessions','session'),(8,'store','product'),(17,'store','productgallery'),(15,'store','reviewrating'),(11,'store','variation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` tinyint(4) DEFAULT NULL,
  `app` varchar(12) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `applied` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2023-06-11'),(2,'contenttypes','0001_initial','2023-06-11'),(3,'admin','0001_initial','2023-06-11'),(4,'admin','0002_logentry_remove_auto_add','2023-06-11'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-11'),(6,'contenttypes','0002_remove_content_type_name','2023-06-11'),(7,'auth','0001_initial','2023-06-11'),(8,'auth','0002_alter_permission_name_max_length','2023-06-11'),(9,'auth','0003_alter_user_email_max_length','2023-06-11'),(10,'auth','0004_alter_user_username_opts','2023-06-11'),(11,'auth','0005_alter_user_last_login_null','2023-06-11'),(12,'auth','0006_require_contenttypes_0002','2023-06-11'),(13,'auth','0007_alter_validators_add_error_messages','2023-06-11'),(14,'auth','0008_alter_user_username_max_length','2023-06-11'),(15,'auth','0009_alter_user_last_name_max_length','2023-06-11'),(16,'auth','0010_alter_group_name_max_length','2023-06-11'),(17,'auth','0011_update_proxy_permissions','2023-06-11'),(18,'auth','0012_alter_user_first_name_max_length','2023-06-11'),(19,'category','0001_initial','2023-06-11'),(20,'sessions','0001_initial','2023-06-11'),(21,'store','0001_initial','2023-06-11'),(22,'carts','0001_initial','2023-06-17'),(23,'store','0002_variation','2023-06-18'),(24,'carts','0002_cartitem_variation','2023-06-18'),(25,'carts','0003_cartitem_user_alter_cartitem_cart','2023-06-30'),(26,'orders','0001_initial','2023-07-09'),(27,'orders','0002_remove_orderproduct_color_remove_orderproduct_size_and_more','2023-07-11'),(28,'store','0003_reviewrating','2023-07-12'),(29,'accounts','0002_userprofile','2023-07-14'),(30,'accounts','0003_auto_20230718_1456','2023-07-18'),(31,'accounts','0004_alter_account_id_alter_userprofile_id','2023-07-18'),(32,'carts','0004_auto_20230718_1456','2023-07-18'),(33,'carts','0005_alter_cart_id_alter_cartitem_id','2023-07-18'),(34,'category','0002_auto_20230718_1456','2023-07-18'),(35,'category','0003_alter_category_id','2023-07-18'),(36,'orders','0003_auto_20230718_1456','2023-07-18'),(37,'orders','0004_alter_order_id_alter_orderproduct_id_and_more','2023-07-18'),(38,'store','0004_auto_20230718_1456','2023-07-18'),(39,'store','0005_alter_product_id_alter_productgallery_id_and_more','2023-07-18');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(32) DEFAULT NULL,
  `session_data` text,
  `expire_date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7b4ts8k1rumtjtmdtkfiapo5tslogwau','e30:1qB2fR:vypf_Um9c0_qRJ_YscpsZOBM7Edmy-P-n2mFyOh0iEY','2023-07-03'),('ab8y7lmzxi2e7lup15olm86b7pd0cy5l','.eJxVjDsOwjAQBe_iGlm2d_2Bkj5nsNbrNQmgRMqnQtwdIqWA9s3Me6lM29rnbZE5D1VdlFen360QP2TcQb3TeJs0T-M6D0Xvij7oorupyvN6uH8HPS39tzZIzgTTUomcMAaKDqE4W9BXK9YKR4YGCOwJvGloETxLOkd0QRKq9wfCWTbY:1qCTow:jz3T-KvEXvWF5qPVjFqljsLNqz9UuQ8KTJblL7lKxYY','2023-07-06'),('0nqwsfd0j6nt4ahwdjzoiko8dbpcf7ix','e30:1qF3RP:txh3Mh_4P43Lb9DRdthHoi6VRmCmRZFZTB2RPnCYiCo','2023-07-14'),('dcj2dkfefpopmfxpt78g2evc5gvds7vf','e30:1qF3Rn:I6jMoY_Dk9QFvrf9jRYvd1gvPtlmBjRrodfihD27drM','2023-07-14'),('s2qvyn2mh9mjzg3nqpmhjnjv607t1qd6','e30:1qF3Rn:I6jMoY_Dk9QFvrf9jRYvd1gvPtlmBjRrodfihD27drM','2023-07-14'),('287v095bp9qspjssw2cvkcu0d0imzdi8','.eJxVjMsOwiAQRf-FtSE8CkxduvcbyMxApWogKe3K-O_apAvd3nPOfYmI21ri1vMS5yTOQltx-h0J-ZHrTtId661JbnVdZpK7Ig_a5bWl_Lwc7t9BwV6-dWAIiXQwBpLGnJNX6DgoHwgG8GCD0RoQPSg2zk_GQnajY_LjQBMb8f4A9ZQ3hA:1qIfEs:LR6iDlsc_vA0Tt7RQXyEaAHp3Kzl5RaYAFAta7GVaj8','2023-07-24'),('asb1iu5vvom8lvgk071wnmorrpjafwow','.eJxVjDsOwjAQBe_iGlnrT-JNSnrOYG3sNTEQB2FTIe4OkdKkfTPzPsJXrjWvxeeSm2954dpoeXoxqh4HB2i0lgA9InQn4endZv-u_PI5ilEoIw7jROHOZSPxRuW6yrCW9sqT3BS50yova-THeXcPBzPV-V-nRJNilyBwtIl0xEFbYxKyieSMxQDJ2Z6iVcCE_RQGdjRoIOhiUii-P2tzR00:1qLqK2:fPHh1H3-wC4Uq05uw7F3e91yrTelevrko_ngoGsjLlo','2023-08-01'),('uqkb9pdv1a2w2jcrxnlne7b188xuz7uz','eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2OTA2OTA4MjkuNTkxNzEyNX0:1qPxuv:P6nIrWirja3tynWXRb86lyv1EOMVNMIBPHJ8nMvS46w','2023-08-13'),('4yf721vmhhxrbfq7hqrx6qrucpnhqnzy','.eJxVjEEOwiAUBe_C2hAoUKBL956BfOBjUQum0JXx7tqkm27fzLwPcQ1by7W4XHJ3PS_YOixvRyY-WqalkcZSq4RR6kIcbH12W8PV5UgmwgU5jR7CE8tO4gPKvdJQS1-zp7tCD9rorUZ8XQ_3dDBDm_91SuA56sQCRplgiMYOUohkUETQQprAkpYjRMkZghl9sKjBDgyYiokb8v0BSR1HLw:1qQCuv:hwvEUPbi170KERC_2e0uABp2JKrM3-2eSBfnuhITPIA','2023-08-13'),('a9hohpaf0idduyi98mkflg83pb4qgulx','eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MjA1Nzg1MzMuNzE4NDEwNX0:1sRN4f:SVwk6MrhZh2wZlncWu7VFgMMDwZC2F198Ps-_-dWH7c','2024-07-24'),('ril6nj2fjtbwbq9mqtvzhtb3lqo2kl37','eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MjA1Nzc4NDkuNTE2ODY1N30:1sRMtd:gdT1oRelu2IC8tpNZ9iSEY9QsfJStsN8mdj-_ynqeak','2024-07-24'),('lba30w9httuj4scjssmk1s5182exvz0k','eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MjA1NzgxODYuMzg2NzA1OX0:1sRMz4:S1R2NAZq1biwF6bRKmoz5xf7zXsQGtSJ3gZSHaZHXXw','2024-07-24'),('ebbjgep3s6l1lemilq36sh3bwu9msubg','.eJxVjDkOwyAURO9CHSEWYz4u0-cM6LPFZIHI4CrK3WNLbtxMMe_NfIltsbVci80ld9vzO7aO748lE9eCjVILzilXGkYmL8Ti2me7trjYHMhExEBOpUP_jGUn4YHlXqmvpS_Z0V2hB230VkN8XQ_3dDBjm7d1MgAo1YDBJNRMMe4ADIzeR298hCRYiGGLcXACmFEsDMCl8OhMSkKQ3x85f0aQ:1sRcL5:FbzhmkIure4UkeoC84vLeYMcei4SYUiAN5HM6vq_2E8','2024-07-24');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_order` (
  `id` tinyint(4) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `first_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(6) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(26) DEFAULT NULL,
  `address_line_1` varchar(24) DEFAULT NULL,
  `address_line_2` varchar(24) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `city` varchar(18) DEFAULT NULL,
  `state` mediumint(9) DEFAULT NULL,
  `order_note` varchar(1) DEFAULT NULL,
  `order_total` decimal(4,1) DEFAULT NULL,
  `tax` decimal(3,1) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `ip` varchar(9) DEFAULT NULL,
  `is_ordered` tinyint(4) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `payment_id` varchar(1) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (14,2024070914,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',10080,'s',348.0,48.0,'New','127.0.0.1',0,'2024-07-10','2024-07-10','',24),(15,2024070915,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',10080,'s',0.0,0.0,'New','127.0.0.1',0,'2024-07-10','2024-07-10','',24),(16,2024070916,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',10080,'',0.0,0.0,'New','127.0.0.1',0,'2024-07-10','2024-07-10','',24),(17,2024070917,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',10080,'',0.0,0.0,'New','127.0.0.1',0,'2024-07-10','2024-07-10','',24),(18,2024070918,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',10080,'',348.0,48.0,'New','127.0.0.1',1,'2024-07-10','2024-07-10','3',24),(19,2024070919,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',0,'',348.0,48.0,'New','127.0.0.1',0,'2024-07-10','2024-07-10','',24),(20,2024071020,'Jairo','Castro',8496079925,'jeremy.castro889@gmail.com','19 Calle Juan vasquez 19','19 Calle Juan vasquez 19','República Dominicana','Santo Domingo Este',11111,'',348.0,48.0,'New','127.0.0.1',0,'2024-07-10','2024-07-10','',24);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderproduct`
--

DROP TABLE IF EXISTS `orders_orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_orderproduct` (
  `id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `product_price` decimal(4,1) DEFAULT NULL,
  `ordered` tinyint(4) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `order_id` tinyint(4) DEFAULT NULL,
  `payment_id` tinyint(4) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderproduct`
--

LOCK TABLES `orders_orderproduct` WRITE;
/*!40000 ALTER TABLE `orders_orderproduct` DISABLE KEYS */;
INSERT INTO `orders_orderproduct` VALUES (3,1,300.0,1,'2024-07-10','2024-07-10',18,3,13,24);
/*!40000 ALTER TABLE `orders_orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderproduct_variation`
--

DROP TABLE IF EXISTS `orders_orderproduct_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_orderproduct_variation` (
  `id` tinyint(4) DEFAULT NULL,
  `orderproduct_id` tinyint(4) DEFAULT NULL,
  `variation_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderproduct_variation`
--

LOCK TABLES `orders_orderproduct_variation` WRITE;
/*!40000 ALTER TABLE `orders_orderproduct_variation` DISABLE KEYS */;
INSERT INTO `orders_orderproduct_variation` VALUES (21,3,12),(22,3,15);
/*!40000 ALTER TABLE `orders_orderproduct_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_payment`
--

DROP TABLE IF EXISTS `orders_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_payment` (
  `id` tinyint(4) DEFAULT NULL,
  `payment_id` varchar(17) DEFAULT NULL,
  `payment_method` varchar(6) DEFAULT NULL,
  `amount_id` decimal(4,1) DEFAULT NULL,
  `status` varchar(9) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_payment`
--

LOCK TABLES `orders_payment` WRITE;
/*!40000 ALTER TABLE `orders_payment` DISABLE KEYS */;
INSERT INTO `orders_payment` VALUES (3,'8RW843540P306053T','Paypal',348.0,'COMPLETED','2024-07-10',24);
/*!40000 ALTER TABLE `orders_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--

DROP TABLE IF EXISTS `sqlite_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlite_sequence` (
  `name` varchar(29) DEFAULT NULL,
  `seq` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlite_sequence`
--

LOCK TABLES `sqlite_sequence` WRITE;
/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */;
INSERT INTO `sqlite_sequence` VALUES ('django_migrations',39),('django_admin_log',251),('django_content_type',17),('auth_permission',68),('auth_group',0),('carts_cartitem_variation',108),('orders_orderproduct_variation',22),('accounts_account',41),('accounts_userprofile',20),('carts_cart',4),('carts_cartitem',10),('category_category',10),('orders_order',20),('orders_orderproduct',3),('orders_payment',3),('store_product',14),('store_productgallery',8),('store_reviewrating',2),('store_variation',19);
/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product` (
  `id` tinyint(4) DEFAULT NULL,
  `product_name` varchar(9) DEFAULT NULL,
  `slug` varchar(9) DEFAULT NULL,
  `description` varchar(35) DEFAULT NULL,
  `price` smallint(6) DEFAULT NULL,
  `images` varchar(57) DEFAULT NULL,
  `stock` tinyint(4) DEFAULT NULL,
  `is_available` tinyint(4) DEFAULT NULL,
  `created_date` varchar(10) DEFAULT NULL,
  `modified_date` varchar(10) DEFAULT NULL,
  `category_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (13,'Addidas 1','addidas-1','Lost Tech: adidas_1 — CONCEPTKICKS®',300,'photos/products/conceptkicks_lost_tech_adidas_1_5.jpg',24,1,'2024-07-10','2024-07-10',9),(14,'Nike 1','nike-1','lo mejores nike',300,'photos/products/calzado-air-force-1-07-b19lqD_ruP5lpP.png',25,1,'2024-07-10','2024-07-10',10);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_productgallery`
--

DROP TABLE IF EXISTS `store_productgallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_productgallery` (
  `id` tinyint(4) DEFAULT NULL,
  `image` varchar(52) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_productgallery`
--

LOCK TABLES `store_productgallery` WRITE;
/*!40000 ALTER TABLE `store_productgallery` DISABLE KEYS */;
INSERT INTO `store_productgallery` VALUES (8,'store/products/conceptkicks_lost_tech_adidas_1_5.jpg',14);
/*!40000 ALTER TABLE `store_productgallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_reviewrating`
--

DROP TABLE IF EXISTS `store_reviewrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_reviewrating` (
  `id` varchar(0) DEFAULT NULL,
  `subject` varchar(0) DEFAULT NULL,
  `review` varchar(0) DEFAULT NULL,
  `rating` varchar(0) DEFAULT NULL,
  `ip` varchar(0) DEFAULT NULL,
  `status` varchar(0) DEFAULT NULL,
  `created_at` varchar(0) DEFAULT NULL,
  `updated_at` varchar(0) DEFAULT NULL,
  `product_id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_reviewrating`
--

LOCK TABLES `store_reviewrating` WRITE;
/*!40000 ALTER TABLE `store_reviewrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_reviewrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_variation`
--

DROP TABLE IF EXISTS `store_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_variation` (
  `id` tinyint(4) DEFAULT NULL,
  `variation_category` varchar(5) DEFAULT NULL,
  `variation_value` varchar(6) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_date` varchar(10) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_variation`
--

LOCK TABLES `store_variation` WRITE;
/*!40000 ALTER TABLE `store_variation` DISABLE KEYS */;
INSERT INTO `store_variation` VALUES (12,'talla','38',1,'2024-07-10',13),(13,'talla','35',1,'2024-07-10',13),(14,'talla','40',1,'2024-07-10',13),(15,'color','Dorado',1,'2024-07-10',13),(16,'color','blanco',1,'2024-07-10',14),(17,'talla','39',1,'2024-07-10',14),(18,'talla','38',1,'2024-07-10',14),(19,'color','negro',1,'2024-07-10',14);
/*!40000 ALTER TABLE `store_variation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 16:42:50
