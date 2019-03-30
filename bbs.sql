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
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: test_bbs.sql
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
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: test_bbs
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
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: test_bbs
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
-- Table structure for table `post_type`
--

DROP TABLE IF EXISTS `post_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='贴子类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_type`
--

LOCK TABLES `post_type` WRITE;
/*!40000 ALTER TABLE `post_type` DISABLE KEYS */;
INSERT INTO `post_type` VALUES (2,'闲文'),(4,'学术'),(5,'原创'),(6,'转载');
/*!40000 ALTER TABLE `post_type` ENABLE KEYS */;
UNLOCK TABLES;

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
  `user_id` varchar(64) DEFAULT NULL COMMENT '公示的人id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_sign_id_uindex` (`id`),
  KEY `public_sign_t_user_id_fk` (`user_id`),
  CONSTRAINT `public_sign_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
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
  `area_title` varchar(64) DEFAULT NULL COMMENT '分区的名字',
  `create_time` datetime NOT NULL COMMENT '分区的创建的时间',
  `status` int(11) DEFAULT '1' COMMENT '分区状态',
  `board_id` varchar(64) DEFAULT NULL COMMENT '受板块id管理',
  `info` varchar(250) DEFAULT NULL COMMENT '简介',
  `details` varchar(250) DEFAULT NULL COMMENT '详细信息',
  `user_id` varchar(64) DEFAULT NULL COMMENT '管理者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_area_id_uindex` (`id`),
  KEY `t_area_t_board_id_fk` (`board_id`),
  KEY `t_area_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_area_t_board_id_fk` FOREIGN KEY (`board_id`) REFERENCES `t_board` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_area_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_area`
--

LOCK TABLES `t_area` WRITE;
/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
INSERT INTO `t_area` VALUES ('0342169ec6a14f75ad18fff140cb6341','软件工程','2019-03-22 14:45:17',1,'2f608a3346db4880abb09d3f219b665b','软件工程','软件工程','7a565a48d8bd47948b3cd7a60149e6f7'),('3f9c01b1daa0488b8440fc9601656975','日常','2019-03-21 23:04:08',1,NULL,'明星的衣食住行','明星的衣食住行',NULL),('55edf69b31054633812a2bc0b4a6884e','计算机科学与技术','2019-03-21 00:00:00',1,'2f608a3346db4880abb09d3f219b665b','计算机科学与技术，是河南省重点的一流学科','计算机科学与技术，是河南省重点的一流学科','7a565a48d8bd47948b3cd7a60149e6f7'),('83e9c7d7729742e3a4151361f98e81d2','预防医学','2019-03-22 14:50:43',1,'3698468e79e3466e99731e66af28ea07','预防医学','预防医学','7a565a48d8bd47948b3cd7a60149e6f7'),('b23b5c6999064d11b1c0f4c9e8d0bdda','恋爱','2019-03-21 23:04:36',1,NULL,'无聊，就是乱呗','无聊，就是乱呗',NULL),('f9ecb5c57a2e487ca0055bb0a8283919',' 信息管理与信息系统','2019-03-22 14:46:48',1,'2f608a3346db4880abb09d3f219b665b',' 信息管理与信息系统',' 信息管理与信息系统','7a565a48d8bd47948b3cd7a60149e6f7');
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
  `board_title` varchar(250) NOT NULL COMMENT '板块名称，简短',
  `create_time` datetime NOT NULL COMMENT '板块的创建时间',
  `board_type` varchar(64) DEFAULT NULL COMMENT '板块的类型，由程序决定',
  `logo_path` varchar(250) DEFAULT NULL COMMENT 'logo的位置',
  `panel_id` varchar(64) DEFAULT NULL COMMENT '所属的panel',
  `user_id` varchar(64) DEFAULT NULL COMMENT '管理人',
  `info` varchar(250) DEFAULT NULL COMMENT '简介',
  `details` varchar(200) NOT NULL COMMENT '板块描述200',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_board_id_uindex` (`id`),
  KEY `t_board_t_panel_id_fk` (`panel_id`),
  KEY `t_board_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_board_t_panel_id_fk` FOREIGN KEY (`panel_id`) REFERENCES `t_panel` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_board_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_board`
--

LOCK TABLES `t_board` WRITE;
/*!40000 ALTER TABLE `t_board` DISABLE KEYS */;
INSERT INTO `t_board` VALUES ('2f608a3346db4880abb09d3f219b665b','信息技术学院','2019-03-15 15:44:39','院系名字','/home/gyl/git_repository/bbs/src/main/webapp/upload/board/computer1553183871625.svg','baf074ac521142e48e9a6bda93bd0861','7a565a48d8bd47948b3cd7a60149e6f7','啦啦啦啦','啦啦啦啦'),('3698468e79e3466e99731e66af28ea07','基础医学院','2019-03-22 14:44:53','院系','/home/gyl/git_repository/bbs/src/main/webapp/upload/board/fire1553237073453.svg','baf074ac521142e48e9a6bda93bd0861','7a565a48d8bd47948b3cd7a60149e6f7','基础医学院','基础医学院');
/*!40000 ALTER TABLE `t_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_broken_rules_users`
--

DROP TABLE IF EXISTS `t_broken_rules_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_broken_rules_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `times` int(11) DEFAULT '0' COMMENT '违规次数',
  `info` text COMMENT '违规信息',
  `user_id` varchar(64) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`),
  KEY `t_broken_rules_users_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_broken_rules_users_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违规用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_broken_rules_users`
--

LOCK TABLES `t_broken_rules_users` WRITE;
/*!40000 ALTER TABLE `t_broken_rules_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_broken_rules_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_collections`
--

DROP TABLE IF EXISTS `t_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_collections` (
  `id` varchar(64) NOT NULL COMMENT '用户收藏表',
  `current_user_id` varchar(64) NOT NULL COMMENT '当前的用户id',
  `user_id` varchar(64) DEFAULT NULL COMMENT '受用户id管理，一个用户可以有多个收藏',
  `post_id` varchar(64) DEFAULT NULL COMMENT '受贴子的id管理',
  `area_id` varchar(64) DEFAULT NULL COMMENT '收藏分区',
  `create_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_collections_id_uindex` (`id`),
  KEY `t_collections_t_user_id_fk` (`user_id`),
  KEY `t_collections_t_area_id_fk` (`area_id`),
  KEY `t_collections_t_post_id_fk` (`post_id`),
  KEY `t_collections_t_user_id_fk_2` (`current_user_id`),
  CONSTRAINT `t_collections_t_area_id_fk` FOREIGN KEY (`area_id`) REFERENCES `t_area` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_collections_t_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `t_post` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_collections_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_collections_t_user_id_fk_2` FOREIGN KEY (`current_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_collections`
--

LOCK TABLES `t_collections` WRITE;
/*!40000 ALTER TABLE `t_collections` DISABLE KEYS */;
INSERT INTO `t_collections` VALUES ('122407a2b3454c7bac20e27d44171d6b','c2b53583abc745c486860c9809fb0230',NULL,NULL,NULL,'2019-03-28 01:07:10'),('2898ed9fbe2d491ca3301259bcf311e3','c2b53583abc745c486860c9809fb0230',NULL,'a68babcc3e4b4c3897536e2060b472e9',NULL,'2019-03-29 18:41:15'),('2c094f6808514cd9ab1a27e504e79d28','c2b53583abc745c486860c9809fb0230',NULL,NULL,'3f9c01b1daa0488b8440fc9601656975','2019-03-28 21:49:44'),('3ffbe62cd3b44782a839f94ea2cec497','c2b53583abc745c486860c9809fb0230',NULL,NULL,'0342169ec6a14f75ad18fff140cb6341','2019-03-28 15:06:32'),('41f5e32b26174a618e87afb13f52f695','c2b53583abc745c486860c9809fb0230','7a565a48d8bd47948b3cd7a60149e6f7',NULL,NULL,'2019-03-29 15:44:27'),('445ef78cc05b4d0590023f407e3b04f1','c2b53583abc745c486860c9809fb0230',NULL,NULL,NULL,'2019-03-28 21:48:04'),('47115532ac8b4785adf8eb28d808cf28','c2b53583abc745c486860c9809fb0230',NULL,NULL,NULL,'2019-03-28 21:29:13'),('b5280beb61cc4318888ba1f620b57d8c','7a565a48d8bd47948b3cd7a60149e6f7',NULL,NULL,NULL,'2019-03-28 21:04:07'),('e87c9b248da04973bb9774afddece46a','c2b53583abc745c486860c9809fb0230',NULL,NULL,NULL,'2019-03-28 21:49:34'),('f75ac7fb9f6c4f8e957c2dc3349caa07','c2b53583abc745c486860c9809fb0230',NULL,NULL,NULL,'2019-03-28 17:32:09'),('fdf1dd2e83394a4881bb75a1eb05ac91','c2b53583abc745c486860c9809fb0230',NULL,NULL,'55edf69b31054633812a2bc0b4a6884e','2019-03-28 15:06:42'),('fead050d0ec2454782749a8cdab96424','c2b53583abc745c486860c9809fb0230',NULL,NULL,NULL,'2019-03-28 21:54:49');
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
  `post_id` varchar(64) DEFAULT NULL COMMENT '受post_id约束，贴子的id，挂在贴子下面',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `user_id` varchar(64) DEFAULT NULL COMMENT '评论者的id，谁评论了',
  `create_time` datetime NOT NULL COMMENT '评论的时间',
  `prises` int(11) DEFAULT NULL COMMENT '点赞数',
  PRIMARY KEY (`id`),
  KEY `t_comment_t_post_id_fk` (`post_id`),
  KEY `t_comment_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_comment_t_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `t_post` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_comment_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES ('09aed5e069ef4b06b997a5387e799581','a68babcc3e4b4c3897536e2060b472e9','<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/>啦啦啦啦啦了</p>','c2b53583abc745c486860c9809fb0230','2019-03-29 18:29:22',NULL),('394e00858e934a37ac731d018f982bbb','18ea8abd2c0e4b3b89c7af6fa30acdce','<p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p>','7a565a48d8bd47948b3cd7a60149e6f7','2019-03-24 20:05:45',NULL),('3f9c01b1daa0488b8440fc9601656915','18ea8abd2c0e4b3b89c7af6fa30acdce','hhahaha',NULL,'2019-03-24 10:31:44',NULL),('47fa2b8adfeb4fef93093c4d04f2006d','a68babcc3e4b4c3897536e2060b472e9','<p><img src=\"http://img.baidu.com/hi/jx2/j_0011.gif\"/></p>','c2b53583abc745c486860c9809fb0230','2019-03-29 22:55:43',NULL),('9311de2241b74283886fdd8d8e58bb47','a68babcc3e4b4c3897536e2060b472e9','<p>啦啦啦啦，轰炸区</p>','c2b53583abc745c486860c9809fb0230','2019-03-29 18:42:44',NULL),('c4999098553847a08616229addf9a62d','18ea8abd2c0e4b3b89c7af6fa30acdce','<p>你是不错的<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>','c2b53583abc745c486860c9809fb0230','2019-03-29 18:27:34',NULL),('fbbbb1a96cf54752a9a8b7f7d96166f0','18ea8abd2c0e4b3b89c7af6fa30acdce','<p>哈不错<img src=\"http://img.baidu.com/hi/jx2/j_0009.gif\"/></p>','7a565a48d8bd47948b3cd7a60149e6f7','2019-03-24 20:02:18',NULL);
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
  `to_comment_id` varchar(64) NOT NULL COMMENT '回复的评论的id',
  `reply_id` varchar(64) DEFAULT NULL COMMENT '回复：回复的id',
  `reply_type` int(11) DEFAULT NULL COMMENT '回复类型是 评论还是回复',
  `reply_content` varchar(100) NOT NULL COMMENT '回复的内容',
  `from_user_id` varchar(64) DEFAULT NULL COMMENT '回复用户的id',
  `to_user_id` varchar(64) DEFAULT NULL COMMENT '被回复用户的id',
  `create_time` datetime NOT NULL COMMENT '回复的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_comment_reply_id_uindex` (`id`),
  KEY `t_comment_reply_t_comment_id_fk` (`to_comment_id`),
  KEY `t_comment_reply_t_user_id_fk` (`from_user_id`),
  KEY `t_comment_reply_t_user_id_fk_2` (`to_user_id`),
  CONSTRAINT `t_comment_reply_t_comment_id_fk` FOREIGN KEY (`to_comment_id`) REFERENCES `t_comment` (`id`),
  CONSTRAINT `t_comment_reply_t_user_id_fk` FOREIGN KEY (`from_user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_comment_reply_t_user_id_fk_2` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment_reply`
--

LOCK TABLES `t_comment_reply` WRITE;
/*!40000 ALTER TABLE `t_comment_reply` DISABLE KEYS */;
INSERT INTO `t_comment_reply` VALUES ('ae1bac9dbc494ee88e434ab12931560b','47fa2b8adfeb4fef93093c4d04f2006d',NULL,NULL,'<p>你真傻呀<img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p>','c2b53583abc745c486860c9809fb0230','c2b53583abc745c486860c9809fb0230','2019-03-29 22:56:17'),('db323fa4861a48d6ace845aa2c79f4d3','09aed5e069ef4b06b997a5387e799581',NULL,NULL,'<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/>，啦啦啦啦啦啦啦</p>','c2b53583abc745c486860c9809fb0230','c2b53583abc745c486860c9809fb0230','2019-03-29 21:31:23');
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
-- Table structure for table `t_panel`
--

DROP TABLE IF EXISTS `t_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_panel` (
  `id` varchar(64) NOT NULL,
  `title` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  `logo_path` varchar(200) DEFAULT NULL,
  `info` text,
  `detail` text,
  `user_manager_id` varchar(64) DEFAULT NULL,
  `is_disabeld` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_panel_id_uindex` (`id`),
  KEY `t_panel_t_user_id_fk` (`user_manager_id`),
  CONSTRAINT `t_panel_t_user_id_fk` FOREIGN KEY (`user_manager_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_panel`
--

LOCK TABLES `t_panel` WRITE;
/*!40000 ALTER TABLE `t_panel` DISABLE KEYS */;
INSERT INTO `t_panel` VALUES ('baf074ac521142e48e9a6bda93bd0861','院系','2019-03-14 00:00:00','/home/gyl/git_repository/bbs/src/main/webapp/upload/panel/school1553183789729.svg','河南中医药大学','河南中医药大学','7a565a48d8bd47948b3cd7a60149e6f7',1),('c59d22df39b846d59c2be4b335aa7eec','谈天说地','2019-03-21 00:00:00','/home/gyl/git_repository/bbs/src/main/webapp/upload/panel/news1553183767935.png','谈天说地，无所不说','谈天说地，无所不说，啦啦啦啦','7a565a48d8bd47948b3cd7a60149e6f7',1);
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
  `user_id` varchar(64) DEFAULT NULL COMMENT '受user_id约束，发帖的用户',
  `post_type` int(11) DEFAULT NULL COMMENT '贴子的类型，程序中指定',
  `post_title` varchar(64) NOT NULL COMMENT '贴子的标题，字数限制<64',
  `post_content` mediumtext NOT NULL COMMENT '贴子的内容',
  `create_time` datetime NOT NULL COMMENT '贴子的创建时间',
  `board_id` varchar(64) DEFAULT NULL COMMENT '受board_id约束',
  `area_id` varchar(64) DEFAULT NULL COMMENT '受area_id约束',
  `participants` int(11) DEFAULT NULL COMMENT '贴子的参与人数',
  `praise` int(11) DEFAULT NULL COMMENT '点赞数',
  `comments` int(11) DEFAULT NULL COMMENT '评论数',
  `ban_comment` int(2) DEFAULT NULL COMMENT '禁止评论',
  `up` int(2) DEFAULT NULL COMMENT '置顶，默认是0，有级别',
  `secret` int(11) DEFAULT NULL COMMENT '是否公开，默认公开1，私密0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_post_id_uindex` (`id`),
  KEY `t_post_t_area_id_fk` (`area_id`),
  KEY `t_post_t_board_id_fk` (`board_id`),
  KEY `t_post_post_type_id_fk` (`post_type`),
  CONSTRAINT `t_post_post_type_id_fk` FOREIGN KEY (`post_type`) REFERENCES `post_type` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_post_t_area_id_fk` FOREIGN KEY (`area_id`) REFERENCES `t_area` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_post_t_board_id_fk` FOREIGN KEY (`board_id`) REFERENCES `t_board` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贴子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_post`
--

LOCK TABLES `t_post` WRITE;
/*!40000 ALTER TABLE `t_post` DISABLE KEYS */;
INSERT INTO `t_post` VALUES ('18ea8abd2c0e4b3b89c7af6fa30acdce','7a565a48d8bd47948b3cd7a60149e6f7',4,'95岁特等功臣将报功书藏63年 子女只知道父亲当过兵','<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　原标题：95岁战斗英雄为何将报功书“藏”了63年</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　那张“报功书”，他“藏”了63年</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　——95岁战斗英雄张富清的故事</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　■田国松 朱 勇 解放军报特约记者 何武涛</p><p><img src=\"/ueditor/jsp/upload/image/20190324/1553401649476017346.jpg\" title=\"1553401649476017346.jpg\" alt=\"_lof-huqrnap3709640.jpg\"/><br/></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">初春的鄂西武陵山区，乍暖还寒。穿着厚厚棉袄的张富清老人，坐在客厅里的火炉旁烤着火。见到一身军装的记者，老人一下子单腿从凳子上站了起来，一旁的老伴迅速扶住他，生怕他摔倒。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　如果不是去年11月3日进行退役军人信息采集时，张富清拿出了泛黄的“报功书”，还有几枚奖章，几乎没人知道，这位95岁的老人，是一位特等功臣。他的子女只知道父亲当过兵，亲朋邻里只知道老人是县银行离休的副行长。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　为什么老人之前从未表明过自己的赫赫战功？“封存”荣誉的背后，他坚守的究竟是什么？</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　3月初，我们从湖北武汉乘车前往来凤县，探访张富清老人。虽已年过耄耋，听力几近丧失，但老人精神矍铄，声音洪亮，见到部队来的人，显得格外激动。聊天中，老人情不自禁地唱起了革命战争年代的军歌，记忆也回溯到那段峥嵘岁月。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　少时·征战</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　“一冲上阵地，满脑子就是消灭敌人，决定胜败的关键是信仰、意志和勇气”</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　1924年，张富清出生于陕西汉中洋县，1948年3月参加西北野战军，在二纵队359旅718团二营六连当战士。老人说，他到部队后，经常不分白天黑夜地打仗，印象最深的是永丰战役。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　永丰战役时，张富清所在的六连担任突击连。那天拂晓，他和两名战友组成突击组，匍匐前进率先攀上永丰城墙。他第一个跳下城墙，和敌人展开激战。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　“我端着冲锋枪，对着敌人一阵猛扫，一下子把近距离的7、8个敌人全部消灭了。”说起这段战斗经历，老人手舞足蹈，仿佛回到了当年的战场。他说，等他回过神来，才感觉头顶有血往下流，用手一摸，一块头皮翻了起来。他这才意识到，一颗子弹刚刚擦着他的头皮飞过，在头顶留下一条浅沟。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　击退外围敌人后，张富清冲到一座碉堡下，刨出一个土坑，把捆在一起的8颗手榴弹和一个炸药包码在一起，将碉堡炸毁。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　这场战斗一直打到天亮，他炸毁了两座碉堡，缴获两挺机枪。战斗结束，他死里逃生，突击组的另外两名战友却再也没回来。回想起在战斗中壮烈牺牲的战友，张富清老泪纵横。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　老人说，打仗时他多次参加突击组打头阵，但当年他的身体其实很瘦弱，打胜仗的关键是不怕死。“一冲上阵地，满脑子就是消灭敌人，决定胜败的关键是信仰、意志和勇气。”说起打仗的诀窍，老人仍一脸自豪。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　永丰战役后，彭德怀到连队视察，接见张富清和突击组战士。彭德怀握着他的手说：“你在永丰战役表现突出，立下了大功。”当时张富清很受鼓舞：“作为一名革命军人、一个共产党员，我做了应该做的，完成了任务，组织上给我这样大的荣誉，我非常感动。”</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　后来，张富清一直跟随部队南征北战，先后两次荣获“战斗英雄”荣誉称号，除了“报功书”上提到的“特等功”，还3次荣立一等功，1次荣立二等功。</p><p><br/></p>','2019-03-24 12:28:31','2f608a3346db4880abb09d3f219b665b','0342169ec6a14f75ad18fff140cb6341',1,11,221,1,0,0),('22a62d76d3694876a0c15e4d8862b9ee','c2b53583abc745c486860c9809fb0230',6,'索尼宣布将关闭北京工厂 以削减成本扭亏为盈','<p><img src=\"https://pics3.baidu.com/feed/2934349b033b5bb51f235cb4947a403db700bc36.jpeg?token=4eb088e5d37c362a1692fc58ac850cf2&s=AE8245856A71AADA06955C0B03003040\"/></p><p><br/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">站长之家3月28日消息:据路透社消息，本周四，索尼公司发言人表示将在未来几天内关闭北京的智能手机工厂，并将该工厂的生产迁往泰国。以削减成本，并在明年初实现扭亏为盈。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">索尼的整体业绩一直都较强劲，但唯独智能手机业务这块比较薄弱。据今年 2 月初索尼公布的2018Q3 财报显示，索尼营业利润较上年同期增长14%，达到 8110 亿日元。但因其相机与智能手机业务销售低于预期，而下调了本财年的营收预测。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">数据显示，在过去的四个季度里，索尼手机业务共亏损了 1010 亿日元(约合61. 9 亿元人民币)。其主线产品Xperia系列智能手机在全球智能手机市场的份额仅占1%。为此，日前，索尼公司还宣布将于今年 4 月 1 日合并相机和手机等部门，并称重组之后Xperia有望在 2021 年盈利。</span></p><p><br/></p>','2019-03-28 17:33:12','2f608a3346db4880abb09d3f219b665b','0342169ec6a14f75ad18fff140cb6341',1,1,23,0,0,0),('2d53290a95354821a544bd4e272b02e2','c2b53583abc745c486860c9809fb0230',2,'继大学和高中之后 日本将编程列为小学必修课','<p><span class=\"bjh-strong\" style=\"font-size: 18px; color: rgb(51, 51, 51); font-weight: 700; font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">【环球网科技 记者 林迪】</span><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">日前，日本文部科学省公布了新的教科书鉴定结果，全日本所有小学要从2020年起开始使用这些教科书，其中，在算术和理科方面，编程教育作为新的必修内容加入了理科教科书中。</span></p><p><img src=\"https://pics3.baidu.com/feed/9f510fb30f2442a7ef2dd87cdf1d394fd01302ad.png?token=b6b706002d9c2362646f37ddce3c957b&s=BF904B815E3A7B94482D7C9A030050A0\"/></p><p><br/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">援引日本经济新闻消息，日本小学开展编程教育的目的，是培养孩子在信息应用方面的基本能力和逻辑思维能力。日本政府希望让孩子们从小学义务教育中，就开始接触编程，谁对此感兴趣，并且还有天赋，今后就会被培养成IT领域的专家或技术人才。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">据了解，按照新修改的小学6年级理科教科书，日本孩子将学会使用“点亮”、“熄灭”、“反复”等指令，让发光二极管(LED)按照预想的次数点亮熄灭。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">日媒评论称，IT与社会的联系越来越紧密，相关行业的国际竞争正在不断激烈化。但日本在IT教育方面很滞后，希望通过修改教科书来培养短缺的IT人才。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">对此，日本某编程教育推进团体代表理事利根川裕太表示：“考虑到教师的教学负担，(编程)目前在小学里就教到接触导入部分的程度比较合适”。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">但是，日本东洋大学信息合作专业的坂村健院长则对未来形势表示了担忧，“现在日本虽然把编程列为了小学必修内容了，但是和国外的教育比起来还远远不够。如果不把编程专门列为一门学科，并不断充实内容，日本还会在世界上落后。”</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">据环球网科技此前报道，早在去年5月17日，日本政府在未来投资会议上确认了在“大学入学共同考试”中引进编程等信息科目的方针。为了推动第4次工业革命，熟练使用人工智能(AI)等技术的IT人才是不可或缺的。日本政府预计未来可能出现人才不足，将加快人才的培育。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">日本已经决定到2022年度将包括编程在内的“信息I”科目加入到高中阶段的共同必修科目。今后，将以文部科学相林芳正为中心，以2022年度入学学生参加的2024年度大学入学共同考试为大体目标，进行引进信息科目的讨论。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">据日本经济产业省2016年公布的数据显示，如果IT市场保持中等水平发展，到2020年，日本国内的IT人才短缺规模将达到约29万人，到2030年将达到59万人。</span></p><p><br/></p>','2019-03-28 17:36:18','2f608a3346db4880abb09d3f219b665b','55edf69b31054633812a2bc0b4a6884e',1,11,23,0,0,0),('a68babcc3e4b4c3897536e2060b472e9','ff71c8516dc94e89b195d184438fd08b',5,'测试5','<p>cca</p>','2019-03-28 21:54:31','3698468e79e3466e99731e66af28ea07',NULL,3,1,3,0,0,0),('de7f1e33fc4b4c8d8d8cb9f54a048cd7','8f9178c03dee4d67b3fa0f9f49a1acfb',6,'测试4','<p>kjlhkjhkj</p><p>nhkljjhljlk</p><p>nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0023.gif\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>nnnnnnnnnnnnnnnnnnnnn</p>','2019-03-28 21:49:08',NULL,'3f9c01b1daa0488b8440fc9601656975',323,1111,232,0,0,0),('e8e9b33da7ef49a0b238b8e5c6e42922','7a565a48d8bd47948b3cd7a60149e6f7',4,'测试2','<p><img src=\"http://img.baidu.com/hi/jx2/j_0027.gif\"/>2313132</p>','2019-03-28 21:45:17','2f608a3346db4880abb09d3f219b665b','0342169ec6a14f75ad18fff140cb6341',4,1,32,0,0,0);
/*!40000 ALTER TABLE `t_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_public`
--

DROP TABLE IF EXISTS `t_public`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_public` (
  `id` varchar(64) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text,
  `user_id` varchar(64) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL COMMENT 'logoPath',
  PRIMARY KEY (`id`),
  KEY `t_public_t_user_id_fk` (`user_id`),
  CONSTRAINT `t_public_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广场';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_public`
--

LOCK TABLES `t_public` WRITE;
/*!40000 ALTER TABLE `t_public` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_public` ENABLE KEYS */;
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
  `nick_name` varchar(64) DEFAULT NULL COMMENT '昵称，选填，空，显示用户名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` varchar(10) NOT NULL DEFAULT '103' COMMENT '激活状态，默认为0，激活为1',
  `email` varchar(64) NOT NULL COMMENT '邮箱，必填',
  `head_image` varchar(200) DEFAULT NULL COMMENT '头像，存放的是路径，选填',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期，必填',
  `hobbies` varchar(200) DEFAULT NULL COMMENT '兴趣爱好',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '个人电话号码，必填',
  `qq_number` varchar(64) DEFAULT NULL COMMENT 'qq号，可以为空',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `street` varchar(100) DEFAULT NULL COMMENT '街道',
  `details` varchar(250) DEFAULT NULL COMMENT '详细地址',
  `ip_adreess` varchar(64) DEFAULT NULL COMMENT '登录的ip',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `left_time` datetime DEFAULT NULL COMMENT '离开时间',
  `access_num` int(11) DEFAULT '0' COMMENT '访问次数',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真名',
  `allow_post` int(11) DEFAULT '0' COMMENT '是否可以发帖',
  `allow_comment` int(11) DEFAULT '0' COMMENT '是否可以发帖',
  `waring_info` text COMMENT '警告信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_user_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('7a565a48d8bd47948b3cd7a60149e6f7','root','admin','超人','2019-03-09 17:00:48','1','vazquez@maildrop.cc','/home/gyl/git_repository/bbs/src/main/webapp/upload/headImage/超人1553228351521.png','2019-03-17 00:00:00','打篮球，电子产品','12345678912','258365412',44,'河南省','郑州','金水区','我就是超级用户','196.123.153.233','2019-03-17 12:59:22','2019-03-17 12:59:25',1,'root',0,1,'啊啊啊啊'),('c2b53583abc745c486860c9809fb0230','gyl','1','iullor','2019-03-09 07:51:19','1','928039229@qq.com','/home/gyl/git_repository/bbs/src/main/webapp/upload/headImage/boy1553184011835.svg','1995-10-17 00:00:00',NULL,'1321321321','45643211',22,'Ohio','Westerville','1808 James Martin Circle','Ohio Westerville','196.123.153.233','2019-03-18 14:05:55','2019-03-18 14:05:39',0,'gyl',1,1,'');
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
  `user_id` varchar(64) DEFAULT NULL COMMENT '外键，非空，受用户表id控制',
  `role_id` varchar(64) DEFAULT NULL COMMENT '外键，受，用户权限表约束',
  `permission` varchar(64) NOT NULL COMMENT '角色权限表中',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roles_permissions_id_uindex` (`id`),
  KEY `user_roles_permissions_t_role_permission_id_fk` (`role_id`),
  KEY `user_roles_permissions_t_user_id_fk` (`user_id`),
  CONSTRAINT `user_roles_permissions_t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE SET NULL
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

-- Dump completed on 2019-03-29 23:17:50
