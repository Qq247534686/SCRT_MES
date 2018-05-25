-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rfidsystem
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `bin`
--

DROP TABLE IF EXISTS `bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `binCode` varchar(255) DEFAULT NULL,
  `assLine` varchar(255) DEFAULT NULL,
  `linePoint` varchar(255) DEFAULT NULL,
  `stockId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin`
--

LOCK TABLES `bin` WRITE;
/*!40000 ALTER TABLE `bin` DISABLE KEYS */;
INSERT INTO `bin` VALUES (1,'B001','asdasd','asdasd',4),(2,'B002','aa','bb',4);
/*!40000 ALTER TABLE `bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charthistory`
--

DROP TABLE IF EXISTS `charthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock` varchar(255) DEFAULT NULL COMMENT '库位',
  `bin` varchar(255) DEFAULT NULL COMMENT '货道',
  `totalNumber` int(11) DEFAULT NULL,
  `depositTime` datetime DEFAULT NULL,
  `weeks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charthistory`
--

LOCK TABLES `charthistory` WRITE;
/*!40000 ALTER TABLE `charthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `charthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fromtorecord`
--

DROP TABLE IF EXISTS `fromtorecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fromtorecord` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `stockLocFrom` int(11) DEFAULT NULL,
  `stockBinFrom` int(11) DEFAULT NULL,
  `stockLocTo` varchar(11) DEFAULT NULL,
  `assLine` varchar(255) DEFAULT NULL,
  `linePoint` varchar(255) DEFAULT NULL,
  `totalNumber` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fromtorecord`
--

LOCK TABLES `fromtorecord` WRITE;
/*!40000 ALTER TABLE `fromtorecord` DISABLE KEYS */;
INSERT INTO `fromtorecord` VALUES (6,4,1,'6601','','',1),(25,4,2,'6601',NULL,NULL,3);
/*!40000 ALTER TABLE `fromtorecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant`
--

DROP TABLE IF EXISTS `plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plantCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant`
--

LOCK TABLES `plant` WRITE;
/*!40000 ALTER TABLE `plant` DISABLE KEYS */;
INSERT INTO `plant` VALUES (1,'SH00');
/*!40000 ALTER TABLE `plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_bound`
--

DROP TABLE IF EXISTS `rfid_bound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_bound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `werks` int(255) DEFAULT NULL COMMENT '工厂',
  `zpltn` varchar(255) DEFAULT NULL COMMENT '生产线',
  `matnr` varchar(255) DEFAULT NULL COMMENT '物料编号',
  `exidv` varchar(255) DEFAULT NULL COMMENT 'SKU号 ',
  `pt` int(255) DEFAULT NULL COMMENT '当前库位',
  `bin` int(11) DEFAULT NULL COMMENT '当前货道',
  `bounded` int(2) DEFAULT '2' COMMENT '是否绑定： 1绑定 2不绑定',
  `intime` datetime DEFAULT NULL COMMENT '入库时间',
  `inbin` int(2) DEFAULT '1' COMMENT '是否已入库： 1已入库 2未入库',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签表外键',
  `linePoint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_bound`
--

LOCK TABLES `rfid_bound` WRITE;
/*!40000 ALTER TABLE `rfid_bound` DISABLE KEYS */;
INSERT INTO `rfid_bound` VALUES (12,1,'asdasd',NULL,NULL,4,1,2,'2017-11-15 01:00:46',1,9,'asdasd'),(16,1,'asdas',NULL,NULL,4,2,2,'2017-11-15 01:00:55',1,8,'asdsad'),(21,1,'asdasd','ss','sss',4,2,2,'2017-11-16 03:46:19',1,9,'asdasd'),(27,1,'asdasd',NULL,NULL,4,1,2,'2017-11-16 04:06:09',1,8,'asdasd');
/*!40000 ALTER TABLE `rfid_bound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_tag`
--

DROP TABLE IF EXISTS `rfid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `empty_pt` varchar(255) DEFAULT NULL,
  `actived` int(2) DEFAULT '2' COMMENT '1:已激活，2:未激活',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_tag`
--

LOCK TABLES `rfid_tag` WRITE;
/*!40000 ALTER TABLE `rfid_tag` DISABLE KEYS */;
INSERT INTO `rfid_tag` VALUES (6,'001',NULL,1,'2017-11-22 17:16:22'),(7,'002',NULL,1,'2017-11-28 17:16:40'),(8,'E2004008651401780260F449','',1,'2017-11-30 17:16:43'),(9,'AD480103163A51746D000070',NULL,1,'2017-11-21 20:48:06');
/*!40000 ALTER TABLE `rfid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleinfo`
--

DROP TABLE IF EXISTS `roleinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(200) DEFAULT NULL,
  `roleRemarks` varchar(200) DEFAULT NULL COMMENT '角色表',
  `roleWithTreeName` varchar(1000) DEFAULT NULL,
  `roleWithTreeID` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleinfo`
--

LOCK TABLES `roleinfo` WRITE;
/*!40000 ALTER TABLE `roleinfo` DISABLE KEYS */;
INSERT INTO `roleinfo` VALUES (1,'系统管理员','所有权限','E-CALL管理系统,基础管理,标签管理,绑定信息,用户管理,用户信息,角色管理','1,2,4,5,3,7,8'),(2,'普通用户','s','基础管理,标签管理,绑定信息','2,4,5'),(3,'测试用户','cc','用户管理,用户信息,角色管理','3,7,8');
/*!40000 ALTER TABLE `roleinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockCode` varchar(255) DEFAULT NULL,
  `plantId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (2,'1101',1),(4,'1102',1),(5,'6601',1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmenu`
--

DROP TABLE IF EXISTS `systemmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmenu` (
  `menuID` int(11) NOT NULL COMMENT '系统菜单表',
  `menuName` varchar(200) DEFAULT NULL,
  `parentID` int(11) DEFAULT NULL,
  `nodeLevel` int(11) DEFAULT '0',
  `leaf` bit(1) DEFAULT b'1',
  `hidden` bit(1) DEFAULT b'0',
  `url` varchar(200) DEFAULT NULL,
  `expanded` bit(1) DEFAULT b'1',
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmenu`
--

LOCK TABLES `systemmenu` WRITE;
/*!40000 ALTER TABLE `systemmenu` DISABLE KEYS */;
INSERT INTO `systemmenu` VALUES (1,'E-CALL管理系统',-1,0,'\0','\0',NULL,'','../../Content/Images/Icon/system.png'),(2,'基础管理',1,0,'\0','\0',NULL,'','../../Content/Images/Icon/bs.png'),(3,'系统管理',1,0,'\0','\0',NULL,'','../../Content/Images/Icon/cl.png'),(4,'标签管理',2,0,'','\0','/TagManage/Index','','../../Content/Images/Icon/kp.png'),(5,'绑定记录',2,0,'','\0','/TagBind/Index','','../../Content/Images/Icon/bd.png'),(7,'用户管理',3,0,'','\0','/UserInfo/Index','','../../Content/Images/Icon/user.png'),(8,'角色管理',3,0,'','\0','/RoleInfo/Index','','../../Content/Images/Icon/role.png');
/*!40000 ALTER TABLE `systemmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `userName` varchar(50) DEFAULT NULL,
  `userPassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'admin','admin'),(9,'1','1'),(10,'123','123'),(14,'2','2'),(15,'3','3'),(16,'4','4'),(17,'5','5'),(18,'7','7'),(19,'8','8'),(20,'9','9'),(21,'10','10'),(22,'11','11'),(23,'12','12'),(24,'13','13'),(25,'14','14'),(26,'15','15'),(27,'16','16');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfowithroles`
--

DROP TABLE IF EXISTS `userinfowithroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfowithroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户和角色的关联表',
  `roleIdFK` int(11) DEFAULT NULL,
  `userIdFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfowithroles`
--

LOCK TABLES `userinfowithroles` WRITE;
/*!40000 ALTER TABLE `userinfowithroles` DISABLE KEYS */;
INSERT INTO `userinfowithroles` VALUES (6,1,1),(8,2,9),(9,1,10),(13,1,14),(14,1,15),(15,1,16),(16,1,17),(17,2,18),(18,2,19),(19,3,20),(20,1,21),(21,1,22),(22,1,23),(23,1,24),(24,1,25),(25,1,26),(26,1,27);
/*!40000 ALTER TABLE `userinfowithroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rfidsystem'
--
/*!50003 DROP PROCEDURE IF EXISTS `EmptyContainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmptyContainer`(in theCode varchar(255),in theEmpty_pt varchar(255))
BEGIN
select id into @tagId from rfid_tag where code=theCode;
if @tagId is null then    
select '1,Can Not Find Tag' as npc;
else
update rfid_tag set empty_pt=theEmpty_pt where id=@tagId;
select '0,Success' as npc;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FeedOnePull` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FeedOnePull`(IN theSLF VARCHAR (100),IN theSBF VARCHAR (100),IN theSLT VARCHAR (100))
BEGIN
SELECT
				b.id AS pt,
				a.id AS bin
				into @slf,@sbf
			FROM
				bin AS a
			LEFT JOIN stock AS b ON a.stockId = b.id
			WHERE
				a.binCode =theSBF
AND b.stockCode = theSLF;
#查找符合条件的数据赋值给变量
select id,totalNumber into @thisId,@tlb from fromToRecord where stockLocFrom=@slf and stockBinFrom=@sbf and stockLocTo=theSLT;
#不存在表中并且数量大于0
if @thisId is null and  @tlb<=0 then
SELECT '0,Success' AS npc;
else
#更新当前数据的数量
update fromToRecord set totalNumber=totalNumber-1 where id=@thisId;
SELECT '0,Success' AS npc;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GeneratePull` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GeneratePull`(
	IN theCode VARCHAR (255),
	IN tStockLocFrom VARCHAR (255),
	IN tStockBinFrom VARCHAR (255),
	IN tStockLocTo VARCHAR (255),
	in tAssLine VARCHAR (255),
	IN tLinePoint VARCHAR (255)
)
BEGIN
SELECT
				b.id AS pt,
				a.id AS bin
				into @slf,@sbf
			FROM
				bin AS a
			LEFT JOIN stock AS b ON a.stockId = b.id
			WHERE
				a.binCode =tStockBinFrom
AND b.stockCode = tStockLocFrom;
SELECT 
    id
INTO @tagID FROM
    rfid_tag
WHERE
    code = theCode;
UPDATE rfid_bound 
SET 
    bin = NULL,
    pt = @slt
WHERE
    tag_id = @tagID AND bounded = 1;
SELECT 
    id
INTO @thisId FROM
    fromToRecord
WHERE
    stockLocFrom = @slf
        AND stockBinFrom = @sbf
        AND stockLocTo =tStockLocTo;
#不存在表中并且数量大于0
if @thisId is null then
insert into fromToRecord(stockLocFrom,stockBinFrom,stockLocTo,assLine,linePoint,totalNumber) values(@slf,@sbf,tStockLocTo,tAssLine,tLinePoint,1);
SELECT '0,Success' AS npc;
else
#更新当前数据的数量
update fromToRecord set totalNumber=totalNumber+1 where id=@thisId;
SELECT '0,Success' AS npc;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBinStockData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBinStockData`()
BEGIN
select e.binCode,e.stockCode,group_concat(ifnull(e.matnr,'empty')  Separator ',') as wlh,
group_concat(ifnull(e.exidv,'empty') Separator ',') as sku 
from (select  a.binCode,b.stockCode,c.matnr,
c.exidv,c.intime from bin as a left join stock as b on a.stockId=b.id left join
rfid_bound as c on c.bin=a.id and c.pt=b.id where c.bin is not null) as e group by e.binCode  order by e.intime desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPullData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPullData`()
BEGIN
select a.stockLocTo,a.totalNumber,a.id,b.binCode as stockBinFrom,c.stockCode as stockLocFrom,a.linePoint,a.assLine from fromToRecord as a LEFT JOIN bin as b on a.stockBinFrom=b.id LEFT JOIN stock as c on a.stockLocFrom=c.id 
where c.id=b.stockId and a.totalNumber>0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TagBundling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TagBundling`(in theCode varchar(225),in theMatnr varchar(225),in theExidv varchar(225))
BEGIN
DECLARE theId int;
set theId=(select id from rfid_tag where code=theCode);
if theId is null then    
select '1,Can Not Find Tag' as npc;
else
if theMatnr is null or theExidv is null then
select '1,Matnr Or Exidv Not Is NULL'  as npc;
else
update rfid_bound set matnr=theMatnr,exidv=theExidv,inbin=1,bounded=1,tag_id=theId where matnr is null;
select '0,Bind Success' as npc;
end if;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TagUnbundling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TagUnbundling`(
in theCode varchar(225),
in thePlant varchar(225),
in theStock varchar(225),
in theBin varchar(225)
)
BEGIN
DECLARE theId int;
DECLARE tableCount int;
#得到标签ID
set theId=(select id from rfid_tag where code=theCode);
if theId is null then    
select '1,Can Not Find Tag' as npc;
else
#2.解除这个标签的绑定状态
update rfid_bound set bounded=2 where tag_id=theId;
SELECT
				c.id AS werks,
				b.id AS pt,
				a.id AS bin,
				a.assLine AS zpltn,
				a.linePoint,
				now() AS intime
				into @wwerks,@ppt,@bbin,@zzpltn,@llinePoint,@iintime
			FROM
				bin AS a
			LEFT JOIN stock AS b ON a.stockId = b.id
			LEFT JOIN plant AS c ON c.id = b.plantId
			WHERE
				a.binCode =theBin
AND b.stockCode = theStock
AND c.plantCode = thePlant;
END IF;
if (@wwerks is not null and @ppt is not null and @bbin is not null) then
insert into rfid_bound(werks,pt,bin,zpltn,linePoint,intime,tag_id) values(@wwerks,@ppt,@bbin,@zzpltn,@llinePoint,@iintime,theId);
SELECT '0,success' AS npc;
else
SELECT '1,Not Find This Data' AS npc;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16 13:06:16
