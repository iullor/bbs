-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `public_sign`
--

DROP TABLE IF EXISTS `public_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_sign` (
  `id` varchar(64) NOT NULL COMMENT '公示板id',
  `title` varchar(16) NOT NULL COMMENT '标题16个字符',
  `content` varchar(100) NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `user_id` varchar(64) NOT NULL COMMENT '公示的人id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_sign_id_uindex` (`id`),
  KEY `public_sign_t_user_id_fk` (`user_id`),
  CONSTRAINT `public_sign_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公示板(简明扼要)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_sign`
--

LOCK TABLES `public_sign` WRITE;
/*!40000 ALTER TABLE `public_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_area`
--

DROP TABLE IF EXISTS `t_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_area` (
  `id` varchar(64) NOT NULL COMMENT '分区id',
  `area_name` varchar(64) NOT NULL COMMENT '分区的名字',
  `create_date` datetime NOT NULL COMMENT '分区的创建的时间',
  `posts_count` int(11) NOT NULL COMMENT '分区里面包含的贴子数',
  `board_id` varchar(64) NOT NULL COMMENT '受板块id管理',
  `status` varchar(16) NOT NULL COMMENT '分区状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_area_id_uindex` (`id`),
  KEY `t_area_t_board_id_fk` (`board_id`),
  CONSTRAINT `t_area_t_board_id_fk` FOREIGN KEY (`board_id`) REFERENCES `t_board` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_area`
--

LOCK TABLES `t_area` WRITE;
/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_board`
--

DROP TABLE IF EXISTS `t_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_board` (
  `id` varchar(64) NOT NULL,
  `board_type` varchar(64) NOT NULL COMMENT '板块的类型，由程序决定',
  `board_name` varchar(16) NOT NULL COMMENT '板块名称，简短',
  `board_description` varchar(200) NOT NULL COMMENT '板块描述200',
  `create_time` datetime NOT NULL COMMENT '板块的创建时间',
  `area_count` int(11) NOT NULL COMMENT '区的个数',
  `panel_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_board_id_uindex` (`id`),
  KEY `t_board_t_panel_id_fk` (`panel_id`),
  CONSTRAINT `t_board_t_panel_id_fk` FOREIGN KEY (`panel_id`) REFERENCES `t_panel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_board`
--

LOCK TABLES `t_board` WRITE;
/*!40000 ALTER TABLE `t_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_collections`
--

DROP TABLE IF EXISTS `t_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_collections` (
  `id` varchar(64) NOT NULL COMMENT '用户收藏表',
  `user_id` varchar(64) NOT NULL COMMENT '受用户id管理，一个用户可以有多个收藏',
  `post_id` varchar(64) NOT NULL COMMENT '受贴子的id管理',
  `create_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_collections_id_uindex` (`id`),
  KEY `t_collections_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_collections_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_collections`
--

LOCK TABLES `t_collections` WRITE;
/*!40000 ALTER TABLE `t_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comment` (
  `id` varchar(64) NOT NULL COMMENT '评论的id',
  `post_id` varchar(64) NOT NULL COMMENT '受post_id约束，贴子的id，挂在贴子下面',
  `comment_content` varchar(200) NOT NULL COMMENT '评论内容',
  `comment_from_uid` varchar(64) NOT NULL COMMENT '评论者的id，谁评论了',
  `create_time` datetime NOT NULL COMMENT '评论的时间',
  `comment_from_unickname` varchar(64) NOT NULL COMMENT '评论者的网名',
  `comment_from_uheadImage` varchar(64) NOT NULL COMMENT '评论者的头像',
  PRIMARY KEY (`id`),
  KEY `t_comment_t_post_id_fk` (`post_id`),
  KEY `t_comment_t_user_id_fk` (`comment_from_uid`),
  CONSTRAINT `t_comment_t_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `t_post` (`id`),
  CONSTRAINT `t_comment_t_user_id_fk` FOREIGN KEY (`comment_from_uid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment_reply`
--

DROP TABLE IF EXISTS `t_comment_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comment_reply` (
  `id` varchar(64) NOT NULL COMMENT '回复表id',
  `comment_id` varchar(64) NOT NULL COMMENT '回复的评论的id',
  `reply_id` varchar(64) NOT NULL COMMENT '回复：回复的id',
  `reply_type` int(11) NOT NULL COMMENT '回复类型是 评论还是回复',
  `reply_content` varchar(100) NOT NULL COMMENT '回复的内容',
  `from_user_id` varchar(64) NOT NULL COMMENT '回复用户的id',
  `to_user_id` varchar(64) NOT NULL COMMENT '被回复用户的id',
  `createdate` datetime NOT NULL COMMENT '回复的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_comment_reply_id_uindex` (`id`),
  KEY `t_comment_reply_t_comment_id_fk` (`comment_id`),
  KEY `t_comment_reply_t_user_id_fk` (`from_user_id`),
  KEY `t_comment_reply_t_user_id_fk_2` (`to_user_id`),
  CONSTRAINT `t_comment_reply_t_comment_id_fk` FOREIGN KEY (`comment_id`) REFERENCES `t_comment` (`id`),
  CONSTRAINT `t_comment_reply_t_user_id_fk` FOREIGN KEY (`from_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_reply_t_user_id_fk_2` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment_reply`
--

LOCK TABLES `t_comment_reply` WRITE;
/*!40000 ALTER TABLE `t_comment_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_comment_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_file`
--

DROP TABLE IF EXISTS `t_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_file` (
  `id` varchar(64) NOT NULL COMMENT '文件上传id',
  `user_id` varchar(64) NOT NULL COMMENT '上传的用户',
  `file_type` int(11) NOT NULL COMMENT '文件的类型，由程序决定',
  `size` int(11) NOT NULL COMMENT '文件的大小',
  `path` varchar(200) NOT NULL COMMENT '文件存放的位置',
  `original_name` varchar(100) NOT NULL COMMENT '最初的名字',
  `final_name` varchar(100) NOT NULL COMMENT '程序加工后的名字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_file_id_uindex` (`id`),
  KEY `t_file_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_file_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_file`
--

LOCK TABLES `t_file` WRITE;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_login_information`
--

DROP TABLE IF EXISTS `t_login_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_login_information` (
  `id` varchar(64) NOT NULL COMMENT '用户登录的信息',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `ip_adress` varchar(64) NOT NULL COMMENT 'ip地址',
  `access_time` datetime NOT NULL COMMENT '访问时间',
  `left_time` datetime NOT NULL COMMENT '离开时间',
  `history_access` int(11) NOT NULL COMMENT '历史访问时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_login_information_id_uindex` (`id`),
  KEY `t_login_information_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_login_information_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录的信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_information`
--

LOCK TABLES `t_login_information` WRITE;
/*!40000 ALTER TABLE `t_login_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_login_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_panel`
--

DROP TABLE IF EXISTS `t_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_panel` (
  `id` varchar(64) NOT NULL,
  `t_title` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_panel_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_panel`
--

LOCK TABLES `t_panel` WRITE;
/*!40000 ALTER TABLE `t_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_post`
--

DROP TABLE IF EXISTS `t_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_post` (
  `id` varchar(64) NOT NULL COMMENT '贴子的id',
  `user_id` varchar(64) NOT NULL COMMENT '受user_id约束，发帖的用户',
  `post_type` varchar(16) NOT NULL COMMENT '贴子的类型，程序中指定',
  `post_title` varchar(64) NOT NULL COMMENT '贴子的标题，字数限制<64',
  `post_content` mediumtext NOT NULL COMMENT '贴子的内容',
  `post_footer` varchar(200) NOT NULL COMMENT '贴子的标注',
  `create_time` datetime NOT NULL COMMENT '贴子的创建时间',
  `board_id` varchar(64) NOT NULL COMMENT '受board_id约束',
  `area_id` varchar(64) NOT NULL COMMENT '受area_id约束',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_post_id_uindex` (`id`),
  KEY `t_post_t_area_id_fk` (`area_id`),
  KEY `t_post_t_board_id_fk` (`board_id`),
  CONSTRAINT `t_post_t_area_id_fk` FOREIGN KEY (`area_id`) REFERENCES `t_area` (`id`),
  CONSTRAINT `t_post_t_board_id_fk` FOREIGN KEY (`board_id`) REFERENCES `t_board` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贴子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_post`
--

LOCK TABLES `t_post` WRITE;
/*!40000 ALTER TABLE `t_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `id` varchar(64) NOT NULL COMMENT 'id，主键非空不自增',
  `role` varchar(16) NOT NULL COMMENT '角色',
  `permission` varchar(16) NOT NULL COMMENT '权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_role_permission_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_test`
--

DROP TABLE IF EXISTS `t_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_test` (
  `id` int(11) DEFAULT NULL,
  `info` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_test`
--

LOCK TABLES `t_test` WRITE;
/*!40000 ALTER TABLE `t_test` DISABLE KEYS */;
INSERT INTO `t_test` VALUES (1,'info1'),(2,'1'),(3,'1afdsafd'),(4,'1afdsafdaaaaaaaaaaaaaaaaaaa'),(5,'1afdsafdaaaaaaaaaaaaaaaaa$$aa'),(6,'1afdsafdaaaaaaaaaaaaaa3333##aaa$$aa'),(7,'明天'),(8,'啦啦啦啦');
/*!40000 ALTER TABLE `t_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` varchar(64) NOT NULL COMMENT '用户表的id，不自增',
  `username` varchar(64) NOT NULL COMMENT '用户名，必填',
  `password` varchar(100) NOT NULL COMMENT '密码，必填',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期，必填',
  `nick_name` varchar(64) DEFAULT NULL COMMENT '昵称，选填，空，显示用户名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(10) NOT NULL DEFAULT '103' COMMENT '激活状态，默认为0，激活为1',
  `head_image` varchar(200) DEFAULT NULL COMMENT '头像，存放的是路径，选填',
  `hobbies` varchar(200) DEFAULT NULL COMMENT '兴趣爱好',
  `phome_number` varchar(64) DEFAULT NULL COMMENT '个人电话号码，必填',
  `email` varchar(64) NOT NULL COMMENT '邮箱，必填',
  `qq_number` varchar(64) DEFAULT NULL COMMENT 'qq号，可以为空',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `street` varchar(100) DEFAULT NULL COMMENT '街道',
  `details` varchar(250) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_user_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('4893504efb3d442c83279ea1c30e1717','gyl','123',NULL,'G',NULL,'103',NULL,NULL,NULL,'928039229@qq.com',NULL,NULL,NULL,NULL,NULL,NULL),('c2b53583abc745c486860c9809fb0230','root','admin',NULL,'root',NULL,'104',NULL,NULL,NULL,'928039229@qq.com',NULL,NULL,NULL,NULL,NULL,NULL),('f7e813fa394e431686ee0c9ce77a8929','iullor','admin',NULL,'iullor',NULL,'104',NULL,NULL,NULL,'928039229@qq.com',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles_permissions`
--

DROP TABLE IF EXISTS `user_roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles_permissions` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '外键，非空，受用户表id控制',
  `role_id` varchar(64) NOT NULL COMMENT '外键，受，用户权限表约束',
  `permission` varchar(64) NOT NULL COMMENT '角色权限表中',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roles_permissions_id_uindex` (`id`),
  KEY `user_roles_permissions_t_role_permission_id_fk` (`role_id`),
  KEY `user_roles_permissions_t_user_id_fk` (`user_id`),
  CONSTRAINT `user_roles_permissions_t_role_permission_id_fk` FOREIGN KEY (`role_id`) REFERENCES `t_role_permission` (`id`),
  CONSTRAINT `user_roles_permissions_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles_permissions`
--

LOCK TABLES `user_roles_permissions` WRITE;
/*!40000 ALTER TABLE `user_roles_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-09 15:46:58
