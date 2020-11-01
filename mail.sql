# Host: 127.0.0.1  (Version 5.5.15)
# Date: 2020-01-16 16:03:20
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "contactinfo"
#
create database mail;
use mail;
DROP TABLE IF EXISTS `contactinfo`;
CREATE TABLE `contactinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mailname` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "contactinfo"
#

INSERT INTO `contactinfo` VALUES (1,'呼呼','huhu@cc.com','15565656665','huhu',2),(2,'呼呼','huhu@cc.com','15565656665','呼呼1',3),(3,'西西','xixi@cc.com','18777778787','西西',3),(4,'呼呼','huhu@cc.com','155454444333','呼呼',4);

#
# Structure for table "fujian"
#

DROP TABLE IF EXISTS `fujian`;
CREATE TABLE `fujian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `fjname` varchar(50) DEFAULT NULL,
  `fjurl` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "fujian"
#


#
# Structure for table "messageinfo"
#

DROP TABLE IF EXISTS `messageinfo`;
CREATE TABLE `messageinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromu` varchar(50) DEFAULT NULL,
  `touser` varchar(50) DEFAULT NULL,
  `fssj` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `zt` varchar(20) DEFAULT NULL,
  `dshi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "messageinfo"
#

INSERT INTO `messageinfo` VALUES (1,'huhu@cc.com','xixi@cc.com','01月12日','你好呀你','你好呀交个朋友','草稿',NULL),(2,'huhu@cc.com','xixi@cc.com','01月12日','上班通知','上班通知','已发送',NULL),(3,'xixi@cc.com','huhu@cc.com','01月12日','nnn','nnn','已发送',NULL),(4,'huhu@cc.com','xixi@cc.com','01月12日','fffffff','fffff','草稿',NULL),(5,'huhu@cc.com','xixi@cc.com','01月14日','bibi','bibi','草稿',NULL),(6,'bibi@cc.com','xixi@cc.com','01月14日','元宵节快乐','你好，元宵节快乐','草稿',NULL),(7,'bibi@cc.com','huhu@cc.com','01月14日','新年快乐','新年快乐','草稿',NULL),(8,'','','01月14日','asdfsdfsadf','','草稿',NULL),(9,'huhu@cc.com','','01月14日','','','草稿',NULL),(10,'huhu@cc.com','','01月14日','','<p><span style=\"color: rgb(255, 0, 0);\">vvvvvvvvvvvvvvvv</span></p>','草稿',NULL),(11,'huhu@cc.com','','01月14日','','<p><img src=\"/mail//ueditor/jsp/upload/image/20170214/1487039970920023856.png\" title=\"1487039970920023856.png\" alt=\"QQ截图20170214103513.png\"/></p>','草稿',NULL),(12,'','','01月14日','','<p style=\"line-height: 16px;\"><img src=\"http://localhost:8080/mail/dialogs/attachment/fileTypeImages/icon_xls.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/mail//ueditor/jsp/upload/file/20170214/1487043790182055887.xls\" title=\"新建 Microsoft Office Excel 97-2003 工作表.xls\">新建 Microsoft Office Excel 97-2003 工作表.xls</a></p><p><br/></p>','草稿',NULL),(13,'huhu@cc.com','','01月14日','','<p>你好<br/></p><p><span style=\"color: rgb(255, 0, 0);\">你好</span></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(255, 0, 0);\"></span></p><p style=\"line-height: 16px;\"><img src=\"http://localhost:8080/mail/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/mail/ueditor/jsp/upload/file/20170214/1487044089998010425.rar\" title=\"录像.rar\">录像.rar</a></p><p style=\"line-height: 16px;\"><img src=\"http://localhost:8080/mail/dialogs/attachment/fileTypeImages/icon_xls.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/mail/ueditor/jsp/upload/file/20170214/1487044090018069633.xls\" title=\"测试文档.xls\">测试文档.xls</a></p><p><span style=\"color: rgb(255, 0, 0);\"><br/></span><br/></p>','草稿',NULL),(14,'bibi@cc.com','huhu@cc.com','01月16日','明天下午一起去打球','<p>明天下午一起去打球，你说好不好</p>','已发送',NULL),(15,'lili@cc.com','huhu@cc.com','01月16日','明天下课一起去看电影','<p>明天下课一起去看电影</p>','草稿',NULL);

#
# Structure for table "userinfo"
#

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `upwd` varchar(100) DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "userinfo"
#

INSERT INTO `userinfo` VALUES (1,'huhu@cc.com','123456','呼呼'),(2,'xixi@cc.com','123456','西西'),(3,'bibi@cc.com','123456','比比'),(4,'lili@cc.com','123456','丽丽');

#
# Structure for table "wenjianjia"
#

DROP TABLE IF EXISTS `wenjianjia`;
CREATE TABLE `wenjianjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "wenjianjia"
#

INSERT INTO `wenjianjia` VALUES (1,'huhu@cc.com','收件箱'),(2,'huhu@cc.com','发件箱'),(3,'huhu@cc.com','草稿箱'),(4,'huhu@cc.com','已删除'),(6,'huhu@cc.com','无用的'),(7,'xixi@cc.com','收件箱'),(8,'xixi@cc.com','发件箱'),(9,'xixi@cc.com','草稿箱'),(10,'xixi@cc.com','已删除'),(11,'xixi@cc.com','西西'),(12,'bibi@cc.com','收件箱'),(13,'bibi@cc.com','发件箱'),(14,'bibi@cc.com','草稿箱'),(15,'bibi@cc.com','已删除'),(16,'bibi@cc.com','常用邮件'),(17,'lili@cc.com','收件箱'),(18,'lili@cc.com','发件箱'),(19,'lili@cc.com','草稿箱'),(20,'lili@cc.com','已删除');

#
# Structure for table "wjxinfo"
#

DROP TABLE IF EXISTS `wjxinfo`;
CREATE TABLE `wjxinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wjjid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

#
# Data for table "wjxinfo"
#

INSERT INTO `wjxinfo` VALUES (3,7,2),(5,7,1),(6,8,3),(9,4,4),(19,6,5),(20,4,2),(21,10,3),(22,10,3),(23,10,3),(24,10,3),(27,10,3),(28,4,1),(29,10,3),(35,13,6),(36,7,6),(40,15,7),(41,0,8),(43,4,9),(46,0,12),(48,13,14),(49,1,14),(50,4,11),(51,4,10),(52,4,13),(54,18,15),(55,1,15),(56,6,3);
