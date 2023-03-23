-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for Linux (x86_64)
--
-- Host: artgallery-db    Database: artgallery
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB-1:10.10.2+maria~ubu2204

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
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `config` text NOT NULL,
  `icon` text DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_dashboards`
--

DROP TABLE IF EXISTS `be_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_dashboards` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `identifier` varchar(120) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `widgets` text DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_dashboards`
--

LOCK TABLES `be_dashboards` WRITE;
/*!40000 ALTER TABLE `be_dashboards` DISABLE KEYS */;
INSERT INTO `be_dashboards` VALUES (1,0,1674668484,1674668484,1,0,0,0,0,'183da223ce718b86a3583de5e273e967bd22458d','My dashboard','{\"dc81181c2d5b2d77afc759fe54a54f6b6435de3d\":{\"identifier\":\"t3information\"},\"4db833b66ebc72954f2281239e2f1d23a7ff3121\":{\"identifier\":\"docGettingStarted\"}}');
/*!40000 ALTER TABLE `be_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `non_exclude_fields` text DEFAULT NULL,
  `explicit_allowdeny` text DEFAULT NULL,
  `allowed_languages` varchar(255) NOT NULL DEFAULT '',
  `custom_options` text DEFAULT NULL,
  `db_mountpoints` text DEFAULT NULL,
  `pagetypes_select` text DEFAULT NULL,
  `tables_select` text DEFAULT NULL,
  `tables_modify` text DEFAULT NULL,
  `groupMods` text DEFAULT NULL,
  `availableWidgets` text DEFAULT NULL,
  `mfa_providers` text DEFAULT NULL,
  `file_mountpoints` text DEFAULT NULL,
  `file_permissions` text DEFAULT NULL,
  `TSconfig` text DEFAULT NULL,
  `subgroup` text DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `category_perms` longtext DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(190) NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` longblob DEFAULT NULL,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
INSERT INTO `be_sessions` VALUES ('35cf509419f3cce69682e086fd4511d5aa72ca7c4769484527b72b8f40ef4230','[DISABLED]',1,1674671683,'a:1:{s:26:\"formProtectionSessionToken\";s:64:\"4713f81a8484459ef0c0706f07816ab4cfa7602218f689a62bfb6edc7389005e\";}');
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT 0,
  `password` varchar(100) NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT 0,
  `usergroup` text DEFAULT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'default',
  `email` varchar(255) NOT NULL DEFAULT '',
  `db_mountpoints` text DEFAULT NULL,
  `options` smallint(5) unsigned NOT NULL DEFAULT 0,
  `realName` varchar(80) NOT NULL DEFAULT '',
  `userMods` text DEFAULT NULL,
  `allowed_languages` varchar(255) NOT NULL DEFAULT '',
  `uc` mediumblob DEFAULT NULL,
  `file_mountpoints` text DEFAULT NULL,
  `file_permissions` text DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `TSconfig` text DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `workspace_id` int(11) NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  `category_perms` longtext DEFAULT NULL,
  `password_reset_token` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1674668472,1674668472,0,0,0,0,0,NULL,'sacha',0,'$argon2i$v=19$m=65536,t=16,p=1$VTFpWmw5MkRwM1JmaWY0OA$CF4zpZlGvFqXlQf/mSMGwzxZb/L1U26SfxioE9y9FvY',1,NULL,'default','sacha@artgallery.tld',NULL,0,'',NULL,'','a:11:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:5:{s:28:\"dashboard/current_dashboard/\";s:40:\"183da223ce718b86a3583de5e273e967bd22458d\";s:10:\"web_layout\";a:3:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";s:19:\"constant_editor_cat\";N;}s:6:\"web_ts\";a:3:{s:8:\"function\";s:85:\"TYPO3\\CMS\\Tstemplate\\Controller\\TypoScriptTemplateInformationModuleFunctionController\";s:8:\"language\";N;s:19:\"constant_editor_cat\";s:7:\"content\";}s:10:\"FormEngine\";a:2:{i:0;a:5:{s:32:\"86205c5935270b8ee413592ec1b62292\";a:4:{i:0;s:25:\"Main TypoScript Rendering\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:35:\"&edit%5Bsys_template%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"d36a77b31c456e93c006b6db22a5f407\";a:4:{i:0;s:25:\"Main TypoScript Rendering\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";s:11:\"description\";s:6:\"noView\";N;}i:2;s:59:\"&edit%5Bsys_template%5D%5B1%5D=edit&columnsOnly=description\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"c312013d83c1a6ad7fec8b36a37ba3c8\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:1;s:3:\"pid\";i:2;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"20ed475662b97ac33d3aa853a74f9c9c\";a:4:{i:0;s:7:\"Contact\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:2;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B2%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:2;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"c72d4a5ffd106794d45e5a4a941814ba\";a:4:{i:0;s:8:\"NEW SITE\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:2;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:35:\"&edit%5Bsys_template%5D%5B2%5D=edit\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:2;s:3:\"pid\";i:2;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"20ed475662b97ac33d3aa853a74f9c9c\";}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1674668484;s:15:\"moduleSessionID\";a:5:{s:28:\"dashboard/current_dashboard/\";s:40:\"1d8d9a24d7e59c6573821c3dac20c02f44082c97\";s:10:\"web_layout\";s:40:\"1d8d9a24d7e59c6573821c3dac20c02f44082c97\";s:6:\"web_ts\";s:40:\"1d8d9a24d7e59c6573821c3dac20c02f44082c97\";s:10:\"FormEngine\";s:40:\"1d8d9a24d7e59c6573821c3dac20c02f44082c97\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:40:\"1d8d9a24d7e59c6573821c3dac20c02f44082c97\";}s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:1:{s:3:\"0_1\";s:1:\"1\";}}}}}',NULL,NULL,1,NULL,1674668484,0,NULL,NULL,'');
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
INSERT INTO `cache_hash` VALUES (1,'e3f9c41857fd5eff3a62366ab4da35fa',2145909600,'a:3:{s:8:\"options.\";a:8:{s:15:\"enableBookmarks\";s:1:\"1\";s:10:\"file_list.\";a:3:{s:23:\"enableDisplayThumbnails\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:10:\"thumbnail.\";a:2:{s:5:\"width\";s:2:\"64\";s:6:\"height\";s:2:\"64\";}}s:9:\"pageTree.\";a:1:{s:31:\"doktypesToShowInNewPageDragArea\";s:21:\"1,6,4,7,3,254,255,199\";}s:12:\"contextMenu.\";a:1:{s:6:\"table.\";a:3:{s:6:\"pages.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:9:\"sys_file.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:15:\"sys_filemounts.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}}}s:11:\"saveDocView\";s:1:\"1\";s:10:\"saveDocNew\";s:1:\"1\";s:11:\"saveDocNew.\";a:3:{s:5:\"pages\";s:1:\"0\";s:8:\"sys_file\";s:1:\"0\";s:17:\"sys_file_metadata\";s:1:\"0\";}s:14:\"disableDelete.\";a:1:{s:8:\"sys_file\";s:1:\"1\";}}s:9:\"admPanel.\";a:1:{s:7:\"enable.\";a:1:{s:3:\"all\";s:1:\"1\";}}s:12:\"TCAdefaults.\";a:1:{s:9:\"sys_note.\";a:2:{s:6:\"author\";s:0:\"\";s:5:\"email\";s:20:\"sacha@artgallery.tld\";}}}'),(2,'63dcf90b7e77769466156d54ac37f082',2145909600,'a:2:{s:9:\"constants\";a:4:{s:7:\"styles.\";a:1:{s:8:\"content.\";a:1:{s:10:\"loginform.\";a:22:{s:3:\"pid\";s:1:\"0\";s:9:\"recursive\";s:1:\"0\";s:22:\"showForgotPasswordLink\";s:1:\"0\";s:18:\"showForgotPassword\";s:1:\"0\";s:14:\"showPermaLogin\";s:1:\"0\";s:24:\"showLogoutFormAfterLogin\";s:1:\"0\";s:9:\"emailFrom\";s:0:\"\";s:13:\"emailFromName\";s:0:\"\";s:12:\"replyToEmail\";s:0:\"\";s:10:\"dateFormat\";s:9:\"Y-m-d H:i\";s:6:\"email.\";a:4:{s:14:\"layoutRootPath\";s:0:\"\";s:16:\"templateRootPath\";s:46:\"EXT:felogin/Resources/Private/Email/Templates/\";s:15:\"partialRootPath\";s:0:\"\";s:12:\"templateName\";s:16:\"PasswordRecovery\";}s:12:\"redirectMode\";s:0:\"\";s:19:\"redirectFirstMethod\";s:1:\"0\";s:17:\"redirectPageLogin\";s:1:\"0\";s:22:\"redirectPageLoginError\";s:1:\"0\";s:18:\"redirectPageLogout\";s:1:\"0\";s:15:\"redirectDisable\";s:1:\"0\";s:23:\"forgotLinkHashValidTime\";s:2:\"12\";s:20:\"newPasswordMinLength\";s:1:\"6\";s:7:\"domains\";s:0:\"\";s:43:\"exposeNonexistentUserInForgotPasswordDialog\";s:1:\"0\";s:12:\"templateFile\";s:76:\"EXT:bootstrap_package/Resources/Private/Templates/Felogin/FrontendLogin.html\";}}}s:7:\"plugin.\";a:6:{s:17:\"tx_felogin_login.\";a:1:{s:5:\"view.\";a:3:{s:16:\"templateRootPath\";s:0:\"\";s:15:\"partialRootPath\";s:0:\"\";s:14:\"layoutRootPath\";s:0:\"\";}}s:34:\"bootstrap_package_contentelements.\";a:11:{s:5:\"view.\";a:3:{s:14:\"layoutRootPath\";s:64:\"EXT:bootstrap_package/Resources/Private/Layouts/ContentElements/\";s:15:\"partialRootPath\";s:65:\"EXT:bootstrap_package/Resources/Private/Partials/ContentElements/\";s:16:\"templateRootPath\";s:66:\"EXT:bootstrap_package/Resources/Private/Templates/ContentElements/\";}s:7:\"header.\";a:3:{s:17:\"defaultHeaderType\";s:1:\"2\";s:5:\"class\";s:14:\"element-header\";s:5:\"date.\";a:1:{s:6:\"format\";s:9:\"%B %e, %Y\";}}s:10:\"subheader.\";a:1:{s:5:\"class\";s:17:\"element-subheader\";}s:9:\"lightbox.\";a:3:{s:8:\"cssClass\";s:8:\"lightbox\";s:6:\"prefix\";s:14:\"lightbox-group\";s:6:\"image.\";a:2:{s:9:\"maxHeight\";s:4:\"1200\";s:8:\"maxWidth\";s:4:\"1200\";}}s:6:\"media.\";a:1:{s:17:\"additionalConfig.\";a:7:{s:8:\"autoplay\";s:1:\"0\";s:8:\"controls\";s:1:\"1\";s:4:\"loop\";s:1:\"0\";s:11:\"enablejsapi\";s:1:\"1\";s:8:\"showinfo\";s:1:\"0\";s:13:\"relatedVideos\";s:1:\"0\";s:14:\"modestbranding\";s:1:\"0\";}}s:8:\"gallery.\";a:1:{s:8:\"columns.\";a:6:{s:2:\"1.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-1\";}s:2:\"2.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-2\";}s:2:\"3.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-3\";}s:2:\"4.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-4\";}s:2:\"5.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-5\";}s:2:\"6.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-6\";}}}s:15:\"menu_thumbnail.\";a:2:{s:6:\"title.\";a:1:{s:4:\"crop\";s:3:\"100\";}s:9:\"subtitle.\";a:1:{s:4:\"crop\";s:2:\"80\";}}s:10:\"menu_card.\";a:4:{s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"0\";s:6:\"height\";s:2:\"32\";s:5:\"width\";s:3:\"32c\";}s:6:\"title.\";a:1:{s:4:\"crop\";s:3:\"100\";}s:9:\"subtitle.\";a:1:{s:4:\"crop\";s:3:\"100\";}s:9:\"abstract.\";a:1:{s:4:\"crop\";s:3:\"250\";}}s:9:\"texticon.\";a:1:{s:5:\"icon.\";a:4:{s:8:\"default.\";a:2:{s:6:\"height\";s:2:\"32\";s:5:\"width\";s:2:\"32\";}s:7:\"medium.\";a:2:{s:6:\"height\";s:2:\"48\";s:5:\"width\";s:2:\"48\";}s:6:\"large.\";a:2:{s:6:\"height\";s:2:\"64\";s:5:\"width\";s:2:\"64\";}s:8:\"awesome.\";a:2:{s:6:\"height\";s:2:\"80\";s:5:\"width\";s:2:\"80\";}}}s:9:\"timeline.\";a:1:{s:5:\"date.\";a:1:{s:6:\"format\";s:17:\"%B %e, %Y - %H:%M\";}}s:8:\"uploads.\";a:1:{s:8:\"preview.\";a:2:{s:6:\"height\";s:4:\"100c\";s:5:\"width\";s:4:\"100c\";}}}s:20:\"tx_bootstrappackage.\";a:1:{s:5:\"view.\";a:3:{s:16:\"templateRootPath\";s:50:\"EXT:bootstrap_package/Resources/Private/Templates/\";s:15:\"partialRootPath\";s:49:\"EXT:bootstrap_package/Resources/Private/Partials/\";s:14:\"layoutRootPath\";s:48:\"EXT:bootstrap_package/Resources/Private/Layouts/\";}}s:7:\"tx_seo.\";a:2:{s:5:\"view.\";a:3:{s:16:\"templateRootPath\";s:36:\"EXT:seo/Resources/Private/Templates/\";s:15:\"partialRootPath\";s:35:\"EXT:seo/Resources/Private/Partials/\";s:14:\"layoutRootPath\";s:34:\"EXT:seo/Resources/Private/Layouts/\";}s:9:\"settings.\";a:1:{s:11:\"xmlSitemap.\";a:1:{s:9:\"sitemaps.\";a:1:{s:6:\"pages.\";a:3:{s:16:\"excludedDoktypes\";s:25:\"3, 4, 6, 7, 199, 254, 255\";s:21:\"excludePagesRecursive\";s:0:\"\";s:15:\"additionalWhere\";s:42:\"{#no_index} = 0 AND {#canonical_link} = \'\'\";}}}}}s:18:\"bootstrap_package.\";a:2:{s:9:\"settings.\";a:3:{s:23:\"overrideParserVariables\";s:1:\"1\";s:16:\"cssSourceMapping\";s:1:\"0\";s:5:\"scss.\";a:38:{s:5:\"white\";s:7:\"#ffffff\";s:8:\"gray-100\";s:7:\"#f8f8f8\";s:8:\"gray-200\";s:7:\"#e9e9e9\";s:8:\"gray-300\";s:7:\"#dedede\";s:8:\"gray-400\";s:7:\"#cecece\";s:8:\"gray-500\";s:7:\"#ababab\";s:8:\"gray-600\";s:7:\"#6c6c6c\";s:8:\"gray-700\";s:7:\"#494949\";s:8:\"gray-800\";s:7:\"#313131\";s:8:\"gray-900\";s:7:\"#212121\";s:5:\"black\";s:7:\"#000000\";s:7:\"primary\";s:7:\"#2a9d8f\";s:9:\"secondary\";s:7:\"#e76f51\";s:8:\"tertiary\";s:7:\"#f4a261\";s:10:\"quaternary\";s:7:\"#e9c46a\";s:7:\"default\";s:7:\"#eaebec\";s:7:\"success\";s:7:\"#5cb85c\";s:4:\"info\";s:7:\"#319fc0\";s:7:\"warning\";s:7:\"#f0ad4e\";s:6:\"danger\";s:7:\"#d9534f\";s:7:\"lighter\";s:9:\"$gray-100\";s:5:\"light\";s:9:\"$gray-200\";s:4:\"dark\";s:9:\"$gray-800\";s:6:\"darker\";s:9:\"$gray-900\";s:18:\"min-contrast-ratio\";s:3:\"2.4\";s:7:\"body-bg\";s:6:\"$white\";s:10:\"body-color\";s:9:\"$gray-900\";s:10:\"link-color\";s:8:\"$primary\";s:15:\"link-decoration\";s:4:\"none\";s:21:\"link-shade-percentage\";s:3:\"20%\";s:16:\"link-hover-color\";s:48:\"shift-color($link-color, $link-shade-percentage)\";s:21:\"link-hover-decoration\";s:9:\"underline\";s:22:\"font-family-sans-serif\";s:32:\"\"#{$google-webfont}\", sans-serif\";s:21:\"font-family-monospace\";s:85:\"SFMono-Regular, Menlo, Monaco, Consolas, \"Liberation Mono\", \"Courier New\", monospace;\";s:14:\"enable-rounded\";s:4:\"true\";s:14:\"enable-shadows\";s:4:\"true\";s:16:\"enable-gradients\";s:5:\"false\";s:18:\"enable-transitions\";s:4:\"true\";}}s:5:\"view.\";a:3:{s:14:\"layoutRootPath\";s:48:\"EXT:bootstrap_package/Resources/Private/Layouts/\";s:15:\"partialRootPath\";s:49:\"EXT:bootstrap_package/Resources/Private/Partials/\";s:16:\"templateRootPath\";s:50:\"EXT:bootstrap_package/Resources/Private/Templates/\";}}s:25:\"bootstrap_package_blocks.\";a:1:{s:5:\"view.\";a:3:{s:14:\"layoutRootPath\";s:55:\"EXT:bootstrap_package/Resources/Private/Layouts/Blocks/\";s:15:\"partialRootPath\";s:56:\"EXT:bootstrap_package/Resources/Private/Partials/Blocks/\";s:16:\"templateRootPath\";s:57:\"EXT:bootstrap_package/Resources/Private/Templates/Blocks/\";}}}s:5:\"page.\";a:6:{s:5:\"logo.\";a:6:{s:4:\"file\";s:66:\"EXT:bootstrap_package/Resources/Public/Images/BootstrapPackage.svg\";s:12:\"fileInverted\";s:74:\"EXT:bootstrap_package/Resources/Public/Images/BootstrapPackageInverted.svg\";s:6:\"height\";s:2:\"52\";s:5:\"width\";s:3:\"180\";s:3:\"alt\";s:0:\"\";s:9:\"linktitle\";s:0:\"\";}s:8:\"favicon.\";a:1:{s:4:\"file\";s:56:\"EXT:bootstrap_package/Resources/Public/Icons/favicon.ico\";}s:6:\"theme.\";a:11:{s:11:\"googleFont.\";a:3:{s:6:\"enable\";s:1:\"1\";s:4:\"font\";s:15:\"Source Sans Pro\";s:6:\"weight\";s:11:\"300,400,700\";}s:11:\"navigation.\";a:4:{s:5:\"style\";s:7:\"default\";s:4:\"type\";s:0:\"\";s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"1\";s:5:\"width\";s:2:\"20\";s:6:\"height\";s:2:\"20\";}s:9:\"dropdown.\";a:1:{s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"1\";s:5:\"width\";s:2:\"16\";s:6:\"height\";s:2:\"16\";}}}s:14:\"subnavigation.\";a:1:{s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"1\";s:5:\"width\";s:2:\"16\";s:6:\"height\";s:2:\"16\";}}s:11:\"breadcrumb.\";a:3:{s:6:\"enable\";s:1:\"1\";s:11:\"enableLevel\";s:1:\"2\";s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"0\";s:5:\"width\";s:2:\"16\";s:6:\"height\";s:2:\"16\";}}s:5:\"meta.\";a:4:{s:6:\"enable\";s:1:\"1\";s:15:\"navigationValue\";s:0:\"\";s:14:\"navigationType\";s:4:\"list\";s:16:\"includeNotInMenu\";s:1:\"1\";}s:8:\"contact.\";a:4:{s:6:\"enable\";s:1:\"0\";s:5:\"label\";s:80:\"LLL:EXT:bootstrap_package/Resources/Private/Language/locallang.xlf:contact.label\";s:5:\"data.\";a:9:{s:5:\"title\";s:0:\"\";s:12:\"addressLine1\";s:0:\"\";s:12:\"addressLine2\";s:0:\"\";s:12:\"addressLine3\";s:0:\"\";s:7:\"country\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:3:\"fax\";s:0:\"\";s:5:\"email\";s:0:\"\";s:3:\"www\";s:0:\"\";}s:7:\"button.\";a:3:{s:7:\"pageUid\";s:0:\"\";s:5:\"label\";s:87:\"LLL:EXT:bootstrap_package/Resources/Private/Language/locallang.xlf:contact.button.label\";s:10:\"colorClass\";s:7:\"primary\";}}s:17:\"footernavigation.\";a:6:{s:6:\"enable\";s:1:\"0\";s:15:\"navigationValue\";s:0:\"\";s:14:\"navigationType\";s:4:\"list\";s:16:\"includeNotInMenu\";s:1:\"1\";s:6:\"levels\";s:1:\"2\";s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"1\";s:5:\"width\";s:2:\"16\";s:6:\"height\";s:2:\"16\";}}s:9:\"language.\";a:2:{s:6:\"enable\";s:1:\"1\";s:13:\"languageValue\";s:4:\"auto\";}s:12:\"socialmedia.\";a:2:{s:6:\"enable\";s:1:\"1\";s:9:\"channels.\";a:11:{s:9:\"facebook.\";a:2:{s:5:\"label\";s:8:\"Facebook\";s:3:\"url\";s:0:\"\";}s:8:\"twitter.\";a:2:{s:5:\"label\";s:7:\"Twitter\";s:3:\"url\";s:0:\"\";}s:10:\"instagram.\";a:2:{s:5:\"label\";s:9:\"Instagram\";s:3:\"url\";s:0:\"\";}s:7:\"github.\";a:2:{s:5:\"label\";s:6:\"GitHub\";s:3:\"url\";s:0:\"\";}s:11:\"googleplus.\";a:2:{s:5:\"label\";s:7:\"Google+\";s:3:\"url\";s:0:\"\";}s:9:\"linkedin.\";a:2:{s:5:\"label\";s:8:\"LinkedIn\";s:3:\"url\";s:0:\"\";}s:5:\"xing.\";a:2:{s:5:\"label\";s:4:\"Xing\";s:3:\"url\";s:0:\"\";}s:8:\"youtube.\";a:2:{s:5:\"label\";s:7:\"YouTube\";s:3:\"url\";s:0:\"\";}s:3:\"vk.\";a:2:{s:5:\"label\";s:2:\"VK\";s:3:\"url\";s:0:\"\";}s:6:\"vimeo.\";a:2:{s:5:\"label\";s:5:\"Vimeo\";s:3:\"url\";s:0:\"\";}s:4:\"rss.\";a:2:{s:5:\"label\";s:3:\"RSS\";s:3:\"url\";s:0:\"\";}}}s:10:\"copyright.\";a:2:{s:6:\"enable\";s:1:\"1\";s:4:\"text\";s:186:\"Running with <a href=\"http://www.typo3.org\" rel=\"noopener\" target=\"_blank\">TYPO3</a> and <a href=\"https://www.bootstrap-package.com\" rel=\"noopener\" target=\"_blank\">Bootstrap Package</a>.\";}s:14:\"cookieconsent.\";a:10:{s:6:\"enable\";s:1:\"1\";s:6:\"layout\";s:5:\"basic\";s:8:\"position\";s:6:\"bottom\";s:6:\"static\";s:1:\"0\";s:8:\"content.\";a:1:{s:4:\"href\";s:0:\"\";}s:9:\"revokable\";s:1:\"0\";s:8:\"location\";s:1:\"0\";s:4:\"law.\";a:2:{s:11:\"countryCode\";s:0:\"\";s:11:\"regionalLaw\";s:1:\"1\";}s:4:\"type\";s:4:\"info\";s:7:\"cookie.\";a:1:{s:10:\"expiryDays\";s:3:\"365\";}}}s:14:\"fluidtemplate.\";a:3:{s:14:\"layoutRootPath\";s:53:\"EXT:bootstrap_package/Resources/Private/Layouts/Page/\";s:15:\"partialRootPath\";s:54:\"EXT:bootstrap_package/Resources/Private/Partials/Page/\";s:16:\"templateRootPath\";s:55:\"EXT:bootstrap_package/Resources/Private/Templates/Page/\";}s:5:\"meta.\";a:6:{s:8:\"viewport\";s:52:\"width=device-width, initial-scale=1, minimum-scale=1\";s:6:\"robots\";s:12:\"index,follow\";s:28:\"apple-mobile-web-app-capable\";s:2:\"no\";s:10:\"compatible\";s:7:\"IE=edge\";s:6:\"google\";s:11:\"notranslate\";s:24:\"google-site-verification\";s:0:\"\";}s:9:\"tracking.\";a:1:{s:7:\"google.\";a:1:{s:21:\"tagManagerContainerId\";s:0:\"\";}}}s:7:\"config.\";a:10:{s:8:\"no_cache\";s:1:\"0\";s:15:\"removeDefaultJS\";s:1:\"0\";s:10:\"compressJs\";s:1:\"1\";s:11:\"compressCss\";s:1:\"1\";s:13:\"concatenateJs\";s:1:\"1\";s:14:\"concatenateCss\";s:1:\"1\";s:8:\"admPanel\";s:1:\"1\";s:18:\"prefixLocalAnchors\";s:3:\"all\";s:13:\"headerComment\";s:90:\"Based on the TYPO3 Bootstrap Package by Benjamin Kott - https://www.bootstrap-package.com/\";s:16:\"sendCacheHeaders\";s:1:\"1\";}}s:5:\"setup\";a:13:{s:7:\"config.\";a:24:{s:19:\"pageTitleProviders.\";a:2:{s:7:\"record.\";a:1:{s:8:\"provider\";s:48:\"TYPO3\\CMS\\Core\\PageTitle\\RecordPageTitleProvider\";}s:4:\"seo.\";a:2:{s:8:\"provider\";s:49:\"TYPO3\\CMS\\Seo\\PageTitle\\SeoTitlePageTitleProvider\";s:6:\"before\";s:6:\"record\";}}s:12:\"absRefPrefix\";s:4:\"auto\";s:8:\"no_cache\";s:1:\"0\";s:14:\"pageTitleFirst\";s:1:\"1\";s:18:\"pageTitleSeparator\";s:1:\"-\";s:19:\"pageTitleSeparator.\";a:1:{s:10:\"noTrimWrap\";s:5:\"| | |\";}s:8:\"linkVars\";s:6:\"L(int)\";s:18:\"prefixLocalAnchors\";s:3:\"all\";s:7:\"doctype\";s:5:\"html5\";s:15:\"removeDefaultJS\";s:1:\"0\";s:8:\"admPanel\";s:1:\"1\";s:5:\"debug\";s:1:\"0\";s:16:\"sendCacheHeaders\";s:1:\"1\";s:12:\"index_enable\";s:1:\"1\";s:15:\"index_externals\";s:1:\"1\";s:14:\"index_metatags\";s:1:\"1\";s:13:\"headerComment\";s:90:\"Based on the TYPO3 Bootstrap Package by Benjamin Kott - https://www.bootstrap-package.com/\";s:20:\"sys_language_overlay\";s:1:\"1\";s:17:\"sys_language_mode\";s:16:\"content_fallback\";s:10:\"compressJs\";s:1:\"1\";s:11:\"compressCss\";s:1:\"1\";s:13:\"concatenateJs\";s:1:\"1\";s:14:\"concatenateCss\";s:1:\"1\";s:11:\"tx_extbase.\";a:3:{s:4:\"mvc.\";a:1:{s:48:\"throwPageNotFoundExceptionIfActionCantBeResolved\";s:1:\"0\";}s:12:\"persistence.\";a:2:{s:28:\"enableAutomaticCacheClearing\";s:1:\"1\";s:20:\"updateReferenceIndex\";s:1:\"0\";}s:9:\"features.\";a:2:{s:20:\"skipDefaultArguments\";s:1:\"0\";s:25:\"ignoreAllEnableFieldsInBe\";s:1:\"0\";}}}s:7:\"styles.\";a:1:{s:8:\"content.\";a:2:{s:3:\"get\";s:7:\"CONTENT\";s:4:\"get.\";a:2:{s:5:\"table\";s:10:\"tt_content\";s:7:\"select.\";a:2:{s:7:\"orderBy\";s:7:\"sorting\";s:5:\"where\";s:11:\"{#colPos}=0\";}}}}s:10:\"tt_content\";s:4:\"CASE\";s:11:\"tt_content.\";a:101:{s:4:\"key.\";a:1:{s:5:\"field\";s:5:\"CType\";}s:7:\"default\";s:4:\"TEXT\";s:8:\"default.\";a:4:{s:5:\"field\";s:5:\"CType\";s:16:\"htmlSpecialChars\";s:1:\"1\";s:4:\"wrap\";s:165:\"<p style=\"background-color: yellow; padding: 0.5em 1em;\"><strong>ERROR:</strong> Content Element with uid \"{field:uid}\" and type \"|\" has no rendering definition!</p>\";s:5:\"wrap.\";a:1:{s:10:\"insertData\";s:1:\"1\";}}s:5:\"audio\";s:20:\"< lib.contentElement\";s:6:\"audio.\";a:2:{s:12:\"templateName\";s:5:\"Audio\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:6:\"assets\";}}}}s:7:\"bullets\";s:20:\"< lib.contentElement\";s:8:\"bullets.\";a:2:{s:12:\"templateName\";s:7:\"Bullets\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\SplitProcessor\";s:3:\"10.\";a:4:{s:3:\"if.\";a:2:{s:5:\"value\";s:1:\"2\";s:11:\"isLessThan.\";a:1:{s:5:\"field\";s:12:\"bullets_type\";}}s:9:\"fieldName\";s:8:\"bodytext\";s:18:\"removeEmptyEntries\";s:1:\"1\";s:2:\"as\";s:7:\"bullets\";}i:20;s:62:\"TYPO3\\CMS\\Frontend\\DataProcessing\\CommaSeparatedValueProcessor\";s:3:\"20.\";a:4:{s:9:\"fieldName\";s:8:\"bodytext\";s:3:\"if.\";a:2:{s:5:\"value\";s:1:\"2\";s:7:\"equals.\";a:1:{s:5:\"field\";s:12:\"bullets_type\";}}s:14:\"fieldDelimiter\";s:1:\"|\";s:2:\"as\";s:7:\"bullets\";}}}s:3:\"csv\";s:20:\"< lib.contentElement\";s:4:\"csv.\";a:2:{s:12:\"templateName\";s:3:\"Csv\";s:15:\"dataProcessing.\";a:2:{i:10;s:53:\"BK2K\\BootstrapPackage\\DataProcessing\\CsvFileProcessor\";s:3:\"10.\";a:4:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}s:15:\"fieldDelimiter.\";a:1:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_delimiter\";}}}s:15:\"fieldEnclosure.\";a:1:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_enclosure\";}}}s:15:\"maximumColumns.\";a:1:{s:5:\"field\";s:4:\"cols\";}}}}s:3:\"div\";s:20:\"< lib.contentElement\";s:4:\"div.\";a:1:{s:12:\"templateName\";s:3:\"Div\";}s:6:\"header\";s:20:\"< lib.contentElement\";s:7:\"header.\";a:1:{s:12:\"templateName\";s:6:\"Header\";}s:4:\"html\";s:20:\"< lib.contentElement\";s:5:\"html.\";a:1:{s:12:\"templateName\";s:4:\"Html\";}s:5:\"image\";s:20:\"< lib.contentElement\";s:6:\"image.\";a:2:{s:12:\"templateName\";s:5:\"Image\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:8:\"folders.\";a:1:{s:5:\"field\";s:11:\"file_folder\";}s:8:\"sorting.\";a:1:{s:5:\"field\";s:16:\"filelink_sorting\";}}i:20;s:56:\"BK2K\\BootstrapPackage\\DataProcessing\\FileFilterProcessor\";s:3:\"20.\";a:1:{s:14:\"predefinedList\";s:5:\"image\";}}}s:4:\"list\";s:20:\"< lib.contentElement\";s:5:\"list.\";a:1:{s:12:\"templateName\";s:4:\"List\";}s:5:\"media\";s:20:\"< lib.contentElement\";s:6:\"media.\";a:2:{s:12:\"templateName\";s:5:\"Media\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:6:\"assets\";}s:8:\"folders.\";a:1:{s:5:\"field\";s:11:\"file_folder\";}s:8:\"sorting.\";a:1:{s:5:\"field\";s:16:\"filelink_sorting\";}}i:20;s:56:\"BK2K\\BootstrapPackage\\DataProcessing\\FileFilterProcessor\";s:3:\"20.\";a:1:{s:21:\"allowedFileExtensions\";s:14:\"youtube, vimeo\";}}}s:13:\"menu_abstract\";s:20:\"< lib.contentElement\";s:14:\"menu_abstract.\";a:2:{s:12:\"templateName\";s:12:\"MenuAbstract\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:24:\"menu_categorized_content\";s:20:\"< lib.contentElement\";s:25:\"menu_categorized_content.\";a:2:{s:12:\"templateName\";s:22:\"MenuCategorizedContent\";s:15:\"dataProcessing.\";a:4:{i:10;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"10.\";a:9:{s:5:\"table\";s:10:\"tt_content\";s:12:\"selectFields\";s:12:\"tt_content.*\";s:7:\"groupBy\";s:3:\"uid\";s:10:\"pidInList.\";a:1:{s:4:\"data\";s:12:\"leveluid : 0\";}s:9:\"recursive\";s:2:\"99\";s:5:\"join.\";a:2:{s:4:\"data\";s:25:\"field:selected_categories\";s:4:\"wrap\";s:120:\"sys_category_record_mm ON tt_content.uid = sys_category_record_mm.uid_foreign AND sys_category_record_mm.uid_local IN(|)\";}s:6:\"where.\";a:2:{s:4:\"data\";s:20:\"field:category_field\";s:4:\"wrap\";s:41:\"tablenames=\'tt_content\' and fieldname=\'|\'\";}s:2:\"as\";s:7:\"content\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:22:\"menu_categorized_pages\";s:20:\"< lib.contentElement\";s:23:\"menu_categorized_pages.\";a:2:{s:12:\"templateName\";s:20:\"MenuCategorizedPages\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:10:\"categories\";s:8:\"special.\";a:4:{s:6:\"value.\";a:1:{s:5:\"field\";s:19:\"selected_categories\";}s:9:\"relation.\";a:1:{s:5:\"field\";s:14:\"category_field\";}s:7:\"sorting\";s:5:\"title\";s:5:\"order\";s:3:\"asc\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:10:\"menu_pages\";s:20:\"< lib.contentElement\";s:11:\"menu_pages.\";a:2:{s:12:\"templateName\";s:9:\"MenuPages\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:16:\"includeNotInMenu\";s:1:\"1\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:13:\"menu_subpages\";s:20:\"< lib.contentElement\";s:14:\"menu_subpages.\";a:2:{s:12:\"templateName\";s:12:\"MenuSubpages\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:21:\"menu_recently_updated\";s:20:\"< lib.contentElement\";s:22:\"menu_recently_updated.\";a:2:{s:12:\"templateName\";s:19:\"MenuRecentlyUpdated\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:7:\"updated\";s:8:\"special.\";a:3:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}s:6:\"maxAge\";s:9:\"3600*24*7\";s:20:\"excludeNoSearchPages\";s:1:\"1\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:18:\"menu_related_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_related_pages.\";a:2:{s:12:\"templateName\";s:16:\"MenuRelatedPages\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:8:\"keywords\";s:8:\"special.\";a:2:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}s:20:\"excludeNoSearchPages\";s:1:\"1\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:12:\"menu_section\";s:20:\"< lib.contentElement\";s:13:\"menu_section.\";a:2:{s:12:\"templateName\";s:11:\"MenuSection\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:2:{s:5:\"field\";s:5:\"pages\";s:9:\"override.\";a:2:{s:4:\"data\";s:8:\"page:uid\";s:3:\"if.\";a:1:{s:8:\"isFalse.\";a:1:{s:5:\"field\";s:5:\"pages\";}}}}}s:16:\"includeNotInMenu\";s:1:\"1\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:6:{s:5:\"table\";s:10:\"tt_content\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"uid\";}s:2:\"as\";s:7:\"content\";s:5:\"where\";s:16:\"sectionIndex = 1\";s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:18:\"menu_section_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_section_pages.\";a:2:{s:12:\"templateName\";s:16:\"MenuSectionPages\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:6:{s:5:\"table\";s:10:\"tt_content\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"uid\";}s:2:\"as\";s:7:\"content\";s:5:\"where\";s:16:\"sectionIndex = 1\";s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:12:\"menu_sitemap\";s:20:\"< lib.contentElement\";s:13:\"menu_sitemap.\";a:2:{s:12:\"templateName\";s:11:\"MenuSitemap\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:6:\"levels\";s:1:\"7\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:18:\"menu_sitemap_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_sitemap_pages.\";a:2:{s:12:\"templateName\";s:16:\"MenuSitemapPages\";s:15:\"dataProcessing.\";a:4:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:6:\"levels\";s:1:\"7\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:5:\"quote\";s:20:\"< lib.contentElement\";s:6:\"quote.\";a:1:{s:12:\"templateName\";s:5:\"Quote\";}s:8:\"shortcut\";s:20:\"< lib.contentElement\";s:9:\"shortcut.\";a:2:{s:12:\"templateName\";s:8:\"Shortcut\";s:10:\"variables.\";a:2:{s:9:\"shortcuts\";s:7:\"RECORDS\";s:10:\"shortcuts.\";a:2:{s:7:\"source.\";a:1:{s:5:\"field\";s:7:\"records\";}s:6:\"tables\";s:10:\"tt_content\";}}}s:12:\"social_links\";s:20:\"< lib.contentElement\";s:13:\"social_links.\";a:2:{s:12:\"templateName\";s:11:\"SocialLinks\";s:15:\"dataProcessing.\";a:2:{i:1;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\ConstantsProcessor\";s:2:\"1.\";a:2:{s:2:\"as\";s:11:\"socialmedia\";s:3:\"key\";s:22:\"page.theme.socialmedia\";}}}s:5:\"table\";s:20:\"< lib.contentElement\";s:6:\"table.\";a:2:{s:12:\"templateName\";s:5:\"Table\";s:15:\"dataProcessing.\";a:2:{i:10;s:62:\"TYPO3\\CMS\\Frontend\\DataProcessing\\CommaSeparatedValueProcessor\";s:3:\"10.\";a:4:{s:9:\"fieldName\";s:8:\"bodytext\";s:15:\"fieldDelimiter.\";a:1:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_delimiter\";}}}s:15:\"fieldEnclosure.\";a:1:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_enclosure\";}}}s:2:\"as\";s:5:\"table\";}}}s:4:\"text\";s:20:\"< lib.contentElement\";s:5:\"text.\";a:1:{s:12:\"templateName\";s:4:\"Text\";}s:10:\"textcolumn\";s:20:\"< lib.contentElement\";s:11:\"textcolumn.\";a:1:{s:12:\"templateName\";s:10:\"Textcolumn\";}s:10:\"textteaser\";s:20:\"< lib.contentElement\";s:11:\"textteaser.\";a:1:{s:12:\"templateName\";s:10:\"Textteaser\";}s:7:\"textpic\";s:20:\"< lib.contentElement\";s:8:\"textpic.\";a:3:{s:12:\"templateName\";s:4:\"TEXT\";s:13:\"templateName.\";a:1:{s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:4:\"CASE\";s:8:\"cObject.\";a:13:{s:4:\"key.\";a:1:{s:5:\"field\";s:11:\"imageorient\";}i:8;s:4:\"TEXT\";s:2:\"8.\";a:1:{s:5:\"value\";s:12:\"TextpicBelow\";}i:25;s:4:\"TEXT\";s:3:\"25.\";a:1:{s:5:\"value\";s:12:\"TextpicRight\";}i:26;s:4:\"TEXT\";s:3:\"26.\";a:1:{s:5:\"value\";s:11:\"TextpicLeft\";}i:125;s:4:\"TEXT\";s:4:\"125.\";a:1:{s:5:\"value\";s:20:\"TextpicCenteredRight\";}i:126;s:4:\"TEXT\";s:4:\"126.\";a:1:{s:5:\"value\";s:19:\"TextpicCenteredLeft\";}s:7:\"default\";s:4:\"TEXT\";s:8:\"default.\";a:1:{s:5:\"value\";s:12:\"TextpicAbove\";}}}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:8:\"folders.\";a:1:{s:5:\"field\";s:11:\"file_folder\";}s:8:\"sorting.\";a:1:{s:5:\"field\";s:16:\"filelink_sorting\";}}i:20;s:56:\"BK2K\\BootstrapPackage\\DataProcessing\\FileFilterProcessor\";s:3:\"20.\";a:1:{s:14:\"predefinedList\";s:5:\"image\";}}}s:9:\"textmedia\";s:20:\"< lib.contentElement\";s:10:\"textmedia.\";a:3:{s:12:\"templateName\";s:4:\"TEXT\";s:13:\"templateName.\";a:1:{s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:4:\"CASE\";s:8:\"cObject.\";a:13:{s:4:\"key.\";a:1:{s:5:\"field\";s:11:\"imageorient\";}i:8;s:4:\"TEXT\";s:2:\"8.\";a:1:{s:5:\"value\";s:14:\"TextmediaBelow\";}i:25;s:4:\"TEXT\";s:3:\"25.\";a:1:{s:5:\"value\";s:14:\"TextmediaRight\";}i:26;s:4:\"TEXT\";s:3:\"26.\";a:1:{s:5:\"value\";s:13:\"TextmediaLeft\";}i:125;s:4:\"TEXT\";s:4:\"125.\";a:1:{s:5:\"value\";s:22:\"TextmediaCenteredRight\";}i:126;s:4:\"TEXT\";s:4:\"126.\";a:1:{s:5:\"value\";s:21:\"TextmediaCenteredLeft\";}s:7:\"default\";s:4:\"TEXT\";s:8:\"default.\";a:1:{s:5:\"value\";s:14:\"TextmediaAbove\";}}}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:6:\"assets\";}}}}s:7:\"uploads\";s:20:\"< lib.contentElement\";s:8:\"uploads.\";a:2:{s:12:\"templateName\";s:7:\"Uploads\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}s:12:\"collections.\";a:1:{s:5:\"field\";s:16:\"file_collections\";}s:8:\"sorting.\";a:2:{s:5:\"field\";s:16:\"filelink_sorting\";s:10:\"direction.\";a:1:{s:5:\"field\";s:26:\"filelink_sorting_direction\";}}}}}s:9:\"accordion\";s:20:\"< lib.contentElement\";s:10:\"accordion.\";a:2:{s:12:\"templateName\";s:9:\"Accordion\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:34:\"tx_bootstrappackage_accordion_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}}s:10:\"card_group\";s:20:\"< lib.contentElement\";s:11:\"card_group.\";a:2:{s:12:\"templateName\";s:9:\"CardGroup\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:35:\"tx_bootstrappackage_card_group_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:2:\"as\";s:5:\"image\";}i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:4:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:13:\"link_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:20:\"link_icon_identifier\";}s:17:\"iconFileFieldName\";s:9:\"link_icon\";s:2:\"as\";s:8:\"linkIcon\";}}}}}s:8:\"carousel\";s:20:\"< lib.contentElement\";s:9:\"carousel.\";a:2:{s:12:\"templateName\";s:8:\"Carousel\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:33:\"tx_bootstrappackage_carousel_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:6:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:16:\"background_image\";}s:2:\"as\";s:15:\"backgroundImage\";}i:20;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"20.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:2:\"as\";s:6:\"images\";}i:1532633187;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";s:11:\"1532633187.\";a:1:{s:9:\"fieldName\";s:24:\"background_image_options\";}}}}}s:14:\"carousel_small\";s:20:\"< lib.contentElement\";s:15:\"carousel_small.\";a:2:{s:12:\"templateName\";s:13:\"CarouselSmall\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:33:\"tx_bootstrappackage_carousel_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:6:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:16:\"background_image\";}s:2:\"as\";s:15:\"backgroundImage\";}i:20;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"20.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:2:\"as\";s:6:\"images\";}i:1532633187;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";s:11:\"1532633187.\";a:1:{s:9:\"fieldName\";s:24:\"background_image_options\";}}}}}s:19:\"carousel_fullscreen\";s:20:\"< lib.contentElement\";s:20:\"carousel_fullscreen.\";a:2:{s:12:\"templateName\";s:18:\"CarouselFullscreen\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:33:\"tx_bootstrappackage_carousel_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:6:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:16:\"background_image\";}s:2:\"as\";s:15:\"backgroundImage\";}i:20;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"20.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:2:\"as\";s:6:\"images\";}i:1532633187;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";s:11:\"1532633187.\";a:1:{s:9:\"fieldName\";s:24:\"background_image_options\";}}}}}s:14:\"external_media\";s:20:\"< lib.contentElement\";s:15:\"external_media.\";a:1:{s:12:\"templateName\";s:13:\"ExternalMedia\";}s:7:\"gallery\";s:20:\"< lib.contentElement\";s:8:\"gallery.\";a:2:{s:12:\"templateName\";s:7:\"Gallery\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:8:\"folders.\";a:1:{s:5:\"field\";s:11:\"file_folder\";}s:8:\"sorting.\";a:1:{s:5:\"field\";s:16:\"filelink_sorting\";}}i:20;s:56:\"BK2K\\BootstrapPackage\\DataProcessing\\FileFilterProcessor\";s:3:\"20.\";a:1:{s:14:\"predefinedList\";s:5:\"image\";}}}s:10:\"icon_group\";s:20:\"< lib.contentElement\";s:11:\"icon_group.\";a:2:{s:12:\"templateName\";s:9:\"IconGroup\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:35:\"tx_bootstrappackage_icon_group_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:4:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:8:\"icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:15:\"icon_identifier\";}s:17:\"iconFileFieldName\";s:9:\"icon_file\";s:2:\"as\";s:4:\"icon\";}}}}}s:9:\"listgroup\";s:20:\"< lib.contentElement\";s:10:\"listgroup.\";a:2:{s:12:\"templateName\";s:9:\"ListGroup\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\SplitProcessor\";s:3:\"10.\";a:3:{s:9:\"fieldName\";s:8:\"bodytext\";s:18:\"removeEmptyEntries\";s:1:\"1\";s:2:\"as\";s:5:\"items\";}}}s:5:\"panel\";s:20:\"< lib.contentElement\";s:6:\"panel.\";a:1:{s:12:\"templateName\";s:5:\"Panel\";}s:3:\"tab\";s:20:\"< lib.contentElement\";s:4:\"tab.\";a:2:{s:12:\"templateName\";s:3:\"Tab\";s:15:\"dataProcessing.\";a:3:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:28:\"tx_bootstrappackage_tab_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}}s:8:\"texticon\";s:20:\"< lib.contentElement\";s:9:\"texticon.\";a:2:{s:12:\"templateName\";s:8:\"Texticon\";s:15:\"dataProcessing.\";a:2:{i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:4:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:8:\"icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:4:\"icon\";}s:17:\"iconFileFieldName\";s:9:\"icon_file\";s:2:\"as\";s:4:\"icon\";}}}s:8:\"timeline\";s:20:\"< lib.contentElement\";s:9:\"timeline.\";a:2:{s:12:\"templateName\";s:8:\"Timeline\";s:15:\"dataProcessing.\";a:2:{i:10;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"10.\";a:5:{s:5:\"table\";s:33:\"tx_bootstrappackage_timeline_item\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"pid\";}s:6:\"where.\";a:3:{s:4:\"data\";s:9:\"field:uid\";s:6:\"intval\";s:1:\"1\";s:4:\"wrap\";s:12:\"tt_content=|\";}s:8:\"orderBy.\";a:1:{s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:4:\"data\";s:28:\"flexform:pi_flexform:sorting\";s:8:\"ifEmpty.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:7:\"current\";s:1:\"1\";}s:7:\"ifEmpty\";s:9:\"date desc\";}}}}}s:15:\"dataProcessing.\";a:4:{i:20;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"20.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}s:2:\"as\";s:5:\"image\";}i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:4:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:8:\"icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:15:\"icon_identifier\";}s:17:\"iconFileFieldName\";s:9:\"icon_file\";s:2:\"as\";s:4:\"icon\";}}}}}s:13:\"menu_card_dir\";s:20:\"< lib.contentElement\";s:14:\"menu_card_dir.\";a:2:{s:12:\"templateName\";s:11:\"MenuCardDir\";s:15:\"dataProcessing.\";a:5:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"20.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:9:\"thumbnail\";}s:3:\"if.\";a:1:{s:6:\"isTrue\";s:70:\"{$plugin.bootstrap_package_contentelements.menu_card.thumbnail.enable}\";}}i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:5:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:12:\"nav_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:19:\"nav_icon_identifier\";}s:17:\"iconFileFieldName\";s:8:\"nav_icon\";s:2:\"as\";s:4:\"icon\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:1:\"0\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:14:\"menu_card_list\";s:20:\"< lib.contentElement\";s:15:\"menu_card_list.\";a:2:{s:12:\"templateName\";s:12:\"MenuCardList\";s:15:\"dataProcessing.\";a:5:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"20.\";a:4:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:16:\"includeNotInMenu\";s:1:\"1\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:9:\"thumbnail\";}s:3:\"if.\";a:1:{s:6:\"isTrue\";s:70:\"{$plugin.bootstrap_package_contentelements.menu_card.thumbnail.enable}\";}}i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:5:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:12:\"nav_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:19:\"nav_icon_identifier\";}s:17:\"iconFileFieldName\";s:8:\"nav_icon\";s:2:\"as\";s:4:\"icon\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:1:\"0\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:18:\"menu_thumbnail_dir\";s:20:\"< lib.contentElement\";s:19:\"menu_thumbnail_dir.\";a:2:{s:12:\"templateName\";s:16:\"MenuThumbnailDir\";s:15:\"dataProcessing.\";a:5:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"20.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:9:\"thumbnail\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:19:\"menu_thumbnail_list\";s:20:\"< lib.contentElement\";s:20:\"menu_thumbnail_list.\";a:2:{s:12:\"templateName\";s:17:\"MenuThumbnailList\";s:15:\"dataProcessing.\";a:5:{i:10;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";i:20;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"20.\";a:4:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:16:\"includeNotInMenu\";s:1:\"1\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:9:\"thumbnail\";}}}}i:90;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"90.\";a:7:{s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:5:\"field\";s:20:\"accessibility_bypass\";}}s:5:\"table\";s:10:\"tt_content\";s:9:\"pidInList\";s:4:\"this\";s:7:\"orderBy\";s:7:\"sorting\";s:3:\"max\";s:1:\"1\";s:6:\"where.\";a:1:{s:8:\"dataWrap\";s:53:\"colPos = {field:colPos} AND sorting > {field:sorting}\";}s:2:\"as\";s:18:\"nextContentElement\";}}}s:18:\"form_formframework\";s:20:\"< lib.contentElement\";s:19:\"form_formframework.\";a:3:{s:12:\"templateName\";s:7:\"Generic\";i:20;s:4:\"USER\";s:3:\"20.\";a:3:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:13:\"extensionName\";s:4:\"Form\";s:10:\"pluginName\";s:13:\"Formframework\";}}s:13:\"felogin_login\";s:20:\"< lib.contentElement\";s:14:\"felogin_login.\";a:3:{s:12:\"templateName\";s:7:\"Generic\";i:20;s:4:\"USER\";s:3:\"20.\";a:3:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:13:\"extensionName\";s:7:\"Felogin\";s:10:\"pluginName\";s:5:\"Login\";}}}s:7:\"module.\";a:3:{s:8:\"tx_form.\";a:2:{s:9:\"settings.\";a:1:{s:19:\"yamlConfigurations.\";a:2:{i:10;s:42:\"EXT:form/Configuration/Yaml/FormSetup.yaml\";i:110;s:51:\"EXT:bootstrap_package/Configuration/Form/Setup.yaml\";}}s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:10;s:45:\"EXT:form/Resources/Private/Backend/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:10;s:44:\"EXT:form/Resources/Private/Backend/Partials/\";}s:16:\"layoutRootPaths.\";a:1:{i:10;s:43:\"EXT:form/Resources/Private/Backend/Layouts/\";}}}s:9:\"tx_belog.\";a:1:{s:9:\"settings.\";a:2:{s:29:\"selectableNumberOfLogEntries.\";a:6:{i:50;s:2:\"50\";i:100;s:3:\"100\";i:200;s:3:\"200\";i:500;s:3:\"500\";i:1000;s:4:\"1000\";i:1000000;s:3:\"any\";}s:18:\"selectableActions.\";a:7:{i:0;s:3:\"any\";i:1;s:14:\"actionDatabase\";i:2;s:10:\"actionFile\";i:3;s:11:\"actionCache\";i:254;s:14:\"actionSettings\";i:255;s:11:\"actionLogin\";i:-1;s:12:\"actionErrors\";}}}s:20:\"tx_extensionmanager.\";a:1:{s:9:\"features.\";a:1:{s:20:\"skipDefaultArguments\";s:1:\"0\";}}}s:7:\"plugin.\";a:5:{s:17:\"tx_felogin_login.\";a:2:{s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:10;s:0:\"\";}s:17:\"partialRootPaths.\";a:1:{i:10;s:0:\"\";}s:16:\"layoutRootPaths.\";a:1:{i:10;s:0:\"\";}}s:9:\"settings.\";a:21:{s:5:\"pages\";s:1:\"0\";s:9:\"recursive\";s:1:\"0\";s:10:\"dateFormat\";s:9:\"Y-m-d H:i\";s:18:\"showForgotPassword\";s:1:\"0\";s:22:\"showForgotPasswordLink\";s:1:\"0\";s:14:\"showPermaLogin\";s:1:\"0\";s:24:\"showLogoutFormAfterLogin\";s:1:\"0\";s:10:\"email_from\";s:0:\"\";s:14:\"email_fromName\";s:0:\"\";s:6:\"email.\";a:4:{s:12:\"templateName\";s:16:\"PasswordRecovery\";s:16:\"layoutRootPaths.\";a:1:{i:20;s:0:\"\";}s:18:\"templateRootPaths.\";a:1:{i:20;s:46:\"EXT:felogin/Resources/Private/Email/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:20;s:0:\"\";}}s:12:\"redirectMode\";s:0:\"\";s:19:\"redirectFirstMethod\";s:1:\"0\";s:17:\"redirectPageLogin\";s:1:\"0\";s:22:\"redirectPageLoginError\";s:1:\"0\";s:18:\"redirectPageLogout\";s:1:\"0\";s:15:\"redirectDisable\";s:1:\"0\";s:43:\"exposeNonexistentUserInForgotPasswordDialog\";s:1:\"0\";s:23:\"forgotLinkHashValidTime\";s:2:\"12\";s:7:\"domains\";s:0:\"\";s:19:\"passwordValidators.\";a:2:{i:10;s:56:\"TYPO3\\CMS\\Extbase\\Validation\\Validator\\NotEmptyValidator\";s:3:\"20.\";a:2:{s:9:\"className\";s:60:\"TYPO3\\CMS\\Extbase\\Validation\\Validator\\StringLengthValidator\";s:8:\"options.\";a:1:{s:7:\"minimum\";s:1:\"6\";}}}s:20:\"newPasswordMinLength\";s:1:\"6\";}}s:8:\"tx_form.\";a:3:{s:9:\"settings.\";a:1:{s:19:\"yamlConfigurations.\";a:2:{i:110;s:51:\"EXT:bootstrap_package/Configuration/Form/Setup.yaml\";i:10;s:42:\"EXT:form/Configuration/Yaml/FormSetup.yaml\";}}s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:0;s:46:\"EXT:form/Resources/Private/Frontend/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:0;s:45:\"EXT:form/Resources/Private/Frontend/Partials/\";}s:16:\"layoutRootPaths.\";a:1:{i:0;s:44:\"EXT:form/Resources/Private/Frontend/Layouts/\";}}s:4:\"mvc.\";a:1:{s:39:\"callDefaultActionIfActionCantBeResolved\";s:1:\"1\";}}s:20:\"tx_bootstrappackage.\";a:2:{s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:2:{i:0;s:50:\"EXT:bootstrap_package/Resources/Private/Templates/\";i:1;s:50:\"EXT:bootstrap_package/Resources/Private/Templates/\";}s:17:\"partialRootPaths.\";a:2:{i:0;s:49:\"EXT:bootstrap_package/Resources/Private/Partials/\";i:1;s:49:\"EXT:bootstrap_package/Resources/Private/Partials/\";}s:16:\"layoutRootPaths.\";a:2:{i:0;s:48:\"EXT:bootstrap_package/Resources/Private/Layouts/\";i:1;s:48:\"EXT:bootstrap_package/Resources/Private/Layouts/\";}}s:9:\"settings.\";a:2:{s:23:\"overrideParserVariables\";s:1:\"1\";s:16:\"cssSourceMapping\";s:1:\"0\";}}s:15:\"tx_felogin_pi1.\";a:14:{s:22:\"wrapContentInBaseClass\";s:1:\"0\";s:23:\"welcomeMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:8:\"<p>|</p>\";}s:22:\"logoutMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:8:\"<p>|</p>\";}s:21:\"errorMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:28:\"<p class=\"text-danger\">|</p>\";}s:23:\"successMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:29:\"<p class=\"text-success\">|</p>\";}s:22:\"cookieWarning_stdWrap.\";a:1:{s:4:\"wrap\";s:29:\"<p class=\"text-warning\">|</p>\";}s:22:\"forgotMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:8:\"<p>|</p>\";}s:27:\"forgotErrorMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:28:\"<p class=\"text-danger\">|</p>\";}s:43:\"forgotResetMessageEmailSentMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:29:\"<p class=\"text-success\">|</p>\";}s:38:\"changePasswordNotValidMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:28:\"<p class=\"text-danger\">|</p>\";}s:38:\"changePasswordTooShortMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:28:\"<p class=\"text-danger\">|</p>\";}s:38:\"changePasswordNotEqualMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:28:\"<p class=\"text-danger\">|</p>\";}s:30:\"changePasswordMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:8:\"<p>|</p>\";}s:34:\"changePasswordDoneMessage_stdWrap.\";a:1:{s:4:\"wrap\";s:29:\"<p class=\"text-success\">|</p>\";}}s:7:\"tx_seo.\";a:2:{s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:4:{i:0;s:46:\"EXT:seo/Resources/Private/Templates/XmlSitemap\";i:10;s:36:\"EXT:seo/Resources/Private/Templates/\";i:20;s:54:\"EXT:bootstrap_package/Resources/Private/Templates/Seo/\";i:21;s:54:\"EXT:bootstrap_package/Resources/Private/Templates/Seo/\";}s:17:\"partialRootPaths.\";a:4:{i:0;s:45:\"EXT:seo/Resources/Private/Partials/XmlSitemap\";i:10;s:35:\"EXT:seo/Resources/Private/Partials/\";i:20;s:53:\"EXT:bootstrap_package/Resources/Private/Partials/Seo/\";i:21;s:53:\"EXT:bootstrap_package/Resources/Private/Partials/Seo/\";}s:16:\"layoutRootPaths.\";a:4:{i:0;s:44:\"EXT:seo/Resources/Private/Layouts/XmlSitemap\";i:10;s:34:\"EXT:seo/Resources/Private/Layouts/\";i:20;s:52:\"EXT:bootstrap_package/Resources/Private/Layouts/Seo/\";i:21;s:52:\"EXT:bootstrap_package/Resources/Private/Layouts/Seo/\";}}s:7:\"config.\";a:1:{s:11:\"xmlSitemap.\";a:1:{s:9:\"sitemaps.\";a:1:{s:6:\"pages.\";a:2:{s:8:\"provider\";s:52:\"TYPO3\\CMS\\Seo\\XmlSitemap\\PagesXmlSitemapDataProvider\";s:7:\"config.\";a:3:{s:16:\"excludedDoktypes\";s:25:\"3, 4, 6, 7, 199, 254, 255\";s:21:\"excludePagesRecursive\";s:0:\"\";s:15:\"additionalWhere\";s:42:\"{#no_index} = 0 AND {#canonical_link} = \'\'\";}}}}}}}s:7:\"shared.\";a:1:{s:17:\"responsiveimages.\";a:1:{s:7:\"footer.\";a:1:{s:7:\"column.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}}}s:4:\"lib.\";a:12:{s:14:\"contentElement\";s:13:\"FLUIDTEMPLATE\";s:15:\"contentElement.\";a:7:{s:12:\"templateName\";s:7:\"Default\";s:18:\"templateRootPaths.\";a:2:{i:0;s:66:\"EXT:bootstrap_package/Resources/Private/Templates/ContentElements/\";i:10;s:66:\"EXT:bootstrap_package/Resources/Private/Templates/ContentElements/\";}s:17:\"partialRootPaths.\";a:2:{i:0;s:65:\"EXT:bootstrap_package/Resources/Private/Partials/ContentElements/\";i:10;s:65:\"EXT:bootstrap_package/Resources/Private/Partials/ContentElements/\";}s:16:\"layoutRootPaths.\";a:2:{i:0;s:64:\"EXT:bootstrap_package/Resources/Private/Layouts/ContentElements/\";i:10;s:64:\"EXT:bootstrap_package/Resources/Private/Layouts/ContentElements/\";}s:15:\"dataProcessing.\";a:4:{i:1509614342;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:11:\"1509614342.\";a:2:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:16:\"background_image\";}s:2:\"as\";s:15:\"backgroundImage\";}i:1532626753;s:54:\"BK2K\\BootstrapPackage\\DataProcessing\\FlexFormProcessor\";s:11:\"1532626753.\";a:1:{s:9:\"fieldName\";s:24:\"background_image_options\";}}s:10:\"variables.\";a:2:{s:13:\"backendlayout\";s:4:\"TEXT\";s:14:\"backendlayout.\";a:3:{s:4:\"data\";s:10:\"pagelayout\";s:12:\"replacement.\";a:1:{s:3:\"10.\";a:2:{s:6:\"search\";s:8:\"pagets__\";s:7:\"replace\";s:0:\"\";}}s:7:\"ifEmpty\";s:7:\"default\";}}s:9:\"settings.\";a:11:{s:7:\"header.\";a:3:{s:17:\"defaultHeaderType\";s:1:\"2\";s:5:\"class\";s:14:\"element-header\";s:5:\"date.\";a:1:{s:6:\"format\";s:9:\"%B %e, %Y\";}}s:10:\"subheader.\";a:1:{s:5:\"class\";s:17:\"element-subheader\";}s:9:\"lightbox.\";a:3:{s:8:\"cssClass\";s:8:\"lightbox\";s:6:\"prefix\";s:14:\"lightbox-group\";s:6:\"image.\";a:2:{s:9:\"maxHeight\";s:4:\"1200\";s:8:\"maxWidth\";s:4:\"1200\";}}s:6:\"media.\";a:1:{s:17:\"additionalConfig.\";a:7:{s:8:\"autoplay\";s:1:\"0\";s:8:\"controls\";s:1:\"1\";s:4:\"loop\";s:1:\"0\";s:11:\"enablejsapi\";s:1:\"1\";s:8:\"showinfo\";s:1:\"0\";s:13:\"relatedVideos\";s:1:\"0\";s:14:\"modestbranding\";s:1:\"0\";}}s:8:\"gallery.\";a:1:{s:8:\"columns.\";a:6:{s:2:\"1.\";a:1:{s:5:\"class\";s:19:\"gallery-item-size-1\";}s:2:\"2.\";a:3:{s:5:\"class\";s:19:\"gallery-item-size-2\";s:11:\"multiplier.\";a:6:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";s:10:\"extrasmall\";s:3:\"0.5\";}s:8:\"gutters.\";a:6:{s:7:\"default\";s:1:\"8\";s:6:\"xlarge\";s:1:\"8\";s:5:\"large\";s:1:\"8\";s:6:\"medium\";s:1:\"8\";s:5:\"small\";s:1:\"8\";s:10:\"extrasmall\";s:1:\"8\";}}s:2:\"3.\";a:3:{s:5:\"class\";s:19:\"gallery-item-size-3\";s:11:\"multiplier.\";a:6:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";s:5:\"small\";s:6:\"0.3333\";s:10:\"extrasmall\";s:6:\"0.3333\";}s:8:\"gutters.\";a:6:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";s:10:\"extrasmall\";s:2:\"16\";}}s:2:\"4.\";a:3:{s:5:\"class\";s:19:\"gallery-item-size-4\";s:11:\"multiplier.\";a:6:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";s:10:\"extrasmall\";s:3:\"0.5\";}s:8:\"gutters.\";a:6:{s:7:\"default\";s:2:\"24\";s:6:\"xlarge\";s:2:\"24\";s:5:\"large\";s:2:\"24\";s:6:\"medium\";s:1:\"8\";s:5:\"small\";s:1:\"8\";s:10:\"extrasmall\";s:1:\"8\";}}s:2:\"5.\";a:3:{s:5:\"class\";s:19:\"gallery-item-size-5\";s:11:\"multiplier.\";a:6:{s:7:\"default\";s:3:\"0.2\";s:6:\"xlarge\";s:3:\"0.2\";s:5:\"large\";s:3:\"0.2\";s:6:\"medium\";s:6:\"0.3333\";s:5:\"small\";s:6:\"0.3333\";s:10:\"extrasmall\";s:3:\"0.5\";}s:8:\"gutters.\";a:6:{s:7:\"default\";s:2:\"32\";s:6:\"xlarge\";s:2:\"32\";s:5:\"large\";s:2:\"32\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";s:10:\"extrasmall\";s:1:\"8\";}}s:2:\"6.\";a:3:{s:5:\"class\";s:19:\"gallery-item-size-6\";s:11:\"multiplier.\";a:6:{s:7:\"default\";s:6:\"0.1666\";s:6:\"xlarge\";s:7:\"0.16666\";s:5:\"large\";s:7:\"0.16666\";s:6:\"medium\";s:6:\"0.3333\";s:5:\"small\";s:6:\"0.3333\";s:10:\"extrasmall\";s:3:\"0.5\";}s:8:\"gutters.\";a:6:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";s:10:\"extrasmall\";s:1:\"8\";}}}}s:17:\"responsiveimages.\";a:3:{s:9:\"variants.\";a:6:{s:8:\"default.\";a:2:{s:10:\"breakpoint\";s:4:\"1400\";s:5:\"width\";s:4:\"1280\";}s:7:\"xlarge.\";a:2:{s:10:\"breakpoint\";s:4:\"1200\";s:5:\"width\";s:4:\"1100\";}s:6:\"large.\";a:2:{s:10:\"breakpoint\";s:3:\"992\";s:5:\"width\";s:3:\"920\";}s:7:\"medium.\";a:2:{s:10:\"breakpoint\";s:3:\"768\";s:5:\"width\";s:3:\"680\";}s:6:\"small.\";a:2:{s:10:\"breakpoint\";s:3:\"576\";s:5:\"width\";s:3:\"500\";}s:11:\"extrasmall.\";a:2:{s:10:\"breakpoint\";s:5:\"unset\";s:5:\"width\";s:3:\"374\";}}s:14:\"backendlayout.\";a:13:{s:8:\"default.\";a:3:{s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:7:\"simple.\";a:3:{s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:10:\"2_columns.\";a:5:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.75\";s:6:\"xlarge\";s:4:\"0.75\";s:5:\"large\";s:4:\"0.75\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:16:\"2_columns_25_75.\";a:5:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.75\";s:6:\"xlarge\";s:4:\"0.75\";s:5:\"large\";s:4:\"0.75\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:2:\"1.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:16:\"2_columns_50_50.\";a:5:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:19:\"subnavigation_left.\";a:4:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.75\";s:6:\"xlarge\";s:4:\"0.75\";s:5:\"large\";s:4:\"0.75\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:23:\"2_columns_offset_right.\";a:5:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:6:\"0.6666\";s:6:\"xlarge\";s:6:\"0.6666\";s:5:\"large\";s:6:\"0.6666\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:10:\"3_columns.\";a:6:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:2:\"1.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:16:\"special_feature.\";a:11:{s:3:\"30.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"31.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"32.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"33.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"34.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"35.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"36.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"37.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";s:5:\"small\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:14:\"special_start.\";a:6:{s:3:\"20.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"21.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"22.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:29:\"subnavigation_left_2_columns.\";a:5:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";}}s:2:\"1.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:20:\"subnavigation_right.\";a:4:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.75\";s:6:\"xlarge\";s:4:\"0.75\";s:5:\"large\";s:4:\"0.75\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}s:30:\"subnavigation_right_2_columns.\";a:5:{s:2:\"0.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";}}s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";}s:8:\"gutters.\";a:3:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";}}s:3:\"10.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"11.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}s:3:\"12.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"80\";s:6:\"xlarge\";s:2:\"80\";s:5:\"large\";s:2:\"80\";s:6:\"medium\";s:2:\"80\";}}}}s:16:\"contentelements.\";a:13:{s:8:\"textpic.\";a:4:{s:14:\"centered_left.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}s:15:\"centered_right.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}s:5:\"left.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}s:6:\"right.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}}s:10:\"textmedia.\";a:4:{s:14:\"centered_left.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}s:15:\"centered_right.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}s:5:\"left.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}s:6:\"right.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"40\";s:6:\"xlarge\";s:2:\"40\";s:5:\"large\";s:2:\"40\";s:6:\"medium\";s:2:\"40\";}}}s:10:\"accordion.\";a:4:{s:5:\"left.\";a:3:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:2:\"21\";s:6:\"xlarge\";s:2:\"21\";s:5:\"large\";s:2:\"21\";s:6:\"medium\";s:2:\"21\";s:5:\"small\";s:2:\"42\";s:10:\"extrasmall\";s:2:\"42\";}}s:4:\"top.\";a:1:{s:12:\"corrections.\";a:6:{s:7:\"default\";s:2:\"42\";s:6:\"xlarge\";s:2:\"42\";s:5:\"large\";s:2:\"42\";s:6:\"medium\";s:2:\"42\";s:5:\"small\";s:2:\"42\";s:10:\"extrasmall\";s:2:\"42\";}}s:6:\"right.\";a:3:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:2:\"21\";s:6:\"xlarge\";s:2:\"21\";s:5:\"large\";s:2:\"21\";s:6:\"medium\";s:2:\"21\";s:5:\"small\";s:2:\"42\";s:10:\"extrasmall\";s:2:\"42\";}}s:7:\"bottom.\";a:1:{s:12:\"corrections.\";a:6:{s:7:\"default\";s:2:\"42\";s:6:\"xlarge\";s:2:\"42\";s:5:\"large\";s:2:\"42\";s:6:\"medium\";s:2:\"42\";s:5:\"small\";s:2:\"42\";s:10:\"extrasmall\";s:2:\"42\";}}}s:11:\"card_group.\";a:4:{s:2:\"1.\";a:1:{s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"2.\";a:3:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"3.\";a:3:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"32\";s:6:\"xlarge\";s:2:\"32\";s:5:\"large\";s:2:\"32\";s:6:\"medium\";s:2:\"32\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"4.\";a:3:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"48\";s:6:\"xlarge\";s:2:\"48\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}}s:9:\"carousel.\";a:2:{s:17:\"background_image.\";a:1:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"1.5\";s:6:\"xlarge\";s:3:\"1.5\";s:5:\"large\";s:3:\"1.5\";}}s:15:\"text_and_image.\";a:1:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}}}s:15:\"carousel_small.\";a:2:{s:17:\"background_image.\";a:1:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"1.5\";s:6:\"xlarge\";s:3:\"1.5\";s:5:\"large\";s:3:\"1.5\";}}s:15:\"text_and_image.\";a:1:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}}}s:20:\"carousel_fullscreen.\";a:2:{s:17:\"background_image.\";a:1:{s:11:\"multiplier.\";a:3:{s:7:\"default\";s:3:\"1.5\";s:6:\"xlarge\";s:3:\"1.5\";s:5:\"large\";s:3:\"1.5\";}}s:15:\"text_and_image.\";a:1:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}}}s:4:\"tab.\";a:2:{s:5:\"left.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";}}s:6:\"right.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";}}}s:9:\"timeline.\";a:2:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:2:\"49\";s:6:\"xlarge\";s:2:\"49\";s:5:\"large\";s:2:\"49\";s:6:\"medium\";s:2:\"49\";s:5:\"small\";s:2:\"72\";s:10:\"extrasmall\";s:2:\"72\";}}s:14:\"menu_card_dir.\";a:4:{s:2:\"1.\";a:1:{s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"2.\";a:3:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"3.\";a:3:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"32\";s:6:\"xlarge\";s:2:\"32\";s:5:\"large\";s:2:\"32\";s:6:\"medium\";s:2:\"32\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"4.\";a:3:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"48\";s:6:\"xlarge\";s:2:\"48\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}}s:15:\"menu_card_list.\";a:4:{s:2:\"1.\";a:1:{s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"2.\";a:3:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"3.\";a:3:{s:11:\"multiplier.\";a:4:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";}s:8:\"gutters.\";a:4:{s:7:\"default\";s:2:\"32\";s:6:\"xlarge\";s:2:\"32\";s:5:\"large\";s:2:\"32\";s:6:\"medium\";s:2:\"32\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}s:2:\"4.\";a:3:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"48\";s:6:\"xlarge\";s:2:\"48\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}s:12:\"corrections.\";a:6:{s:7:\"default\";s:1:\"2\";s:6:\"xlarge\";s:1:\"2\";s:5:\"large\";s:1:\"2\";s:6:\"medium\";s:1:\"2\";s:5:\"small\";s:1:\"2\";s:10:\"extrasmall\";s:1:\"2\";}}}s:19:\"menu_thumbnail_dir.\";a:3:{s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:1:\"8\";s:6:\"xlarge\";s:1:\"8\";s:5:\"large\";s:1:\"8\";s:6:\"medium\";s:1:\"8\";s:5:\"small\";s:1:\"8\";}}s:2:\"3.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";s:5:\"small\";s:6:\"0.3333\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}}s:2:\"4.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"24\";s:6:\"xlarge\";s:2:\"24\";s:5:\"large\";s:2:\"24\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}}}s:20:\"menu_thumbnail_list.\";a:3:{s:2:\"2.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:3:\"0.5\";s:6:\"xlarge\";s:3:\"0.5\";s:5:\"large\";s:3:\"0.5\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:1:\"8\";s:6:\"xlarge\";s:1:\"8\";s:5:\"large\";s:1:\"8\";s:6:\"medium\";s:1:\"8\";s:5:\"small\";s:1:\"8\";}}s:2:\"3.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:6:\"0.3333\";s:6:\"xlarge\";s:6:\"0.3333\";s:5:\"large\";s:6:\"0.3333\";s:6:\"medium\";s:6:\"0.3333\";s:5:\"small\";s:6:\"0.3333\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"16\";s:6:\"xlarge\";s:2:\"16\";s:5:\"large\";s:2:\"16\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}}s:2:\"4.\";a:2:{s:11:\"multiplier.\";a:5:{s:7:\"default\";s:4:\"0.25\";s:6:\"xlarge\";s:4:\"0.25\";s:5:\"large\";s:4:\"0.25\";s:6:\"medium\";s:3:\"0.5\";s:5:\"small\";s:3:\"0.5\";}s:8:\"gutters.\";a:5:{s:7:\"default\";s:2:\"24\";s:6:\"xlarge\";s:2:\"24\";s:5:\"large\";s:2:\"24\";s:6:\"medium\";s:2:\"16\";s:5:\"small\";s:2:\"16\";}}}}}s:14:\"menuthumbnail.\";a:2:{s:6:\"title.\";a:1:{s:4:\"crop\";s:3:\"100\";}s:9:\"subtitle.\";a:1:{s:4:\"crop\";s:2:\"80\";}}s:9:\"menucard.\";a:4:{s:5:\"icon.\";a:3:{s:6:\"enable\";s:1:\"0\";s:6:\"height\";s:2:\"32\";s:5:\"width\";s:3:\"32c\";}s:6:\"title.\";a:1:{s:4:\"crop\";s:3:\"100\";}s:9:\"subtitle.\";a:1:{s:4:\"crop\";s:3:\"100\";}s:9:\"abstract.\";a:1:{s:4:\"crop\";s:3:\"250\";}}s:9:\"texticon.\";a:1:{s:5:\"icon.\";a:4:{s:8:\"default.\";a:2:{s:6:\"height\";s:2:\"32\";s:5:\"width\";s:2:\"32\";}s:7:\"medium.\";a:2:{s:6:\"height\";s:2:\"48\";s:5:\"width\";s:2:\"48\";}s:6:\"large.\";a:2:{s:6:\"height\";s:2:\"64\";s:5:\"width\";s:2:\"64\";}s:8:\"awesome.\";a:2:{s:6:\"height\";s:2:\"80\";s:5:\"width\";s:2:\"80\";}}}s:9:\"timeline.\";a:1:{s:5:\"date.\";a:1:{s:6:\"format\";s:17:\"%B %e, %Y - %H:%M\";}}s:8:\"uploads.\";a:1:{s:8:\"preview.\";a:2:{s:6:\"height\";s:4:\"100c\";s:5:\"width\";s:4:\"100c\";}}}}s:14:\"dynamicContent\";s:3:\"COA\";s:15:\"dynamicContent.\";a:5:{i:5;s:13:\"LOAD_REGISTER\";s:2:\"5.\";a:6:{s:7:\"colPos.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:5:\"field\";s:6:\"colPos\";s:8:\"ifEmpty.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:7:\"current\";s:1:\"1\";}s:7:\"ifEmpty\";s:1:\"0\";}}}}s:6:\"slide.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:9:\"override.\";a:2:{s:5:\"field\";s:5:\"slide\";s:3:\"if.\";a:2:{s:9:\"isInList.\";a:1:{s:5:\"field\";s:5:\"slide\";}s:5:\"value\";s:11:\"-1, 0, 1, 2\";}}s:7:\"ifEmpty\";s:1:\"0\";}}s:8:\"pageUid.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:5:\"field\";s:7:\"pageUid\";s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:7:\"TSFE:id\";}}}s:15:\"contentFromPid.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:4:\"data\";s:44:\"DB:pages:{register:pageUid}:content_from_pid\";s:5:\"data.\";a:1:{s:10:\"insertData\";s:1:\"1\";}}}s:5:\"wrap.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:4:\"wrap\";}}s:12:\"elementWrap.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:11:\"elementWrap\";}}}i:20;s:7:\"CONTENT\";s:3:\"20.\";a:6:{s:5:\"table\";s:10:\"tt_content\";s:7:\"select.\";a:5:{s:39:\"includeRecordsWithoutDefaultTranslation\";s:1:\"1\";s:7:\"orderBy\";s:7:\"sorting\";s:5:\"where\";s:27:\"{#colPos}={register:colPos}\";s:6:\"where.\";a:1:{s:10:\"insertData\";s:1:\"1\";}s:10:\"pidInList.\";a:2:{s:4:\"data\";s:16:\"register:pageUid\";s:9:\"override.\";a:1:{s:4:\"data\";s:23:\"register:contentFromPid\";}}}s:5:\"slide\";s:16:\"{register:slide}\";s:6:\"slide.\";a:1:{s:10:\"insertData\";s:1:\"1\";}s:10:\"renderObj.\";a:1:{s:8:\"stdWrap.\";a:2:{s:8:\"dataWrap\";s:22:\"{register:elementWrap}\";s:8:\"required\";s:1:\"1\";}}s:8:\"stdWrap.\";a:2:{s:8:\"dataWrap\";s:15:\"{register:wrap}\";s:8:\"required\";s:1:\"1\";}}i:90;s:16:\"RESTORE_REGISTER\";}s:19:\"dynamicContentSlide\";s:20:\"< lib.dynamicContent\";s:20:\"dynamicContentSlide.\";a:1:{s:3:\"20.\";a:1:{s:5:\"slide\";s:2:\"-1\";}}s:10:\"parseFunc.\";a:8:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:4:{s:4:\"link\";s:4:\"TEXT\";s:5:\"link.\";a:3:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:2:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:22:\"parameters : allParams\";}s:9:\"extTarget\";s:6:\"_blank\";}s:10:\"parseFunc.\";a:1:{s:9:\"constants\";s:1:\"1\";}}s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:6:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}s:9:\"extTarget\";s:6:\"_blank\";s:10:\"extTarget.\";a:1:{s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:382:\"a, abbr, acronym, address, article, aside, b, bdo,big, blockquote, br, caption, center, cite, code, col,colgroup, dd, del, dfn, dl, div, dt, em, font,footer, header, h1, h2, h3, h4, h5, h6, hr, i, img,ins, kbd, label, li, link, meta, nav, ol, p, pre, q,samp, sdfield, section, small, span, strike, strong,style, sub, sup, table, thead, tbody, tfoot, td, th,tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:37:\"<span class=\"text-highlight\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}}}s:14:\"parseFunc_RTE.\";a:10:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:4:{s:4:\"link\";s:4:\"TEXT\";s:5:\"link.\";a:3:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:2:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:22:\"parameters : allParams\";}s:9:\"extTarget\";s:6:\"_blank\";}s:10:\"parseFunc.\";a:1:{s:9:\"constants\";s:1:\"1\";}}s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:6:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}s:9:\"extTarget\";s:6:\"_blank\";s:10:\"extTarget.\";a:1:{s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:382:\"a, abbr, acronym, address, article, aside, b, bdo,big, blockquote, br, caption, center, cite, code, col,colgroup, dd, del, dfn, dl, div, dt, em, font,footer, header, h1, h2, h3, h4, h5, h6, hr, i, img,ins, kbd, label, li, link, meta, nav, ol, p, pre, q,samp, sdfield, section, small, span, strike, strong,style, sub, sup, table, thead, tbody, tfoot, td, th,tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:37:\"<span class=\"text-highlight\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:3:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}s:12:\"encapsLines.\";a:4:{s:13:\"encapsTagList\";s:38:\"p, pre, h1, h2, h3, h4, h5, h6, hr, dt\";s:9:\"remapTag.\";a:1:{s:3:\"DIV\";s:1:\"P\";}s:13:\"nonWrappedTag\";s:1:\"P\";s:17:\"innerStdWrap_all.\";a:1:{s:7:\"ifBlank\";s:6:\"&nbsp;\";}}}s:14:\"externalBlocks\";s:105:\"article, address, aside, blockquote, div, dd, dl, footer,header, nav, ol, section, table, ul, pre, figure\";s:15:\"externalBlocks.\";a:15:{s:3:\"ol.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:9:\"parseFunc\";s:15:\"< lib.parseFunc\";}}s:3:\"ul.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:3:{s:9:\"parseFunc\";s:15:\"< lib.parseFunc\";s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:5:\"tags.\";a:1:{s:3:\"ul.\";a:1:{s:10:\"fixAttrib.\";a:1:{s:6:\"class.\";a:1:{s:7:\"default\";s:11:\"list-normal\";}}}}s:18:\"keepNonMatchedTags\";s:1:\"1\";}}}s:6:\"table.\";a:4:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:37:\"<div class=\"table-responsive\">|</div>\";}s:14:\"HTMLtableCells\";s:1:\"1\";s:15:\"HTMLtableCells.\";a:1:{s:8:\"default.\";a:1:{s:8:\"stdWrap.\";a:2:{s:9:\"parseFunc\";s:19:\"< lib.parseFunc_RTE\";s:10:\"parseFunc.\";a:1:{s:18:\"nonTypoTagStdWrap.\";a:1:{s:12:\"encapsLines.\";a:1:{s:13:\"nonWrappedTag\";s:0:\"\";}}}}}}}s:4:\"pre.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:10:\"parseFunc.\";a:8:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:4:{s:4:\"link\";s:4:\"TEXT\";s:5:\"link.\";a:3:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:2:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:22:\"parameters : allParams\";}s:9:\"extTarget\";s:6:\"_blank\";}s:10:\"parseFunc.\";a:1:{s:9:\"constants\";s:1:\"1\";}}s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:6:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}s:9:\"extTarget\";s:6:\"_blank\";s:10:\"extTarget.\";a:1:{s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:382:\"a, abbr, acronym, address, article, aside, b, bdo,big, blockquote, br, caption, center, cite, code, col,colgroup, dd, del, dfn, dl, div, dt, em, font,footer, header, h1, h2, h3, h4, h5, h6, hr, i, img,ins, kbd, label, li, link, meta, nav, ol, p, pre, q,samp, sdfield, section, small, span, strike, strong,style, sub, sup, table, thead, tbody, tfoot, td, th,tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:37:\"<span class=\"text-highlight\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}}}}}s:4:\"div.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:8:\"article.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:6:\"aside.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"figure.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:11:\"blockquote.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"footer.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"header.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:4:\"nav.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:8:\"section.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:3:\"dl.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:3:\"dd.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}}}s:8:\"tx_form.\";a:2:{s:23:\"contentElementRendering\";s:7:\"RECORDS\";s:24:\"contentElementRendering.\";a:3:{s:6:\"tables\";s:10:\"tt_content\";s:7:\"source.\";a:1:{s:7:\"current\";s:1:\"1\";}s:12:\"dontCheckPid\";s:1:\"1\";}}s:5:\"block\";s:13:\"FLUIDTEMPLATE\";s:6:\"block.\";a:6:{s:12:\"templateName\";s:7:\"Default\";s:13:\"templateName.\";a:1:{s:9:\"override.\";a:1:{s:5:\"field\";s:8:\"template\";}}s:18:\"templateRootPaths.\";a:2:{i:0;s:57:\"EXT:bootstrap_package/Resources/Private/Templates/Blocks/\";i:10;s:57:\"EXT:bootstrap_package/Resources/Private/Templates/Blocks/\";}s:17:\"partialRootPaths.\";a:2:{i:0;s:56:\"EXT:bootstrap_package/Resources/Private/Partials/Blocks/\";i:10;s:56:\"EXT:bootstrap_package/Resources/Private/Partials/Blocks/\";}s:16:\"layoutRootPaths.\";a:2:{i:0;s:55:\"EXT:bootstrap_package/Resources/Private/Layouts/Blocks/\";i:10;s:55:\"EXT:bootstrap_package/Resources/Private/Layouts/Blocks/\";}s:15:\"dataProcessing.\";a:2:{i:1;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\ConstantsProcessor\";s:2:\"1.\";a:2:{s:2:\"as\";s:5:\"theme\";s:3:\"key\";s:10:\"page.theme\";}}}s:5:\"page.\";a:2:{s:5:\"class\";s:3:\"COA\";s:6:\"class.\";a:10:{i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:5:\"field\";s:12:\"alias // uid\";s:10:\"noTrimWrap\";s:8:\"|page-||\";}i:20;s:4:\"TEXT\";s:3:\"20.\";a:2:{s:4:\"data\";s:7:\"level:1\";s:10:\"noTrimWrap\";s:14:\"| pagelevel-||\";}i:30;s:4:\"TEXT\";s:3:\"30.\";a:2:{s:4:\"data\";s:23:\"siteLanguage:languageId\";s:10:\"noTrimWrap\";s:13:\"| language-||\";}i:40;s:4:\"TEXT\";s:3:\"40.\";a:4:{s:4:\"data\";s:10:\"pagelayout\";s:12:\"replacement.\";a:1:{s:3:\"10.\";a:2:{s:6:\"search\";s:8:\"pagets__\";s:7:\"replace\";s:0:\"\";}}s:7:\"ifEmpty\";s:7:\"default\";s:10:\"noTrimWrap\";s:18:\"| backendlayout-||\";}i:50;s:4:\"TEXT\";s:3:\"50.\";a:3:{s:5:\"field\";s:6:\"layout\";s:10:\"noTrimWrap\";s:11:\"| layout-||\";s:7:\"ifEmpty\";s:7:\"default\";}}}}s:11:\"seo_sitemap\";s:4:\"PAGE\";s:12:\"seo_sitemap.\";a:4:{s:7:\"typeNum\";s:10:\"1533906435\";s:7:\"config.\";a:7:{s:12:\"cache_period\";s:3:\"900\";s:20:\"disableAllHeaderCode\";s:1:\"1\";s:8:\"admPanel\";s:1:\"0\";s:15:\"removeDefaultJS\";s:1:\"1\";s:16:\"removeDefaultCss\";s:1:\"1\";s:13:\"removePageCss\";s:1:\"1\";s:18:\"additionalHeaders.\";a:2:{s:3:\"10.\";a:1:{s:6:\"header\";s:42:\"Content-Type:application/xml;charset=utf-8\";}s:3:\"20.\";a:1:{s:6:\"header\";s:20:\"X-Robots-Tag:noindex\";}}}i:10;s:4:\"USER\";s:3:\"10.\";a:1:{s:8:\"userFunc\";s:51:\"TYPO3\\CMS\\Seo\\XmlSitemap\\XmlSitemapRenderer->render\";}}s:5:\"page.\";a:14:{s:11:\"includeCSS.\";a:1:{s:5:\"theme\";s:65:\"EXT:bootstrap_package/Resources/Public/Scss/bootstrap5/theme.scss\";}s:20:\"includeJSFooterlibs.\";a:12:{s:6:\"popper\";s:72:\"EXT:bootstrap_package/Resources/Public/Contrib/popper-core/popper.min.js\";s:9:\"bootstrap\";s:77:\"EXT:bootstrap_package/Resources/Public/Contrib/bootstrap5/js/bootstrap.min.js\";s:15:\"photoswipe_core\";s:75:\"EXT:bootstrap_package/Resources/Public/Contrib/photoswipe/photoswipe.min.js\";s:13:\"photoswipe_ui\";s:86:\"EXT:bootstrap_package/Resources/Public/Contrib/photoswipe/photoswipe-ui-default.min.js\";s:19:\"bootstrap_accordion\";s:81:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.accordion.min.js\";s:17:\"bootstrap_popover\";s:79:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.popover.min.js\";s:22:\"bootstrap_stickyheader\";s:84:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.stickyheader.min.js\";s:22:\"bootstrap_smoothscroll\";s:84:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.smoothscroll.min.js\";s:18:\"bootstrap_lightbox\";s:80:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.lightbox.min.js\";s:16:\"bootstrap_navbar\";s:78:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.navbar.min.js\";s:21:\"contrib_cookieconsent\";s:81:\"EXT:bootstrap_package/Resources/Public/Contrib/cookieconsent/cookieconsent.min.js\";s:23:\"bootstrap_cookieconsent\";s:85:\"EXT:bootstrap_package/Resources/Public/JavaScript/Dist/bootstrap.cookieconsent.min.js\";}s:7:\"typeNum\";s:1:\"0\";s:12:\"shortcutIcon\";s:56:\"EXT:bootstrap_package/Resources/Public/Icons/favicon.ico\";s:14:\"bodyTagCObject\";s:3:\"COA\";s:15:\"bodyTagCObject.\";a:5:{i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:4:\"data\";s:7:\"TSFE:id\";s:10:\"noTrimWrap\";s:10:\"| id=\"p|\"|\";}i:20;s:16:\"< lib.page.class\";s:3:\"20.\";a:1:{s:8:\"stdWrap.\";a:1:{s:10:\"noTrimWrap\";s:12:\"| class=\"|\"|\";}}s:4:\"wrap\";s:7:\"<body|>\";}s:11:\"headerData.\";a:4:{i:10;s:5:\"HMENU\";s:3:\"10.\";a:4:{s:7:\"special\";s:6:\"browse\";s:8:\"special.\";a:1:{s:5:\"items\";s:9:\"prev|next\";}i:1;s:5:\"TMENU\";s:2:\"1.\";a:1:{s:3:\"NO.\";a:3:{s:7:\"allWrap\";s:57:\"<link rel=\"prev\" href=\"|\"> |*| <link rel=\"next\" href=\"|\">\";s:11:\"doNotLinkIt\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:9:\"typolink.\";a:2:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:9:\"field:uid\";}s:10:\"returnLast\";s:3:\"url\";}}}}}i:99;s:4:\"TEXT\";s:3:\"99.\";a:2:{s:3:\"if.\";a:1:{s:6:\"isTrue\";s:0:\"\";}s:5:\"value\";s:474:\"\n<!-- Google Tag Manager -->\n<script>\nlet googletagmanagerContainerId = \'\';\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\n\'https://www.googletagmanager.com/gtm.js?id=\'+i+dl;f.parentNode.insertBefore(j,f);\n})(window,document,\'script\',\'dataLayer\',googletagmanagerContainerId);\n</script>\n<!-- End Google Tag Manager -->\n\";}}i:10;s:13:\"FLUIDTEMPLATE\";s:3:\"10.\";a:9:{s:12:\"templateName\";s:4:\"TEXT\";s:13:\"templateName.\";a:3:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:4:{s:4:\"data\";s:10:\"pagelayout\";s:8:\"required\";s:1:\"1\";s:4:\"case\";s:14:\"uppercamelcase\";s:6:\"split.\";a:3:{s:5:\"token\";s:8:\"pagets__\";s:7:\"cObjNum\";s:1:\"1\";s:2:\"1.\";a:1:{s:7:\"current\";s:1:\"1\";}}}s:7:\"ifEmpty\";s:7:\"Default\";}s:18:\"templateRootPaths.\";a:2:{i:0;s:55:\"EXT:bootstrap_package/Resources/Private/Templates/Page/\";i:1;s:55:\"EXT:bootstrap_package/Resources/Private/Templates/Page/\";}s:17:\"partialRootPaths.\";a:2:{i:0;s:54:\"EXT:bootstrap_package/Resources/Private/Partials/Page/\";i:1;s:54:\"EXT:bootstrap_package/Resources/Private/Partials/Page/\";}s:16:\"layoutRootPaths.\";a:2:{i:0;s:53:\"EXT:bootstrap_package/Resources/Private/Layouts/Page/\";i:1;s:53:\"EXT:bootstrap_package/Resources/Private/Layouts/Page/\";}s:15:\"dataProcessing.\";a:16:{i:1;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\ConstantsProcessor\";s:2:\"1.\";a:2:{s:2:\"as\";s:5:\"theme\";s:3:\"key\";s:10:\"page.theme\";}i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:6:\"levels\";s:1:\"2\";s:13:\"includeSpacer\";s:1:\"1\";s:2:\"as\";s:14:\"mainnavigation\";s:15:\"dataProcessing.\";a:2:{i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:5:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:12:\"nav_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:19:\"nav_icon_identifier\";}s:17:\"iconFileFieldName\";s:8:\"nav_icon\";s:2:\"as\";s:4:\"icon\";s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:4:{i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:5:\"value\";s:1:\"1\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:1:\"1\";}}i:20;s:4:\"TEXT\";s:3:\"20.\";a:2:{s:5:\"value\";s:1:\"1\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:1:\"1\";}}}}}}}}}i:20;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"20.\";a:6:{s:10:\"entryLevel\";s:1:\"1\";s:6:\"levels\";s:1:\"2\";s:9:\"expandAll\";s:1:\"0\";s:13:\"includeSpacer\";s:1:\"1\";s:2:\"as\";s:13:\"subnavigation\";s:15:\"dataProcessing.\";a:2:{i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:5:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:12:\"nav_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:19:\"nav_icon_identifier\";}s:17:\"iconFileFieldName\";s:8:\"nav_icon\";s:2:\"as\";s:4:\"icon\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:1:\"1\";}}}}i:30;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"30.\";a:6:{s:7:\"special\";s:8:\"rootline\";s:8:\"special.\";a:1:{s:5:\"range\";s:4:\"0|-1\";}s:16:\"includeNotInMenu\";s:1:\"1\";s:2:\"as\";s:10:\"breadcrumb\";s:3:\"if.\";a:3:{s:5:\"value\";s:1:\"2\";s:6:\"value.\";a:3:{s:10:\"insertData\";s:1:\"1\";s:10:\"prioriCalc\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:3:\"|-1\";}}s:14:\"isGreaterThan.\";a:1:{s:4:\"data\";s:5:\"level\";}}s:15:\"dataProcessing.\";a:2:{i:1628754217;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1628754217.\";a:4:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:12:\"nav_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:19:\"nav_icon_identifier\";}s:17:\"iconFileFieldName\";s:8:\"nav_icon\";s:2:\"as\";s:4:\"icon\";}}}i:40;s:55:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor\";s:3:\"40.\";a:2:{s:9:\"languages\";s:4:\"auto\";s:2:\"as\";s:18:\"languagenavigation\";}i:50;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"50.\";a:5:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:5:\"value\";s:0:\"\";}s:16:\"includeNotInMenu\";s:1:\"1\";s:2:\"as\";s:14:\"metanavigation\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:0:\"\";}}i:1629126321;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:11:\"1629126321.\";a:7:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:5:\"value\";s:0:\"\";}s:16:\"includeNotInMenu\";s:1:\"1\";s:6:\"levels\";s:1:\"2\";s:2:\"as\";s:16:\"footernavigation\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:0:\"\";}s:15:\"dataProcessing.\";a:2:{i:1629202464;s:55:\"BK2K\\BootstrapPackage\\DataProcessing\\IconsDataProcessor\";s:11:\"1629202464.\";a:4:{s:8:\"iconSet.\";a:1:{s:5:\"field\";s:12:\"nav_icon_set\";}s:15:\"iconIdentifier.\";a:1:{s:5:\"field\";s:19:\"nav_icon_identifier\";}s:17:\"iconFileFieldName\";s:8:\"nav_icon\";s:2:\"as\";s:4:\"icon\";}}}i:1553883874;s:57:\"BK2K\\BootstrapPackage\\DataProcessing\\StaticFilesProcessor\";s:11:\"1553883874.\";a:2:{s:6:\"files.\";a:2:{s:6:\"normal\";s:66:\"EXT:bootstrap_package/Resources/Public/Images/BootstrapPackage.svg\";s:8:\"inverted\";s:74:\"EXT:bootstrap_package/Resources/Public/Images/BootstrapPackageInverted.svg\";}s:2:\"as\";s:4:\"logo\";}}s:9:\"settings.\";a:1:{s:5:\"logo.\";a:3:{s:6:\"height\";s:2:\"52\";s:5:\"width\";s:3:\"180\";s:9:\"linktitle\";s:0:\"\";}}s:10:\"variables.\";a:12:{s:9:\"pageTitle\";s:4:\"TEXT\";s:10:\"pageTitle.\";a:1:{s:4:\"data\";s:10:\"page:title\";}s:9:\"siteTitle\";s:4:\"TEXT\";s:10:\"siteTitle.\";a:1:{s:4:\"data\";s:61:\"siteLanguage:websiteTitle//site:websiteTitle//site:identifier\";}s:8:\"rootPage\";s:4:\"TEXT\";s:9:\"rootPage.\";a:1:{s:4:\"data\";s:10:\"leveluid:0\";}s:10:\"pagelayout\";s:4:\"TEXT\";s:11:\"pagelayout.\";a:3:{s:4:\"data\";s:10:\"pagelayout\";s:12:\"replacement.\";a:1:{s:3:\"10.\";a:2:{s:6:\"search\";s:8:\"pagets__\";s:7:\"replace\";s:0:\"\";}}s:7:\"ifEmpty\";s:7:\"default\";}s:7:\"logoAlt\";s:3:\"COA\";s:8:\"logoAlt.\";a:4:{i:10;s:4:\"TEXT\";s:3:\"10.\";a:3:{s:4:\"data\";s:61:\"siteLanguage:websiteTitle//site:websiteTitle//site:identifier\";s:10:\"noTrimWrap\";s:8:\"|| logo|\";s:3:\"if.\";a:1:{s:7:\"isFalse\";s:0:\"\";}}i:20;s:4:\"TEXT\";s:3:\"20.\";a:2:{s:5:\"value\";s:0:\"\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:0:\"\";}}}s:23:\"breadcrumbExtendedValue\";s:3:\"COA\";s:24:\"breadcrumbExtendedValue.\";a:0:{}}s:8:\"stdWrap.\";a:1:{s:12:\"replacement.\";a:4:{s:2:\"1.\";a:2:{s:6:\"search\";s:25:\"http://###BACKEND_URL###/\";s:8:\"replace.\";a:1:{s:9:\"typolink.\";a:2:{s:9:\"parameter\";s:6:\"typo3/\";s:10:\"returnLast\";s:3:\"url\";}}}s:2:\"2.\";a:2:{s:6:\"search\";s:18:\"###FRONTEND_URL###\";s:8:\"replace.\";a:1:{s:9:\"typolink.\";a:2:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:10:\"leveluid:0\";}s:10:\"returnLast\";s:3:\"url\";}}}s:2:\"3.\";a:2:{s:6:\"search\";s:17:\"###CURRENTYEAR###\";s:8:\"replace.\";a:2:{s:4:\"data\";s:6:\"date:U\";s:8:\"strftime\";s:2:\"%Y\";}}s:2:\"4.\";a:2:{s:6:\"search\";s:11:\"###SPACE###\";s:8:\"replace.\";a:1:{s:4:\"char\";s:2:\"32\";}}}}}s:5:\"meta.\";a:7:{s:8:\"viewport\";s:52:\"width=device-width, initial-scale=1, minimum-scale=1\";s:6:\"robots\";s:12:\"index,follow\";s:28:\"apple-mobile-web-app-capable\";s:2:\"no\";s:15:\"X-UA-Compatible\";s:7:\"IE=edge\";s:16:\"X-UA-Compatible.\";a:1:{s:9:\"attribute\";s:10:\"http-equiv\";}s:6:\"google\";s:11:\"notranslate\";s:24:\"google-site-verification\";s:0:\"\";}s:15:\"includeCSSLibs.\";a:3:{s:13:\"googlewebfont\";s:80:\"https://fonts.googleapis.com/css?display=swap&family=Source Sans Pro:300,400,700\";s:14:\"googlewebfont.\";a:4:{s:8:\"external\";s:1:\"1\";s:18:\"disableCompression\";s:1:\"1\";s:24:\"excludeFromConcatenation\";s:1:\"1\";s:3:\"if.\";a:1:{s:6:\"isTrue\";s:1:\"1\";}}s:20:\"bootstrappackageicon\";s:73:\"EXT:bootstrap_package/Resources/Public/Fonts/bootstrappackageicon.min.css\";}s:14:\"includeJSLibs.\";a:2:{s:9:\"modernizr\";s:73:\"EXT:bootstrap_package/Resources/Public/Contrib/modernizr/modernizr.min.js\";s:10:\"modernizr.\";a:2:{s:10:\"forceOnTop\";s:1:\"1\";s:5:\"async\";s:1:\"1\";}}i:5;s:4:\"TEXT\";s:2:\"5.\";a:2:{s:3:\"if.\";a:1:{s:6:\"isTrue\";s:0:\"\";}s:5:\"value\";s:233:\"\n<!-- Google Tag Manager (noscript) -->\n<noscript><iframe src=\"https://www.googletagmanager.com/ns.html?id=\"\nheight=\"0\" width=\"0\" style=\"display:none;visibility:hidden\"></iframe></noscript>\n<!-- End Google Tag Manager (noscript) -->\n\";}}s:4:\"page\";s:4:\"PAGE\";s:6:\"types.\";a:2:{i:1533906435;s:11:\"seo_sitemap\";i:0;s:4:\"page\";}}}'),(3,'4867453d9a488d3c0c9c49a82dda5980',2145909600,'a:1:{s:32:\"ffb7c399fe1d1c6c494fdaf47b419bd4\";s:8:\"[1 == 1]\";}'),(4,'aaa8a79a469ccd50e0868d8ca3eecec9',1674757171,'a:0:{}'),(5,'ae3fde944faa18556f4f3b05d695cede',1674757171,'a:1:{i:0;a:3:{s:11:\"doNotLinkIt\";s:1:\"1\";s:14:\"wrapItemAndSub\";s:3:\"{|}\";s:8:\"stdWrap.\";a:2:{s:7:\"cObject\";s:3:\"COA\";s:8:\"cObject.\";a:27:{i:1;s:13:\"LOAD_REGISTER\";s:2:\"1.\";a:1:{s:11:\"languageId.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:2:{s:6:\"value.\";a:1:{s:4:\"data\";s:24:\"register:languages_HMENU\";}s:8:\"listNum.\";a:2:{s:8:\"stdWrap.\";a:2:{s:4:\"data\";s:28:\"register:count_HMENU_MENUOBJ\";s:4:\"wrap\";s:3:\"|-1\";}s:9:\"splitChar\";s:1:\",\";}}}}i:10;s:4:\"TEXT\";s:3:\"10.\";a:2:{s:8:\"stdWrap.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:4:\"wrap\";s:14:\"\"languageId\":|\";}i:11;s:4:\"USER\";s:3:\"11.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:6:\"locale\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:11:\",\"locale\":|\";}}i:20;s:4:\"USER\";s:3:\"20.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:5:\"title\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:10:\",\"title\":|\";}}i:21;s:4:\"USER\";s:3:\"21.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:15:\"navigationTitle\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:20:\",\"navigationTitle\":|\";}}i:22;s:4:\"USER\";s:3:\"22.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:16:\"twoLetterIsoCode\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:21:\",\"twoLetterIsoCode\":|\";}}i:23;s:4:\"USER\";s:3:\"23.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:8:\"hreflang\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:13:\",\"hreflang\":|\";}}i:24;s:4:\"USER\";s:3:\"24.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:9:\"direction\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:14:\",\"direction\":|\";}}i:25;s:4:\"USER\";s:3:\"25.\";a:4:{s:8:\"userFunc\";s:71:\"TYPO3\\CMS\\Frontend\\DataProcessing\\LanguageMenuProcessor->getFieldAsJson\";s:9:\"language.\";a:1:{s:4:\"data\";s:19:\"register:languageId\";}s:5:\"field\";s:4:\"flag\";s:8:\"stdWrap.\";a:1:{s:4:\"wrap\";s:9:\",\"flag\":|\";}}i:90;s:4:\"TEXT\";s:3:\"90.\";a:2:{s:5:\"value\";s:21:\"###LINKPLACEHOLDER###\";s:4:\"wrap\";s:9:\",\"link\":|\";}i:91;s:4:\"TEXT\";s:3:\"91.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:11:\",\"active\":|\";}i:92;s:4:\"TEXT\";s:3:\"92.\";a:2:{s:5:\"value\";s:1:\"0\";s:4:\"wrap\";s:12:\",\"current\":|\";}i:93;s:4:\"TEXT\";s:3:\"93.\";a:2:{s:5:\"value\";s:1:\"1\";s:4:\"wrap\";s:14:\",\"available\":|\";}i:99;s:16:\"RESTORE_REGISTER\";}}}}'),(6,'3cceec512bf1bae19222ec156531d175',1674757171,'a:0:{}'),(7,'9be957d92e17b26206295cd2c8ab8ae0',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:5:{s:4:\"mod.\";a:5:{s:9:\"web_list.\";a:3:{s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:10:{s:7:\"common.\";a:3:{s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";s:9:\"elements.\";a:8:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:57:\"header,text,textpic,image,textmedia,bullets,table,uploads\";}s:5:\"menu.\";a:3:{s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";s:9:\"elements.\";a:15:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}s:14:\"menu_card_dir.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-menu-card\";s:5:\"title\";s:78:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_dir\";s:11:\"description\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_dir.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_card_dir\";}}s:15:\"menu_card_list.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-menu-card\";s:5:\"title\";s:79:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_list\";s:11:\"description\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_list.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"menu_card_list\";}}s:19:\"menu_thumbnail_dir.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-menu-thumbnail\";s:5:\"title\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_dir\";s:11:\"description\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_dir.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_thumbnail_dir\";}}s:20:\"menu_thumbnail_list.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-menu-thumbnail\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_list\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_list.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"menu_thumbnail_list\";}}}s:4:\"show\";s:259:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages,menu_card_dir,menu_card_list,menu_thumbnail_dir,menu_thumbnail_list\";}s:8:\"special.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";}s:6:\"forms.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";s:4:\"show\";s:27:\"formframework,felogin_login\";s:9:\"elements.\";a:2:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:81:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:14:\"felogin_login.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-elements-login\";s:5:\"title\";s:92:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.title\";s:11:\"description\";s:98:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"felogin_login\";}}}}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:1:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}}s:4:\"show\";s:1:\"*\";}s:12:\"interactive.\";a:3:{s:6:\"header\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.interactive\";s:9:\"elements.\";a:5:{s:10:\"accordion.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-accordion\";s:5:\"title\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.accordion\";s:11:\"description\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.accordion.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"accordion\";}}s:9:\"carousel.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"carousel\";}}s:20:\"carousel_fullscreen.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_fullscreen\";s:11:\"description\";s:112:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_fullscreen.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"carousel_fullscreen\";}}s:15:\"carousel_small.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_small\";s:11:\"description\";s:107:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_small.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"carousel_small\";}}s:9:\"timeline.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-timeline\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.timeline\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.timeline.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"timeline\";}}}s:4:\"show\";s:62:\"accordion,carousel,carousel_fullscreen,carousel_small,timeline\";}s:6:\"media.\";a:3:{s:6:\"header\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.media\";s:9:\"elements.\";a:11:{s:6:\"audio.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-audio\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.audio\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.audio.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"audio\";}}s:11:\"card_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-card-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"card_group\";}}s:15:\"external_media.\";a:4:{s:14:\"iconIdentifier\";s:38:\"content-bootstrappackage-externalmedia\";s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.external_media\";s:11:\"description\";s:107:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.external_media.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"external_media\";}}s:8:\"gallery.\";a:4:{s:14:\"iconIdentifier\";s:32:\"content-bootstrappackage-gallery\";s:5:\"title\";s:88:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.gallery\";s:11:\"description\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.gallery.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"gallery\";}}s:11:\"icon_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-icon-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.icon_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.icon_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"icon_group\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:6:\"media.\";a:4:{s:14:\"iconIdentifier\";s:30:\"mimetypes-x-content-multimedia\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.media\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.media.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"media\";}}s:4:\"tab.\";a:4:{s:14:\"iconIdentifier\";s:28:\"content-bootstrappackage-tab\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.tab\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.tab.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"tab\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:92:\"audio,card_group,external_media,gallery,icon_group,image,media,tab,textmedia,textpic,uploads\";}s:5:\"text.\";a:3:{s:6:\"header\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.text\";s:9:\"elements.\";a:13:{s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:11:\"card_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-card-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"card_group\";}}s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:10:\"listgroup.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-listgroup\";s:5:\"title\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.listgroup\";s:11:\"description\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.listgroup.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"listgroup\";}}s:6:\"panel.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-panel\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.panel\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.panel.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"panel\";}}s:6:\"quote.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-quote\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.quote\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.quote.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"quote\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:11:\"textcolumn.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-text-columns\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textcolumn\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textcolumn.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"textcolumn\";}}s:9:\"texticon.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-texticon\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.texticon\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.texticon.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"texticon\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:11:\"textteaser.\";a:4:{s:14:\"iconIdentifier\";s:19:\"content-text-teaser\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textteaser\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textteaser.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"textteaser\";}}}s:4:\"show\";s:107:\"bullets,card_group,header,listgroup,panel,quote,table,text,textcolumn,texticon,textmedia,textpic,textteaser\";}s:7:\"social.\";a:3:{s:6:\"header\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.social_media\";s:9:\"elements.\";a:1:{s:13:\"social_links.\";a:4:{s:14:\"iconIdentifier\";s:37:\"content-bootstrappackage-social-links\";s:5:\"title\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.social_links\";s:11:\"description\";s:105:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.social_links.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"social_links\";}}}s:4:\"show\";s:12:\"social_links\";}s:5:\"data.\";a:3:{s:6:\"header\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.data\";s:9:\"elements.\";a:2:{s:4:\"csv.\";a:4:{s:14:\"iconIdentifier\";s:28:\"content-bootstrappackage-csv\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.csv\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.csv.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"csv\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}}s:4:\"show\";s:9:\"csv,table\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:6:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:2:\"3.\";a:2:{s:5:\"label\";s:75:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_layouts\";s:6:\"fields\";s:79:\"title,uid,actual_backend_layout,backend_layout,backend_layout_next_level,layout\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:106:\"title,uid,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:67:\"title,uid,og_title,og_description,twitter_title,twitter_description\";}}}s:11:\"web_layout.\";a:2:{s:11:\"tt_content.\";a:1:{s:8:\"preview.\";a:4:{s:3:\"csv\";s:66:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/Csv.html\";s:14:\"external_media\";s:76:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/ExternalMedia.html\";s:9:\"listgroup\";s:72:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/ListGroup.html\";s:5:\"quote\";s:68:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/Quote.html\";}}s:15:\"BackendLayouts.\";a:13:{s:10:\"2_columns.\";a:3:{s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:73:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns.svg\";}s:16:\"2_columns_25_75.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_25_75\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_25_75.svg\";}s:16:\"2_columns_50_50.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_50_50\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_50_50.svg\";}s:23:\"2_columns_offset_right.\";a:3:{s:5:\"title\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_offset_right\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:86:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_offset_right.svg\";}s:10:\"3_columns.\";a:3:{s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.3_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"3.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:73:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/3_columns.svg\";}s:8:\"default.\";a:3:{s:5:\"title\";s:87:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.default\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:71:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/default.svg\";}s:7:\"simple.\";a:3:{s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.simple\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"4\";s:5:\"rows.\";a:4:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}}}}s:4:\"icon\";s:70:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/simple.svg\";}s:16:\"special_feature.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.special_feature\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:2:\"10\";s:5:\"rows.\";a:10:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special1\";s:6:\"colPos\";s:2:\"30\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special2\";s:6:\"colPos\";s:2:\"31\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special3\";s:6:\"colPos\";s:2:\"32\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special4\";s:6:\"colPos\";s:2:\"33\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"6.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.main2\";s:6:\"colPos\";s:1:\"4\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"7.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special5\";s:6:\"colPos\";s:2:\"34\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special6\";s:6:\"colPos\";s:2:\"35\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"8.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special7\";s:6:\"colPos\";s:2:\"36\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special8\";s:6:\"colPos\";s:2:\"37\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"9.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:3:\"10.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/special_feature.svg\";}s:14:\"special_start.\";a:3:{s:5:\"title\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.special_start\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"6\";s:5:\"rows.\";a:6:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle1\";s:6:\"colPos\";s:2:\"20\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle2\";s:6:\"colPos\";s:2:\"21\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle3\";s:6:\"colPos\";s:2:\"22\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"6.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:77:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/special_start.svg\";}s:19:\"subnavigation_left.\";a:3:{s:5:\"title\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_left\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"9\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:82:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_left.svg\";}s:29:\"subnavigation_left_2_columns.\";a:3:{s:5:\"title\";s:108:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_left_2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"3\";}s:2:\"3.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:92:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_left_2_columns.svg\";}s:20:\"subnavigation_right.\";a:3:{s:5:\"title\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_right\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"9\";}s:2:\"2.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:83:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_right.svg\";}s:30:\"subnavigation_right_2_columns.\";a:3:{s:5:\"title\";s:109:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_right_2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"3\";}s:2:\"3.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:93:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_right_2_columns.svg\";}}}}s:8:\"TCEMAIN.\";a:3:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:6:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:9:\"page,file\";s:9:\"scanAfter\";s:9:\"page,file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:16:\"page,file,folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:20:\"page,file,folder,url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:25:\"page,file,folder,url,mail\";s:10:\"scanBefore\";s:3:\"url\";}}s:12:\"permissions.\";a:4:{s:7:\"groupid\";s:1:\"1\";s:4:\"user\";s:36:\"show, editcontent, edit, new, delete\";s:5:\"group\";s:36:\"show, editcontent, edit, new, delete\";s:9:\"everybody\";s:0:\"\";}}s:8:\"TCEFORM.\";a:2:{s:11:\"tt_content.\";a:11:{s:12:\"imageorient.\";a:2:{s:6:\"types.\";a:2:{s:6:\"image.\";a:2:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";s:8:\"disabled\";s:1:\"1\";}s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:11:\"removeItems\";s:14:\"1,2,9,10,17,18\";}s:14:\"header_layout.\";a:1:{s:10:\"altLabels.\";a:5:{i:1;s:2:\"H1\";i:2;s:2:\"H2\";i:3;s:2:\"H3\";i:4;s:2:\"H4\";i:5;s:2:\"H5\";}}s:7:\"layout.\";a:3:{s:11:\"removeItems\";s:5:\"1,2,3\";s:29:\"disableNoMatchingValueElement\";s:1:\"1\";s:6:\"types.\";a:1:{s:8:\"uploads.\";a:2:{s:11:\"removeItems\";s:1:\"3\";s:10:\"altLabels.\";a:3:{i:0;s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.default\";i:1;s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.icons\";i:2;s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.iconsandpreview\";}}}}s:12:\"table_class.\";a:1:{s:9:\"addItems.\";a:2:{s:5:\"hover\";s:82:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:tablelayout.hover\";s:9:\"condensed\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:tablelayout.condensed\";}}s:12:\"imageborder.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:10:\"imagecols.\";a:1:{s:11:\"removeItems\";s:3:\"7,8\";}s:11:\"image_zoom.\";a:1:{s:6:\"types.\";a:1:{s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}}s:12:\"frame_class.\";a:1:{s:11:\"removeItems\";s:56:\"ruler-before,ruler-after,indent,indent-left,indent-right\";}s:20:\"accessibility_title.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:12:\"imageheight.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"imagewidth.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:6:\"pages.\";a:1:{s:7:\"layout.\";a:1:{s:11:\"removeItems\";s:5:\"1,2,3\";}}}s:4:\"RTE.\";a:1:{s:8:\"default.\";a:1:{s:6:\"preset\";s:9:\"bootstrap\";}}s:12:\"TCAdefaults.\";a:1:{s:11:\"tt_content.\";a:1:{s:9:\"imagecols\";s:1:\"1\";}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"48688c5a44a612931a585c0fd4af6158\";}'),(8,'79465ab812423e88acd1bb7c98ecd606',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:5:{s:4:\"mod.\";a:5:{s:9:\"web_list.\";a:3:{s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:10:{s:7:\"common.\";a:3:{s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";s:9:\"elements.\";a:8:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:57:\"header,text,textpic,image,textmedia,bullets,table,uploads\";}s:5:\"menu.\";a:3:{s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";s:9:\"elements.\";a:15:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}s:14:\"menu_card_dir.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-menu-card\";s:5:\"title\";s:78:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_dir\";s:11:\"description\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_dir.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_card_dir\";}}s:15:\"menu_card_list.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-menu-card\";s:5:\"title\";s:79:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_list\";s:11:\"description\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_list.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"menu_card_list\";}}s:19:\"menu_thumbnail_dir.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-menu-thumbnail\";s:5:\"title\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_dir\";s:11:\"description\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_dir.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_thumbnail_dir\";}}s:20:\"menu_thumbnail_list.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-menu-thumbnail\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_list\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_list.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"menu_thumbnail_list\";}}}s:4:\"show\";s:259:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages,menu_card_dir,menu_card_list,menu_thumbnail_dir,menu_thumbnail_list\";}s:8:\"special.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";}s:6:\"forms.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";s:4:\"show\";s:27:\"formframework,felogin_login\";s:9:\"elements.\";a:2:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:81:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:14:\"felogin_login.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-elements-login\";s:5:\"title\";s:92:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.title\";s:11:\"description\";s:98:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"felogin_login\";}}}}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:1:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}}s:4:\"show\";s:1:\"*\";}s:12:\"interactive.\";a:3:{s:6:\"header\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.interactive\";s:9:\"elements.\";a:5:{s:10:\"accordion.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-accordion\";s:5:\"title\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.accordion\";s:11:\"description\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.accordion.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"accordion\";}}s:9:\"carousel.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"carousel\";}}s:20:\"carousel_fullscreen.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_fullscreen\";s:11:\"description\";s:112:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_fullscreen.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"carousel_fullscreen\";}}s:15:\"carousel_small.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_small\";s:11:\"description\";s:107:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_small.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"carousel_small\";}}s:9:\"timeline.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-timeline\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.timeline\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.timeline.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"timeline\";}}}s:4:\"show\";s:62:\"accordion,carousel,carousel_fullscreen,carousel_small,timeline\";}s:6:\"media.\";a:3:{s:6:\"header\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.media\";s:9:\"elements.\";a:11:{s:6:\"audio.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-audio\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.audio\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.audio.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"audio\";}}s:11:\"card_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-card-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"card_group\";}}s:15:\"external_media.\";a:4:{s:14:\"iconIdentifier\";s:38:\"content-bootstrappackage-externalmedia\";s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.external_media\";s:11:\"description\";s:107:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.external_media.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"external_media\";}}s:8:\"gallery.\";a:4:{s:14:\"iconIdentifier\";s:32:\"content-bootstrappackage-gallery\";s:5:\"title\";s:88:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.gallery\";s:11:\"description\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.gallery.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"gallery\";}}s:11:\"icon_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-icon-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.icon_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.icon_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"icon_group\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:6:\"media.\";a:4:{s:14:\"iconIdentifier\";s:30:\"mimetypes-x-content-multimedia\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.media\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.media.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"media\";}}s:4:\"tab.\";a:4:{s:14:\"iconIdentifier\";s:28:\"content-bootstrappackage-tab\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.tab\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.tab.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"tab\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:92:\"audio,card_group,external_media,gallery,icon_group,image,media,tab,textmedia,textpic,uploads\";}s:5:\"text.\";a:3:{s:6:\"header\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.text\";s:9:\"elements.\";a:13:{s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:11:\"card_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-card-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"card_group\";}}s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:10:\"listgroup.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-listgroup\";s:5:\"title\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.listgroup\";s:11:\"description\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.listgroup.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"listgroup\";}}s:6:\"panel.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-panel\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.panel\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.panel.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"panel\";}}s:6:\"quote.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-quote\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.quote\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.quote.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"quote\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:11:\"textcolumn.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-text-columns\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textcolumn\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textcolumn.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"textcolumn\";}}s:9:\"texticon.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-texticon\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.texticon\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.texticon.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"texticon\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:11:\"textteaser.\";a:4:{s:14:\"iconIdentifier\";s:19:\"content-text-teaser\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textteaser\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textteaser.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"textteaser\";}}}s:4:\"show\";s:107:\"bullets,card_group,header,listgroup,panel,quote,table,text,textcolumn,texticon,textmedia,textpic,textteaser\";}s:7:\"social.\";a:3:{s:6:\"header\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.social_media\";s:9:\"elements.\";a:1:{s:13:\"social_links.\";a:4:{s:14:\"iconIdentifier\";s:37:\"content-bootstrappackage-social-links\";s:5:\"title\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.social_links\";s:11:\"description\";s:105:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.social_links.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"social_links\";}}}s:4:\"show\";s:12:\"social_links\";}s:5:\"data.\";a:3:{s:6:\"header\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.data\";s:9:\"elements.\";a:2:{s:4:\"csv.\";a:4:{s:14:\"iconIdentifier\";s:28:\"content-bootstrappackage-csv\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.csv\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.csv.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"csv\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}}s:4:\"show\";s:9:\"csv,table\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:6:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:2:\"3.\";a:2:{s:5:\"label\";s:75:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_layouts\";s:6:\"fields\";s:79:\"title,uid,actual_backend_layout,backend_layout,backend_layout_next_level,layout\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:106:\"title,uid,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:67:\"title,uid,og_title,og_description,twitter_title,twitter_description\";}}}s:11:\"web_layout.\";a:2:{s:11:\"tt_content.\";a:1:{s:8:\"preview.\";a:4:{s:3:\"csv\";s:66:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/Csv.html\";s:14:\"external_media\";s:76:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/ExternalMedia.html\";s:9:\"listgroup\";s:72:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/ListGroup.html\";s:5:\"quote\";s:68:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/Quote.html\";}}s:15:\"BackendLayouts.\";a:13:{s:10:\"2_columns.\";a:3:{s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:73:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns.svg\";}s:16:\"2_columns_25_75.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_25_75\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_25_75.svg\";}s:16:\"2_columns_50_50.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_50_50\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_50_50.svg\";}s:23:\"2_columns_offset_right.\";a:3:{s:5:\"title\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_offset_right\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:86:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_offset_right.svg\";}s:10:\"3_columns.\";a:3:{s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.3_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"3.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:73:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/3_columns.svg\";}s:8:\"default.\";a:3:{s:5:\"title\";s:87:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.default\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:71:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/default.svg\";}s:7:\"simple.\";a:3:{s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.simple\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"4\";s:5:\"rows.\";a:4:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}}}}s:4:\"icon\";s:70:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/simple.svg\";}s:16:\"special_feature.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.special_feature\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:2:\"10\";s:5:\"rows.\";a:10:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special1\";s:6:\"colPos\";s:2:\"30\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special2\";s:6:\"colPos\";s:2:\"31\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special3\";s:6:\"colPos\";s:2:\"32\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special4\";s:6:\"colPos\";s:2:\"33\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"6.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.main2\";s:6:\"colPos\";s:1:\"4\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"7.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special5\";s:6:\"colPos\";s:2:\"34\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special6\";s:6:\"colPos\";s:2:\"35\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"8.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special7\";s:6:\"colPos\";s:2:\"36\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special8\";s:6:\"colPos\";s:2:\"37\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"9.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:3:\"10.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/special_feature.svg\";}s:14:\"special_start.\";a:3:{s:5:\"title\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.special_start\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"6\";s:5:\"rows.\";a:6:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle1\";s:6:\"colPos\";s:2:\"20\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle2\";s:6:\"colPos\";s:2:\"21\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle3\";s:6:\"colPos\";s:2:\"22\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"6.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:77:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/special_start.svg\";}s:19:\"subnavigation_left.\";a:3:{s:5:\"title\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_left\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"9\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:82:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_left.svg\";}s:29:\"subnavigation_left_2_columns.\";a:3:{s:5:\"title\";s:108:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_left_2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"3\";}s:2:\"3.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:92:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_left_2_columns.svg\";}s:20:\"subnavigation_right.\";a:3:{s:5:\"title\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_right\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"9\";}s:2:\"2.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:83:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_right.svg\";}s:30:\"subnavigation_right_2_columns.\";a:3:{s:5:\"title\";s:109:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_right_2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"3\";}s:2:\"3.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:93:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_right_2_columns.svg\";}}}}s:8:\"TCEMAIN.\";a:3:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:6:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:9:\"page,file\";s:9:\"scanAfter\";s:9:\"page,file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:16:\"page,file,folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:20:\"page,file,folder,url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:25:\"page,file,folder,url,mail\";s:10:\"scanBefore\";s:3:\"url\";}}s:12:\"permissions.\";a:4:{s:7:\"groupid\";s:1:\"1\";s:4:\"user\";s:36:\"show, editcontent, edit, new, delete\";s:5:\"group\";s:36:\"show, editcontent, edit, new, delete\";s:9:\"everybody\";s:0:\"\";}}s:8:\"TCEFORM.\";a:2:{s:11:\"tt_content.\";a:11:{s:12:\"imageorient.\";a:2:{s:6:\"types.\";a:2:{s:6:\"image.\";a:2:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";s:8:\"disabled\";s:1:\"1\";}s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:11:\"removeItems\";s:14:\"1,2,9,10,17,18\";}s:14:\"header_layout.\";a:1:{s:10:\"altLabels.\";a:5:{i:1;s:2:\"H1\";i:2;s:2:\"H2\";i:3;s:2:\"H3\";i:4;s:2:\"H4\";i:5;s:2:\"H5\";}}s:7:\"layout.\";a:3:{s:11:\"removeItems\";s:5:\"1,2,3\";s:29:\"disableNoMatchingValueElement\";s:1:\"1\";s:6:\"types.\";a:1:{s:8:\"uploads.\";a:2:{s:11:\"removeItems\";s:1:\"3\";s:10:\"altLabels.\";a:3:{i:0;s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.default\";i:1;s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.icons\";i:2;s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.iconsandpreview\";}}}}s:12:\"table_class.\";a:1:{s:9:\"addItems.\";a:2:{s:5:\"hover\";s:82:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:tablelayout.hover\";s:9:\"condensed\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:tablelayout.condensed\";}}s:12:\"imageborder.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:10:\"imagecols.\";a:1:{s:11:\"removeItems\";s:3:\"7,8\";}s:11:\"image_zoom.\";a:1:{s:6:\"types.\";a:1:{s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}}s:12:\"frame_class.\";a:1:{s:11:\"removeItems\";s:56:\"ruler-before,ruler-after,indent,indent-left,indent-right\";}s:20:\"accessibility_title.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:12:\"imageheight.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"imagewidth.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:6:\"pages.\";a:1:{s:7:\"layout.\";a:1:{s:11:\"removeItems\";s:5:\"1,2,3\";}}}s:4:\"RTE.\";a:1:{s:8:\"default.\";a:1:{s:6:\"preset\";s:9:\"bootstrap\";}}s:12:\"TCAdefaults.\";a:1:{s:11:\"tt_content.\";a:1:{s:9:\"imagecols\";s:1:\"1\";}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"48688c5a44a612931a585c0fd4af6158\";}'),(9,'d7bee72ccdc1e3dc622c2d800715eaba',2145909600,'a:2:{s:9:\"constants\";a:2:{s:7:\"styles.\";a:2:{s:8:\"content.\";a:7:{s:10:\"loginform.\";a:21:{s:3:\"pid\";s:1:\"0\";s:9:\"recursive\";s:1:\"0\";s:22:\"showForgotPasswordLink\";s:1:\"0\";s:18:\"showForgotPassword\";s:1:\"0\";s:14:\"showPermaLogin\";s:1:\"0\";s:24:\"showLogoutFormAfterLogin\";s:1:\"0\";s:9:\"emailFrom\";s:0:\"\";s:13:\"emailFromName\";s:0:\"\";s:12:\"replyToEmail\";s:0:\"\";s:10:\"dateFormat\";s:9:\"Y-m-d H:i\";s:6:\"email.\";a:4:{s:14:\"layoutRootPath\";s:0:\"\";s:16:\"templateRootPath\";s:46:\"EXT:felogin/Resources/Private/Email/Templates/\";s:15:\"partialRootPath\";s:0:\"\";s:12:\"templateName\";s:16:\"PasswordRecovery\";}s:12:\"redirectMode\";s:0:\"\";s:19:\"redirectFirstMethod\";s:1:\"0\";s:17:\"redirectPageLogin\";s:1:\"0\";s:22:\"redirectPageLoginError\";s:1:\"0\";s:18:\"redirectPageLogout\";s:1:\"0\";s:15:\"redirectDisable\";s:1:\"0\";s:23:\"forgotLinkHashValidTime\";s:2:\"12\";s:20:\"newPasswordMinLength\";s:1:\"6\";s:7:\"domains\";s:0:\"\";s:43:\"exposeNonexistentUserInForgotPasswordDialog\";s:1:\"0\";}s:17:\"defaultHeaderType\";s:1:\"2\";s:9:\"shortcut.\";a:1:{s:6:\"tables\";s:10:\"tt_content\";}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:6:\"image.\";a:2:{s:11:\"lazyLoading\";s:4:\"lazy\";s:13:\"imageDecoding\";s:0:\"\";}s:10:\"textmedia.\";a:9:{s:4:\"maxW\";s:3:\"600\";s:10:\"maxWInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:10:\"rowSpacing\";s:2:\"10\";s:10:\"textMargin\";s:2:\"10\";s:11:\"borderColor\";s:7:\"#000000\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";s:9:\"linkWrap.\";a:6:{s:5:\"width\";s:4:\"800m\";s:6:\"height\";s:4:\"600m\";s:9:\"newWindow\";s:1:\"0\";s:15:\"lightboxEnabled\";s:1:\"0\";s:16:\"lightboxCssClass\";s:8:\"lightbox\";s:20:\"lightboxRelAttribute\";s:21:\"lightbox[{field:uid}]\";}}s:6:\"links.\";a:2:{s:9:\"extTarget\";s:6:\"_blank\";s:4:\"keep\";s:4:\"path\";}}s:10:\"templates.\";a:3:{s:16:\"templateRootPath\";s:0:\"\";s:15:\"partialRootPath\";s:0:\"\";s:14:\"layoutRootPath\";s:0:\"\";}}s:7:\"plugin.\";a:1:{s:17:\"tx_felogin_login.\";a:1:{s:5:\"view.\";a:3:{s:16:\"templateRootPath\";s:0:\"\";s:15:\"partialRootPath\";s:0:\"\";s:14:\"layoutRootPath\";s:0:\"\";}}}}s:5:\"setup\";a:10:{s:7:\"config.\";a:3:{s:19:\"pageTitleProviders.\";a:2:{s:7:\"record.\";a:1:{s:8:\"provider\";s:48:\"TYPO3\\CMS\\Core\\PageTitle\\RecordPageTitleProvider\";}s:4:\"seo.\";a:2:{s:8:\"provider\";s:49:\"TYPO3\\CMS\\Seo\\PageTitle\\SeoTitlePageTitleProvider\";s:6:\"before\";s:6:\"record\";}}s:11:\"tx_extbase.\";a:3:{s:4:\"mvc.\";a:1:{s:48:\"throwPageNotFoundExceptionIfActionCantBeResolved\";s:1:\"0\";}s:12:\"persistence.\";a:2:{s:28:\"enableAutomaticCacheClearing\";s:1:\"1\";s:20:\"updateReferenceIndex\";s:1:\"0\";}s:9:\"features.\";a:2:{s:20:\"skipDefaultArguments\";s:1:\"0\";s:25:\"ignoreAllEnableFieldsInBe\";s:1:\"0\";}}s:29:\"contentObjectExceptionHandler\";s:1:\"0\";}s:7:\"styles.\";a:1:{s:8:\"content.\";a:2:{s:3:\"get\";s:7:\"CONTENT\";s:4:\"get.\";a:2:{s:5:\"table\";s:10:\"tt_content\";s:7:\"select.\";a:2:{s:7:\"orderBy\";s:7:\"sorting\";s:5:\"where\";s:11:\"{#colPos}=0\";}}}}s:10:\"tt_content\";s:4:\"CASE\";s:11:\"tt_content.\";a:54:{s:4:\"key.\";a:1:{s:5:\"field\";s:5:\"CType\";}s:7:\"default\";s:4:\"TEXT\";s:8:\"default.\";a:4:{s:5:\"field\";s:5:\"CType\";s:16:\"htmlSpecialChars\";s:1:\"1\";s:4:\"wrap\";s:165:\"<p style=\"background-color: yellow; padding: 0.5em 1em;\"><strong>ERROR:</strong> Content Element with uid \"{field:uid}\" and type \"|\" has no rendering definition!</p>\";s:5:\"wrap.\";a:1:{s:10:\"insertData\";s:1:\"1\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editPanel\";s:1:\"1\";s:10:\"editPanel.\";a:5:{s:5:\"allow\";s:29:\"move, new, edit, hide, delete\";s:5:\"label\";s:2:\"%s\";s:14:\"onlyCurrentPid\";s:1:\"1\";s:13:\"previewBorder\";s:1:\"1\";s:5:\"edit.\";a:1:{s:13:\"displayRecord\";s:1:\"1\";}}}s:7:\"bullets\";s:20:\"< lib.contentElement\";s:8:\"bullets.\";a:3:{s:12:\"templateName\";s:7:\"Bullets\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\SplitProcessor\";s:3:\"10.\";a:4:{s:3:\"if.\";a:2:{s:5:\"value\";s:1:\"2\";s:11:\"isLessThan.\";a:1:{s:5:\"field\";s:12:\"bullets_type\";}}s:9:\"fieldName\";s:8:\"bodytext\";s:18:\"removeEmptyEntries\";s:1:\"1\";s:2:\"as\";s:7:\"bullets\";}i:20;s:62:\"TYPO3\\CMS\\Frontend\\DataProcessing\\CommaSeparatedValueProcessor\";s:3:\"20.\";a:4:{s:9:\"fieldName\";s:8:\"bodytext\";s:3:\"if.\";a:2:{s:5:\"value\";s:1:\"2\";s:7:\"equals.\";a:1:{s:5:\"field\";s:12:\"bullets_type\";}}s:14:\"fieldDelimiter\";s:1:\"|\";s:2:\"as\";s:7:\"bullets\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:59:\"tt_content: header [header_layout], bodytext [bullets_type]\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:92:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.bullets\";}}}}s:3:\"div\";s:20:\"< lib.contentElement\";s:4:\"div.\";a:1:{s:12:\"templateName\";s:3:\"Div\";}s:6:\"header\";s:20:\"< lib.contentElement\";s:7:\"header.\";a:2:{s:12:\"templateName\";s:6:\"Header\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:63:\"tt_content: header [header_layout|header_link], subheader, date\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:91:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.header\";}}}}s:4:\"html\";s:20:\"< lib.contentElement\";s:5:\"html.\";a:2:{s:12:\"templateName\";s:4:\"Html\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:20:\"tt_content: bodytext\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.html\";}}}}s:5:\"image\";s:20:\"< lib.contentElement\";s:6:\"image.\";a:3:{s:12:\"templateName\";s:5:\"Image\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}i:20;s:50:\"TYPO3\\CMS\\Frontend\\DataProcessing\\GalleryProcessor\";s:3:\"20.\";a:5:{s:15:\"maxGalleryWidth\";s:3:\"600\";s:21:\"maxGalleryWidthInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:92:\"tt_content : image [imageorient|imagewidth|imageheight], [imagecols|imageborder], image_zoom\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:90:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.image\";}}}}s:4:\"list\";s:20:\"< lib.contentElement\";s:5:\"list.\";a:2:{s:12:\"templateName\";s:4:\"List\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:72:\"tt_content: header [header_layout], list_type, layout, pages [recursive]\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.list\";}}}}s:8:\"shortcut\";s:20:\"< lib.contentElement\";s:9:\"shortcut.\";a:3:{s:12:\"templateName\";s:8:\"Shortcut\";s:10:\"variables.\";a:2:{s:9:\"shortcuts\";s:7:\"RECORDS\";s:10:\"shortcuts.\";a:2:{s:7:\"source.\";a:1:{s:5:\"field\";s:7:\"records\";}s:6:\"tables\";s:10:\"tt_content\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:43:\"tt_content: header [header_layout], records\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:93:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.shortcut\";}}}}s:5:\"table\";s:20:\"< lib.contentElement\";s:6:\"table.\";a:3:{s:12:\"templateName\";s:5:\"Table\";s:15:\"dataProcessing.\";a:2:{i:10;s:62:\"TYPO3\\CMS\\Frontend\\DataProcessing\\CommaSeparatedValueProcessor\";s:3:\"10.\";a:5:{s:9:\"fieldName\";s:8:\"bodytext\";s:15:\"fieldDelimiter.\";a:1:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_delimiter\";}}}s:15:\"fieldEnclosure.\";a:2:{s:5:\"char.\";a:2:{s:7:\"cObject\";s:4:\"TEXT\";s:8:\"cObject.\";a:1:{s:5:\"field\";s:15:\"table_enclosure\";}}s:3:\"if.\";a:3:{s:5:\"value\";s:1:\"0\";s:7:\"equals.\";a:1:{s:5:\"field\";s:15:\"table_enclosure\";}s:6:\"negate\";s:1:\"1\";}}s:15:\"maximumColumns.\";a:1:{s:5:\"field\";s:4:\"cols\";}s:2:\"as\";s:5:\"table\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:100:\"tt_content: header [header_layout], bodytext, [table_caption|cols|table_header_position|table_tfoot]\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:90:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.table\";}}}}s:4:\"text\";s:20:\"< lib.contentElement\";s:5:\"text.\";a:2:{s:12:\"templateName\";s:4:\"Text\";s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:20:\"tt_content: bodytext\";s:10:\"editIcons.\";a:2:{s:13:\"beforeLastTag\";s:1:\"1\";s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.html\";}}}}s:9:\"textmedia\";s:20:\"< lib.contentElement\";s:10:\"textmedia.\";a:3:{s:12:\"templateName\";s:9:\"Textmedia\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:6:\"assets\";}}i:20;s:50:\"TYPO3\\CMS\\Frontend\\DataProcessing\\GalleryProcessor\";s:3:\"20.\";a:5:{s:15:\"maxGalleryWidth\";s:3:\"600\";s:21:\"maxGalleryWidthInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:126:\"tt_content: header [header_layout], bodytext, assets [imageorient|imagewidth|imageheight], [imagecols|imageborder], image_zoom\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:94:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.textmedia\";}}}}s:7:\"textpic\";s:20:\"< lib.contentElement\";s:8:\"textpic.\";a:3:{s:12:\"templateName\";s:7:\"Textpic\";s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}i:20;s:50:\"TYPO3\\CMS\\Frontend\\DataProcessing\\GalleryProcessor\";s:3:\"20.\";a:5:{s:15:\"maxGalleryWidth\";s:3:\"600\";s:21:\"maxGalleryWidthInText\";s:3:\"300\";s:13:\"columnSpacing\";s:2:\"10\";s:11:\"borderWidth\";s:1:\"2\";s:13:\"borderPadding\";s:1:\"0\";}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:125:\"tt_content: header [header_layout], bodytext, image [imageorient|imagewidth|imageheight], [imagecols|imageborder], image_zoom\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:92:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.textpic\";}}}}s:7:\"uploads\";s:20:\"< lib.contentElement\";s:8:\"uploads.\";a:3:{s:12:\"templateName\";s:7:\"Uploads\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:3:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}s:12:\"collections.\";a:1:{s:5:\"field\";s:16:\"file_collections\";}s:8:\"sorting.\";a:2:{s:5:\"field\";s:16:\"filelink_sorting\";s:10:\"direction.\";a:1:{s:5:\"field\";s:26:\"filelink_sorting_direction\";}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:127:\"tt_content: header [header_layout], media, file_collections, filelink_sorting, [filelink_size|uploads_description|uploads_type]\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:92:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.uploads\";}}}}s:13:\"menu_abstract\";s:20:\"< lib.contentElement\";s:14:\"menu_abstract.\";a:3:{s:12:\"templateName\";s:12:\"MenuAbstract\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:24:\"menu_categorized_content\";s:20:\"< lib.contentElement\";s:25:\"menu_categorized_content.\";a:3:{s:12:\"templateName\";s:22:\"MenuCategorizedContent\";s:15:\"dataProcessing.\";a:2:{i:10;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"10.\";a:10:{s:5:\"table\";s:10:\"tt_content\";s:12:\"selectFields\";s:15:\"{#tt_content}.*\";s:7:\"groupBy\";s:3:\"uid\";s:10:\"pidInList.\";a:1:{s:4:\"data\";s:12:\"leveluid : 0\";}s:9:\"recursive\";s:2:\"99\";s:5:\"join.\";a:2:{s:4:\"data\";s:25:\"field:selected_categories\";s:4:\"wrap\";s:124:\"{#sys_category_record_mm} ON uid = {#sys_category_record_mm}.{#uid_foreign} AND {#sys_category_record_mm}.{#uid_local} IN(|)\";}s:6:\"where.\";a:2:{s:4:\"data\";s:20:\"field:category_field\";s:4:\"wrap\";s:47:\"{#tablenames}=\'tt_content\' and {#fieldname}=\'|\'\";}s:7:\"orderBy\";s:18:\"tt_content.sorting\";s:2:\"as\";s:7:\"content\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:71:\"tt_content: header [header_layout], selected_categories, category_field\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:22:\"menu_categorized_pages\";s:20:\"< lib.contentElement\";s:23:\"menu_categorized_pages.\";a:3:{s:12:\"templateName\";s:20:\"MenuCategorizedPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:10:\"categories\";s:8:\"special.\";a:4:{s:6:\"value.\";a:1:{s:5:\"field\";s:19:\"selected_categories\";}s:9:\"relation.\";a:1:{s:5:\"field\";s:14:\"category_field\";}s:7:\"sorting\";s:5:\"title\";s:5:\"order\";s:3:\"asc\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:71:\"tt_content: header [header_layout], selected_categories, category_field\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:10:\"menu_pages\";s:20:\"< lib.contentElement\";s:11:\"menu_pages.\";a:3:{s:12:\"templateName\";s:9:\"MenuPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:13:\"menu_subpages\";s:20:\"< lib.contentElement\";s:14:\"menu_subpages.\";a:3:{s:12:\"templateName\";s:12:\"MenuSubpages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:12:\"menu_section\";s:20:\"< lib.contentElement\";s:13:\"menu_section.\";a:3:{s:12:\"templateName\";s:11:\"MenuSection\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:17:\"includeNotInMenu.\";a:2:{s:8:\"override\";s:1:\"1\";s:9:\"override.\";a:1:{s:3:\"if.\";a:1:{s:8:\"isFalse.\";a:1:{s:5:\"field\";s:5:\"pages\";}}}}s:7:\"special\";s:4:\"list\";s:8:\"special.\";a:1:{s:6:\"value.\";a:2:{s:5:\"field\";s:5:\"pages\";s:9:\"override.\";a:3:{s:4:\"data\";s:8:\"page:uid\";s:3:\"if.\";a:1:{s:8:\"isFalse.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:9:\"override.\";a:2:{s:4:\"data\";s:21:\"page:content_from_pid\";s:3:\"if.\";a:1:{s:7:\"isTrue.\";a:1:{s:4:\"data\";s:21:\"page:content_from_pid\";}}}}}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:6:{s:5:\"table\";s:10:\"tt_content\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"uid\";}s:2:\"as\";s:7:\"content\";s:5:\"where\";s:19:\"{#sectionIndex} = 1\";s:7:\"orderBy\";s:7:\"sorting\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"menu_section_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_section_pages.\";a:3:{s:12:\"templateName\";s:16:\"MenuSectionPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:15:\"dataProcessing.\";a:4:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}i:20;s:56:\"TYPO3\\CMS\\Frontend\\DataProcessing\\DatabaseQueryProcessor\";s:3:\"20.\";a:5:{s:5:\"table\";s:10:\"tt_content\";s:10:\"pidInList.\";a:1:{s:5:\"field\";s:3:\"uid\";}s:7:\"orderBy\";s:7:\"sorting\";s:2:\"as\";s:7:\"content\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"image\";}}}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:21:\"menu_recently_updated\";s:20:\"< lib.contentElement\";s:22:\"menu_recently_updated.\";a:3:{s:12:\"templateName\";s:19:\"MenuRecentlyUpdated\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:3:{s:7:\"special\";s:7:\"updated\";s:8:\"special.\";a:3:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}s:6:\"maxAge\";s:9:\"3600*24*7\";s:20:\"excludeNoSearchPages\";s:1:\"1\";}s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"menu_related_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_related_pages.\";a:3:{s:12:\"templateName\";s:16:\"MenuRelatedPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:8:\"keywords\";s:8:\"special.\";a:2:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}s:20:\"excludeNoSearchPages\";s:1:\"1\";}s:23:\"alternativeSortingField\";s:5:\"title\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:12:\"menu_sitemap\";s:20:\"< lib.contentElement\";s:13:\"menu_sitemap.\";a:3:{s:12:\"templateName\";s:11:\"MenuSitemap\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:2:{s:6:\"levels\";s:1:\"7\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"menu_sitemap_pages\";s:20:\"< lib.contentElement\";s:19:\"menu_sitemap_pages.\";a:3:{s:12:\"templateName\";s:16:\"MenuSitemapPages\";s:15:\"dataProcessing.\";a:2:{i:10;s:47:\"TYPO3\\CMS\\Frontend\\DataProcessing\\MenuProcessor\";s:3:\"10.\";a:4:{s:7:\"special\";s:9:\"directory\";s:8:\"special.\";a:1:{s:6:\"value.\";a:1:{s:5:\"field\";s:5:\"pages\";}}s:6:\"levels\";s:1:\"7\";s:15:\"dataProcessing.\";a:2:{i:10;s:48:\"TYPO3\\CMS\\Frontend\\DataProcessing\\FilesProcessor\";s:3:\"10.\";a:1:{s:11:\"references.\";a:1:{s:9:\"fieldName\";s:5:\"media\";}}}}}s:8:\"stdWrap.\";a:2:{s:9:\"editIcons\";s:41:\"tt_content: header [header_layout], pages\";s:10:\"editIcons.\";a:1:{s:10:\"iconTitle.\";a:1:{s:4:\"data\";s:89:\"LLL:EXT:fluid_styled_content/Resources/Private/Language/FrontendEditing.xlf:editIcon.menu\";}}}}s:18:\"form_formframework\";s:20:\"< lib.contentElement\";s:19:\"form_formframework.\";a:3:{s:12:\"templateName\";s:7:\"Generic\";i:20;s:4:\"USER\";s:3:\"20.\";a:3:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:13:\"extensionName\";s:4:\"Form\";s:10:\"pluginName\";s:13:\"Formframework\";}}s:13:\"felogin_login\";s:20:\"< lib.contentElement\";s:14:\"felogin_login.\";a:3:{s:12:\"templateName\";s:7:\"Generic\";i:20;s:4:\"USER\";s:3:\"20.\";a:3:{s:8:\"userFunc\";s:37:\"TYPO3\\CMS\\Extbase\\Core\\Bootstrap->run\";s:13:\"extensionName\";s:7:\"Felogin\";s:10:\"pluginName\";s:5:\"Login\";}}}s:7:\"module.\";a:3:{s:8:\"tx_form.\";a:2:{s:9:\"settings.\";a:1:{s:19:\"yamlConfigurations.\";a:2:{i:10;s:42:\"EXT:form/Configuration/Yaml/FormSetup.yaml\";i:110;s:51:\"EXT:bootstrap_package/Configuration/Form/Setup.yaml\";}}s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:10;s:45:\"EXT:form/Resources/Private/Backend/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:10;s:44:\"EXT:form/Resources/Private/Backend/Partials/\";}s:16:\"layoutRootPaths.\";a:1:{i:10;s:43:\"EXT:form/Resources/Private/Backend/Layouts/\";}}}s:9:\"tx_belog.\";a:1:{s:9:\"settings.\";a:2:{s:29:\"selectableNumberOfLogEntries.\";a:6:{i:50;s:2:\"50\";i:100;s:3:\"100\";i:200;s:3:\"200\";i:500;s:3:\"500\";i:1000;s:4:\"1000\";i:1000000;s:3:\"any\";}s:18:\"selectableActions.\";a:7:{i:0;s:3:\"any\";i:1;s:14:\"actionDatabase\";i:2;s:10:\"actionFile\";i:3;s:11:\"actionCache\";i:254;s:14:\"actionSettings\";i:255;s:11:\"actionLogin\";i:-1;s:12:\"actionErrors\";}}}s:20:\"tx_extensionmanager.\";a:1:{s:9:\"features.\";a:1:{s:20:\"skipDefaultArguments\";s:1:\"0\";}}}s:7:\"plugin.\";a:3:{s:17:\"tx_felogin_login.\";a:2:{s:5:\"view.\";a:3:{s:18:\"templateRootPaths.\";a:1:{i:10;s:0:\"\";}s:17:\"partialRootPaths.\";a:1:{i:10;s:0:\"\";}s:16:\"layoutRootPaths.\";a:1:{i:10;s:0:\"\";}}s:9:\"settings.\";a:21:{s:5:\"pages\";s:1:\"0\";s:9:\"recursive\";s:1:\"0\";s:10:\"dateFormat\";s:9:\"Y-m-d H:i\";s:18:\"showForgotPassword\";s:1:\"0\";s:22:\"showForgotPasswordLink\";s:1:\"0\";s:14:\"showPermaLogin\";s:1:\"0\";s:24:\"showLogoutFormAfterLogin\";s:1:\"0\";s:10:\"email_from\";s:0:\"\";s:14:\"email_fromName\";s:0:\"\";s:6:\"email.\";a:4:{s:12:\"templateName\";s:16:\"PasswordRecovery\";s:16:\"layoutRootPaths.\";a:1:{i:20;s:0:\"\";}s:18:\"templateRootPaths.\";a:1:{i:20;s:46:\"EXT:felogin/Resources/Private/Email/Templates/\";}s:17:\"partialRootPaths.\";a:1:{i:20;s:0:\"\";}}s:12:\"redirectMode\";s:0:\"\";s:19:\"redirectFirstMethod\";s:1:\"0\";s:17:\"redirectPageLogin\";s:1:\"0\";s:22:\"redirectPageLoginError\";s:1:\"0\";s:18:\"redirectPageLogout\";s:1:\"0\";s:15:\"redirectDisable\";s:1:\"0\";s:43:\"exposeNonexistentUserInForgotPasswordDialog\";s:1:\"0\";s:23:\"forgotLinkHashValidTime\";s:2:\"12\";s:7:\"domains\";s:0:\"\";s:19:\"passwordValidators.\";a:2:{i:10;s:56:\"TYPO3\\CMS\\Extbase\\Validation\\Validator\\NotEmptyValidator\";s:3:\"20.\";a:2:{s:9:\"className\";s:60:\"TYPO3\\CMS\\Extbase\\Validation\\Validator\\StringLengthValidator\";s:8:\"options.\";a:1:{s:7:\"minimum\";s:1:\"6\";}}}s:20:\"newPasswordMinLength\";s:1:\"6\";}}s:8:\"tx_form.\";a:1:{s:9:\"settings.\";a:1:{s:19:\"yamlConfigurations.\";a:1:{i:110;s:51:\"EXT:bootstrap_package/Configuration/Form/Setup.yaml\";}}}s:12:\"tx_frontend.\";a:1:{s:18:\"_CSS_DEFAULT_STYLE\";s:3359:\"    .ce-align-left { text-align: left; }\n    .ce-align-center { text-align: center; }\n    .ce-align-right { text-align: right; }\n\n    .ce-table td, .ce-table th { vertical-align: top; }\n\n    .ce-textpic, .ce-image, .ce-nowrap .ce-bodytext, .ce-gallery, .ce-row, .ce-uploads li, .ce-uploads div { overflow: hidden; }\n\n    .ce-left .ce-gallery, .ce-column { float: left; }\n    .ce-center .ce-outer { position: relative; float: right; right: 50%; }\n    .ce-center .ce-inner { position: relative; float: right; right: -50%; }\n    .ce-right .ce-gallery { float: right; }\n\n    .ce-gallery figure { display: table; margin: 0; }\n    .ce-gallery figcaption { display: table-caption; caption-side: bottom; }\n    .ce-gallery img { display: block; }\n    .ce-gallery iframe { border-width: 0; }\n    .ce-border img,\n    .ce-border iframe {\n        border: 2px solid #000000;\n        padding: 0px;\n    }\n\n    .ce-intext.ce-right .ce-gallery, .ce-intext.ce-left .ce-gallery, .ce-above .ce-gallery {\n        margin-bottom: 10px;\n    }\n    .ce-image .ce-gallery { margin-bottom: 0; }\n    .ce-intext.ce-right .ce-gallery { margin-left: 10px; }\n    .ce-intext.ce-left .ce-gallery { margin-right: 10px; }\n    .ce-below .ce-gallery { margin-top: 10px; }\n\n    .ce-column { margin-right: 10px; }\n    .ce-column:last-child { margin-right: 0; }\n\n    .ce-row { margin-bottom: 10px; }\n    .ce-row:last-child { margin-bottom: 0; }\n\n    .ce-above .ce-bodytext { clear: both; }\n\n    .ce-intext.ce-left ol, .ce-intext.ce-left ul { padding-left: 40px; overflow: auto; }\n\n    /* Headline */\n    .ce-headline-left { text-align: left; }\n    .ce-headline-center { text-align: center; }\n    .ce-headline-right { text-align: right; }\n\n    /* Uploads */\n    .ce-uploads { margin: 0; padding: 0; }\n    .ce-uploads li { list-style: none outside none; margin: 1em 0; }\n    .ce-uploads img { float: left; padding-right: 1em; vertical-align: top; }\n    .ce-uploads span { display: block; }\n\n    /* Table */\n    .ce-table { width: 100%; max-width: 100%; }\n    .ce-table th, .ce-table td { padding: 0.5em 0.75em; vertical-align: top; }\n    .ce-table thead th { border-bottom: 2px solid #dadada; }\n    .ce-table th, .ce-table td { border-top: 1px solid #dadada; }\n    .ce-table-striped tbody tr:nth-of-type(odd) { background-color: rgba(0,0,0,.05); }\n    .ce-table-bordered th, .ce-table-bordered td { border: 1px solid #dadada; }\n\n    /* Space */\n    .frame-space-before-extra-small { margin-top: 1em; }\n    .frame-space-before-small { margin-top: 2em; }\n    .frame-space-before-medium { margin-top: 3em; }\n    .frame-space-before-large { margin-top: 4em; }\n    .frame-space-before-extra-large { margin-top: 5em; }\n    .frame-space-after-extra-small { margin-bottom: 1em; }\n    .frame-space-after-small { margin-bottom: 2em; }\n    .frame-space-after-medium { margin-bottom: 3em; }\n    .frame-space-after-large { margin-bottom: 4em; }\n    .frame-space-after-extra-large { margin-bottom: 5em; }\n\n    /* Frame */\n    .frame-ruler-before:before { content: \'\'; display: block; border-top: 1px solid rgba(0,0,0,0.25); margin-bottom: 2em; }\n    .frame-ruler-after:after { content: \'\'; display: block; border-bottom: 1px solid rgba(0,0,0,0.25); margin-top: 2em; }\n    .frame-indent { margin-left: 15%; margin-right: 15%; }\n    .frame-indent-left { margin-left: 33%; }\n    .frame-indent-right { margin-right: 33%; }\";}}s:4:\"lib.\";a:4:{s:14:\"contentElement\";s:13:\"FLUIDTEMPLATE\";s:15:\"contentElement.\";a:5:{s:12:\"templateName\";s:7:\"Default\";s:18:\"templateRootPaths.\";a:2:{i:0;s:53:\"EXT:fluid_styled_content/Resources/Private/Templates/\";i:10;s:0:\"\";}s:17:\"partialRootPaths.\";a:2:{i:0;s:52:\"EXT:fluid_styled_content/Resources/Private/Partials/\";i:10;s:0:\"\";}s:16:\"layoutRootPaths.\";a:2:{i:0;s:51:\"EXT:fluid_styled_content/Resources/Private/Layouts/\";i:10;s:0:\"\";}s:9:\"settings.\";a:2:{s:17:\"defaultHeaderType\";s:1:\"2\";s:6:\"media.\";a:4:{s:11:\"lazyLoading\";s:4:\"lazy\";s:13:\"imageDecoding\";s:0:\"\";s:6:\"popup.\";a:9:{s:7:\"bodyTag\";s:41:\"<body style=\"margin:0; background:#fff;\">\";s:4:\"wrap\";s:37:\"<a href=\"javascript:close();\"> | </a>\";s:5:\"width\";s:4:\"800m\";s:6:\"height\";s:4:\"600m\";s:5:\"crop.\";a:1:{s:4:\"data\";s:17:\"file:current:crop\";}s:8:\"JSwindow\";s:1:\"1\";s:9:\"JSwindow.\";a:2:{s:9:\"newWindow\";s:1:\"0\";s:3:\"if.\";a:1:{s:7:\"isFalse\";s:1:\"0\";}}s:15:\"directImageLink\";s:1:\"0\";s:11:\"linkParams.\";a:1:{s:11:\"ATagParams.\";a:1:{s:8:\"dataWrap\";s:44:\"class=\"lightbox\" rel=\"lightbox[{field:uid}]\"\";}}}s:17:\"additionalConfig.\";a:2:{s:9:\"no-cookie\";s:1:\"1\";s:3:\"api\";s:1:\"0\";}}}}s:10:\"parseFunc.\";a:9:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:2:{s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:5:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}s:10:\"extTarget.\";a:2:{s:8:\"ifEmpty.\";a:1:{s:8:\"override\";s:6:\"_blank\";}s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:31:\"<span class=\"ce-sword\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}}s:12:\"htmlSanitize\";s:1:\"1\";}s:14:\"parseFunc_RTE.\";a:11:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:2:{s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:5:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}s:10:\"extTarget.\";a:2:{s:8:\"ifEmpty.\";a:1:{s:8:\"override\";s:6:\"_blank\";}s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:31:\"<span class=\"ce-sword\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:3:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}s:12:\"encapsLines.\";a:4:{s:13:\"encapsTagList\";s:29:\"p,pre,h1,h2,h3,h4,h5,h6,hr,dt\";s:9:\"remapTag.\";a:1:{s:3:\"DIV\";s:1:\"P\";}s:13:\"nonWrappedTag\";s:1:\"P\";s:17:\"innerStdWrap_all.\";a:1:{s:7:\"ifBlank\";s:6:\"&nbsp;\";}}}s:12:\"htmlSanitize\";s:1:\"1\";s:14:\"externalBlocks\";s:97:\"article, aside, blockquote, div, dd, dl, footer, header, nav, ol, section, table, ul, pre, figure\";s:15:\"externalBlocks.\";a:15:{s:3:\"ol.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:9:\"parseFunc\";s:15:\"< lib.parseFunc\";}}s:3:\"ul.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:1:{s:9:\"parseFunc\";s:15:\"< lib.parseFunc\";}}s:4:\"pre.\";a:1:{s:8:\"stdWrap.\";a:1:{s:10:\"parseFunc.\";a:9:{s:9:\"makelinks\";s:1:\"1\";s:10:\"makelinks.\";a:2:{s:5:\"http.\";a:2:{s:4:\"keep\";s:4:\"path\";s:9:\"extTarget\";s:6:\"_blank\";}s:7:\"mailto.\";a:1:{s:4:\"keep\";s:4:\"path\";}}s:5:\"tags.\";a:2:{s:1:\"a\";s:4:\"TEXT\";s:2:\"a.\";a:2:{s:7:\"current\";s:1:\"1\";s:9:\"typolink.\";a:5:{s:10:\"parameter.\";a:1:{s:4:\"data\";s:15:\"parameters:href\";}s:6:\"title.\";a:1:{s:4:\"data\";s:16:\"parameters:title\";}s:11:\"ATagParams.\";a:1:{s:4:\"data\";s:20:\"parameters:allParams\";}s:7:\"target.\";a:1:{s:8:\"ifEmpty.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}s:10:\"extTarget.\";a:2:{s:8:\"ifEmpty.\";a:1:{s:8:\"override\";s:6:\"_blank\";}s:9:\"override.\";a:1:{s:4:\"data\";s:17:\"parameters:target\";}}}}}s:9:\"allowTags\";s:392:\"a, abbr, acronym, address, article, aside, b, bdo, big, blockquote, br, caption, center, cite, code, col, colgroup, dd, del, dfn, dl, div, dt, em, font, footer, header, h1, h2, h3, h4, h5, h6, hr, i, img, ins, kbd, label, li, link, meta, nav, ol, p, pre, q, s, samp, sdfield, section, small, span, strike, strong, style, sub, sup, table, thead, tbody, tfoot, td, th, tr, title, tt, u, ul, var\";s:8:\"denyTags\";s:1:\"*\";s:5:\"sword\";s:31:\"<span class=\"ce-sword\">|</span>\";s:9:\"constants\";s:1:\"1\";s:18:\"nonTypoTagStdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:18:\"keepNonMatchedTags\";s:1:\"1\";s:16:\"htmlSpecialChars\";s:1:\"2\";}}s:12:\"htmlSanitize\";s:1:\"1\";}}}s:6:\"table.\";a:4:{s:7:\"stripNL\";s:1:\"1\";s:8:\"stdWrap.\";a:2:{s:10:\"HTMLparser\";s:1:\"1\";s:11:\"HTMLparser.\";a:2:{s:5:\"tags.\";a:1:{s:6:\"table.\";a:1:{s:10:\"fixAttrib.\";a:1:{s:6:\"class.\";a:3:{s:7:\"default\";s:12:\"contenttable\";s:6:\"always\";s:1:\"1\";s:4:\"list\";s:12:\"contenttable\";}}}}s:18:\"keepNonMatchedTags\";s:1:\"1\";}}s:14:\"HTMLtableCells\";s:1:\"1\";s:15:\"HTMLtableCells.\";a:2:{s:8:\"default.\";a:1:{s:8:\"stdWrap.\";a:2:{s:9:\"parseFunc\";s:19:\"< lib.parseFunc_RTE\";s:10:\"parseFunc.\";a:1:{s:18:\"nonTypoTagStdWrap.\";a:1:{s:12:\"encapsLines.\";a:2:{s:13:\"nonWrappedTag\";s:0:\"\";s:17:\"innerStdWrap_all.\";a:1:{s:7:\"ifBlank\";s:0:\"\";}}}}}}s:25:\"addChr10BetweenParagraphs\";s:1:\"1\";}}s:4:\"div.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:8:\"article.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:6:\"aside.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"figure.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:11:\"blockquote.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"footer.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:7:\"header.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:4:\"nav.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:8:\"section.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:3:\"dl.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}s:3:\"dd.\";a:2:{s:7:\"stripNL\";s:1:\"1\";s:13:\"callRecursive\";s:1:\"1\";}}}}s:4:\"page\";s:4:\"PAGE\";s:5:\"page.\";a:3:{s:7:\"config.\";a:1:{s:20:\"disableAllHeaderCode\";s:1:\"1\";}i:1;s:13:\"FLUIDTEMPLATE\";s:2:\"1.\";a:2:{s:6:\"format\";s:4:\"html\";s:4:\"file\";s:19:\"fileadmin/index.php\";}}s:6:\"types.\";a:1:{i:0;s:4:\"page\";}}}'),(10,'cd1b4cb48aa6e37433799349f15fc9a1',2145909600,'a:0:{}');
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
INSERT INTO `cache_hash_tags` VALUES (1,'e3f9c41857fd5eff3a62366ab4da35fa','UserTSconfig'),(2,'63dcf90b7e77769466156d54ac37f082','ident_TS_TEMPLATE'),(3,'4867453d9a488d3c0c9c49a82dda5980','ident_TMPL_CONDITIONS_ALL'),(4,'aaa8a79a469ccd50e0868d8ca3eecec9','ident_MENUDATA'),(5,'ae3fde944faa18556f4f3b05d695cede','ident_MENUDATA'),(6,'3cceec512bf1bae19222ec156531d175','ident_MENUDATA'),(7,'9be957d92e17b26206295cd2c8ab8ae0','pageTSconfig'),(8,'79465ab812423e88acd1bb7c98ecd606','pageTSconfig'),(9,'d7bee72ccdc1e3dc622c2d800715eaba','ident_TS_TEMPLATE'),(10,'cd1b4cb48aa6e37433799349f15fc9a1','ident_TMPL_CONDITIONS_ALL');
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
INSERT INTO `cache_pages` VALUES (4,'1_c1d53ad11f050efe0840558778529068',1674757863,'xúÂZko€÷˛ﬁ_¡r¿“¢ïd…ÒM±ΩπN“¶kú v7l(†âGkädI ónl`_ÿÄ”|YuqÏ4N%YrÏ$´õ≈ﬁó˝!¸{ﬁC]([íÌµ:ÃÄLÚú˜~ﬁ˜9á<á≈\'‚∞„—°∏¨*\\w‘¥ -˘Üæó£âTTfJ4ö\Z‚i>4~}hdd|ll|$614:NîcqŸdûP˘Ü\Zè˙-)Cw é˙\'Üá&‚Ú‰€äërVM.eùú6˝÷$]$çÈô)9m…”oI¯õÃr¶¯∑‚1«&•≤Ã≤π3%Áùth\\tø\nµËo!´⁄“2O⁄™√%‹ö∆2∑∏\"%W•Öﬂﬁø7,Ö$U∑M’Rıådr√‘∏‰í\r¸ÌnIÇ\"òî∂8óìÎím‰≠óf}◊§ªLá€9∫Ωm±_6¨E»Wïi⁄™î≤8s|Âøb∂…-i~ë1+k|.1]ë45≈u˝y]AﬂásüF>ºˇI∏∑)√\\µ‘L÷ë¢„°ÿPtB2“gÂÜ•[+∞ÃV\rÜ[<¿b\'ÀUK≤8XRé∫üñunŸ›\ZÔËi√ 1\"Ñï4åñöÃ˚\r∆Œ1Ìx$ÇÅ4Ü√Üïâ¥ŸC°¿»8™£ÒÈèÁ•Àôå¯OgÜUG»¶‰áÃ1,Yj¶ÃîÏª={w^Óõ\nü.‹>ó\n“]\"È2#†®9j°Oêqyå[@◊œ)ÚyfÚN∂À≤çØHŒ<xpÁÊΩ><å§·ÿ$C“õ™›nÄ!£I÷è£ò„°î°uŸı≥4„#£AM’1⁄⁄îl;´\Z∑≥ú;≤îµxzJnçb\Z¸v8cç3Sµ√)#IŸˆ/“,ßj´S7Ôæ7œ-5˝ﬁ_q˛x5ﬁ<”Ìü+™mjlu ^f¶<-]NiÑYN»vê[©H:ØiÑa(\Zmß,’t$€Ju”˛Eû[´·ú™á?√dƒ\'ºgé]ùßm]æÀz)z}E~RÿuMMs¿–™n@UVj\\gÖYãx∞&t¸Y÷»ÒÓÑætÄid≈ˇ[Ê6‰à‡u¬=È@Ìd“PVJuIR¿≤∫¬ï¿tujSpO¬•ëCõv‰i¿ÄÙ!*£xΩ¿+H%\"ü¥œÌ\01¿‰|SNAãË|´ËaÕ@ä∏À”·ˇdÑ]Då®GÖÉˆ%à©bY\nvÕ˙7ó`/O/–•\'yèHtEÉØ®PUJiÃ∂ßdFHiLl,‰®9.r\\Ìœ!»9FŒ‹Û™{È2≥ÜŒCˆyÃL≤$“#≈¨å™áƒ`≈•sÂÜoçÙû4ïb√◊•ë—1i|‚r*∏æƒ5L’!öÆËh∂êıX˘tî&-Æ~ô˝e Iáì_fØãf¬ÕfëÊ4È∑G∞=g.´é√-Qı_rûZd	Yr`\nMhI¨ÑÂÈﬂâv\ZÊA\nuÓ–b√Ó˙AZg∞ZPïOÚsz˝¬Íô\">0Izg·Y≈ÀÀÀaÇ+Æ–ƒb‰L¶ØF¢±âÒÒQÃVó7¢%ÁÚV\0˜5«à3Úxˇ“¥«–©ôå§¨;ãiºÉ˙ï«†<M;òXõ…óÚ±	=]†x}ÏäÙ√W§ø~z#uÍ6vb93$g€S[säÔ5ª5G¬¶e≤°˜\Zøl‘ü≠TP÷=∑e£ΩËcÇÔvìÁ7\\K—‰é∑ºTH≥%6ÔØFC)„K{ü÷ÏRFºGÿ~÷ÒDèÍ◊î0¥≈˙‡~”Î∂∂]Œ˘0òVÉ,~ÚÙ|÷Xñ¸y≠ﬂÑ€\'ˇ˚F0ÿ´¥Ä•”wÓXx›˘5≥TÒbK±n\'[Ÿp-à2MIa¿bDâDØèçç];ã-}çT”ÙÓZ∂òivY”3ûF⁄HÂmüßÁ“ß+Àö≤E‚™xœ		€z/ôz4ù]x∂˛ñòÖ•ø¬•)IÊKL{\'Øs;®{«ø¸ﬁ≠Øù∫ﬂ<‹uÎ∑∏ªÂ>Ÿ™π•ù7n„®*⁄\nÎﬂªÖáœ‹˝£∏Ê÷÷›˝ıGË{çÎû˚xÎâ˚◊√C∑¥vËñq_l”|ÂV~„6÷*Ë´˚ø›=∑tÿ∫VA[ˇ+Ωqk;\r∑àkG◊YÓ”ı›¶-U–øv∑∑™Ó6Ï+n5‹ÁÎ\'n˝Ëï[ﬂ}Ó÷éˆ‹¬\ZıΩ˝»ŸáåÄ≠w‹⁄˙Kw6}ΩN:kny˜‘-ÆëÃ=\\èaÁû[Åå √nÂ∞ö=Ù!&–[⁄Ÿo^·√÷ﬂ‹2û°x¯⁄}ˇm∫∫ªΩˆ=¸;ÇŒ™[ÿ=4€àAmÖ›ö[ÄÕË¨ØU∂8^íR¸ùH>édﬁøvÌ›wﬂïoúÕ&Ÿë+Ô–∏æﬂ/qﬁΩq&gŒΩöúE?÷ªˆ~.Ã·øˇ^ﬂﬁÍóÃ?h’re(àçéEá¢P l˚/@A%Tﬂ©∏k∏Ø¢dÍÓSîjÖRÈ]§ﬂ˙1JÖ[›z)Ó[u∑∂uä‘>jó‰6Jª%´∂Éæ@yìÏ QeπãíÌ@ƒˆ÷w(Ω}˜)JÆ±V•V€yéC˘ÏºpãG\\!pUdî÷>\0	G_˚}ªÄ/î∂œ›g;Ù´ªuÿRx¯5 JÔ◊Mîˆ+»9◊\n‡•πœ‡CmkOñ◊\Z(„:¯O‰t ª’ôG$q9¢Ú)Ï)ÏºPX⁄•ß¯©Ø?~>r´\"n$˛÷âw˜)‚ÛÚ«Ö?q˛è°`Œ¯Áæˆo`¡h,ˆì≈ÿˆü«Ø⁄xÓ’ÎØrr‡5N´^uÛïW€<Òókﬁ„“KoªtËmü4º\"û∑Oø˜äçó^Ât◊€ﬂ‹Û\nõÕëW¨z•çW^œÖRµ-≥V:ıvNp≠WΩB˝5hﬁ†\r≤Jˇ˜êU˜™Â]Øﬁ¯\n◊oº∆—◊@∑Áï ¯ùÏ{O!£±˝•}¥ì,Ëj”˘Ì‘_ÿ8Ü‹&\rÒüê]uØTß⁄ dˇ3ØVÆ√˛G^cÛµ„q˘+¯ÚùπxÚ~|Áˇ`ﬂˆF˜Aæ3v÷[v6 „~5Ô€Èﬂ˜JdÓã\'$Î≤Ω¬)…£∂óh{∫7?6P‚¸c¡Z˛ﬂYååM¸d°\0∂˝7††~ÍÌ„˜∏Ai|Ä‘DI’_ ÖèQ˙œº˝S‹#Öóè˝ˆ∆_pÄí8ˆ˛∫˘o•\\=›Ûv7wQ^ª†?Fˇ7(ücîœS¥U\0/ºrâJÏò“ø		oº\'%»iÚÃTÀ(èÕ¢(·˙∆)ÏLÅ∂±—,üMîSΩu}Ì}[™8(oP©∑Ïå¡&eß(ooüT!gÌsÉ¸€Ù*–U#8¬µJ–U†2=%¢‘∑q-#z\0/\r»!X$›EË#]Ö”G\"F≈ìW\nÈÁ√Ê°◊ÄÏ\'Â‰ﬂ˛ÏÎ*U‡w›á©ç˘\r¡OúˇQ(ËiBSΩÙEﬁp∏\'{îﬁ=KÕ®:”Z[a˛æg⁄2rΩ?HÅ†Û˝1—ÑÄ@oÔoQ?VÄ⁄_ˇ–á©˝E¨◊\'ßñÈS˚2ä∏íÂöIc«)g äjg/ÿ˛Öt”–Ø9“mÉ\"Fü≠Z“£:Y°b0–ë®˛Ê\nR⁄\"õÕ[ÜQ[•O\\ã¥MOüe¡+©9SõÌ˛ÊtpWÏ¨¬ﬁ=Ìﬁ9F)ÉÈT›Ã√ÕUì∂\\i»|¥÷Õm√ ëT‹¢ÔÃW—¡â°£D<]§‰.∑mñπ–2	…:¬Ìeg´}∞ˇ√%◊ïD2ﬂo©ı¡ºˇéãˇ}˛÷‹Õã¨m©¥‡¥ä@ÙõE√ÄÆ¡ö≤√”3äBzP√˝	cC“}-,Õfö—u˛æ4<244$=∏57wk~2iE¶≈øÅ∫Ó”ˆ◊`Mgˆº.)∏ôkÉÿ◊Íí\0ÑdFÕâÔ„Wè˝≈xvˆq–Ê=í†«>¸dƒﬂ≥ÜﬂtöàéE£ÌSG®)qÚ(.äW–í!ê∞Tñ\'Ê0˘ã«Ë”®`L´jÒèCM¯göË‡ }ÀXR:*”Êã#ASÜ•à¶(5çÉ£IH™Æ„Yúc˘lˆÓ¸g≥¿”œÓ∑~ˆ@ﬁ?´@æÒ\'0∆QnFG’YπAπÛ‹à≈ì/Ôº`·díIyÛ¡∑*ˇ‰áŒYI TIfs°{òt√ñ‹R™„#9Âd-cô4ÃŒm#Ø+∑VR‹$Læìû”“,”ù¯n⁄WD‹„Úêp.\ZÉ7à§jcòRº„eíπŒí\Zü…;M:©Y\Z®Yç3:≠’î•k£ò71Ç–ëÊ	∫Cg&∫4!LiŒú<Í;†úˆ¢jﬁ‰iñ◊ú+ìß≈ÓpÇf$.´Åö—¥[¬§€*◊˚é˛®ÄéÿD;„Ó%?«ú‹≈GLW4?Ómπ–≠®∂pQ”>‚„2ã•\\–≥ËçKŒX‚M?ûßfäÕ\n÷%XÁ¥$©:-àÊ	nc<gﬁV5ﬁ:}\'≤‹»ôm€‘:t√=K⁄Ÿ}¨äT-å/C∏Âf˜\n’…MˇîµAéà%Ù[Ü·|BK0?H$b*Ç:å!ıè˛ë\Z<Â;©\0áó∏ï0:dûﬂ∏lZ£≠V™}ﬁjF@ƒ·±¶µt$£Yÿ:[J¥ªÑ•Ç:«ïöêÈ\Z[50w5%¢!´*\n◊[\rêïñCg!ZmcîçJ∞eúÚ)ë±åº’Ë®?6∫≤`ÃÁìÑv@àb,˙¡Ù√Aò0ﬂÇö9bçc˚-	UOiyÖ¯ÁöQÌe§‡\"öC’9â@ÃiÏ⁄ç	Ck∑£5ìq\"\'rÕÔ†O≤‘\"MÎ~t¥6Mhyg‰)«)+¶j˘nEG«Æèçåçè˚ëtπúŸÍã^=§∏\rüt§∞]Å}∆ì_ú{‚\nÚo·Ö_–∫X∆d°ê–uGID…Ê&∑s');
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
INSERT INTO `cache_pages_tags` VALUES (4,'1_c1d53ad11f050efe0840558778529068','pageId_1');
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection`
--

DROP TABLE IF EXISTS `cache_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection`
--

LOCK TABLES `cache_pagesection` WRITE;
/*!40000 ALTER TABLE `cache_pagesection` DISABLE KEYS */;
INSERT INTO `cache_pagesection` VALUES (2,'1_0_222419149',1677263463,'xúΩò›nõ0«_e‚Flíí´≠Î‘ImU5©¥;‰ÄìZ56¬&]VÂ›wÅ‚iïi;∏	¯p|¸„é?âÇËY¡èG8˜ñ$öDœG-\"ØêR_1AçEœ,ö¿\r∆\'Ôú•ﬁ“ÿ™VY∑¥Œ\"O{ZƒÚ≈M\Z„ìÍXQcUöh⁄òg`eöC[E”»ªîYuqŸ«Ì#È’ﬁMÈò¬»„‰ K›D√KS*\ZƒÇ!≠Y÷;è<*“Æ4ÿ“xW»27aÅvR]!˝•¡y-WÂ&\';™:AR˘®9m‰Ä ÎU\"≈ñÌºÂçÈ>Z’ñòâÑó©ÈsÑ©X1Mç¯E3Y\nw4G∏cå%oÌAÕÂéâ8ìi˚2Ñ⁄ê‰∞„ZùX¿[ƒúÓ)o≈;+µ\n˘¥*3ì¯`⁄d>®oRçe\"^&>≠π\\%Àıß;O&vfXl√˘4!∆À£È÷∆Å‹Br∑*GÈß)(öjˇºR¶,àfR¯/±˝Féê^¸\\GUﬂ∏Ó˜ÍçAÂ£πt(f¯m+pÉ˜{°Yºá¶ÂDt©ÊUâmàjÎ»∂ú˙L≠7ÅSH|K÷iü¸g]ˇ∂é¿eD@Mﬂ◊ûù‚Ñf%h‚, è~Ú\0À;ÍÁÂÜ≥ƒá9 _ÑÒ∑¥*»◊ı\0¡`B\n≠>õ~™2zM≠’%ÑÁ33Ù‹\ZzÚÒ°’eÓv—MŒ‹„æ©.)œiaûøN3∏8°Œl®yx‘-)˝^äƒ…É&Íëù7ŸÚ¯_Kà‹£d≤u\ná≈˙∆ˆn$<l=˝ÖtI	,Àn™¿¶öL•3Ófö⁄Lãaô~d∞‘π°f£\nu≈î{1@°=˘–∞L´YË§Ï¡55Åk≤·=∏5Åkà‡f≤óss¬ö©:9;¡∏À∫Àô{∑¡hT¨˚úKí∫wl/Ìh6,÷5Âóç“I‹%ÜÌè¿v_v;Y∞ﬂ4==uS⁄K>F•º5ﬂsn∆Ÿ®ì’0ˆG/øÊ#ÿÕfoËXˇ≈F„ÂF≥74Å¨É÷3≠ˆÊÄG®∑;ö¿-?‹Á)Ãé‘âLFóérÉ÷O¬\0ç_}L”å∏ø.<~ı’h=•≥ˆçπ˚W˝Ò±oÓ„Ò(;1ï');
/*!40000 ALTER TABLE `cache_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cache_pagesection_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection_tags`
--

LOCK TABLES `cache_pagesection_tags` WRITE;
/*!40000 ALTER TABLE `cache_pagesection_tags` DISABLE KEYS */;
INSERT INTO `cache_pagesection_tags` VALUES (3,'1_0_222419149','pageId_1'),(4,'1_0_222419149','mpvarHash_222419149');
/*!40000 ALTER TABLE `cache_pagesection_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
INSERT INTO `cache_rootline` VALUES (5,'1__0_0_1',1677263416,'xúMêMr√ ÖÔ¬	¸”¶≠|ÅÆ≤Iˆ1äÀ#èn3ô‹Ω≤]ª¨@è\'È(··†hT<\"‘†gU3≥•JkUJıäÎ	GMˇä≤ÿ‡wÃhπ—»Üq√ØB{©#ºÄ˙§~πäo0ìﬁüƒR≠Í≠3:ÄÚÊNâ7G_ŒZ/i92ª~o˚\nÉÕ…;®+Ín§4Ã∂2m±úbá?,‚3ù“e0∆Ãƒ“çÔnqà…˘‘R∏∫N5«˘ªh8ÆDª–˙dÁˇ«ø@\\‘—1éDú%⁄S\n¨≥ÃÀ*Éö¸ŒÎehOù∫\'ª/SIP”ﬁdlΩ¶£Él°=NË˜ûœ_X[õ/'),(6,'2__0_0_1',1677263416,'xúÕëªn√0EˇE_‡Gü ÿ•SñdãqÖ»¢aQnÉ\"ˇ^:™]ã†õxD^>Æñç¸¥≤ﬁhŸ+»Vä—\Z±Yÿ5ä)j8zñÇ⁄&ÖâUÃÍ*√˜P–:”@ö „{¶ñ«A>JÒÇûtG\"I{=´ıóUE*¿X]†)ú>c§, ‡Õ\Z>÷‚Æë÷Œ‹\rº)…ìGP˝Ñq,‘kVÉ‚‹=Ó‚a‘=ÑB√‡âŒ#‰Û∞∆~◊°?⁄^l∂K9ÁPHDYﬂπhñ˙Ì˜IlP¡LàT;`Ù§∆‚zM∫ï∑◊ôˆ÷´Õ∫K√w:ËÓƒc´tÂyÂ`∑nwYí˚\\˝π˛küÔ§x≈˛Ö…<musóÎª|˘p95Ü'),(7,'1__0_0_0',1677263463,'xúMêMr√ ÖÔ¬	¸”¶≠|ÅÆ≤Iˆ1äÀ#èn3ô‹Ω≤]ª¨@è\'È(··†hT<\"‘†gU3≥•JkUJıäÎ	GMˇä≤ÿ‡wÃhπ—»Üq√ØB{©#ºÄ˙§~πäo0ìﬁüƒR≠Í≠3:ÄÚÊNâ7G_ŒZ/i92ª~o˚\nÉÕ…;®+Ín§4Ã∂2m±úbá?,‚3ù“e0∆Ãƒ“çÔnqà…˘‘R∏∫N5«˘ªh8ÆDª–˙dÁˇ«ø@\\‘—1éDú%⁄S\n¨≥ÃÀ*Éö¸ŒÎehOù∫\'ª/SIP”ﬁdlΩ¶£Él°=NË˜ûœ_X[õ/');
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) NOT NULL DEFAULT '',
  `tag` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
INSERT INTO `cache_rootline_tags` VALUES (7,'1__0_0_1','pageId_1'),(8,'2__0_0_1','pageId_2'),(9,'2__0_0_1','pageId_1'),(10,'1__0_0_0','pageId_1');
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `treelist` mediumtext DEFAULT NULL,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_treelist`
--

LOCK TABLES `cache_treelist` WRITE;
/*!40000 ALTER TABLE `cache_treelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_treelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `tx_extbase_type` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subgroup` tinytext DEFAULT NULL,
  `TSconfig` text DEFAULT NULL,
  `felogin_redirectPid` tinytext DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(190) NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` mediumblob DEFAULT NULL,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
INSERT INTO `fe_sessions` VALUES ('9a73ee1d987db545c7811eaa95bf49f81e43b6e88de67246a6da6c2b0172ca39','[DISABLED]',0,1674670742,'a:1:{s:39:\"tx_form_honeypot_name_contactform-1form\";s:16:\"OzhS20YwGPfqDHkU\";}',0),('ee454a3212d1a355992c65fc817d3c5db66a724c992f52ba80d4fd2c3549cd5b','[DISABLED]',0,1674670771,'a:1:{s:39:\"tx_form_honeypot_name_contactform-1form\";s:12:\"LkKWO0sZ5Pti\";}',0);
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `tx_extbase_type` varchar(255) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usergroup` text DEFAULT NULL,
  `name` varchar(160) NOT NULL DEFAULT '',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `middle_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `uc` blob DEFAULT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `zip` varchar(10) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(40) NOT NULL DEFAULT '',
  `www` varchar(80) NOT NULL DEFAULT '',
  `company` varchar(80) NOT NULL DEFAULT '',
  `image` tinytext DEFAULT NULL,
  `TSconfig` text DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `is_online` int(10) unsigned NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  `felogin_redirectPid` tinytext DEFAULT NULL,
  `felogin_forgotHash` varchar(80) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`),
  KEY `felogin_forgotHash` (`felogin_forgotHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `rowDescription` text DEFAULT NULL,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `perms_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(2048) DEFAULT NULL,
  `doktype` int(10) unsigned NOT NULL DEFAULT 0,
  `TSconfig` text DEFAULT NULL,
  `is_siteroot` smallint(6) NOT NULL DEFAULT 0,
  `php_tree_stop` smallint(6) NOT NULL DEFAULT 0,
  `url` varchar(255) NOT NULL DEFAULT '',
  `shortcut` int(10) unsigned NOT NULL DEFAULT 0,
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT 0,
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `target` varchar(80) NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT 0,
  `keywords` text DEFAULT NULL,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `cache_tags` varchar(255) NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT 0,
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT 0,
  `abstract` text DEFAULT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT 0,
  `author` varchar(255) NOT NULL DEFAULT '',
  `author_email` varchar(255) NOT NULL DEFAULT '',
  `nav_title` varchar(255) NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT 0,
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT 0,
  `l18n_cfg` smallint(6) NOT NULL DEFAULT 0,
  `fe_login_mode` smallint(6) NOT NULL DEFAULT 0,
  `backend_layout` varchar(64) NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) NOT NULL DEFAULT '',
  `tsconfig_includes` text DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `no_index` smallint(6) NOT NULL DEFAULT 0,
  `no_follow` smallint(6) NOT NULL DEFAULT 0,
  `og_title` varchar(255) NOT NULL DEFAULT '',
  `og_description` text DEFAULT NULL,
  `og_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_title` varchar(255) NOT NULL DEFAULT '',
  `twitter_description` text DEFAULT NULL,
  `twitter_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_card` varchar(255) NOT NULL DEFAULT '',
  `canonical_link` varchar(2048) NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT 0.5,
  `sitemap_changefreq` varchar(10) NOT NULL DEFAULT '',
  `nav_icon_set` varchar(255) NOT NULL DEFAULT '',
  `nav_icon_identifier` varchar(255) NOT NULL DEFAULT '',
  `nav_icon` int(10) unsigned DEFAULT 0,
  `thumbnail` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1674668482,1674668482,1,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,0,NULL,0,0,0,0,1,1,31,31,1,'Home','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1674668482,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'','',0.5,'','','',0,0),(2,1,1674671415,1674668725,1,0,0,0,0,'',256,NULL,0,0,0,0,NULL,0,'{\"doktype\":\"\",\"title\":\"\",\"slug\":\"\",\"nav_title\":\"\",\"subtitle\":\"\",\"nav_icon_set\":\"\",\"nav_icon\":\"\",\"seo_title\":\"\",\"description\":\"\",\"no_index\":\"\",\"no_follow\":\"\",\"canonical_link\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"\",\"og_title\":\"\",\"og_description\":\"\",\"og_image\":\"\",\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_image\":\"\",\"twitter_card\":\"\",\"abstract\":\"\",\"keywords\":\"\",\"author\":\"\",\"author_email\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"newUntil\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"thumbnail\":\"\",\"content_from_pid\":\"\",\"target\":\"\",\"cache_timeout\":\"\",\"cache_tags\":\"\",\"is_siteroot\":\"\",\"no_search\":\"\",\"php_tree_stop\":\"\",\"module\":\"\",\"media\":\"\",\"tsconfig_includes\":\"\",\"TSconfig\":\"\",\"l18n_cfg\":\"\",\"hidden\":\"\",\"nav_hide\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"fe_login_mode\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,1,1,31,31,0,'Contact','/debug-contact-form',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1674670738,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `route` varchar(255) NOT NULL DEFAULT '',
  `arguments` text DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sc_group` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext NOT NULL,
  `items` int(11) NOT NULL DEFAULT 0,
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(10) unsigned NOT NULL DEFAULT 0,
  `uid_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `tablenames` varchar(255) NOT NULL DEFAULT '',
  `fieldname` varchar(255) NOT NULL DEFAULT '',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `last_indexed` int(11) NOT NULL DEFAULT 0,
  `missing` smallint(6) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT 0,
  `identifier` text DEFAULT NULL,
  `identifier_hash` varchar(40) NOT NULL DEFAULT '',
  `folder_hash` varchar(40) NOT NULL DEFAULT '',
  `extension` varchar(255) NOT NULL DEFAULT '',
  `mime_type` varchar(255) NOT NULL DEFAULT '',
  `name` tinytext DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `creation_date` int(11) NOT NULL DEFAULT 0,
  `modification_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,0,1674670742,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/BootstrapPackage.svg','53b7aaf32363271515e80e6c7b25293292185218','27aadec2782a38a84423e8476091a41d1dbdbc06','svg','image/svg+xml','BootstrapPackage.svg','a6fb0cc7b50579d6255f16171147695a55b93c27',3843,1674668714,1674668285),(2,0,1674670742,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/BootstrapPackageInverted.svg','5b24af7f7f2c99d8a6188015bc8298396b952ab7','27aadec2782a38a84423e8476091a41d1dbdbc06','svg','image/svg+xml','BootstrapPackageInverted.svg','493f5cd69ede03cf7d436e92481422145674b907',3784,1674668714,1674668285);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `folder` text DEFAULT NULL,
  `recursive` smallint(6) NOT NULL DEFAULT 0,
  `category` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `file` int(11) NOT NULL DEFAULT 0,
  `title` tinytext DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `alternative` text DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES (1,0,1674670742,1674670742,1,0,0,NULL,0,'',0,0,0,0,1,NULL,244,68,NULL,NULL,0),(2,0,1674670742,1674670742,1,0,0,NULL,0,'',0,0,0,0,2,NULL,244,68,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `original` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(512) NOT NULL DEFAULT '',
  `name` tinytext DEFAULT NULL,
  `processing_url` text DEFAULT NULL,
  `configuration` blob DEFAULT NULL,
  `configurationsha1` varchar(40) NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) NOT NULL DEFAULT '',
  `task_type` varchar(200) NOT NULL DEFAULT '',
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
INSERT INTO `sys_file_processedfile` VALUES (1,1674670742,1674670742,0,1,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','a6fb0cc7b50579d6255f16171147695a55b93c27','Image.CropScaleMask','dce9777136',244,68),(2,1674670742,1674670742,0,2,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','493f5cd69ede03cf7d436e92481422145674b907','Image.CropScaleMask','ccc116dcec',244,68);
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(64) NOT NULL DEFAULT '',
  `fieldname` varchar(64) NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `table_local` varchar(64) NOT NULL DEFAULT '',
  `title` tinytext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `alternative` text DEFAULT NULL,
  `link` varchar(1024) NOT NULL DEFAULT '',
  `crop` varchar(4000) NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `driver` tinytext DEFAULT NULL,
  `configuration` text DEFAULT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `is_browsable` smallint(6) NOT NULL DEFAULT 0,
  `is_public` smallint(6) NOT NULL DEFAULT 0,
  `is_writable` smallint(6) NOT NULL DEFAULT 0,
  `is_online` smallint(6) NOT NULL DEFAULT 1,
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT 1,
  `processingfolder` tinytext DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1674668758,1674668758,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT 0,
  `read_only` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `actiontype` smallint(6) NOT NULL DEFAULT 0,
  `usertype` varchar(2) NOT NULL DEFAULT 'BE',
  `userid` int(10) unsigned DEFAULT NULL,
  `originaluserid` int(10) unsigned DEFAULT NULL,
  `recuid` int(11) NOT NULL DEFAULT 0,
  `tablename` varchar(255) NOT NULL DEFAULT '',
  `history_data` mediumtext DEFAULT NULL,
  `workspace` int(11) DEFAULT 0,
  `correlation_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
INSERT INTO `sys_history` VALUES (1,1674668598,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"config\":\"page = PAGE\\npage.10 = TEXT\\npage.10.value (\\n   <div style=\\\"width: 800px; margin: 15% auto;\\\">\\n      <div style=\\\"width: 300px;\\\">\\n        <svg xmlns=\\\"http:\\/\\/www.w3.org\\/2000\\/svg\\\" viewBox=\\\"0 0 150 42\\\"><path d=\\\"M60.2 14.4v27h-3.8v-27h-6.7v-3.3h17.1v3.3h-6.6zm20.2 12.9v14h-3.9v-14l-7.7-16.2h4.1l5.7 12.2 5.7-12.2h3.9l-7.8 16.2zm19.5 2.6h-3.6v11.4h-3.8V11.1s3.7-.3 7.3-.3c6.6 0 8.5 4.1 8.5 9.4 0 6.5-2.3 9.7-8.4 9.7m.4-16c-2.4 0-4.1.3-4.1.3v12.6h4.1c2.4 0 4.1-1.6 4.1-6.3 0-4.4-1-6.6-4.1-6.6m21.5 27.7c-7.1 0-9-5.2-9-15.8 0-10.2 1.9-15.1 9-15.1s9 4.9 9 15.1c.1 10.6-1.8 15.8-9 15.8m0-27.7c-3.9 0-5.2 2.6-5.2 12.1 0 9.3 1.3 12.4 5.2 12.4 3.9 0 5.2-3.1 5.2-12.4 0-9.4-1.3-12.1-5.2-12.1m19.9 27.7c-2.1 0-5.3-.6-5.7-.7v-3.1c1 .2 3.7.7 5.6.7 2.2 0 3.6-1.9 3.6-5.2 0-3.9-.6-6-3.7-6H138V24h3.1c3.5 0 3.7-3.6 3.7-5.3 0-3.4-1.1-4.8-3.2-4.8-1.9 0-4.1.5-5.3.7v-3.2c.5-.1 3-.7 5.2-.7 4.4 0 7 1.9 7 8.3 0 2.9-1 5.5-3.3 6.3 2.6.2 3.8 3.1 3.8 7.3 0 6.6-2.5 9-7.3 9\\\"\\/><path fill=\\\"#FF8700\\\" d=\\\"M31.7 28.8c-.6.2-1.1.2-1.7.2-5.2 0-12.9-18.2-12.9-24.3 0-2.2.5-3 1.3-3.6C12 1.9 4.3 4.2 1.9 7.2 1.3 8 1 9.1 1 10.6c0 9.5 10.1 31 17.3 31 3.3 0 8.8-5.4 13.4-12.8M28.4.5c6.6 0 13.2 1.1 13.2 4.8 0 7.6-4.8 16.7-7.2 16.7-4.4 0-9.9-12.1-9.9-18.2C24.5 1 25.6.5 28.4.5\\\"\\/><\\/svg>\\n      <\\/div>\\n      <h4 style=\\\"font-family: sans-serif;\\\">Welcome to a default website made with <a href=\\\"https:\\/\\/typo3.org\\\">TYPO3<\\/a><\\/h4>\\n   <\\/div>\\n)\\npage.100 = CONTENT\\npage.100 {\\n    table = tt_content\\n    select {\\n        orderBy = sorting\\n        where = {#colPos}=0\\n    }\\n}\\n\",\"description\":\"This is an Empty Site Package TypoScript template.\\n\\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject\\/Configuration\\/TypoScript\\/setup.typoscript\'\"},\"newRecord\":{\"config\":\"# Default PAGE object:\\r\\npage = PAGE\\r\\nconfig.contentObjectExceptionHandler = 0\\r\\npage.config.disableAllHeaderCode = 1\\r\\npage.1 = FLUIDTEMPLATE\\r\\npage.1 {\\r\\n    format = html\\r\\n    file = fileadmin\\/index.php\\r\\n}\",\"description\":\"This is an Empty Site Package TypoScript template.\\r\\n\\r\\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject\\/Configuration\\/TypoScript\\/setup.typoscript\'\"}}',0,'0400$2b2097629b3f7b601f49625275f91b67:35af6288617af54964e77af08c30949a'),(2,1674668622,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"description\":\"This is an Empty Site Package TypoScript template.\\r\\n\\r\\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject\\/Configuration\\/TypoScript\\/setup.typoscript\'\"},\"newRecord\":{\"description\":\"\"}}',0,'0400$1c6775a0c0b6b736c696f6697da3403e:35af6288617af54964e77af08c30949a'),(3,1674668725,1,'BE',1,0,2,'pages','{\"uid\":2,\"pid\":0,\"tstamp\":1674668725,\"crdate\":1674668725,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":31,\"perms_everybody\":0,\"title\":\"[Default Title]\",\"slug\":\"\\/\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"nav_icon_set\":\"\",\"nav_icon_identifier\":\"\",\"nav_icon\":0,\"thumbnail\":0}',0,'0400$7378cd1272bd1a813bb6003d162ab4f7:f11830df10b4b0bca2db34810c2241b3'),(4,1674668725,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"l10n_diffsource\":\"\"},\"newRecord\":{\"l10n_diffsource\":\"{\\\"slug\\\":\\\"\\\"}\"}}',0,'0400$57c8133b97249bc01d393f8d54c6f808:f11830df10b4b0bca2db34810c2241b3'),(5,1674668738,3,'BE',1,0,2,'pages','{\"oldPageId\":0,\"newPageId\":1,\"oldData\":{\"header\":\"[Default Title]\",\"pid\":0,\"event_pid\":2,\"t3ver_state\":0},\"newData\":{\"tstamp\":1674668738,\"pid\":1,\"sorting\":256}}',0,'0400$19d94823c7b414d18b1c9216c3b0ff0b:f11830df10b4b0bca2db34810c2241b3'),(6,1674668747,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"title\":\"[Default Title]\",\"l10n_diffsource\":\"{\\\"slug\\\":\\\"\\\"}\"},\"newRecord\":{\"title\":\"Contact\",\"l10n_diffsource\":\"{\\\"title\\\":\\\"\\\"}\"}}',0,'0400$8de9637d313cadbf9e295389a4e46660:f11830df10b4b0bca2db34810c2241b3'),(7,1674668763,1,'BE',1,0,1,'tt_content','{\"uid\":1,\"rowDescription\":\"\",\"pid\":2,\"tstamp\":1674668763,\"crdate\":1674668763,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"form_formframework\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":1,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">EXT:bootstrap_package\\/Resources\\/Private\\/Forms\\/Contact.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null,\"tx_impexp_origuid\":0,\"teaser\":null,\"aspect_ratio\":\"1.3333333333333\",\"items_per_page\":10,\"readmore_label\":\"\",\"quote_source\":\"\",\"quote_link\":\"\",\"panel_class\":\"default\",\"file_folder\":null,\"icon\":\"\",\"icon_set\":\"\",\"icon_file\":0,\"icon_position\":\"\",\"icon_size\":\"default\",\"icon_type\":\"default\",\"icon_color\":\"#FFFFFF\",\"icon_background\":\"#333333\",\"external_media_source\":\"\",\"external_media_ratio\":\"\",\"tx_bootstrappackage_card_group_item\":0,\"tx_bootstrappackage_carousel_item\":0,\"tx_bootstrappackage_accordion_item\":0,\"tx_bootstrappackage_icon_group_item\":0,\"tx_bootstrappackage_tab_item\":0,\"tx_bootstrappackage_timeline_item\":0,\"frame_layout\":\"default\",\"frame_options\":\"\",\"background_color_class\":\"none\",\"background_image\":0,\"background_image_options\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"behaviour\\\">\\n                    <value index=\\\"vDEF\\\">cover<\\/value>\\n                <\\/field>\\n                <field index=\\\"parallax\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"fade\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"filter\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\"}',0,'0400$7f40e9943fcac2ab0cfb8e92665ae422:7fa2c035f26826fe83eeecaaeddc4d40'),(8,1674668768,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"{\\\"title\\\":\\\"\\\"}\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$19203f719ff1c17061f6bac2402307a8:f11830df10b4b0bca2db34810c2241b3'),(9,1674670434,1,'BE',1,0,2,'sys_template','{\"uid\":2,\"pid\":2,\"tstamp\":1674670434,\"crdate\":1674670434,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"sorting\":256,\"description\":null,\"t3_origuid\":0,\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"title\":\"NEW SITE\",\"root\":1,\"clear\":3,\"include_static_file\":null,\"constants\":null,\"config\":\"\\n# Default PAGE object:\\npage = PAGE\\npage.10 = TEXT\\npage.10.value = HELLO WORLD!\\n\",\"basedOn\":\"\",\"includeStaticAfterBasedOn\":0,\"static_file_mode\":0,\"tx_impexp_origuid\":0}',0,'0400$b8fc344106ea7d33cfb6d07f588a8752:092a6d165d49be6de27c1b2c5d7d6698'),(10,1674670657,2,'BE',1,0,2,'sys_template','{\"oldRecord\":{\"config\":\"\\n# Default PAGE object:\\npage = PAGE\\npage.10 = TEXT\\npage.10.value = HELLO WORLD!\\n\"},\"newRecord\":{\"config\":\"# Default PAGE object:\\r\\npage = PAGE\\r\\n\"}}',0,'0400$dc6b7245be9e208145c3cbefb39598e0:092a6d165d49be6de27c1b2c5d7d6698'),(11,1674670672,2,'BE',1,0,2,'sys_template','{\"oldRecord\":{\"include_static_file\":null},\"newRecord\":{\"include_static_file\":\"EXT:bootstrap_package\\/Configuration\\/TypoScript,EXT:form\\/Configuration\\/TypoScript\\/\"}}',0,'0400$5f1640a706cddc54ca884208fba488d4:092a6d165d49be6de27c1b2c5d7d6698'),(12,1674670738,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"slug\":\"\\/\",\"fe_group\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"},\"newRecord\":{\"slug\":\"\\/debug-contact-form\",\"fe_group\":\"\",\"l10n_diffsource\":\"{\\\"doktype\\\":\\\"\\\",\\\"title\\\":\\\"\\\",\\\"slug\\\":\\\"\\\",\\\"nav_title\\\":\\\"\\\",\\\"subtitle\\\":\\\"\\\",\\\"nav_icon_set\\\":\\\"\\\",\\\"nav_icon\\\":\\\"\\\",\\\"seo_title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"no_index\\\":\\\"\\\",\\\"no_follow\\\":\\\"\\\",\\\"canonical_link\\\":\\\"\\\",\\\"sitemap_changefreq\\\":\\\"\\\",\\\"sitemap_priority\\\":\\\"\\\",\\\"og_title\\\":\\\"\\\",\\\"og_description\\\":\\\"\\\",\\\"og_image\\\":\\\"\\\",\\\"twitter_title\\\":\\\"\\\",\\\"twitter_description\\\":\\\"\\\",\\\"twitter_image\\\":\\\"\\\",\\\"twitter_card\\\":\\\"\\\",\\\"abstract\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"author_email\\\":\\\"\\\",\\\"lastUpdated\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"newUntil\\\":\\\"\\\",\\\"backend_layout\\\":\\\"\\\",\\\"backend_layout_next_level\\\":\\\"\\\",\\\"thumbnail\\\":\\\"\\\",\\\"content_from_pid\\\":\\\"\\\",\\\"target\\\":\\\"\\\",\\\"cache_timeout\\\":\\\"\\\",\\\"cache_tags\\\":\\\"\\\",\\\"is_siteroot\\\":\\\"\\\",\\\"no_search\\\":\\\"\\\",\\\"php_tree_stop\\\":\\\"\\\",\\\"module\\\":\\\"\\\",\\\"media\\\":\\\"\\\",\\\"tsconfig_includes\\\":\\\"\\\",\\\"TSconfig\\\":\\\"\\\",\\\"l18n_cfg\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"nav_hide\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"extendToSubpages\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"fe_login_mode\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$be0734f1b547f1548348ad3172bbf4d8:f11830df10b4b0bca2db34810c2241b3');
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `title` varchar(80) NOT NULL DEFAULT '',
  `flag` varchar(20) NOT NULL DEFAULT '',
  `language_isocode` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_language`
--

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `record_table` varchar(255) NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT 0,
  `record_pid` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
INSERT INTO `sys_lockedrecords` VALUES (14,1,1674671416,'pages',2,0,'sacha',0);
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `action` smallint(5) unsigned NOT NULL DEFAULT 0,
  `recuid` int(10) unsigned NOT NULL DEFAULT 0,
  `tablename` varchar(255) NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT 0,
  `error` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `channel` varchar(20) NOT NULL DEFAULT 'default',
  `details_nr` smallint(6) NOT NULL DEFAULT 0,
  `IP` varchar(39) NOT NULL DEFAULT '',
  `log_data` text DEFAULT NULL,
  `event_pid` int(11) NOT NULL DEFAULT -1,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `NEWid` varchar(30) NOT NULL DEFAULT '',
  `request_id` varchar(13) NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT 0,
  `component` varchar(255) NOT NULL DEFAULT '',
  `level` varchar(10) NOT NULL DEFAULT 'info',
  `message` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `errorcount` (`tstamp`,`error`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,0,1674668484,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'172.18.0.1','a:1:{i:0;s:5:\"sacha\";}',-1,-99,'','',0,'','info',NULL,NULL),(2,0,1674668598,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:25:\"Main TypoScript Rendering\";i:1;s:14:\"sys_template:1\";s:7:\"history\";s:1:\"1\";}',1,0,'','',0,'','info',NULL,NULL),(3,0,1674668622,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:25:\"Main TypoScript Rendering\";i:1;s:14:\"sys_template:1\";s:7:\"history\";s:1:\"2\";}',1,0,'','',0,'','info',NULL,NULL),(4,0,1674668632,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1257246929: Tried resolving a template file for controller action \"Standard->index\" in format \".html\", but none of the paths contained the expected template file (/challenge/public/fileadmin/index.php). No paths configured. | TYPO3Fluid\\Fluid\\View\\Exception\\InvalidTemplateResourceException thrown in file /challenge/vendor/typo3fluid/fluid/src/View/TemplatePaths.php in line 594. Requested URL: http://localhost/',5,'php',0,'172.18.0.1','',-1,0,'','',0,'','info',NULL,NULL),(5,0,1674668725,1,1,2,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.18.0.1','a:4:{i:0;s:15:\"[Default Title]\";i:1;s:7:\"pages:2\";i:2;s:12:\"[root-level]\";i:3;i:0;}',0,0,'NEW_1','',0,'','info',NULL,NULL),(6,0,1674668725,1,1,0,'site',0,0,'Site configuration \'%s\' was automatically created for new root page (%s).',6,'site',0,'172.18.0.1','a:2:{i:0;s:48:\"autogenerated-2-c81e728d9d4c2f636f067f89cc14862c\";i:1;i:2;}',-1,0,'','',0,'','info',NULL,NULL),(7,0,1674668725,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:15:\"[Default Title]\";i:1;s:7:\"pages:2\";s:7:\"history\";s:1:\"4\";}',2,0,'','',0,'','info',NULL,NULL),(8,0,1674668728,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: An exception occurred while executing \'INSERT INTO `sys_log` (`userid`, `type`, `channel`, `level`, `action`, `error`, `details_nr`, `details`, `log_data`, `tablename`, `recuid`, `IP`, `tstamp`, `event_pid`, `NEWid`, `workspace`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\' with params [1, 1, \"content\", \"info\", 4, 1, 14, \"Attempt to move record \'%%s\' (%%s) without having permissions to do so.\", \"a:2:{i:0;s:10:\\\"[No title]\\\";i:1;s:8:\\\"pages:-1\\\";}\", \"pages\", -1, \"172.18.0.1\", 1674668728, 0, \"\", 0]:\n\nOut of range value for column \'recuid\' at row 1 | Doctrine\\DBAL\\Exception\\DriverException thrown in file /challenge/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/AbstractMySQLDriver.php in line 128. Requested URL: http://localhost/typo3/ajax/record/process?token=--AnonymizedToken--',5,'php',0,'172.18.0.1','',-1,0,'','',0,'','info',NULL,NULL),(9,0,1674668738,1,4,2,'pages',0,0,'Moved record \'%s\' (%s) to page \'%s\' (%s)',1,'content',2,'172.18.0.1','a:4:{i:0;s:15:\"[Default Title]\";i:1;s:7:\"pages:2\";i:2;s:4:\"Home\";i:3;i:1;}',0,0,'','',0,'','info',NULL,NULL),(10,0,1674668738,1,4,2,'pages',0,0,'Moved record \'%s\' (%s) from page \'%s\' (%s)',1,'content',3,'172.18.0.1','a:4:{i:0;s:15:\"[Default Title]\";i:1;s:7:\"pages:2\";i:2;s:12:\"[root-level]\";i:3;i:0;}',1,0,'','',0,'','info',NULL,NULL),(11,0,1674668747,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:7:\"Contact\";i:1;s:7:\"pages:2\";s:7:\"history\";s:1:\"6\";}',2,0,'','',0,'','info',NULL,NULL),(12,0,1674668763,1,1,1,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.18.0.1','a:4:{i:0;s:10:\"[No title]\";i:1;s:12:\"tt_content:1\";i:2;s:7:\"Contact\";i:3;i:2;}',2,0,'NEW63d16ad6a2d70804621922','',0,'','info',NULL,NULL),(13,0,1674668768,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:7:\"Contact\";i:1;s:7:\"pages:2\";s:7:\"history\";s:1:\"8\";}',2,0,'','',0,'','info',NULL,NULL),(14,0,1674668796,1,2,0,'site',0,0,'Site configuration \'%s\' was updated.',6,'site',0,'172.18.0.1','a:1:{i:0;s:4:\"main\";}',-1,0,'','',0,'','info',NULL,NULL),(15,0,1674668811,1,4,0,'site',0,0,'Site configuration \'%s\' was deleted.',6,'site',0,'172.18.0.1','a:1:{i:0;s:48:\"autogenerated-2-c81e728d9d4c2f636f067f89cc14862c\";}',-1,0,'','',0,'','info',NULL,NULL),(16,0,1674670434,1,1,2,'sys_template',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.18.0.1','a:4:{i:0;s:8:\"NEW SITE\";i:1;s:14:\"sys_template:2\";i:2;s:7:\"Contact\";i:3;i:2;}',2,0,'NEW','',0,'','info',NULL,NULL),(17,0,1674670657,1,2,2,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:8:\"NEW SITE\";i:1;s:14:\"sys_template:2\";s:7:\"history\";s:2:\"10\";}',2,0,'','',0,'','info',NULL,NULL),(18,0,1674670672,1,2,2,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:8:\"NEW SITE\";i:1;s:14:\"sys_template:2\";s:7:\"history\";s:2:\"11\";}',2,0,'','',0,'','info',NULL,NULL),(19,0,1674670738,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:7:\"Contact\";i:1;s:7:\"pages:2\";s:7:\"history\";s:2:\"12\";}',2,0,'','',0,'','info',NULL,NULL),(20,0,1674671415,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.18.0.1','a:3:{i:0;s:7:\"Contact\";i:1;s:7:\"pages:2\";s:7:\"history\";i:0;}',2,0,'','',0,'','info',NULL,NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_note`
--

DROP TABLE IF EXISTS `sys_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_note` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text DEFAULT NULL,
  `personal` smallint(5) unsigned NOT NULL DEFAULT 0,
  `category` smallint(5) unsigned NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_note`
--

LOCK TABLES `sys_note` WRITE;
/*!40000 ALTER TABLE `sys_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) NOT NULL DEFAULT '',
  `tablename` varchar(255) NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT 0,
  `field` varchar(64) NOT NULL DEFAULT '',
  `flexpointer` varchar(255) NOT NULL DEFAULT '',
  `softref_key` varchar(30) NOT NULL DEFAULT '',
  `softref_id` varchar(40) NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `ref_table` varchar(255) NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT 0,
  `ref_string` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
INSERT INTO `sys_refindex` VALUES ('dd5ee787ae64fcf440a3debd76c52c40','tt_content',1,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','8832822f9357de7ad84e0c83d6673115',-1,0,'_STRING',0,'EXT:bootstrap_package/Resources/Private/Forms/Contact.form.yaml');
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) NOT NULL DEFAULT '',
  `entry_key` varchar(128) NOT NULL DEFAULT '',
  `entry_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FeeditExtractionUpdate','i:1;'),(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\TaskcenterExtractionUpdate','i:1;'),(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysActionExtractionUpdate','i:1;'),(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SvgFilesSanitization','i:1;'),(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\ShortcutRecordsMigration','i:1;'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\CollectionsExtractionUpdate','i:1;'),(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserLanguageMigration','i:1;'),(8,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysLogChannel','i:1;'),(9,'installUpdate','TYPO3\\CMS\\FrontendLogin\\Updates\\MigrateFeloginPlugins','i:1;'),(10,'installUpdateRows','rowUpdatersDone','a:4:{i:0;s:69:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceVersionRecordsMigration\";i:1;s:66:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\L18nDiffsourceToJsonMigration\";i:2;s:77:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceMovePlaceholderRemovalMigration\";i:3;s:76:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceNewPlaceholderRemovalMigration\";}'),(11,'core','formProtectionSessionToken:1','s:64:\"4713f81a8484459ef0c0706f07816ab4cfa7602218f689a62bfb6edc7389005e\";');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `root` smallint(5) unsigned NOT NULL DEFAULT 0,
  `clear` smallint(5) unsigned NOT NULL DEFAULT 0,
  `include_static_file` text DEFAULT NULL,
  `constants` text DEFAULT NULL,
  `config` text DEFAULT NULL,
  `basedOn` tinytext DEFAULT NULL,
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT 0,
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,1,1674668622,1674668482,1,0,0,0,0,0,'',0,0,0,0,0,'Main TypoScript Rendering',1,1,'EXT:fluid_styled_content/Configuration/TypoScript/,EXT:fluid_styled_content/Configuration/TypoScript/Styling/','','# Default PAGE object:\r\npage = PAGE\r\nconfig.contentObjectExceptionHandler = 0\r\npage.config.disableAllHeaderCode = 1\r\npage.1 = FLUIDTEMPLATE\r\npage.1 {\r\n    format = html\r\n    file = fileadmin/index.php\r\n}',NULL,0,0,0),(2,2,1674670672,1674670434,1,0,0,0,0,256,NULL,0,0,0,0,0,'NEW SITE',1,3,'EXT:bootstrap_package/Configuration/TypoScript,EXT:form/Configuration/TypoScript/',NULL,'# Default PAGE object:\r\npage = PAGE\r\n','',0,0,0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l18n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l18n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `CType` varchar(255) NOT NULL DEFAULT '',
  `header` varchar(255) NOT NULL DEFAULT '',
  `header_position` varchar(255) NOT NULL DEFAULT '',
  `bodytext` mediumtext DEFAULT NULL,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `assets` int(10) unsigned NOT NULL DEFAULT 0,
  `image` int(10) unsigned NOT NULL DEFAULT 0,
  `imagewidth` int(10) unsigned NOT NULL DEFAULT 0,
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT 0,
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `frame_class` varchar(60) NOT NULL DEFAULT 'default',
  `cols` int(10) unsigned NOT NULL DEFAULT 0,
  `space_before_class` varchar(60) NOT NULL DEFAULT '',
  `space_after_class` varchar(60) NOT NULL DEFAULT '',
  `records` text DEFAULT NULL,
  `pages` text DEFAULT NULL,
  `colPos` int(10) unsigned NOT NULL DEFAULT 0,
  `subheader` varchar(255) NOT NULL DEFAULT '',
  `header_link` varchar(1024) NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `header_layout` varchar(30) NOT NULL DEFAULT '0',
  `list_type` varchar(255) NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT 0,
  `file_collections` text DEFAULT NULL,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT 0,
  `filelink_sorting` varchar(64) NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) NOT NULL DEFAULT '',
  `target` varchar(30) NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `recursive` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageheight` int(10) unsigned NOT NULL DEFAULT 0,
  `pi_flexform` mediumtext DEFAULT NULL,
  `accessibility_title` varchar(30) NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT 0,
  `accessibility_bypass_text` varchar(30) NOT NULL DEFAULT '',
  `category_field` varchar(64) NOT NULL DEFAULT '',
  `table_class` varchar(60) NOT NULL DEFAULT '',
  `table_caption` varchar(255) DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT 0,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `selected_categories` longtext DEFAULT NULL,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `teaser` text DEFAULT NULL,
  `aspect_ratio` varchar(255) NOT NULL DEFAULT '1.3333333333333',
  `items_per_page` int(10) unsigned DEFAULT 10,
  `readmore_label` varchar(255) NOT NULL DEFAULT '',
  `quote_source` varchar(255) NOT NULL DEFAULT '',
  `quote_link` varchar(1024) NOT NULL DEFAULT '',
  `panel_class` varchar(60) NOT NULL DEFAULT 'default',
  `file_folder` text DEFAULT NULL,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `icon_set` varchar(255) NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT 0,
  `icon_position` varchar(255) NOT NULL DEFAULT '',
  `icon_size` varchar(60) NOT NULL DEFAULT 'default',
  `icon_type` varchar(60) NOT NULL DEFAULT 'default',
  `icon_color` varchar(255) NOT NULL DEFAULT '',
  `icon_background` varchar(255) NOT NULL DEFAULT '',
  `external_media_source` varchar(1024) NOT NULL DEFAULT '',
  `external_media_ratio` varchar(10) NOT NULL DEFAULT '',
  `tx_bootstrappackage_card_group_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_carousel_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_accordion_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_icon_group_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_tab_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_timeline_item` int(10) unsigned DEFAULT 0,
  `frame_layout` varchar(255) NOT NULL DEFAULT 'default',
  `frame_options` varchar(255) NOT NULL DEFAULT '',
  `background_color_class` varchar(255) NOT NULL DEFAULT '',
  `background_image` int(10) unsigned DEFAULT 0,
  `background_image_options` mediumtext DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
INSERT INTO `tt_content` VALUES (1,'',2,1674668763,1674668763,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'',0,0,0,0,'form_formframework','','',NULL,0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">EXT:bootstrap_package/Resources/Private/Forms/Contact.form.yaml</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"behaviour\">\n                    <value index=\"vDEF\">cover</value>\n                </field>\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_accordion_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_accordion_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_accordion_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) NOT NULL DEFAULT '',
  `bodytext` text DEFAULT NULL,
  `media` int(10) unsigned DEFAULT 0,
  `mediaorient` varchar(60) NOT NULL DEFAULT 'left',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 1,
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_accordion_item`
--

LOCK TABLES `tx_bootstrappackage_accordion_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_accordion_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_accordion_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_card_group_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_card_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_card_group_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) NOT NULL DEFAULT '',
  `subheader` varchar(255) NOT NULL DEFAULT '',
  `image` int(11) NOT NULL DEFAULT 0,
  `bodytext` text DEFAULT NULL,
  `link` varchar(1024) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `link_icon_set` varchar(255) NOT NULL DEFAULT '',
  `link_icon_identifier` varchar(255) NOT NULL DEFAULT '',
  `link_icon` int(10) unsigned DEFAULT 0,
  `link_class` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_card_group_item`
--

LOCK TABLES `tx_bootstrappackage_card_group_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_card_group_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_card_group_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_carousel_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_carousel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_carousel_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `tt_content` int(10) unsigned DEFAULT 0,
  `item_type` varchar(255) NOT NULL DEFAULT '',
  `layout` varchar(255) NOT NULL DEFAULT '',
  `header` varchar(255) NOT NULL DEFAULT '',
  `header_layout` smallint(5) unsigned NOT NULL DEFAULT 1,
  `header_position` varchar(255) NOT NULL DEFAULT 'center',
  `header_class` varchar(255) NOT NULL DEFAULT '',
  `subheader` varchar(255) NOT NULL DEFAULT '',
  `subheader_layout` smallint(5) unsigned NOT NULL DEFAULT 2,
  `subheader_class` varchar(255) NOT NULL DEFAULT '',
  `nav_title` varchar(255) NOT NULL DEFAULT '',
  `button_text` varchar(255) NOT NULL DEFAULT '',
  `bodytext` text DEFAULT NULL,
  `image` int(10) unsigned DEFAULT 0,
  `link` varchar(1024) NOT NULL DEFAULT '',
  `text_color` varchar(255) NOT NULL DEFAULT '',
  `background_color` varchar(255) NOT NULL DEFAULT '',
  `background_image` int(10) unsigned DEFAULT 0,
  `background_image_options` mediumtext DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_carousel_item`
--

LOCK TABLES `tx_bootstrappackage_carousel_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_carousel_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_icon_group_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_icon_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_icon_group_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) NOT NULL DEFAULT '',
  `subheader` varchar(255) NOT NULL DEFAULT '',
  `bodytext` text DEFAULT NULL,
  `link` varchar(1024) NOT NULL DEFAULT '',
  `icon_set` varchar(255) NOT NULL DEFAULT '',
  `icon_identifier` varchar(255) NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_icon_group_item`
--

LOCK TABLES `tx_bootstrappackage_icon_group_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_icon_group_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_icon_group_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_tab_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_tab_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_tab_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) NOT NULL DEFAULT '',
  `bodytext` text DEFAULT NULL,
  `media` int(10) unsigned DEFAULT 0,
  `mediaorient` varchar(60) NOT NULL DEFAULT 'left',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 1,
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_tab_item`
--

LOCK TABLES `tx_bootstrappackage_tab_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_tab_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_tab_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_timeline_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_timeline_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_timeline_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `tt_content` int(10) unsigned DEFAULT 0,
  `date` datetime DEFAULT NULL,
  `header` varchar(255) NOT NULL DEFAULT '',
  `bodytext` text DEFAULT NULL,
  `icon_set` varchar(255) NOT NULL DEFAULT '',
  `icon_identifier` varchar(255) NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT 0,
  `image` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_timeline_item`
--

LOCK TABLES `tx_bootstrappackage_timeline_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_timeline_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_timeline_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `extension_key` varchar(60) NOT NULL DEFAULT '',
  `repository` int(11) NOT NULL DEFAULT 1,
  `remote` varchar(100) NOT NULL DEFAULT 'ter',
  `version` varchar(15) NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `review_state` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `serialized_dependencies` mediumtext DEFAULT NULL,
  `author_name` varchar(255) NOT NULL DEFAULT '',
  `author_email` varchar(255) NOT NULL DEFAULT '',
  `ownerusername` varchar(50) NOT NULL DEFAULT '',
  `md5hash` varchar(35) NOT NULL DEFAULT '',
  `update_comment` mediumtext DEFAULT NULL,
  `authorcompany` varchar(255) NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) NOT NULL DEFAULT 0,
  `lastreviewedversion` int(11) NOT NULL DEFAULT 0,
  `documentation_link` varchar(2048) DEFAULT NULL,
  `distribution_image` varchar(255) DEFAULT NULL,
  `distribution_welcome_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`remote`),
  KEY `index_extrepo` (`extension_key`,`remote`),
  KEY `index_versionrepo` (`integer_version`,`remote`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_impexp_presets`
--

DROP TABLE IF EXISTS `tx_impexp_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_impexp_presets` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `user_uid` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `public` smallint(6) NOT NULL DEFAULT 0,
  `item_uid` int(11) NOT NULL DEFAULT 0,
  `preset_data` blob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `lookup` (`item_uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_impexp_presets`
--

LOCK TABLES `tx_impexp_presets` WRITE;
/*!40000 ALTER TABLE `tx_impexp_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_impexp_presets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25 18:36:06
