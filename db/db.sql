/*
SQLyog Community v12.2.6 (64 bit)
MySQL - 5.5.30 : Database - connectto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`connectto` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `connectto`;

/*Table structure for table `a_mob_contact` */

DROP TABLE IF EXISTS `a_mob_contact`;

CREATE TABLE `a_mob_contact` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(15) unsigned NOT NULL,
  `login_key` varchar(256) COLLATE utf8_bin NOT NULL,
  `contact` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `home` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `office` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a_mob_contact` (`account_id`),
  CONSTRAINT `FK_a_mob_contact` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `last_url` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `save_password` int(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `default_photo_id` int(2) unsigned DEFAULT NULL,
  `photo_data_id` int(11) unsigned DEFAULT NULL,
  `device_manufacturer` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `device_model` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `imei` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `imsi` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `r_user_agent` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `r_accept` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `screen_width` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `screen_height` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `login_date` datetime NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  `online_status_key` int(1) unsigned NOT NULL,
  `login_key` varchar(256) COLLATE utf8_bin NOT NULL,
  `old_login_key` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `extension_number` varchar(16) COLLATE utf8_bin NOT NULL,
  `extension_uuid` varchar(256) COLLATE utf8_bin NOT NULL,
  `extension_user_uuid` varchar(256) COLLATE utf8_bin NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  `session_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `old_session_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account` (`online_status_key`),
  KEY `FK_account_s` (`status`),
  CONSTRAINT `FK_account` FOREIGN KEY (`online_status_key`) REFERENCES `u_online_status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_account_s` FOREIGN KEY (`status`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27022 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `account_device` */

DROP TABLE IF EXISTS `account_device`;

CREATE TABLE `account_device` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `latitude` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dst_savings` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `screen_width` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `screen_height` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ipV6` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `ipV4` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `imei` varchar(256) COLLATE utf8_bin NOT NULL,
  `imsi` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `wlan0` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `eth0` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `network_type` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `network_operator_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `network_country_iso` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `device_manufacturer` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `device_model` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `status` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3175 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_action_groups` */

DROP TABLE IF EXISTS `adv_action_groups`;

CREATE TABLE `adv_action_groups` (
  `group_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`action_id`),
  KEY `FK_adv_action_groups1` (`action_id`),
  CONSTRAINT `FK_adv_action_groups1` FOREIGN KEY (`action_id`) REFERENCES `adv_actions` (`action_id`),
  CONSTRAINT `FK_adv_action_groups2` FOREIGN KEY (`group_id`) REFERENCES `adv_groups` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_action_types` */

DROP TABLE IF EXISTS `adv_action_types`;

CREATE TABLE `adv_action_types` (
  `action_type_id` smallint(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`action_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_actions` */

DROP TABLE IF EXISTS `adv_actions`;

CREATE TABLE `adv_actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `action_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `action_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL,
  `type_id` smallint(6) NOT NULL,
  `image_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `element_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `cav_name` (`campaign_id`,`action_name`,`value`),
  KEY `FK_adv_actions2` (`type_id`),
  CONSTRAINT `FK_adv_actions1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`),
  CONSTRAINT `FK_adv_actions2` FOREIGN KEY (`type_id`) REFERENCES `adv_action_types` (`action_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_advertizer` */

DROP TABLE IF EXISTS `adv_advertizer`;

CREATE TABLE `adv_advertizer` (
  `advertizer_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `company_dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL,
  `partition_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`advertizer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_advertizing_campaign` */

DROP TABLE IF EXISTS `adv_advertizing_campaign`;

CREATE TABLE `adv_advertizing_campaign` (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `advertizer_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `budget` decimal(9,2) NOT NULL,
  `content_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_dur` varchar(15) COLLATE utf8_bin NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL,
  `advertizer_approved` char(1) COLLATE utf8_bin NOT NULL,
  `admin_approved` char(1) COLLATE utf8_bin NOT NULL,
  `start_dt` datetime NOT NULL,
  `end_dt` datetime NOT NULL,
  `is_tv_advertising` char(1) COLLATE utf8_bin NOT NULL,
  `is_to_user_advertising` char(1) COLLATE utf8_bin NOT NULL,
  `per_use_price` decimal(9,2) DEFAULT NULL,
  `generated_file` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `url_type` smallint(6) NOT NULL,
  PRIMARY KEY (`campaign_id`),
  KEY `FK_adv_advertizing_campaign1` (`advertizer_id`),
  CONSTRAINT `FK_adv_advertizing_campaign1` FOREIGN KEY (`advertizer_id`) REFERENCES `adv_advertizer` (`advertizer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_campaign_auditory` */

DROP TABLE IF EXISTS `adv_campaign_auditory`;

CREATE TABLE `adv_campaign_auditory` (
  `campaign_auditory_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `age` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `marital_status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ethnicity` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `head_of_household` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `male_children_count` int(11) DEFAULT NULL,
  `female_children_count` int(11) DEFAULT NULL,
  `length_of_residence` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dwelling_unit_size` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `owner_rent_status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `home_value` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `education` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `profession` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `estimated_income` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `mortgage_amount` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`campaign_auditory_id`),
  UNIQUE KEY `campaign_id` (`campaign_id`),
  CONSTRAINT `FK_adv_campaign_auditory1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_campaign_channels` */

DROP TABLE IF EXISTS `adv_campaign_channels`;

CREATE TABLE `adv_campaign_channels` (
  `campaign_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`channel_id`),
  KEY `FK_adv_campaign_channels2` (`channel_id`),
  CONSTRAINT `FK_adv_campaign_channels1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_adv_campaign_channels2` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_campaign_geo` */

DROP TABLE IF EXISTS `adv_campaign_geo`;

CREATE TABLE `adv_campaign_geo` (
  `campaign_geoloc_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `location_radius` int(11) NOT NULL,
  PRIMARY KEY (`campaign_geoloc_id`),
  UNIQUE KEY `campaign_id` (`campaign_id`,`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_campaign_schedules` */

DROP TABLE IF EXISTS `adv_campaign_schedules`;

CREATE TABLE `adv_campaign_schedules` (
  `campaign_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`schedule_id`),
  KEY `FK_adv_campaign_schedules2` (`schedule_id`),
  CONSTRAINT `FK_adv_campaign_schedules1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_adv_campaign_schedules2` FOREIGN KEY (`schedule_id`) REFERENCES `adv_schedules` (`schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_campaign_urls` */

DROP TABLE IF EXISTS `adv_campaign_urls`;

CREATE TABLE `adv_campaign_urls` (
  `campaign_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`campaign_url_id`),
  UNIQUE KEY `campaign_id` (`campaign_id`,`url`),
  CONSTRAINT `FK_adv_campaign_urls1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_credit_card_type` */

DROP TABLE IF EXISTS `adv_credit_card_type`;

CREATE TABLE `adv_credit_card_type` (
  `cc_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cc_type` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cc_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_education` */

DROP TABLE IF EXISTS `adv_education`;

CREATE TABLE `adv_education` (
  `education_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `education` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_entertainment_types` */

DROP TABLE IF EXISTS `adv_entertainment_types`;

CREATE TABLE `adv_entertainment_types` (
  `entertainment_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `entertainment_type` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`entertainment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_ethnicity` */

DROP TABLE IF EXISTS `adv_ethnicity`;

CREATE TABLE `adv_ethnicity` (
  `ethnicity_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ethnicity` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_groups` */

DROP TABLE IF EXISTS `adv_groups`;

CREATE TABLE `adv_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL,
  `parent_group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`),
  KEY `FK_adv_groups1` (`campaign_id`),
  KEY `parent_group_id` (`parent_group_id`),
  CONSTRAINT `FK_adv_groups1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_interest_types` */

DROP TABLE IF EXISTS `adv_interest_types`;

CREATE TABLE `adv_interest_types` (
  `interest_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `interest_type` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`interest_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_marital_statuses` */

DROP TABLE IF EXISTS `adv_marital_statuses`;

CREATE TABLE `adv_marital_statuses` (
  `status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_music_types` */

DROP TABLE IF EXISTS `adv_music_types`;

CREATE TABLE `adv_music_types` (
  `music_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `music_type` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`music_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_personal_info` */

DROP TABLE IF EXISTS `adv_personal_info`;

CREATE TABLE `adv_personal_info` (
  `user_id` int(11) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `marital_status` smallint(6) DEFAULT NULL,
  `ethnicity` smallint(6) DEFAULT NULL,
  `credit_card_type` smallint(6) DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `head_of_household` char(1) COLLATE utf8_bin DEFAULT NULL,
  `male_children` smallint(6) DEFAULT NULL,
  `female_children` smallint(6) DEFAULT NULL,
  `length_of_residence` int(11) DEFAULT NULL,
  `dwelling_unit_size` int(11) DEFAULT NULL,
  `owner_rent_status` char(1) COLLATE utf8_bin DEFAULT NULL,
  `home_value` decimal(9,2) DEFAULT NULL,
  `education` smallint(6) DEFAULT NULL,
  `profession` int(11) DEFAULT NULL,
  `estimated_household_income` decimal(9,2) DEFAULT NULL,
  `mortgage_amount` decimal(11,2) DEFAULT NULL,
  `mortgage_amount_date` date DEFAULT NULL,
  `potential_investor` int(11) DEFAULT NULL,
  `credit_score` int(11) DEFAULT NULL,
  `internal_credit_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_adv_personal_info1` (`credit_card_type`),
  CONSTRAINT `FK_adv_personal_info1` FOREIGN KEY (`credit_card_type`) REFERENCES `adv_credit_card_type` (`cc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_professions` */

DROP TABLE IF EXISTS `adv_professions`;

CREATE TABLE `adv_professions` (
  `profession_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `profession` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_schedule_days` */

DROP TABLE IF EXISTS `adv_schedule_days`;

CREATE TABLE `adv_schedule_days` (
  `day_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  PRIMARY KEY (`day_id`),
  KEY `dt_index` (`schedule_date`,`from_time`,`to_time`),
  KEY `FK_adv_schedule_days1` (`campaign_id`),
  CONSTRAINT `FK_adv_schedule_days1` FOREIGN KEY (`campaign_id`) REFERENCES `adv_advertizing_campaign` (`campaign_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_schedule_logic` */

DROP TABLE IF EXISTS `adv_schedule_logic`;

CREATE TABLE `adv_schedule_logic` (
  `schedule_id` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `timetable_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`,`weekday`,`timetable_id`),
  KEY `FK_adv_schedule_logic1` (`timetable_id`),
  CONSTRAINT `FK_adv_schedule_logic1` FOREIGN KEY (`timetable_id`) REFERENCES `adv_timetables` (`timetable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_schedules` */

DROP TABLE IF EXISTS `adv_schedules`;

CREATE TABLE `adv_schedules` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `advertiser_id` int(11) NOT NULL,
  `schedule_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `FK_adv_schedules1` (`advertiser_id`),
  CONSTRAINT `FK_adv_schedules1` FOREIGN KEY (`advertiser_id`) REFERENCES `adv_advertizer` (`advertizer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_styles` */

DROP TABLE IF EXISTS `adv_styles`;

CREATE TABLE `adv_styles` (
  `style_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `css_file` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_timetable_times` */

DROP TABLE IF EXISTS `adv_timetable_times`;

CREATE TABLE `adv_timetable_times` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `timetable_id` int(11) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  PRIMARY KEY (`time_id`),
  KEY `FK_adv_timetable_times1` (`timetable_id`),
  CONSTRAINT `FK_adv_timetable_times1` FOREIGN KEY (`timetable_id`) REFERENCES `adv_timetables` (`timetable_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_timetables` */

DROP TABLE IF EXISTS `adv_timetables`;

CREATE TABLE `adv_timetables` (
  `timetable_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `timetable_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`timetable_id`),
  KEY `FK_adv_timetables1` (`schedule_id`),
  CONSTRAINT `FK_adv_timetables1` FOREIGN KEY (`schedule_id`) REFERENCES `adv_schedules` (`schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_url_types` */

DROP TABLE IF EXISTS `adv_url_types`;

CREATE TABLE `adv_url_types` (
  `url_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `url_type` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`url_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_action_log` */

DROP TABLE IF EXISTS `adv_user_action_log`;

CREATE TABLE `adv_user_action_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_geo_location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `action_time` datetime NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `URL_from` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_channel_activities` */

DROP TABLE IF EXISTS `adv_user_channel_activities`;

CREATE TABLE `adv_user_channel_activities` (
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`channel_id`),
  KEY `FK_adv_user_channel_activities1` (`channel_id`),
  CONSTRAINT `FK_adv_user_channel_activities1` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_entertainment_activities` */

DROP TABLE IF EXISTS `adv_user_entertainment_activities`;

CREATE TABLE `adv_user_entertainment_activities` (
  `user_id` int(11) NOT NULL,
  `entertainment_type_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`entertainment_type_id`),
  KEY `FK_adv_user_entertainment_activities1` (`entertainment_type_id`),
  CONSTRAINT `FK_adv_user_entertainment_activities1` FOREIGN KEY (`entertainment_type_id`) REFERENCES `adv_entertainment_types` (`entertainment_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_interests` */

DROP TABLE IF EXISTS `adv_user_interests`;

CREATE TABLE `adv_user_interests` (
  `user_id` int(11) NOT NULL,
  `interest_type_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`interest_type_id`),
  KEY `FK_adv_user_interests1` (`interest_type_id`),
  CONSTRAINT `FK_adv_user_interests1` FOREIGN KEY (`interest_type_id`) REFERENCES `adv_interest_types` (`interest_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_movie_activities` */

DROP TABLE IF EXISTS `adv_user_movie_activities`;

CREATE TABLE `adv_user_movie_activities` (
  `user_id` int(11) NOT NULL,
  `movie_category_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`movie_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_music_activities` */

DROP TABLE IF EXISTS `adv_user_music_activities`;

CREATE TABLE `adv_user_music_activities` (
  `user_id` int(11) NOT NULL,
  `music_type_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`music_type_id`),
  KEY `FK_adv_user_music_activities1` (`music_type_id`),
  CONSTRAINT `FK_adv_user_music_activities1` FOREIGN KEY (`music_type_id`) REFERENCES `adv_music_types` (`music_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_profitability_activities` */

DROP TABLE IF EXISTS `adv_user_profitability_activities`;

CREATE TABLE `adv_user_profitability_activities` (
  `user_id` int(11) NOT NULL,
  `profitability_type_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`profitability_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_purchase_activities` */

DROP TABLE IF EXISTS `adv_user_purchase_activities`;

CREATE TABLE `adv_user_purchase_activities` (
  `user_id` int(11) NOT NULL,
  `purchase_type_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`purchase_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_user_tvprogram_activities` */

DROP TABLE IF EXISTS `adv_user_tvprogram_activities`;

CREATE TABLE `adv_user_tvprogram_activities` (
  `user_id` int(11) NOT NULL,
  `tv_programs_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tv_programs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `adv_web_login` */

DROP TABLE IF EXISTS `adv_web_login`;

CREATE TABLE `adv_web_login` (
  `advertiser_id` int(11) NOT NULL,
  `session_id` varchar(254) COLLATE utf8_bin NOT NULL,
  `login_dt` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `FK_adv_web_login1` (`advertiser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `c_company` */

DROP TABLE IF EXISTS `c_company`;

CREATE TABLE `c_company` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `address` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` int(1) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_bin NOT NULL,
  `insurance_type` int(11) DEFAULT NULL,
  `phone_code` varchar(8) COLLATE utf8_bin NOT NULL,
  `phone` varchar(32) COLLATE utf8_bin NOT NULL,
  `policy_phone_code` varchar(8) COLLATE utf8_bin NOT NULL,
  `policy_phone` varchar(32) COLLATE utf8_bin NOT NULL,
  `valid_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cdr` */

DROP TABLE IF EXISTS `cdr`;

CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int(11) NOT NULL DEFAULT '0',
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `peeraccount` varchar(20) NOT NULL DEFAULT '',
  `linkedid` varchar(32) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '0',
  `userfield` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_bin,
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `comment_id` int(15) unsigned DEFAULT NULL,
  `user_id` int(15) unsigned NOT NULL,
  `data_id` int(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment` (`data_id`),
  KEY `FK_comment_com` (`comment_id`),
  KEY `FK_comment_u` (`user_id`),
  CONSTRAINT `FK_comment` FOREIGN KEY (`data_id`) REFERENCES `u_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_com` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_actions` */

DROP TABLE IF EXISTS `core_actions`;

CREATE TABLE `core_actions` (
  `action_id` int(6) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `core_actions_log` */

DROP TABLE IF EXISTS `core_actions_log`;

CREATE TABLE `core_actions_log` (
  `log_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) DEFAULT NULL,
  `is_admin` int(6) DEFAULT NULL,
  `partition_id` int(6) DEFAULT NULL,
  `group_id` int(6) DEFAULT NULL,
  `action_id` int(6) DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `prev_value` varchar(255) DEFAULT NULL,
  `next_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=latin1;

/*Table structure for table `core_admin_roles` */

DROP TABLE IF EXISTS `core_admin_roles`;

CREATE TABLE `core_admin_roles` (
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `core_billing_plans` */

DROP TABLE IF EXISTS `core_billing_plans`;

CREATE TABLE `core_billing_plans` (
  `billing_plan_id` int(6) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(100) DEFAULT NULL,
  `join_fee` decimal(9,2) DEFAULT NULL,
  `join_fee_percent` int(6) DEFAULT NULL,
  `interval_fee` decimal(9,2) DEFAULT NULL,
  `interval_fee_percent` int(6) DEFAULT NULL,
  `interval_period` int(11) DEFAULT NULL,
  `per_use_fee` decimal(9,2) DEFAULT NULL,
  `per_use_percent` int(6) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`billing_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `core_channel_click` */

DROP TABLE IF EXISTS `core_channel_click`;

CREATE TABLE `core_channel_click` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `channel_id` int(11) unsigned DEFAULT NULL,
  `click_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9831 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_partition_pbx` */

DROP TABLE IF EXISTS `core_partition_pbx`;

CREATE TABLE `core_partition_pbx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `host` varchar(255) COLLATE utf8_bin NOT NULL,
  `port` int(11) DEFAULT NULL,
  `super_admin` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `api_key` varchar(255) COLLATE utf8_bin NOT NULL,
  `domain_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `domain_uuid` varchar(255) COLLATE utf8_bin NOT NULL,
  `domain_description` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_partition_resources` */

DROP TABLE IF EXISTS `core_partition_resources`;

CREATE TABLE `core_partition_resources` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `partitionId` int(6) DEFAULT NULL,
  `resourceTypeId` int(6) DEFAULT NULL,
  `resourceId` int(6) DEFAULT NULL,
  `billingId` int(6) DEFAULT NULL,
  `visible_to_client` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_partition_type` */

DROP TABLE IF EXISTS `core_partition_type`;

CREATE TABLE `core_partition_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `core_partitions` */

DROP TABLE IF EXISTS `core_partitions`;

CREATE TABLE `core_partitions` (
  `partition_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_name` varchar(255) NOT NULL,
  `partition_url` varchar(255) NOT NULL,
  `partition_dns` varchar(50) DEFAULT NULL,
  `partition_un` varchar(255) NOT NULL,
  `partition_pwd` int(11) DEFAULT NULL,
  `partition_email` varchar(255) NOT NULL,
  `partition_email_psw` varchar(255) NOT NULL,
  `partition_pn` varchar(12) NOT NULL,
  `status` smallint(6) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon_png` varchar(255) DEFAULT NULL,
  `favicon_ico` varchar(255) DEFAULT NULL,
  `partitionServerUrl` varchar(255) DEFAULT NULL,
  `partitionLogoDirectory` varchar(255) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL,
  `wholesale_token` varchar(20) DEFAULT NULL,
  `wholesale_token_ip` varchar(64) DEFAULT NULL,
  `monitoring_token` varchar(20) DEFAULT NULL,
  `monitoring_token_ip` varchar(64) DEFAULT NULL,
  `id_core_partition_type` int(11) DEFAULT NULL,
  `allow_open_sensor` int(11) DEFAULT NULL,
  PRIMARY KEY (`partition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Table structure for table `core_partitions_group` */

DROP TABLE IF EXISTS `core_partitions_group`;

CREATE TABLE `core_partitions_group` (
  `partition_id` int(11) NOT NULL,
  `available_partition_id` int(11) NOT NULL,
  PRIMARY KEY (`partition_id`,`available_partition_id`),
  KEY `FK_core_partitions_group` (`available_partition_id`),
  CONSTRAINT `FK_core_partitions_group` FOREIGN KEY (`available_partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_core_partitions_groupp` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_partitions_info` */

DROP TABLE IF EXISTS `core_partitions_info`;

CREATE TABLE `core_partitions_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `key` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_core_partitions_info` (`partition_id`),
  CONSTRAINT `FK_core_partitions_info` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_resource_type` */

DROP TABLE IF EXISTS `core_resource_type`;

CREATE TABLE `core_resource_type` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `setting_url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `icon_dir` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `core_resources_not_used` */

DROP TABLE IF EXISTS `core_resources_not_used`;

CREATE TABLE `core_resources_not_used` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_type` int(6) DEFAULT NULL,
  `resource_conf_xml` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Table structure for table `core_roles` */

DROP TABLE IF EXISTS `core_roles`;

CREATE TABLE `core_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8_bin NOT NULL,
  `dsc` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_system_admins` */

DROP TABLE IF EXISTS `core_system_admins`;

CREATE TABLE `core_system_admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` bigint(30) NOT NULL,
  `status` smallint(6) NOT NULL,
  `partition_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `token` varchar(64) DEFAULT 'hi1915ffmpegadmin',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Table structure for table `core_tokens` */

DROP TABLE IF EXISTS `core_tokens`;

CREATE TABLE `core_tokens` (
  `id` smallint(6) NOT NULL,
  `monitoring_ip` varchar(64) NOT NULL,
  `monitoring_token` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `core_xml_files_updates` */

DROP TABLE IF EXISTS `core_xml_files_updates`;

CREATE TABLE `core_xml_files_updates` (
  `id` int(11) NOT NULL,
  `russian_files` datetime DEFAULT NULL,
  `usa_files` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_xmltv` */

DROP TABLE IF EXISTS `core_xmltv`;

CREATE TABLE `core_xmltv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xml_type` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `stop_time` datetime NOT NULL,
  `channel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dsc` text COLLATE utf8_bin,
  `category` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orig_language` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `length` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `episode_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `director` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `actor` text COLLATE utf8_bin,
  `writer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `producer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rating` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `star_rating` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_index_start_time` (`start_time`) USING BTREE,
  KEY `id_index_stop_time` (`stop_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5940266 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_xmltv_archive` */

DROP TABLE IF EXISTS `core_xmltv_archive`;

CREATE TABLE `core_xmltv_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xml_type` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `stop_time` datetime NOT NULL,
  `channel` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dsc` text COLLATE utf8_bin,
  `category` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orig_language` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `length` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `episode_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `director` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `actor` text COLLATE utf8_bin,
  `writer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `producer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rating` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `star_rating` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_index_start_time` (`start_time`) USING BTREE,
  KEY `id_index_stop_time` (`stop_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_xmltv_channel` */

DROP TABLE IF EXISTS `core_xmltv_channel`;

CREATE TABLE `core_xmltv_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type` double DEFAULT NULL,
  `channel_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(765) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1286 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `core_xmltv_type` */

DROP TABLE IF EXISTS `core_xmltv_type`;

CREATE TABLE `core_xmltv_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `dvr_error_log` */

DROP TABLE IF EXISTS `dvr_error_log`;

CREATE TABLE `dvr_error_log` (
  `dvr_error_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `dvr_request_id` int(11) NOT NULL,
  `dvr_error_code` int(11) DEFAULT NULL,
  `dvr_error_message` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `error_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dvr_error_log_id`,`dvr_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `dvr_program_requests` */

DROP TABLE IF EXISTS `dvr_program_requests`;

CREATE TABLE `dvr_program_requests` (
  `id_dvr_request` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `from_guide` int(11) DEFAULT NULL,
  `id_program_guide` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `record_on_all_channels` int(11) DEFAULT NULL,
  `request_date_time` datetime DEFAULT NULL,
  `id_dvr_status` int(11) DEFAULT NULL,
  `status_change_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dvr_request`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `dvr_recording` */

DROP TABLE IF EXISTS `dvr_recording`;

CREATE TABLE `dvr_recording` (
  `id_dvr_record` int(11) NOT NULL AUTO_INCREMENT,
  `id_dvr_requests` int(11) DEFAULT NULL,
  `id_dvr_status` int(11) DEFAULT NULL,
  `watching_start_date_time` datetime DEFAULT NULL,
  `watching_end_date_time` datetime DEFAULT NULL,
  `recording_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_dvr_record`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `dvr_recording_frequency` */

DROP TABLE IF EXISTS `dvr_recording_frequency`;

CREATE TABLE `dvr_recording_frequency` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `dvr_requests` */

DROP TABLE IF EXISTS `dvr_requests`;

CREATE TABLE `dvr_requests` (
  `id_dvr_request` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `request_date_time` datetime DEFAULT NULL,
  `id_dvr_status` int(11) DEFAULT NULL,
  `status_change_date_time` datetime DEFAULT NULL,
  `record_channel_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `from_guide` int(11) DEFAULT NULL,
  `id_program_guide` int(11) DEFAULT NULL,
  `record_on_all_channels` int(11) DEFAULT NULL,
  `id_recording_frequency` int(11) DEFAULT NULL,
  `server_recording_start_date` date DEFAULT NULL,
  `server_recording_start_time` time DEFAULT NULL,
  `server_recording_end_date` date DEFAULT NULL,
  `server_recording_end_time` time DEFAULT NULL,
  `difference` int(11) DEFAULT NULL,
  `monday` int(11) DEFAULT NULL,
  `tuesday` int(11) DEFAULT NULL,
  `wednesday` int(11) DEFAULT NULL,
  `thursday` int(11) DEFAULT NULL,
  `friday` int(11) DEFAULT NULL,
  `saturday` int(11) DEFAULT NULL,
  `sunday` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_timezone` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `user_recording_start_date` date DEFAULT NULL,
  `user_recording_start_time` time DEFAULT NULL,
  `user_recording_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dvr_request`)
) ENGINE=InnoDB AUTO_INCREMENT=1598 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `dvr_server_time_zone` */

DROP TABLE IF EXISTS `dvr_server_time_zone`;

CREATE TABLE `dvr_server_time_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_time_zone` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `dvr_status` */

DROP TABLE IF EXISTS `dvr_status`;

CREATE TABLE `dvr_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `g_language_lcp` */

DROP TABLE IF EXISTS `g_language_lcp`;

CREATE TABLE `g_language_lcp` (
  `value` int(2) unsigned NOT NULL,
  `key` varchar(32) COLLATE utf8_bin NOT NULL,
  `title` varchar(32) COLLATE utf8_bin NOT NULL,
  `locale` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `guide_channels` */

DROP TABLE IF EXISTS `guide_channels`;

CREATE TABLE `guide_channels` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `channel_number` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `quality` varchar(10) DEFAULT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `checked` char(1) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `currency_type` char(3) DEFAULT NULL,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4950 DEFAULT CHARSET=utf8;

/*Table structure for table `guide_packages` */

DROP TABLE IF EXISTS `guide_packages`;

CREATE TABLE `guide_packages` (
  `ap_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `checked` char(1) DEFAULT NULL,
  `currency_type` char(3) DEFAULT NULL,
  `channels_count` int(11) DEFAULT NULL,
  `is_vod` char(1) NOT NULL,
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8;

/*Table structure for table `iptv_accepted_channels` */

DROP TABLE IF EXISTS `iptv_accepted_channels`;

CREATE TABLE `iptv_accepted_channels` (
  `partition_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`partition_id`,`channel_id`),
  KEY `FK_iptv_accepted_channels1` (`channel_id`),
  CONSTRAINT `FK_iptv_accepted_channels1` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_accepted_packages` */

DROP TABLE IF EXISTS `iptv_accepted_packages`;

CREATE TABLE `iptv_accepted_packages` (
  `partition_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`partition_id`,`package_id`),
  KEY `FK_iptv_accepted_channels1` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_accepted_vods` */

DROP TABLE IF EXISTS `iptv_accepted_vods`;

CREATE TABLE `iptv_accepted_vods` (
  `partition_id` int(11) NOT NULL,
  `vod_id` int(11) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`partition_id`,`vod_id`),
  KEY `FK_iptv_accepted_vods1` (`vod_id`),
  CONSTRAINT `FK_iptv_accepted_vods1` FOREIGN KEY (`vod_id`) REFERENCES `iptv_vods` (`vod_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_account_channels` */

DROP TABLE IF EXISTS `iptv_account_channels`;

CREATE TABLE `iptv_account_channels` (
  `account_channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `from_dt` datetime NOT NULL,
  `to_dt` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_channel_id`),
  KEY `FK_iptv_account_channels1` (`channel_id`),
  CONSTRAINT `FK_iptv_account_channels1` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_account_packages` */

DROP TABLE IF EXISTS `iptv_account_packages`;

CREATE TABLE `iptv_account_packages` (
  `account_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `from_dt` datetime NOT NULL,
  `to_dt` datetime DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_package_id`),
  KEY `FK_iptv_account_packages1` (`package_id`),
  CONSTRAINT `FK_iptv_account_packages1` FOREIGN KEY (`package_id`) REFERENCES `iptv_packages` (`package_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_account_vods` */

DROP TABLE IF EXISTS `iptv_account_vods`;

CREATE TABLE `iptv_account_vods` (
  `account_vod_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `vod_id` int(11) NOT NULL,
  `from_dt` datetime NOT NULL,
  `to_dt` datetime DEFAULT NULL,
  `price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`account_vod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_allowed_channels` */

DROP TABLE IF EXISTS `iptv_allowed_channels`;

CREATE TABLE `iptv_allowed_channels` (
  `partition_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`partition_id`,`channel_id`),
  KEY `FK_iptv_allowed_channels1` (`channel_id`),
  CONSTRAINT `FK_iptv_allowed_channels1` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_allowed_channels2` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_allowed_packages` */

DROP TABLE IF EXISTS `iptv_allowed_packages`;

CREATE TABLE `iptv_allowed_packages` (
  `partition_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`partition_id`,`package_id`),
  KEY `FK_iptv_allowed_packages1` (`package_id`),
  CONSTRAINT `FK_iptv_allowed_packages1` FOREIGN KEY (`package_id`) REFERENCES `iptv_packages` (`package_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_allowed_packages2` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_allowed_vods` */

DROP TABLE IF EXISTS `iptv_allowed_vods`;

CREATE TABLE `iptv_allowed_vods` (
  `partition_id` int(11) NOT NULL,
  `vod_id` int(11) NOT NULL,
  PRIMARY KEY (`partition_id`,`vod_id`),
  KEY `FK_iptv_allowed_vods1` (`vod_id`),
  CONSTRAINT `FK_iptv_allowed_vods1` FOREIGN KEY (`vod_id`) REFERENCES `iptv_vods` (`vod_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_assets_accepted_vods` */

DROP TABLE IF EXISTS `iptv_assets_accepted_vods`;

CREATE TABLE `iptv_assets_accepted_vods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  KEY `FK_iptv_assets_accepted_vods1` (`id`),
  KEY `FK_iptv_assets_accepted_vods2` (`asset_id`),
  CONSTRAINT `FK_iptv_assets_accepted_vods2` FOREIGN KEY (`asset_id`) REFERENCES `iptv_assets_library` (`asset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_allowed_extensions` */

DROP TABLE IF EXISTS `iptv_assets_allowed_extensions`;

CREATE TABLE `iptv_assets_allowed_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `transcoding_needed` smallint(6) DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `asset_type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_is_watched` */

DROP TABLE IF EXISTS `iptv_assets_is_watched`;

CREATE TABLE `iptv_assets_is_watched` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1317 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_library` */

DROP TABLE IF EXISTS `iptv_assets_library`;

CREATE TABLE `iptv_assets_library` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `file_submit_date` date NOT NULL,
  `file_expiry_date` date DEFAULT NULL,
  `file_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `file_price` double DEFAULT NULL,
  `file_cost` double DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `file_type` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `category_sub1` int(11) DEFAULT NULL,
  `category_sub2` int(11) DEFAULT NULL,
  `search_keyword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_author` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `production_company` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `production_year` int(11) DEFAULT NULL,
  `producer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `director` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_info` text COLLATE utf8_bin,
  `file_intended_audience` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_extension` varchar(20) COLLATE utf8_bin NOT NULL,
  `serial_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `asset_status` int(11) DEFAULT NULL,
  `copyright_owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `epg_only` int(11) DEFAULT NULL,
  `public_private` int(11) DEFAULT NULL,
  `is_media_approved` int(11) DEFAULT NULL,
  `approved_by_admin` int(11) DEFAULT NULL,
  `advertising` int(11) DEFAULT NULL,
  `show_in_vod` int(11) DEFAULT NULL,
  `show_in_live_channel` int(11) DEFAULT NULL,
  `include_in_dynamic_selections` int(11) DEFAULT NULL,
  `priority_in_dynamic_selection` int(11) DEFAULT NULL,
  `asset_trailer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `directory` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `drm_id` int(11) DEFAULT NULL,
  `poster` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assets_library_server_URL` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `actor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `asset_workflow_id` int(11) DEFAULT NULL,
  `proxy` int(11) DEFAULT NULL,
  `proxy_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `partition_id` (`partition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_library_close_capturing` */

DROP TABLE IF EXISTS `iptv_assets_library_close_capturing`;

CREATE TABLE `iptv_assets_library_close_capturing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iptv_asstes_library_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_library_details` */

DROP TABLE IF EXISTS `iptv_assets_library_details`;

CREATE TABLE `iptv_assets_library_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iptv_asstes_library_id` int(11) DEFAULT NULL,
  `duration_ms` int(11) DEFAULT NULL,
  `bitrate` int(50) DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  `extension` char(6) COLLATE utf8_bin DEFAULT NULL,
  `major_brand` char(10) COLLATE utf8_bin DEFAULT NULL,
  `minor_version` char(10) COLLATE utf8_bin DEFAULT NULL,
  `compatible_brands` char(10) COLLATE utf8_bin DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `duration` char(16) COLLATE utf8_bin DEFAULT NULL,
  `file_size_kb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_library_languages` */

DROP TABLE IF EXISTS `iptv_assets_library_languages`;

CREATE TABLE `iptv_assets_library_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iptv_asstes_library_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_resolutions` */

DROP TABLE IF EXISTS `iptv_assets_resolutions`;

CREATE TABLE `iptv_assets_resolutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resolution` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_settings` */

DROP TABLE IF EXISTS `iptv_assets_settings`;

CREATE TABLE `iptv_assets_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) DEFAULT NULL,
  `loading_server_id` int(11) DEFAULT NULL,
  `stream_encoding_id` int(11) DEFAULT NULL,
  `transcoder_server_id` int(11) DEFAULT NULL,
  `asset_server_id` int(11) DEFAULT NULL,
  `min_stream_definitions_id` int(11) DEFAULT NULL,
  `min_bandwidth_allowed` int(11) DEFAULT NULL,
  `max_bandwidth_allowed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_statuses` */

DROP TABLE IF EXISTS `iptv_assets_statuses`;

CREATE TABLE `iptv_assets_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_stream` */

DROP TABLE IF EXISTS `iptv_assets_stream`;

CREATE TABLE `iptv_assets_stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_name` char(20) COLLATE utf8_bin DEFAULT NULL,
  `stream_type` int(11) DEFAULT NULL,
  `stream_encoding` char(10) COLLATE utf8_bin DEFAULT NULL,
  `stream_bitrate` int(11) DEFAULT NULL,
  `stream_fps` double(4,2) DEFAULT NULL,
  `stream_audio_mono_sterio` tinyint(4) DEFAULT NULL,
  `stream_audio_hz` int(11) DEFAULT NULL,
  `stream_resolution` char(14) COLLATE utf8_bin DEFAULT NULL,
  `stream_frame_size` char(14) COLLATE utf8_bin DEFAULT NULL,
  `stream_audio_language` char(6) COLLATE utf8_bin DEFAULT NULL,
  `stream_number` tinyint(4) DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_stream_encoding` */

DROP TABLE IF EXISTS `iptv_assets_stream_encoding`;

CREATE TABLE `iptv_assets_stream_encoding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_stream_type` */

DROP TABLE IF EXISTS `iptv_assets_stream_type`;

CREATE TABLE `iptv_assets_stream_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_type` tinyint(4) NOT NULL DEFAULT '2',
  `stream_description` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_types` */

DROP TABLE IF EXISTS `iptv_assets_types`;

CREATE TABLE `iptv_assets_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `iptv_assets_users_rate` */

DROP TABLE IF EXISTS `iptv_assets_users_rate`;

CREATE TABLE `iptv_assets_users_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `users_count` int(11) DEFAULT NULL,
  `rate_sum` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_workflow` */

DROP TABLE IF EXISTS `iptv_assets_workflow`;

CREATE TABLE `iptv_assets_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iptv_assets_library_id` int(11) DEFAULT NULL,
  `load_start_date_time` datetime DEFAULT NULL,
  `load_end_date_time` datetime DEFAULT NULL,
  `loader_user_id` int(11) DEFAULT NULL,
  `load_file_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `workflow_statuses_id` int(11) DEFAULT NULL,
  `transcoding_start_date_time` datetime DEFAULT NULL,
  `transcoding_end_date_time` datetime DEFAULT NULL,
  `transcoder_id` int(11) DEFAULT NULL,
  `error_description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ready_file_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `loaded_file_size_kb` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ready_file_size_kb` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `partitionID` int(11) DEFAULT NULL,
  `UTF-8-file_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=808 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_assets_workflow_statuses` */

DROP TABLE IF EXISTS `iptv_assets_workflow_statuses`;

CREATE TABLE `iptv_assets_workflow_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_categories` */

DROP TABLE IF EXISTS `iptv_categories`;

CREATE TABLE `iptv_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_channel_categories` */

DROP TABLE IF EXISTS `iptv_channel_categories`;

CREATE TABLE `iptv_channel_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `category_dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_channel_country_timezone` */

DROP TABLE IF EXISTS `iptv_channel_country_timezone`;

CREATE TABLE `iptv_channel_country_timezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `timezone` char(3) COLLATE utf8_bin NOT NULL,
  `daylight_saving` int(1) unsigned NOT NULL,
  `start_month` int(6) unsigned NOT NULL,
  `start_week` int(6) unsigned NOT NULL,
  `start_week_day` int(6) unsigned NOT NULL,
  `start_day` int(6) unsigned NOT NULL,
  `end_month` int(6) unsigned NOT NULL,
  `end_week` int(6) unsigned NOT NULL,
  `end_week_day` int(6) unsigned NOT NULL,
  `end_day` int(6) unsigned NOT NULL,
  `deleted` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_channels` */

DROP TABLE IF EXISTS `iptv_channels`;

CREATE TABLE `iptv_channels` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `channel_number` int(11) NOT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `channel_dsc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_extension` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delays` int(11) NOT NULL,
  `dvr_depth` int(11) NOT NULL,
  `default_language_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `proxy_server_id` int(11) NOT NULL,
  `multicast_server_id` int(11) NOT NULL,
  `multicast_proxy_server_id` int(11) NOT NULL,
  `default_rating_id` int(11) NOT NULL,
  `add_insertion` tinyint(1) NOT NULL,
  `add_insertion_method_id` int(11) NOT NULL,
  `stream_src_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stream_src_encoding_group_id` int(11) NOT NULL DEFAULT '0',
  `multicast_encoding_grp_id` int(11) NOT NULL DEFAULT '0',
  `timezone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_onwer_id` int(11) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `status_id` int(11) NOT NULL,
  `epg_id` int(11) NOT NULL,
  `close_capture_server` int(11) NOT NULL,
  `close_capture_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `max_connections` int(11) NOT NULL,
  `recording` tinyint(1) NOT NULL,
  `close_caption` tinyint(1) NOT NULL,
  `timeshift` tinyint(1) DEFAULT NULL,
  `channel_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `channel_category` int(11) NOT NULL,
  `xml_channel_id` int(11) NOT NULL,
  `drm_id` int(11) NOT NULL,
  `unicast_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `unicast_proxy_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `multicast_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `multicast_proxy_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `close_caption_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `deleted` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nvr_server_id` int(11) DEFAULT NULL,
  `nvr_proxy_server_id` int(11) DEFAULT NULL,
  `nvr_stream_src_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nvr_stream_src_encoding_group_id` int(11) DEFAULT NULL,
  `nvr_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `nvr_proxy_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `usr_server_id` int(11) DEFAULT NULL,
  `usr_proxy_server_id` int(11) DEFAULT NULL,
  `usr_stream_src_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_stream_src_encoding_group_id` int(11) DEFAULT NULL,
  `usr_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `usr_proxy_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `nvr_view_server_id` int(11) DEFAULT NULL,
  `nvr_view_proxy_server_id` int(11) DEFAULT NULL,
  `nvr_view_stream_src_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nvr_view_encoding_grp_id` int(11) DEFAULT NULL,
  `nvr_view_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `nvr_view_proxy_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `primary_transcoder_id` int(11) NOT NULL DEFAULT '0',
  `secondary_transcoder_id` int(11) NOT NULL DEFAULT '0',
  `monitoring_group_id` int(11) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`channel_id`),
  UNIQUE KEY `unique_np` (`partition_id`,`channel_number`,`deleted`),
  KEY `FK_iptv_channels1` (`default_language_id`),
  KEY `FK_iptv_channels2` (`server_id`),
  KEY `FK_iptv_channels3` (`channel_category`),
  CONSTRAINT `FK_iptv_channels1` FOREIGN KEY (`default_language_id`) REFERENCES `iptv_languages` (`language_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_channels3` FOREIGN KEY (`channel_category`) REFERENCES `iptv_channel_categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_drm` */

DROP TABLE IF EXISTS `iptv_drm`;

CREATE TABLE `iptv_drm` (
  `DRM_id` int(11) NOT NULL AUTO_INCREMENT,
  `DRM_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `DRM_key1` varchar(128) COLLATE utf8_bin NOT NULL,
  `DRM_key2` varchar(128) COLLATE utf8_bin NOT NULL,
  `resource_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `position_count` varchar(128) COLLATE utf8_bin NOT NULL,
  `server1` varchar(128) COLLATE utf8_bin NOT NULL,
  `server2` varchar(128) COLLATE utf8_bin NOT NULL,
  `key_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `content_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `media_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `DRM_str` text COLLATE utf8_bin NOT NULL,
  `EZDRM_username` varchar(128) COLLATE utf8_bin NOT NULL,
  `EZDRM_password` varchar(128) COLLATE utf8_bin NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`DRM_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_encoding_quality` */

DROP TABLE IF EXISTS `iptv_encoding_quality`;

CREATE TABLE `iptv_encoding_quality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `iptv_epg` */

DROP TABLE IF EXISTS `iptv_epg`;

CREATE TABLE `iptv_epg` (
  `epg_id` int(11) NOT NULL AUTO_INCREMENT,
  `epg_step_minutes` int(11) NOT NULL,
  `epg_days_back` int(11) NOT NULL,
  `epg_days_forward` int(11) NOT NULL,
  `epg_optimal_channel_count` int(11) NOT NULL,
  PRIMARY KEY (`epg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_favorite_block` */

DROP TABLE IF EXISTS `iptv_favorite_block`;

CREATE TABLE `iptv_favorite_block` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `favorite` int(1) DEFAULT '0',
  `favorite_date_time` datetime DEFAULT NULL,
  `block` int(1) DEFAULT '0',
  `block_password` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `block_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iptv_favorite_block1` (`channel_id`),
  CONSTRAINT `FK_iptv_favorite_block1` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_insertions` */

DROP TABLE IF EXISTS `iptv_insertions`;

CREATE TABLE `iptv_insertions` (
  `insertion_id` int(11) NOT NULL AUTO_INCREMENT,
  `insertion` varchar(100) NOT NULL,
  `insertion_dsc` varchar(255) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`insertion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_languages` */

DROP TABLE IF EXISTS `iptv_languages`;

CREATE TABLE `iptv_languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(128) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_monitoring_groups` */

DROP TABLE IF EXISTS `iptv_monitoring_groups`;

CREATE TABLE `iptv_monitoring_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `group_priority` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_owners` */

DROP TABLE IF EXISTS `iptv_owners`;

CREATE TABLE `iptv_owners` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`owner_id`),
  KEY `FK_iptv_owners1` (`status_id`),
  CONSTRAINT `FK_iptv_owners1` FOREIGN KEY (`status_id`) REFERENCES `iptv_statuses` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_package_channels` */

DROP TABLE IF EXISTS `iptv_package_channels`;

CREATE TABLE `iptv_package_channels` (
  `package_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`package_id`,`channel_id`),
  KEY `FK_iptv_package_channels2` (`channel_id`),
  CONSTRAINT `FK_iptv_package_channels1` FOREIGN KEY (`package_id`) REFERENCES `iptv_packages` (`package_id`) ON DELETE NO ACTION,
  CONSTRAINT `FK_iptv_package_channels2` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_packages` */

DROP TABLE IF EXISTS `iptv_packages`;

CREATE TABLE `iptv_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `is_vod` tinyint(1) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_packages_log` */

DROP TABLE IF EXISTS `iptv_packages_log`;

CREATE TABLE `iptv_packages_log` (
  `id` int(15) unsigned NOT NULL,
  `account_package_id` int(11) NOT NULL,
  `add_remove` char(1) COLLATE utf8_bin NOT NULL,
  `log_dt` datetime NOT NULL,
  `cost` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `self` tinyint(1) NOT NULL,
  `company_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iptv_packages_log1` (`account_package_id`),
  CONSTRAINT `FK_iptv_packages_log1` FOREIGN KEY (`account_package_id`) REFERENCES `iptv_account_packages` (`account_package_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_port_protocols` */

DROP TABLE IF EXISTS `iptv_port_protocols`;

CREATE TABLE `iptv_port_protocols` (
  `port_protocol_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_protocol` varchar(100) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`port_protocol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_port_types` */

DROP TABLE IF EXISTS `iptv_port_types`;

CREATE TABLE `iptv_port_types` (
  `port_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_type` varchar(100) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`port_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_ratings` */

DROP TABLE IF EXISTS `iptv_ratings`;

CREATE TABLE `iptv_ratings` (
  `rating_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rating` varchar(100) NOT NULL,
  `rating1` varchar(255) DEFAULT NULL,
  `rating_dsc` varchar(255) DEFAULT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` int(1) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_seasons` */

DROP TABLE IF EXISTS `iptv_seasons`;

CREATE TABLE `iptv_seasons` (
  `season_id` int(11) NOT NULL AUTO_INCREMENT,
  `season` varchar(255) COLLATE utf8_bin NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`season_id`),
  UNIQUE KEY `season` (`season`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_serials` */

DROP TABLE IF EXISTS `iptv_serials`;

CREATE TABLE `iptv_serials` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `serial_dir` varchar(255) COLLATE utf8_bin NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL,
  `partition_id` int(11) NOT NULL,
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `serial_name` (`serial_name`,`partition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_server_ports` */

DROP TABLE IF EXISTS `iptv_server_ports`;

CREATE TABLE `iptv_server_ports` (
  `server_port_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_protocol_id` int(11) NOT NULL,
  `port_number` varchar(100) NOT NULL,
  `port_type_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`server_port_id`),
  KEY `FK_iptv_server_ports1` (`port_protocol_id`),
  KEY `FK_iptv_server_ports2` (`port_type_id`),
  CONSTRAINT `FK_iptv_server_ports1` FOREIGN KEY (`port_protocol_id`) REFERENCES `iptv_port_protocols` (`port_protocol_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_server_ports2` FOREIGN KEY (`port_type_id`) REFERENCES `iptv_port_types` (`port_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_server_types` */

DROP TABLE IF EXISTS `iptv_server_types`;

CREATE TABLE `iptv_server_types` (
  `server_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_type` varchar(100) NOT NULL,
  `server_type_dsc` varchar(255) DEFAULT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`server_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_servers` */

DROP TABLE IF EXISTS `iptv_servers`;

CREATE TABLE `iptv_servers` (
  `server_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `server_name` varchar(100) NOT NULL,
  `server_ip` varchar(100) NOT NULL,
  `server_port_id` int(11) NOT NULL,
  `server_url` varchar(100) NOT NULL,
  `server_type_id` int(11) NOT NULL,
  `server_operation_system` varchar(100) NOT NULL,
  `server_program` varchar(100) NOT NULL,
  `server_program_version` varchar(64) DEFAULT NULL,
  `timezone_id` int(11) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`server_id`),
  KEY `FK_iptv_servers1` (`server_port_id`),
  KEY `FK_iptv_servers2` (`server_type_id`),
  CONSTRAINT `FK_iptv_servers1` FOREIGN KEY (`server_port_id`) REFERENCES `iptv_server_ports` (`server_port_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_servers2` FOREIGN KEY (`server_type_id`) REFERENCES `iptv_server_types` (`server_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_statuses` */

DROP TABLE IF EXISTS `iptv_statuses`;

CREATE TABLE `iptv_statuses` (
  `status_id` int(6) NOT NULL AUTO_INCREMENT,
  `status` varchar(32) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_stream_audio_encoding` */

DROP TABLE IF EXISTS `iptv_stream_audio_encoding`;

CREATE TABLE `iptv_stream_audio_encoding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_audio_frequency` */

DROP TABLE IF EXISTS `iptv_stream_audio_frequency`;

CREATE TABLE `iptv_stream_audio_frequency` (
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_definitions` */

DROP TABLE IF EXISTS `iptv_stream_definitions`;

CREATE TABLE `iptv_stream_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_encoding` */

DROP TABLE IF EXISTS `iptv_stream_encoding`;

CREATE TABLE `iptv_stream_encoding` (
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_encoding_groups` */

DROP TABLE IF EXISTS `iptv_stream_encoding_groups`;

CREATE TABLE `iptv_stream_encoding_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `encoding_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `stream_type_id` int(11) DEFAULT NULL,
  `stream_playback_type_id` int(11) DEFAULT NULL,
  `stream_definitions` int(11) DEFAULT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `FK_iptv_stream_encoding_groups1` (`encoding_id`),
  CONSTRAINT `FK_iptv_stream_encoding_groups1` FOREIGN KEY (`encoding_id`) REFERENCES `iptv_stream_encodings` (`encoding_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_stream_encodings` */

DROP TABLE IF EXISTS `iptv_stream_encodings`;

CREATE TABLE `iptv_stream_encodings` (
  `encoding_id` int(11) NOT NULL AUTO_INCREMENT,
  `encoding_stream_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video_stream_encoding` varchar(255) COLLATE utf8_bin NOT NULL,
  `video_stream_video` int(11) DEFAULT NULL,
  `video_stream` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video_stream_bandwidth` int(11) NOT NULL,
  `video_stream_format` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `video_resolution` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `video_fps` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `audio_1` int(11) DEFAULT NULL,
  `audio_1_stream` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_1_encoding` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_1_bandwidth` int(11) NOT NULL,
  `audio_1_language` int(11) NOT NULL,
  `audio_1_frequency_hz` int(11) NOT NULL,
  `audio_2` int(11) DEFAULT NULL,
  `audio_2_stream` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_2_encoding` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_2_bandwidth` int(11) NOT NULL,
  `audio_2_language` int(11) NOT NULL,
  `audio_2_frequency_hz` int(11) NOT NULL,
  `audio_3` int(11) DEFAULT NULL,
  `audio_3_stream` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_3_encoding` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_3_bandwidth` int(11) NOT NULL,
  `audio_3_language` int(11) NOT NULL,
  `audio_3_frequency_hz` int(11) NOT NULL,
  `audio_4` int(11) DEFAULT NULL,
  `audio_4_stream` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_4_encoding` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `audio_4_bandwidth` int(11) NOT NULL,
  `audio_4_language` int(11) NOT NULL,
  `audio_4_frequency_hz` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `total_bandwidth` int(11) DEFAULT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`encoding_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_playback_types` */

DROP TABLE IF EXISTS `iptv_stream_playback_types`;

CREATE TABLE `iptv_stream_playback_types` (
  `stream_playback_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_playback_type` varchar(200) NOT NULL,
  `stream_playback_type_dsc` varchar(255) DEFAULT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`stream_playback_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_stream_types` */

DROP TABLE IF EXISTS `iptv_stream_types`;

CREATE TABLE `iptv_stream_types` (
  `stream_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_type` varchar(100) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`stream_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Table structure for table `iptv_stream_video_resolution` */

DROP TABLE IF EXISTS `iptv_stream_video_resolution`;

CREATE TABLE `iptv_stream_video_resolution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_video_stream` */

DROP TABLE IF EXISTS `iptv_stream_video_stream`;

CREATE TABLE `iptv_stream_video_stream` (
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_stream_video_stream_format` */

DROP TABLE IF EXISTS `iptv_stream_video_stream_format`;

CREATE TABLE `iptv_stream_video_stream_format` (
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_support_processes` */

DROP TABLE IF EXISTS `iptv_support_processes`;

CREATE TABLE `iptv_support_processes` (
  `support_process_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `process_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `process_command` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `process_directory` varchar(50) COLLATE utf8_bin NOT NULL,
  `process_default_arguments` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ssh_monitoring_command` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `http_monitoring_command` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `SQLCommand` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `monitoring_type` int(11) NOT NULL,
  PRIMARY KEY (`support_process_id`),
  KEY `FK_iptv_support_processes1` (`server_id`),
  KEY `FK_iptv_support_processes2` (`monitoring_type`),
  CONSTRAINT `FK_iptv_support_processes1` FOREIGN KEY (`server_id`) REFERENCES `iptv_support_servers` (`support_server_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_support_processes2` FOREIGN KEY (`monitoring_type`) REFERENCES `monitoring_type` (`monitoring_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_support_processes_log` */

DROP TABLE IF EXISTS `iptv_support_processes_log`;

CREATE TABLE `iptv_support_processes_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `support_process_id` int(11) NOT NULL DEFAULT '0',
  `process_status` int(11) DEFAULT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `log_id` (`log_id`),
  KEY `FK_iptv_support_processes_log1` (`support_process_id`),
  CONSTRAINT `FK_iptv_support_processes_log1` FOREIGN KEY (`support_process_id`) REFERENCES `iptv_support_processes` (`support_process_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1890868 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_support_servers` */

DROP TABLE IF EXISTS `iptv_support_servers`;

CREATE TABLE `iptv_support_servers` (
  `support_server_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `support_ssl_port` varchar(64) COLLATE utf8_bin NOT NULL,
  `support_user` varchar(64) COLLATE utf8_bin NOT NULL,
  `support_pwd` varchar(64) COLLATE utf8_bin NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  PRIMARY KEY (`support_server_id`),
  KEY `FK_iptv_support_servers1` (`server_id`),
  CONSTRAINT `FK_iptv_support_servers1` FOREIGN KEY (`server_id`) REFERENCES `iptv_servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_transcoder` */

DROP TABLE IF EXISTS `iptv_transcoder`;

CREATE TABLE `iptv_transcoder` (
  `transcoder_id` int(11) NOT NULL AUTO_INCREMENT,
  `transcoder_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL,
  `transcoder_server_id` int(11) NOT NULL,
  `transcoder_command` varchar(999) COLLATE utf8_bin NOT NULL DEFAULT '',
  `trancoder_command_id` int(11) DEFAULT NULL,
  `transcoder_pid` int(11) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`transcoder_id`),
  KEY `FK_iptv_transcoder1` (`status`),
  KEY `FK_iptv_transcoder2` (`transcoder_server_id`),
  KEY `FK_iptv_transcoder3` (`vendor_id`),
  CONSTRAINT `FK_iptv_transcoder1` FOREIGN KEY (`status`) REFERENCES `iptv_statuses` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_transcoder2` FOREIGN KEY (`transcoder_server_id`) REFERENCES `iptv_transcoder_server` (`transcoder_server_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_transcoder3` FOREIGN KEY (`vendor_id`) REFERENCES `iptv_owners` (`owner_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_transcoder_server` */

DROP TABLE IF EXISTS `iptv_transcoder_server`;

CREATE TABLE `iptv_transcoder_server` (
  `transcoder_server_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `transcoder_ssl_port` varchar(64) COLLATE utf8_bin NOT NULL,
  `transcoder_user` varchar(64) COLLATE utf8_bin NOT NULL,
  `transcoder_pwd` varchar(64) COLLATE utf8_bin NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`transcoder_server_id`),
  KEY `FK_iptv_transcoder_server1` (`server_id`),
  CONSTRAINT `FK_iptv_transcoder_server1` FOREIGN KEY (`server_id`) REFERENCES `iptv_servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_ui` */

DROP TABLE IF EXISTS `iptv_ui`;

CREATE TABLE `iptv_ui` (
  `ui_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `logo_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `step_min` int(11) NOT NULL,
  `days_forward` int(11) NOT NULL,
  `days_back` int(11) NOT NULL,
  `optimal_channel_cnt` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ui_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_user_rating_info` */

DROP TABLE IF EXISTS `iptv_user_rating_info`;

CREATE TABLE `iptv_user_rating_info` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned NOT NULL,
  `password` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `rating` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `no_rating` int(1) DEFAULT NULL,
  `channel_category` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `watching_channel` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12234 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_user_rating_info_hour` */

DROP TABLE IF EXISTS `iptv_user_rating_info_hour`;

CREATE TABLE `iptv_user_rating_info_hour` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(1) unsigned NOT NULL,
  `unblock_hour` int(1) unsigned NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_vod_package` */

DROP TABLE IF EXISTS `iptv_vod_package`;

CREATE TABLE `iptv_vod_package` (
  `package_id` int(11) NOT NULL,
  `vod_id` int(11) NOT NULL,
  PRIMARY KEY (`package_id`,`vod_id`),
  KEY `FK_iptv_vod_package2` (`vod_id`),
  CONSTRAINT `FK_iptv_vod_package1` FOREIGN KEY (`package_id`) REFERENCES `iptv_packages` (`package_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_iptv_vod_package2` FOREIGN KEY (`vod_id`) REFERENCES `iptv_assets_library` (`asset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `iptv_vods` */

DROP TABLE IF EXISTS `iptv_vods`;

CREATE TABLE `iptv_vods` (
  `vod_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_owner_id` int(11) NOT NULL,
  `content_submit_date` date NOT NULL,
  `content_expiry_date` date NOT NULL,
  `content_price` double NOT NULL,
  `content_cost` double NOT NULL,
  `content_name` varchar(100) NOT NULL,
  `content_title` varchar(100) NOT NULL,
  `content_author` varchar(100) NOT NULL,
  `content_info` text NOT NULL,
  `content_intended_audience` varchar(255) NOT NULL,
  `content_extension` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `serial_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `content_file` varchar(255) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `server` int(11) NOT NULL,
  `proxy` int(11) NOT NULL,
  `encoding_grp` int(11) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `drm_id` int(11) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `server_url` text,
  `proxy_url` text,
  `deleted` char(1) NOT NULL,
  `production_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`vod_id`),
  KEY `partition_id` (`partition_id`),
  KEY `FK_iptv_vods1` (`content_owner_id`),
  CONSTRAINT `FK_iptv_vods1` FOREIGN KEY (`content_owner_id`) REFERENCES `iptv_owners` (`owner_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `l_client_logger` */

DROP TABLE IF EXISTS `l_client_logger`;

CREATE TABLE `l_client_logger` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned DEFAULT NULL,
  `location` varchar(256) DEFAULT NULL,
  `method` varchar(1024) DEFAULT NULL,
  `message` text,
  `date` datetime DEFAULT NULL,
  `log_level` enum('info','fatal','error','warn','info','debug','trace','all') DEFAULT 'all',
  PRIMARY KEY (`id`),
  KEY `FK_java_script_logger` (`user_id`),
  CONSTRAINT `FK_java_script_logger` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100683 DEFAULT CHARSET=latin1;

/*Table structure for table `l_server_logger` */

DROP TABLE IF EXISTS `l_server_logger`;

CREATE TABLE `l_server_logger` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL,
  `partition_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `sub_resource_id` int(11) DEFAULT NULL,
  `level` enum('info','fatal','error','warn','info','debug','trace','all') COLLATE utf8_bin NOT NULL DEFAULT 'all',
  `class_name` text COLLATE utf8_bin,
  `method_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `log_action` enum('create','read','update','delete','insert','util','attach') COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37588 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `label` */

DROP TABLE IF EXISTS `label`;

CREATE TABLE `label` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE utf8_bin NOT NULL,
  `war_name` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5100 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `label_info` */

DROP TABLE IF EXISTS `label_info`;

CREATE TABLE `label_info` (
  `label_id` int(15) unsigned NOT NULL,
  `lang_id` int(2) unsigned NOT NULL,
  `value` text COLLATE utf8_bin,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`label_id`,`lang_id`),
  KEY `FK_label_info_l` (`lang_id`),
  CONSTRAINT `FK_label_info` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_label_info_l` FOREIGN KEY (`lang_id`) REFERENCES `g_language_lcp` (`value`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `live_channel_block` */

DROP TABLE IF EXISTS `live_channel_block`;

CREATE TABLE `live_channel_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_core_partition` int(11) DEFAULT NULL,
  `block_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `block_dsc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `duration_ms` bigint(20) DEFAULT NULL,
  `duration_fixed` int(11) DEFAULT '0',
  `min_duration` int(11) DEFAULT NULL,
  `recuring` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_month` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_month_start_time` time DEFAULT NULL,
  `recuring_repeats_by_days_of_month_start_date` date DEFAULT NULL,
  `recuring_repeats_by_days_of_month_end_date` date DEFAULT NULL,
  `recuring_repeats_by_days_of_month_days` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `recuring_repeats_by_days_of_week` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_start_time` time DEFAULT NULL,
  `recuring_repeats_by_days_of_week_start_date` date DEFAULT NULL,
  `recuring_repeats_by_days_of_week_end_date` date DEFAULT NULL,
  `recuring_repeats_by_days_of_week_monday` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_tuesday` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_wednesday` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_thursday` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_friday` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_saturday` int(11) DEFAULT NULL,
  `recuring_repeats_by_days_of_week_sunday` int(11) DEFAULT NULL,
  `advertising` int(11) DEFAULT NULL,
  `advertising_server_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `live` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `audio` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `overlay` int(11) DEFAULT NULL,
  `overlay_possition_x` int(11) DEFAULT NULL,
  `overlay_possition_y` int(11) DEFAULT NULL,
  `overlay_possition_width_percent` int(11) DEFAULT NULL,
  `overlay_possition_heigth_percent` int(11) DEFAULT NULL,
  `overlay_possition_transparency_percent` int(11) DEFAULT NULL,
  `overlay_type` int(11) DEFAULT NULL,
  `program_schedule` int(11) DEFAULT NULL,
  `program_schedule_dates` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `epg_only` int(11) DEFAULT NULL,
  `block_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Table structure for table `live_channel_block_assets` */

DROP TABLE IF EXISTS `live_channel_block_assets`;

CREATE TABLE `live_channel_block_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_live_channel_block` int(11) DEFAULT NULL,
  `id_iptv_assets_library` int(11) DEFAULT NULL,
  `duration_ms` bigint(20) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8;

/*Table structure for table `live_channel_block_logs` */

DROP TABLE IF EXISTS `live_channel_block_logs`;

CREATE TABLE `live_channel_block_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_core_partition` int(11) DEFAULT NULL,
  `id_live_channel_block` int(11) DEFAULT NULL,
  `id_iptv_assets_library` int(11) DEFAULT NULL,
  `id_live_channel_logs_actions` int(11) DEFAULT NULL,
  `id_core_system_admins` int(11) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8;

/*Table structure for table `live_channel_block_type` */

DROP TABLE IF EXISTS `live_channel_block_type`;

CREATE TABLE `live_channel_block_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `live_channel_logs_actions` */

DROP TABLE IF EXISTS `live_channel_logs_actions`;

CREATE TABLE `live_channel_logs_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `live_channel_overlay` */

DROP TABLE IF EXISTS `live_channel_overlay`;

CREATE TABLE `live_channel_overlay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_core_partition` int(11) DEFAULT NULL,
  `overlay_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_live_channel_block` int(11) DEFAULT NULL,
  `overlay_possition_x` int(11) DEFAULT NULL,
  `overlay_possition_y` int(11) DEFAULT NULL,
  `overlay_length` int(11) DEFAULT NULL,
  `overlay_hight` int(11) DEFAULT NULL,
  `overlay_length_percent` int(11) DEFAULT NULL,
  `overlay_hight_percent` int(11) DEFAULT NULL,
  `overlay_transparancy_percent` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `live_channel_settings` */

DROP TABLE IF EXISTS `live_channel_settings`;

CREATE TABLE `live_channel_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_core_partition` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `multicast_ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `multicast_port` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channel_info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `publish_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `publish_point_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `publish_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `publish_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_iptv_stream_video_resolution` int(11) DEFAULT NULL,
  `id_iptv_stream_encoding` int(11) DEFAULT NULL,
  `frame_per_second` int(11) DEFAULT NULL,
  `bandwidth_video_kb` int(11) DEFAULT NULL,
  `bandwidth_audio_kb` int(11) DEFAULT NULL,
  `minium_hours_of_scheduling` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `id_iptv_stream_audio_encoding` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `live_channel_timeline` */

DROP TABLE IF EXISTS `live_channel_timeline`;

CREATE TABLE `live_channel_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_core_partition` int(11) DEFAULT NULL,
  `id_timeline_type` int(11) DEFAULT NULL,
  `id_live_channel_block` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=utf8;

/*Table structure for table `live_channel_timeline_type` */

DROP TABLE IF EXISTS `live_channel_timeline_type`;

CREATE TABLE `live_channel_timeline_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `monitoring_type` */

DROP TABLE IF EXISTS `monitoring_type`;

CREATE TABLE `monitoring_type` (
  `monitoring_type_id` int(6) NOT NULL AUTO_INCREMENT,
  `monitoring_type` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `deleted` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`monitoring_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `partition_setup` */

DROP TABLE IF EXISTS `partition_setup`;

CREATE TABLE `partition_setup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `language_id` int(1) unsigned NOT NULL,
  `url_fb` varchar(128) COLLATE utf8_bin NOT NULL,
  `url_gmail` varchar(128) COLLATE utf8_bin NOT NULL,
  `url_twitter` varchar(128) COLLATE utf8_bin NOT NULL,
  `fs_domain_name` varchar(256) COLLATE utf8_bin NOT NULL,
  `fs_api_key` varchar(256) COLLATE utf8_bin NOT NULL,
  `fs_api_methods` text COLLATE utf8_bin NOT NULL,
  `fs_extension_directory_visible` varchar(10) COLLATE utf8_bin NOT NULL,
  `fs_extension_directory_exten_visible` varchar(10) COLLATE utf8_bin NOT NULL,
  `fs_extension_limit_max` varchar(10) COLLATE utf8_bin NOT NULL,
  `fs_extension_user_context` varchar(256) COLLATE utf8_bin NOT NULL,
  `fs_extension_call_group` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'support',
  `fs_extension_enabled` varchar(10) COLLATE utf8_bin NOT NULL,
  `fs_extension_all_timeout` varchar(10) COLLATE utf8_bin NOT NULL,
  `save_contact_days` int(5) NOT NULL,
  `clean_account_days` int(3) NOT NULL,
  `fs_domain_host` varchar(256) COLLATE utf8_bin NOT NULL,
  `fs_domain_port` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fs_domain_description` text COLLATE utf8_bin NOT NULL,
  `fs_user_enabled` varchar(5) COLLATE utf8_bin NOT NULL,
  `fs_user_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `fs_user_password` varchar(256) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `domain_uuid` varchar(256) COLLATE utf8_bin NOT NULL,
  `user_uuid` varchar(256) COLLATE utf8_bin NOT NULL,
  `group_uuid` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_partition_setup` (`language_id`),
  KEY `FK_partition_setup_pp` (`partition_id`),
  KEY `FK_partition_setup_p` (`created_by`),
  KEY `FK_partition_setup_u` (`updated_by`),
  CONSTRAINT `FK_partition_setup` FOREIGN KEY (`language_id`) REFERENCES `g_language_lcp` (`value`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_partition_setup_p` FOREIGN KEY (`created_by`) REFERENCES `core_system_admins` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_partition_setup_pp` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_partition_setup_u` FOREIGN KEY (`updated_by`) REFERENCES `core_system_admins` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `partition_setup_on_facebook` */

DROP TABLE IF EXISTS `partition_setup_on_facebook`;

CREATE TABLE `partition_setup_on_facebook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `app_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `cookie` int(1) unsigned NOT NULL,
  `xfbml` int(1) NOT NULL,
  `version` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part` (`partition_id`),
  CONSTRAINT `FK_partition_setup_on_facebook` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `partition_setup_on_gmail` */

DROP TABLE IF EXISTS `partition_setup_on_gmail`;

CREATE TABLE `partition_setup_on_gmail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `browser_api_key` varchar(256) COLLATE utf8_bin NOT NULL,
  `web_app_client_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `web_app_client_secret` varchar(256) COLLATE utf8_bin NOT NULL,
  `web_app_redirect_uri` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `service_account_client_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `service_account_email_address` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `service_account_certificate_fingeprints` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `recaptcha_version` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `recaptcha_client_key` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `recaptcha_secret_key` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `referrals` */

DROP TABLE IF EXISTS `referrals`;

CREATE TABLE `referrals` (
  `referral_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `user_id` int(15) unsigned NOT NULL,
  `referral_phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `referral_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `referral_user_id` int(11) DEFAULT NULL,
  `refer_dt` datetime NOT NULL,
  `registration_dt` datetime DEFAULT NULL,
  `first_credit` tinyint(1) NOT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `FK_referrals` (`partition_id`),
  KEY `FK_referrals_user` (`user_id`),
  CONSTRAINT `FK_referrals` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_referrals_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Table structure for table `s_general_setting` */

DROP TABLE IF EXISTS `s_general_setting`;

CREATE TABLE `s_general_setting` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(15) unsigned NOT NULL,
  `lang_id` int(1) unsigned NOT NULL DEFAULT '2',
  `profile_key` int(1) unsigned NOT NULL DEFAULT '1',
  `activate_date` datetime DEFAULT NULL,
  `deactivate_date` datetime DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `org` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_unique` (`owner_id`),
  KEY `FK_s_general_setting_l` (`lang_id`),
  KEY `FK_s_general_setting` (`profile_key`),
  CONSTRAINT `FK_s_general_setting` FOREIGN KEY (`profile_key`) REFERENCES `u_profile_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_general_setting_l` FOREIGN KEY (`lang_id`) REFERENCES `g_language_lcp` (`value`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_general_setting_u` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12131 DEFAULT CHARSET=latin1;

/*Table structure for table `s_locale_storage_setting` */

DROP TABLE IF EXISTS `s_locale_storage_setting`;

CREATE TABLE `s_locale_storage_setting` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(15) unsigned NOT NULL,
  `storage_size_mb` int(6) unsigned NOT NULL DEFAULT '1024',
  `msg` int(1) unsigned DEFAULT '1',
  `msg_count` int(1) unsigned DEFAULT '10',
  `msg_data` int(1) unsigned DEFAULT '1',
  `msg_data__count` int(1) unsigned DEFAULT '10',
  `contacts_icon` int(1) unsigned DEFAULT '1',
  `contacts_icon_count` int(1) unsigned DEFAULT '10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_location_setting` */

DROP TABLE IF EXISTS `s_location_setting`;

CREATE TABLE `s_location_setting` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(15) unsigned NOT NULL,
  `latitude` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `accuracy` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `dst_savings` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `ip_v_6` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ip_v_4` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `wlan_0` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `eth_0` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `net_type` int(2) NOT NULL,
  `net_operator_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `net_country_iso` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `logout_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s_location_setting` (`account_id`),
  CONSTRAINT `FK_s_location_setting` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29903 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_notification_type_lcp` */

DROP TABLE IF EXISTS `s_notification_type_lcp`;

CREATE TABLE `s_notification_type_lcp` (
  `key` int(1) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `s_privacy_setting` */

DROP TABLE IF EXISTS `s_privacy_setting`;

CREATE TABLE `s_privacy_setting` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(15) unsigned DEFAULT NULL,
  `fut_post_key` int(1) unsigned NOT NULL,
  `fut_post_not_key` int(1) unsigned NOT NULL,
  `contact_req_key` int(1) unsigned NOT NULL,
  `contact_req_not_key` int(1) unsigned NOT NULL,
  `inbox_filter_key` int(1) unsigned NOT NULL,
  `inbox_filter_not_key` int(1) unsigned NOT NULL,
  `post_on_tl_key` int(1) unsigned NOT NULL,
  `post_on_tl_not_key` int(1) unsigned NOT NULL,
  `subscription_key` int(1) unsigned NOT NULL DEFAULT '1',
  `subscription_not_key` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_unique` (`owner_id`),
  KEY `FK_s_privacy_setting_f` (`fut_post_key`),
  KEY `FK_s_privacy_setting_c` (`contact_req_key`),
  KEY `FK_s_privacy_setting_p` (`post_on_tl_key`),
  KEY `FK_s_privacy_setting_pn` (`fut_post_not_key`),
  KEY `FK_s_privacy_setting_cn` (`contact_req_not_key`),
  KEY `FK_s_privacy_setting_i` (`inbox_filter_key`),
  KEY `FK_s_privacy_setting_in` (`inbox_filter_not_key`),
  KEY `FK_s_privacy_setting_pi` (`post_on_tl_not_key`),
  KEY `FK_s_privacy_setting_ss` (`subscription_key`),
  KEY `FK_s_privacy_setting_s` (`subscription_not_key`),
  CONSTRAINT `FK_s_privacy_setting_c` FOREIGN KEY (`contact_req_key`) REFERENCES `s_visibility_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_cn` FOREIGN KEY (`contact_req_not_key`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_f` FOREIGN KEY (`fut_post_key`) REFERENCES `s_visibility_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_fn` FOREIGN KEY (`fut_post_not_key`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_i` FOREIGN KEY (`inbox_filter_key`) REFERENCES `s_visibility_type_lcp` (`key`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_s_privacy_setting_in` FOREIGN KEY (`inbox_filter_not_key`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_p` FOREIGN KEY (`post_on_tl_key`) REFERENCES `s_visibility_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_pi` FOREIGN KEY (`post_on_tl_not_key`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_pn` FOREIGN KEY (`fut_post_not_key`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_s` FOREIGN KEY (`subscription_not_key`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_ss` FOREIGN KEY (`subscription_key`) REFERENCES `s_visibility_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_privacy_setting_u` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `s_security_setting` */

DROP TABLE IF EXISTS `s_security_setting`;

CREATE TABLE `s_security_setting` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(15) unsigned DEFAULT NULL,
  `login_not` int(1) unsigned NOT NULL DEFAULT '1',
  `logged_in` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`owner_id`),
  KEY `FK_s_security_setting` (`login_not`),
  CONSTRAINT `FK_s_security_setting` FOREIGN KEY (`login_not`) REFERENCES `s_notification_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_security_setting_u` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_trusted_contact` */

DROP TABLE IF EXISTS `s_trusted_contact`;

CREATE TABLE `s_trusted_contact` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `owner_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s_trusted_contact` (`user_id`),
  KEY `FK_s_trusted_contact_ow` (`owner_id`),
  CONSTRAINT `FK_s_trusted_contact` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_s_trusted_contact_ow` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_visibility_type_lcp` */

DROP TABLE IF EXISTS `s_visibility_type_lcp`;

CREATE TABLE `s_visibility_type_lcp` (
  `key` int(1) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sippeers` */

DROP TABLE IF EXISTS `sippeers`;

CREATE TABLE `sippeers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int(5) DEFAULT NULL COMMENT 'prev was 5',
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(10) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(20) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp,ws,wss','tcp','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(40) DEFAULT NULL,
  `allow` varchar(40) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(40) DEFAULT NULL,
  `setvar` varchar(40) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ipaddr` (`ipaddr`,`port`),
  KEY `host` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `status_lcp` */

DROP TABLE IF EXISTS `status_lcp`;

CREATE TABLE `status_lcp` (
  `key` int(1) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `support_processes` */

DROP TABLE IF EXISTS `support_processes`;

CREATE TABLE `support_processes` (
  `transcoder_server_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) DEFAULT NULL,
  `transcoder_ssl_port` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `transcoder_user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `transcoder_pwd` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `partition_id` int(11) DEFAULT NULL,
  `deleted` char(1) COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`transcoder_server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `transcoder_log` */

DROP TABLE IF EXISTS `transcoder_log`;

CREATE TABLE `transcoder_log` (
  `transcoder_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `transcoder_id` int(11) NOT NULL,
  `transcoder_pid` char(10) COLLATE utf8_bin NOT NULL,
  `start_dt` datetime NOT NULL,
  `stop_dt` datetime NOT NULL,
  `transcoder_command` text COLLATE utf8_bin,
  `transcoder_output` text COLLATE utf8_bin NOT NULL,
  `transcoder_output_file` varchar(255) COLLATE utf8_bin NOT NULL,
  `transcoder_notification_sent` datetime NOT NULL,
  `user_id` char(50) COLLATE utf8_bin DEFAULT NULL,
  `partition_id` int(11) NOT NULL,
  `output` text COLLATE utf8_bin,
  `Notified` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`transcoder_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9007094 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_arrival_types` */

DROP TABLE IF EXISTS `tsm_arrival_types`;

CREATE TABLE `tsm_arrival_types` (
  `arrival_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `arrival_type` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`arrival_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_become_company_request` */

DROP TABLE IF EXISTS `tsm_become_company_request`;

CREATE TABLE `tsm_become_company_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_partition` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_first_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_last_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `number_of_vehicels` int(11) DEFAULT NULL,
  `number_of_drivers` int(11) DEFAULT NULL,
  `service_area` int(11) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_car_classes` */

DROP TABLE IF EXISTS `tsm_car_classes`;

CREATE TABLE `tsm_car_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `car_class` varchar(255) NOT NULL,
  `car_class_icon` varchar(255) NOT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  `max_passengers` int(11) NOT NULL,
  `oldest_vehicle_year` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_car_colors` */

DROP TABLE IF EXISTS `tsm_car_colors`;

CREATE TABLE `tsm_car_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_car_condition` */

DROP TABLE IF EXISTS `tsm_car_condition`;

CREATE TABLE `tsm_car_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_car_models` */

DROP TABLE IF EXISTS `tsm_car_models`;

CREATE TABLE `tsm_car_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `car_make` varchar(255) NOT NULL,
  `car_model` varchar(255) NOT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_cars_in_use` */

DROP TABLE IF EXISTS `tsm_cars_in_use`;

CREATE TABLE `tsm_cars_in_use` (
  `car_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`car_id`,`driver_id`),
  UNIQUE KEY `car_id` (`car_id`),
  UNIQUE KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_company` */

DROP TABLE IF EXISTS `tsm_company`;

CREATE TABLE `tsm_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_tsm_insurance` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comments` text,
  `id_tsm_become_company_request` int(11) DEFAULT NULL,
  `sent_to_merchant` int(1) DEFAULT NULL,
  `convert_to_merchant` int(1) DEFAULT NULL,
  `merchant_secretKey` varchar(255) DEFAULT NULL,
  `merchant_clientKey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_company_location_car` */

DROP TABLE IF EXISTS `tsm_company_location_car`;

CREATE TABLE `tsm_company_location_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  `id_tsm_car_classes` int(11) DEFAULT NULL,
  `id_tsm_car_models` int(11) DEFAULT NULL,
  `id_tsm_car_colors` int(11) DEFAULT NULL,
  `id_tsm_car_condition` int(11) DEFAULT NULL,
  `legal_info` varchar(255) DEFAULT NULL,
  `id_tsm_insurance` int(11) DEFAULT NULL,
  `tcp_number` varchar(255) DEFAULT NULL,
  `tcp_exp_date` date DEFAULT NULL,
  `inspection_info` varchar(255) DEFAULT NULL,
  `inspection_exp_date` datetime DEFAULT NULL,
  `id_tsm_car_statuses` int(11) DEFAULT NULL,
  `car_image_front` varchar(255) DEFAULT NULL,
  `car_image_back` varchar(255) DEFAULT NULL,
  `car_image_side` varchar(255) DEFAULT NULL,
  `car_image_interior` varchar(255) DEFAULT NULL,
  `inspection_form_image` varchar(255) DEFAULT NULL,
  `inspection_receipt_image` varchar(255) DEFAULT NULL,
  `car_year` int(11) DEFAULT NULL,
  `car_license_plate` varchar(10) DEFAULT NULL,
  `car_license_plate_state` int(11) DEFAULT NULL,
  `car_license_plate_country` int(11) DEFAULT NULL,
  `tsm_carnumber` varchar(50) DEFAULT NULL,
  `equiped_with_chidren_carseat` char(1) DEFAULT NULL,
  `equiped_with_wheelchair_aaccess` char(1) DEFAULT NULL,
  `equiped_with_camera` char(1) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_company_location_driver` */

DROP TABLE IF EXISTS `tsm_company_location_driver`;

CREATE TABLE `tsm_company_location_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `id_tsm_company` int(11) DEFAULT NULL,
  `id_tsm_company_locations` int(11) DEFAULT NULL,
  `first_last_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `legal_info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_insurance` int(11) DEFAULT NULL,
  `driver_license_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `driver_license_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `driver_licese_expiration` datetime DEFAULT NULL,
  `driver_lisense_image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `backgroud_checked_passed` tinyint(1) DEFAULT NULL,
  `background_check_last_date` datetime DEFAULT NULL,
  `backgroud_checked_image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `driver_picture` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tsm_telephone_number` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `comments` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_company_location_driver_languages` */

DROP TABLE IF EXISTS `tsm_company_location_driver_languages`;

CREATE TABLE `tsm_company_location_driver_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_company_location_driver` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_company_locations` */

DROP TABLE IF EXISTS `tsm_company_locations`;

CREATE TABLE `tsm_company_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `id_tsm_company` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` int(10) DEFAULT NULL,
  `legal_info` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `id_tsm_insurance` int(11) DEFAULT NULL,
  `puc_certificate` varchar(255) DEFAULT NULL,
  `puc_permit` varchar(255) DEFAULT NULL,
  `puc_startdate` date DEFAULT NULL,
  `puc_expirationdate` date DEFAULT NULL,
  `puc_image` varchar(255) DEFAULT NULL,
  `id_tsm_contract` int(11) DEFAULT NULL,
  `tsm_contract_accepted_by_id` int(11) DEFAULT NULL,
  `tsm_contract_accepted_date` datetime DEFAULT NULL,
  `businessLicense` varchar(255) DEFAULT NULL,
  `businessLicenseIssueDate` date DEFAULT NULL,
  `businessLicenseExpirationDate` date DEFAULT NULL,
  `businessLicenseImage` varchar(255) DEFAULT NULL,
  `id_tsm_service_areas` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_company_percentage_settings` */

DROP TABLE IF EXISTS `tsm_company_percentage_settings`;

CREATE TABLE `tsm_company_percentage_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_company` int(11) DEFAULT NULL,
  `default_driver_percentage_for_ride` int(11) DEFAULT NULL,
  `credit_limit_for_driver` int(11) DEFAULT NULL,
  `credit_limit_for_location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `tsm_contract` */

DROP TABLE IF EXISTS `tsm_contract`;

CREATE TABLE `tsm_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `tsm_contract` varchar(255) COLLATE utf8_bin NOT NULL,
  `tsm_effective_date` date DEFAULT NULL,
  `tsm_expiration_date` date DEFAULT NULL,
  `tsm_image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_contract_accepted` */

DROP TABLE IF EXISTS `tsm_contract_accepted`;

CREATE TABLE `tsm_contract_accepted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_company` int(11) DEFAULT NULL,
  `id_tsm_contract` int(11) DEFAULT NULL,
  `accepted_date` datetime DEFAULT NULL,
  `accepted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_countries` */

DROP TABLE IF EXISTS `tsm_countries`;

CREATE TABLE `tsm_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_dispatcher_orders` */

DROP TABLE IF EXISTS `tsm_dispatcher_orders`;

CREATE TABLE `tsm_dispatcher_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sms_code` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_driver_percentage_settings` */

DROP TABLE IF EXISTS `tsm_driver_percentage_settings`;

CREATE TABLE `tsm_driver_percentage_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_driver` int(11) DEFAULT NULL,
  `default_driver_percentage_for_ride` int(11) DEFAULT NULL,
  `credit_limit_for_driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `tsm_driver_statuses` */

DROP TABLE IF EXISTS `tsm_driver_statuses`;

CREATE TABLE `tsm_driver_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_dynamic_agreement` */

DROP TABLE IF EXISTS `tsm_dynamic_agreement`;

CREATE TABLE `tsm_dynamic_agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_type` int(11) DEFAULT NULL,
  `location_type` int(11) DEFAULT NULL,
  `driver_type` int(11) DEFAULT NULL,
  `effective_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_dynamic_agreement_assigned` */

DROP TABLE IF EXISTS `tsm_dynamic_agreement_assigned`;

CREATE TABLE `tsm_dynamic_agreement_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_dynamic_agreement` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_dynamic_certificate` */

DROP TABLE IF EXISTS `tsm_dynamic_certificate`;

CREATE TABLE `tsm_dynamic_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_dynamic_certificate_assigned` */

DROP TABLE IF EXISTS `tsm_dynamic_certificate_assigned`;

CREATE TABLE `tsm_dynamic_certificate_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_dynamic_certificate` int(11) DEFAULT NULL,
  `id_tsm_system` int(11) DEFAULT NULL,
  `CertificateCompanyName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CertificateCompanyStreet` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CertificateCompanyCity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CertificateCompanyState` int(10) DEFAULT NULL,
  `CertificateCompanyZip` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CertificateCompanyCountry` int(1) DEFAULT NULL,
  `CertificateCompanyPhoneNumber` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CertificatePolicyNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CertificateValidDate` datetime DEFAULT NULL,
  `CertificateExpiredDate` datetime DEFAULT NULL,
  `CertificatePolicyImage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_dynamic_certificate_type` */

DROP TABLE IF EXISTS `tsm_dynamic_certificate_type`;

CREATE TABLE `tsm_dynamic_certificate_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_dynamic_information` */

DROP TABLE IF EXISTS `tsm_dynamic_information`;

CREATE TABLE `tsm_dynamic_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_type` int(11) DEFAULT NULL,
  `location_type` int(11) DEFAULT NULL,
  `driver_type` int(11) DEFAULT NULL,
  `effective_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dsc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_hollor_users` */

DROP TABLE IF EXISTS `tsm_hollor_users`;

CREATE TABLE `tsm_hollor_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `id_hollor_user` int(11) DEFAULT NULL,
  `id_tsm_system` int(11) DEFAULT NULL,
  `id_tsm_roles` int(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tsm_partition` (`id_tsm_partition`,`id_hollor_user`)
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_insurance` */

DROP TABLE IF EXISTS `tsm_insurance`;

CREATE TABLE `tsm_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InsuranceCompanyName` varchar(255) DEFAULT NULL,
  `InsuranceCompanyStreet` varchar(255) DEFAULT NULL,
  `InsuranceCompanyCity` varchar(255) DEFAULT NULL,
  `InsuranceCompanyState` int(10) DEFAULT NULL,
  `InsuranceCompanyZip` varchar(10) DEFAULT NULL,
  `InsuranceCompanyCountry` int(1) DEFAULT NULL,
  `InsuranceCompanyPhoneNumber` varchar(10) DEFAULT NULL,
  `Id_InsuranceType` int(11) DEFAULT NULL,
  `InsurancePolicyNumber` varchar(255) DEFAULT NULL,
  `InsuranceValidDate` datetime DEFAULT NULL,
  `InsuranceExpiredDate` datetime DEFAULT NULL,
  `InsurancePolicyImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_insurance_type` */

DROP TABLE IF EXISTS `tsm_insurance_type`;

CREATE TABLE `tsm_insurance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_languages` */

DROP TABLE IF EXISTS `tsm_languages`;

CREATE TABLE `tsm_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_location_percentage_settings` */

DROP TABLE IF EXISTS `tsm_location_percentage_settings`;

CREATE TABLE `tsm_location_percentage_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_location` int(11) DEFAULT NULL,
  `default_driver_percentage_for_ride` int(11) DEFAULT NULL,
  `credit_limit_for_driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `tsm_log_actions` */

DROP TABLE IF EXISTS `tsm_log_actions`;

CREATE TABLE `tsm_log_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_action_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_login` */

DROP TABLE IF EXISTS `tsm_login`;

CREATE TABLE `tsm_login` (
  `user_id` int(11) NOT NULL,
  `partition_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT '0',
  `session_id` varchar(255) NOT NULL,
  `login_dt` datetime NOT NULL,
  `device_type` smallint(6) DEFAULT NULL,
  `device_key` blob,
  `production` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_logs` */

DROP TABLE IF EXISTS `tsm_logs`;

CREATE TABLE `tsm_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_logged_user` int(11) DEFAULT NULL,
  `id_tsm_roles` int(11) DEFAULT NULL,
  `id_partition` int(11) DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `id_location` int(11) DEFAULT NULL,
  `id_driver` int(11) DEFAULT NULL,
  `id_updated_item` int(11) DEFAULT NULL,
  `id_log_actions` int(11) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_partition` */

DROP TABLE IF EXISTS `tsm_partition`;

CREATE TABLE `tsm_partition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hollor_partition` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` int(1) DEFAULT NULL,
  `id_tsm_insurance` int(11) NOT NULL,
  `legal_info` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `rating_number` int(11) NOT NULL,
  `id_tsm_time_format` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_partition_languages` */

DROP TABLE IF EXISTS `tsm_partition_languages`;

CREATE TABLE `tsm_partition_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_partition_percentage_settings` */

DROP TABLE IF EXISTS `tsm_partition_percentage_settings`;

CREATE TABLE `tsm_partition_percentage_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `default_company_percentage_for_ride` int(11) DEFAULT NULL,
  `credit_limit_for_company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tsm_partition_promotions` */

DROP TABLE IF EXISTS `tsm_partition_promotions`;

CREATE TABLE `tsm_partition_promotions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `new_user_bonus` double(9,2) NOT NULL,
  `referral_residual_percent` int(11) DEFAULT NULL,
  `referral_residual_amount` int(11) DEFAULT NULL,
  `referral_one_time_percent` int(11) DEFAULT NULL,
  `referral_one_time_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_partition_settings` */

DROP TABLE IF EXISTS `tsm_partition_settings`;

CREATE TABLE `tsm_partition_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tsm_partition` int(11) DEFAULT NULL,
  `comercial_insurance_required` tinyint(1) NOT NULL,
  `tcp_required` tinyint(1) NOT NULL,
  `puc_required` tinyint(1) NOT NULL,
  `min_car_year` int(11) NOT NULL,
  `driver_insurance` tinyint(1) DEFAULT NULL,
  `car_insuranse` tinyint(1) DEFAULT NULL,
  `distance_type` int(11) DEFAULT NULL,
  `lookup_cycle` int(11) DEFAULT NULL,
  `min_lookup_car_count` int(11) DEFAULT NULL,
  `max_distance` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `send_coordinates_free` decimal(9,4) DEFAULT NULL,
  `send_coordinates_with_passenger` decimal(9,4) DEFAULT NULL,
  `check_primary_service_area` tinyint(11) DEFAULT NULL,
  `company_insurance_required` tinyint(11) DEFAULT NULL,
  `location_insurance_required` tinyint(11) DEFAULT NULL,
  `cooeficient_from` double DEFAULT NULL,
  `cooeficient_to` double DEFAULT NULL,
  `max_hotzone_radius` double DEFAULT NULL,
  `driver_can_accept_cash` tinyint(1) DEFAULT NULL,
  `gratuity_allowed` tinyint(1) DEFAULT NULL,
  `max_hot_zone_notification_distance` double DEFAULT NULL,
  `available_toll_road` tinyint(1) DEFAULT NULL,
  `min_reserve_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_rate_schedule` */

DROP TABLE IF EXISTS `tsm_rate_schedule`;

CREATE TABLE `tsm_rate_schedule` (
  `rate_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_schedule_name` varchar(255) NOT NULL,
  `car_class_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  PRIMARY KEY (`rate_schedule_id`),
  KEY `FK_tsm_rate_schedule` (`rate_id`),
  CONSTRAINT `FK_tsm_rate_schedule` FOREIGN KEY (`rate_id`) REFERENCES `tsm_rates` (`rate_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_rates` */

DROP TABLE IF EXISTS `tsm_rates`;

CREATE TABLE `tsm_rates` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `rate_name` varchar(255) NOT NULL,
  `cancelation_fee` double NOT NULL DEFAULT '0',
  `min_fair_amount` double NOT NULL DEFAULT '0',
  `max_fair_amount` double NOT NULL DEFAULT '0',
  `initial_free_waiting_time` double NOT NULL DEFAULT '0' COMMENT 'in minutes',
  `min_waiting_fee` double NOT NULL DEFAULT '0',
  `max_waiting_fee` double NOT NULL DEFAULT '0',
  `per_distance_unit_fee` double NOT NULL DEFAULT '0',
  `per_minute_fee` double NOT NULL DEFAULT '0',
  `end_trip_cost` double NOT NULL DEFAULT '0',
  `client_not_show` double NOT NULL DEFAULT '0',
  `additional_cost` double NOT NULL DEFAULT '0',
  `parking_fee` double NOT NULL DEFAULT '0',
  `toll_road_fee` double NOT NULL DEFAULT '0',
  `flat_rate_pickup_fee` double NOT NULL DEFAULT '0',
  `flat_rate_dropoff_fee` double NOT NULL DEFAULT '0',
  `per_extra_stop_rate` double NOT NULL DEFAULT '0',
  `reservation_fee` double NOT NULL DEFAULT '0',
  `min_time_for_reservation` double NOT NULL DEFAULT '0',
  `umbrella_insurance_fee` double NOT NULL DEFAULT '0',
  `fair_share_fee` double NOT NULL DEFAULT '0',
  `tax_inclusive` char(1) NOT NULL DEFAULT '1',
  `charge_from_distance` double DEFAULT NULL,
  `waiting_minute_fee` double DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_rating_number` */

DROP TABLE IF EXISTS `tsm_rating_number`;

CREATE TABLE `tsm_rating_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_schedule_reminder` */

DROP TABLE IF EXISTS `tsm_schedule_reminder`;

CREATE TABLE `tsm_schedule_reminder` (
  `schedule_id` int(11) NOT NULL,
  `next_remind_dt` datetime NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tsm_schedule_settings` */

DROP TABLE IF EXISTS `tsm_schedule_settings`;

CREATE TABLE `tsm_schedule_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `remind_start` int(11) NOT NULL COMMENT 'in minutes',
  `remind_interval` int(11) NOT NULL COMMENT 'in minutes',
  `time_interval` int(11) NOT NULL COMMENT 'time before/after order in minutes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tsm_states` */

DROP TABLE IF EXISTS `tsm_states`;

CREATE TABLE `tsm_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abr` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_statuses` */

DROP TABLE IF EXISTS `tsm_statuses`;

CREATE TABLE `tsm_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `dsc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `tsm_time_format` */

DROP TABLE IF EXISTS `tsm_time_format`;

CREATE TABLE `tsm_time_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_month_day` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hour_min_sec` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `am_pm` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `12_24` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tsm_vehicle_schedule` */

DROP TABLE IF EXISTS `tsm_vehicle_schedule`;

CREATE TABLE `tsm_vehicle_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `vehicle_type_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `arrival_type` int(11) DEFAULT NULL,
  `arrival_number` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `start_dt` datetime NOT NULL,
  `start_gps_lat` double NOT NULL,
  `start_gps_lon` double NOT NULL,
  `start_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `end_dt` datetime NOT NULL,
  `end_gps_lat` double NOT NULL,
  `end_gps_lon` double NOT NULL,
  `end_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_order_sent` tinyint(1) NOT NULL,
  `is_cash` tinyint(1) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `FK_tsm_vehicle_schedule2` (`vehicle_type_id`),
  KEY `FK_tsm_vehicle_schedule1` (`partition_id`),
  KEY `FK_tsm_vehicle_schedule3` (`vehicle_id`),
  KEY `FK_tsm_vehicle_schedule4` (`arrival_type`),
  CONSTRAINT `FK_tsm_vehicle_schedule1` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`),
  CONSTRAINT `FK_tsm_vehicle_schedule2` FOREIGN KEY (`vehicle_type_id`) REFERENCES `tsm_car_classes` (`id`),
  CONSTRAINT `FK_tsm_vehicle_schedule3` FOREIGN KEY (`vehicle_id`) REFERENCES `tsm_company_location_car` (`id`),
  CONSTRAINT `FK_tsm_vehicle_schedule4` FOREIGN KEY (`arrival_type`) REFERENCES `tsm_arrival_types` (`arrival_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Table structure for table `u_contact` */

DROP TABLE IF EXISTS `u_contact`;

CREATE TABLE `u_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) unsigned NOT NULL,
  `to` int(11) unsigned NOT NULL,
  `contact_state_id` int(1) unsigned NOT NULL,
  `user_online_status_id` int(1) unsigned NOT NULL,
  `s_change_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`from`,`to`),
  KEY `FK_user_friend_to` (`to`),
  KEY `FK_user_friend_state` (`contact_state_id`),
  KEY `FK_user_friend_online` (`user_online_status_id`),
  CONSTRAINT `FK_user_friend` FOREIGN KEY (`from`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_friend_online` FOREIGN KEY (`user_online_status_id`) REFERENCES `u_online_status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_friend_state` FOREIGN KEY (`contact_state_id`) REFERENCES `u_contact_state_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_friend_to` FOREIGN KEY (`to`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_contact_state_lcp` */

DROP TABLE IF EXISTS `u_contact_state_lcp`;

CREATE TABLE `u_contact_state_lcp` (
  `key` int(1) unsigned NOT NULL,
  `state` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_data` */

DROP TABLE IF EXISTS `u_data`;

CREATE TABLE `u_data` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(256) COLLATE utf8_bin NOT NULL,
  `content_type` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `size` int(15) unsigned DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `status` int(1) unsigned NOT NULL,
  `user_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_u_datas` (`status`),
  KEY `FK_u_data` (`user_id`),
  CONSTRAINT `FK_u_data` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_datas` FOREIGN KEY (`status`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_group` */

DROP TABLE IF EXISTS `u_group`;

CREATE TABLE `u_group` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin COMMENT 'a short descreption , that will illustrate the group aims',
  `creation_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `admin_id` int(15) unsigned NOT NULL COMMENT 'creator id',
  `icon_id` int(15) unsigned DEFAULT NULL,
  `parent_group_id` int(15) unsigned DEFAULT NULL COMMENT 'the group can also has sub groups, like connecto has hi-teck',
  `status_id` int(1) unsigned NOT NULL COMMENT 'is deleted, is activ',
  `group_type_id` int(1) unsigned NOT NULL COMMENT 'group visibilty type, who can access to this group',
  PRIMARY KEY (`id`),
  KEY `FK_u_group_a` (`admin_id`),
  KEY `FK_u_group` (`icon_id`),
  KEY `FK_u_group_st` (`status_id`),
  KEY `FK_u_group_type` (`group_type_id`),
  KEY `FK_u_groupparent` (`parent_group_id`),
  CONSTRAINT `FK_u_group` FOREIGN KEY (`icon_id`) REFERENCES `u_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_group_a` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_group_st` FOREIGN KEY (`status_id`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_group_type` FOREIGN KEY (`group_type_id`) REFERENCES `u_group_type_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_groupparent` FOREIGN KEY (`parent_group_id`) REFERENCES `u_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_group_member` */

DROP TABLE IF EXISTS `u_group_member`;

CREATE TABLE `u_group_member` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(15) unsigned NOT NULL,
  `user_id` int(15) unsigned NOT NULL,
  `u_profile` int(1) unsigned NOT NULL COMMENT 'is admin, or operator, or moderator',
  `entry_date` datetime NOT NULL,
  `status` int(1) unsigned NOT NULL,
  `state` int(1) unsigned NOT NULL,
  `s_change_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`group_id`,`user_id`),
  KEY `FK_group_member_p` (`u_profile`),
  KEY `FK_u_group_member` (`status`),
  KEY `FK_group_member_u` (`user_id`),
  KEY `FK_u_group_member_state` (`state`),
  CONSTRAINT `FK_group_member` FOREIGN KEY (`group_id`) REFERENCES `u_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_group_member_p` FOREIGN KEY (`u_profile`) REFERENCES `u_profile_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_group_member_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_group_member` FOREIGN KEY (`status`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_group_member_state` FOREIGN KEY (`state`) REFERENCES `u_contact_state_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_group_type_lcp` */

DROP TABLE IF EXISTS `u_group_type_lcp`;

CREATE TABLE `u_group_type_lcp` (
  `key` int(1) unsigned NOT NULL,
  `value` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_guest` */

DROP TABLE IF EXISTS `u_guest`;

CREATE TABLE `u_guest` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned NOT NULL,
  `guest_id` int(15) unsigned NOT NULL,
  `visited_date` datetime NOT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`user_id`,`guest_id`),
  KEY `FK_u_guest_g` (`guest_id`),
  KEY `guest` (`user_id`,`guest_id`),
  CONSTRAINT `FK_u_guest_g` FOREIGN KEY (`guest_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_guest_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_message` */

DROP TABLE IF EXISTS `u_message`;

CREATE TABLE `u_message` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(15) unsigned NOT NULL,
  `to` int(15) unsigned NOT NULL,
  `message` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `data_id` int(15) unsigned DEFAULT NULL,
  `t_state_id` int(1) unsigned NOT NULL,
  `sip_state_id` int(1) unsigned NOT NULL,
  `sms_state_id` int(1) unsigned NOT NULL,
  `status_id` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_u_message_f` (`from`),
  KEY `FK_u_message_t` (`to`),
  KEY `FK_u_message_d` (`data_id`),
  KEY `FK_u_message_sip` (`sip_state_id`),
  KEY `FK_u_message` (`t_state_id`),
  KEY `FK_u_message_sms` (`sms_state_id`),
  KEY `FK_u_message_st` (`status_id`),
  CONSTRAINT `FK_u_message` FOREIGN KEY (`t_state_id`) REFERENCES `u_message_state_lcp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_message_d` FOREIGN KEY (`data_id`) REFERENCES `u_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_message_f` FOREIGN KEY (`from`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_message_sip` FOREIGN KEY (`sip_state_id`) REFERENCES `u_message_state_lcp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_message_sms` FOREIGN KEY (`sms_state_id`) REFERENCES `u_message_state_lcp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_message_st` FOREIGN KEY (`status_id`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_message_t` FOREIGN KEY (`to`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `u_message_state_lcp` */

DROP TABLE IF EXISTS `u_message_state_lcp`;

CREATE TABLE `u_message_state_lcp` (
  `id` int(1) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `u_online_status_lcp` */

DROP TABLE IF EXISTS `u_online_status_lcp`;

CREATE TABLE `u_online_status_lcp` (
  `key` int(1) unsigned NOT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_post` */

DROP TABLE IF EXISTS `u_post`;

CREATE TABLE `u_post` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(15) unsigned NOT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `created_date` datetime NOT NULL,
  `default_photo_id` int(15) unsigned NOT NULL,
  `rating` int(15) NOT NULL,
  `status` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_u_post_u` (`owner_id`),
  KEY `FK_u_post_p` (`default_photo_id`),
  KEY `FK_u_post` (`status`),
  CONSTRAINT `FK_u_post` FOREIGN KEY (`status`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_post_p` FOREIGN KEY (`default_photo_id`) REFERENCES `u_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_post_u` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_post_comment` */

DROP TABLE IF EXISTS `u_post_comment`;

CREATE TABLE `u_post_comment` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(15) unsigned NOT NULL,
  `comment_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`post_id`,`comment_id`),
  KEY `FK_u_post_comment_c` (`comment_id`),
  CONSTRAINT `FK_u_post_comment_c` FOREIGN KEY (`comment_id`) REFERENCES `u_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_post_comment_p` FOREIGN KEY (`post_id`) REFERENCES `u_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_post_data` */

DROP TABLE IF EXISTS `u_post_data`;

CREATE TABLE `u_post_data` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(15) unsigned NOT NULL,
  `data_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`post_id`,`data_id`),
  KEY `FK_u_post_data_d` (`data_id`),
  CONSTRAINT `FK_u_post_data_d` FOREIGN KEY (`data_id`) REFERENCES `u_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_post_data_p` FOREIGN KEY (`post_id`) REFERENCES `u_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_profile_lcp` */

DROP TABLE IF EXISTS `u_profile_lcp`;

CREATE TABLE `u_profile_lcp` (
  `key` int(2) unsigned NOT NULL,
  `profile` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `u_share` */

DROP TABLE IF EXISTS `u_share`;

CREATE TABLE `u_share` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(15) unsigned NOT NULL,
  `from_account` int(15) unsigned DEFAULT NULL,
  `to` int(15) unsigned NOT NULL,
  `to_account` int(15) unsigned DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `creation_date` datetime NOT NULL,
  `data_id` int(15) unsigned DEFAULT NULL,
  `status_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_u_share_f` (`from`),
  KEY `FK_u_share_t` (`to`),
  KEY `FK_u_share_fa` (`from_account`),
  KEY `FK_u_share` (`to_account`),
  KEY `FK_u_share_da` (`data_id`),
  KEY `FK_u_share_s` (`status_id`),
  CONSTRAINT `FK_u_share` FOREIGN KEY (`to_account`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_share_da` FOREIGN KEY (`data_id`) REFERENCES `u_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_share_f` FOREIGN KEY (`from`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_u_share_fa` FOREIGN KEY (`from_account`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_share_s` FOREIGN KEY (`status_id`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_u_share_t` FOREIGN KEY (`to`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `surname` varchar(50) COLLATE utf8_bin NOT NULL,
  `phone_code` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` enum('male','female','none') COLLATE utf8_bin DEFAULT 'none',
  `dob` date DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `default_photo_id` int(2) unsigned NOT NULL,
  `default_cover_id` int(2) DEFAULT NULL,
  `photo_data_id` int(11) unsigned DEFAULT NULL,
  `cover_data_id` int(2) DEFAULT NULL,
  `partition_id` int(11) NOT NULL,
  `user_uuid` varchar(256) COLLATE utf8_bin NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '5',
  `s_change_date` date DEFAULT NULL,
  `profile_iptv` int(2) unsigned NOT NULL DEFAULT '7',
  `profile_tsm` int(2) unsigned NOT NULL DEFAULT '0',
  `verification_code` varchar(7) COLLATE utf8_bin DEFAULT 'poxel',
  `promo_code` varchar(7) COLLATE utf8_bin NOT NULL,
  `reset_password_token` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`email`,`partition_id`,`profile_tsm`),
  UNIQUE KEY `phone` (`phone`,`partition_id`,`profile_tsm`),
  KEY `FK_user_status` (`status`),
  KEY `FK_user` (`partition_id`),
  KEY `FK_user_pt` (`profile_tsm`),
  KEY `FK_user_pi` (`profile_iptv`),
  CONSTRAINT `FK_user` FOREIGN KEY (`partition_id`) REFERENCES `core_partitions` (`partition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_pi` FOREIGN KEY (`profile_iptv`) REFERENCES `u_profile_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_pt` FOREIGN KEY (`profile_tsm`) REFERENCES `u_profile_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_status` FOREIGN KEY (`status`) REFERENCES `status_lcp` (`key`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13120 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `user_account` */

DROP TABLE IF EXISTS `user_account`;

CREATE TABLE `user_account` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(15) unsigned NOT NULL,
  `account_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`user_id`,`account_id`),
  KEY `FK_user_account_a` (`account_id`),
  CONSTRAINT `FK_user_account_a` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_account_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24430 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `user_tsm_profile` */

DROP TABLE IF EXISTS `user_tsm_profile`;

CREATE TABLE `user_tsm_profile` (
  `user_id` int(15) unsigned NOT NULL,
  `home_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `home_city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `home_state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `home_zip` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `home_country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `work_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `work_city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `work_state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `work_zip` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `work_country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `default_language` int(1) unsigned DEFAULT NULL,
  `default_car` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `FK_user_tsm_profile` (`default_language`),
  CONSTRAINT `FK_user_tsm_profile` FOREIGN KEY (`default_language`) REFERENCES `g_language_lcp` (`value`),
  CONSTRAINT `FK_user_tsm_profile_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `wtb_minutes` */

DROP TABLE IF EXISTS `wtb_minutes`;

CREATE TABLE `wtb_minutes` (
  `session` varchar(250) COLLATE utf8_bin DEFAULT 'NULL',
  `user` varchar(64) COLLATE utf8_bin NOT NULL,
  `application` varchar(64) COLLATE utf8_bin NOT NULL,
  `total` int(11) NOT NULL,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `wtb_token_test` */

DROP TABLE IF EXISTS `wtb_token_test`;

CREATE TABLE `wtb_token_test` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `server_info` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `destroyed_at` datetime DEFAULT NULL,
  `used_count` int(15) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `wtb_tokens` */

DROP TABLE IF EXISTS `wtb_tokens`;

CREATE TABLE `wtb_tokens` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `IP` varchar(64) COLLATE utf8_bin DEFAULT '0.0.0.0',
  `TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
