-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pedido
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Current Database: `pedido`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pedido` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pedido`;

--
-- Table structure for table `tCliente`
--

DROP TABLE IF EXISTS `tCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tCliente` (
  `pCliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cRazonSocial` varchar(80) NOT NULL,
  `cRut` varchar(12) DEFAULT NULL,
  `fGiro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pCliente`),
  KEY `fkCliente_giro_idx` (`fGiro`),
  CONSTRAINT `fkCliente_giro` FOREIGN KEY (`fGiro`) REFERENCES `tGiro` (`pGiro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tCliente`
--

LOCK TABLES `tCliente` WRITE;
/*!40000 ALTER TABLE `tCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tClienteSucursal`
--

DROP TABLE IF EXISTS `tClienteSucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tClienteSucursal` (
  `pClienteSucursal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fCliente` int(10) unsigned NOT NULL,
  `cNombre` varchar(80) NOT NULL,
  `cDireccion` varchar(120) NOT NULL,
  `fComuna` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pClienteSucursal`),
  KEY `fk_tClienteSucursal_comuna_idx` (`fComuna`),
  KEY `fk_tClienteSucursal_cliente_idx` (`fCliente`),
  CONSTRAINT `fkClienteSucursal_cliente` FOREIGN KEY (`fCliente`) REFERENCES `tCliente` (`pCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tClienteSucursal_comuna` FOREIGN KEY (`fComuna`) REFERENCES `tComuna` (`pComuna`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tClienteSucursal`
--

LOCK TABLES `tClienteSucursal` WRITE;
/*!40000 ALTER TABLE `tClienteSucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tClienteSucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tComuna`
--

DROP TABLE IF EXISTS `tComuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tComuna` (
  `pComuna` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cLocalidad` varchar(65) NOT NULL,
  `cCiudad` varchar(65) NOT NULL,
  `cRegion` varchar(65) NOT NULL,
  PRIMARY KEY (`pComuna`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tComuna`
--

LOCK TABLES `tComuna` WRITE;
/*!40000 ALTER TABLE `tComuna` DISABLE KEYS */;
INSERT INTO `tComuna` VALUES (1,'Arica','Arica','Regi??n de Arica y Parinacota'),(2,'Camarones','Arica','Regi??n de Arica y Parinacota'),(3,'Putre','Parinacota','Regi??n de Arica y Parinacota'),(4,'General Lagos','Parinacota','Regi??n de Arica y Parinacota'),(5,'Iquique','Iquique','Regi??n de Tarapac??'),(6,'Cami??a','Tamarugal','Regi??n de Tarapac??'),(7,'Colchane','Tamarugal','Regi??n de Tarapac??'),(8,'Huara','Tamarugal','Regi??n de Tarapac??'),(9,'Pica','Tamarugal','Regi??n de Tarapac??'),(10,'Pozo Almonte','Tamarugal','Regi??n de Tarapac??'),(11,'Alto Hospicio','Iquique','Regi??n de Tarapac??'),(12,'Antofagasta','Antofagasta','Regi??n de Antofagasta'),(13,'Mejillones','Antofagasta','Regi??n de Antofagasta'),(14,'Sierra Gorda','Antofagasta','Regi??n de Antofagasta'),(15,'Taltal','Antofagasta','Regi??n de Antofagasta'),(16,'Calama','El Loa','Regi??n de Antofagasta'),(17,'Ollag??e','El Loa','Regi??n de Antofagasta'),(18,'San Pedro de Atacama','El Loa','Regi??n de Antofagasta'),(19,'Tocopilla','Tocopilla','Regi??n de Antofagasta'),(20,'Mar??a Elena','Tocopilla','Regi??n de Antofagasta'),(21,'Copiap??','Copiap??','Regi??n de Atacama'),(22,'Caldera','Copiap??','Regi??n de Atacama'),(23,'Tierra Amarilla','Copiap??','Regi??n de Atacama'),(24,'Cha??aral','Cha??aral','Regi??n de Atacama'),(25,'Diego de Almagro','Cha??aral','Regi??n de Atacama'),(26,'Vallenar','Huasco','Regi??n de Atacama'),(27,'Alto del Carmen','Huasco','Regi??n de Atacama'),(28,'Freirina','Huasco','Regi??n de Atacama'),(29,'Huasco','Huasco','Regi??n de Atacama'),(30,'La Serena','Elqui','Regi??n de Coquimbo'),(31,'Coquimbo','Elqui','Regi??n de Coquimbo'),(32,'Andacollo','Elqui','Regi??n de Coquimbo'),(33,'La Higuera','Elqui','Regi??n de Coquimbo'),(34,'Paiguano','Elqui','Regi??n de Coquimbo'),(35,'Vicu??a','Elqui','Regi??n de Coquimbo'),(36,'Illapel','Choapa','Regi??n de Coquimbo'),(37,'Canela','Choapa','Regi??n de Coquimbo'),(38,'Los Vilos','Choapa','Regi??n de Coquimbo'),(39,'Pichidangui','Choapa','Regi??n de Coquimbo'),(40,'Salamanca','Choapa','Regi??n de Coquimbo'),(41,'Ovalle','Limari','Regi??n de Coquimbo'),(42,'Combarbal??','Limari','Regi??n de Coquimbo'),(43,'Monte Patria','Limari','Regi??n de Coquimbo'),(44,'Punitaqui','Limari','Regi??n de Coquimbo'),(45,'R??o Hurtado','Limari','Regi??n de Coquimbo'),(46,'Valpara??so','Valpara??so','Regi??n de Valpara??so'),(47,'Casablanca','Valpara??so','Regi??n de Valpara??so'),(48,'Conc??n','Valpara??so','Regi??n de Valpara??so'),(49,'Juan Fern??ndez','Valpara??so','Regi??n de Valpara??so'),(50,'Puchuncav??','Valpara??so','Regi??n de Valpara??so'),(51,'Quilpu??','Marga Marga','Regi??n de Valpara??so'),(52,'Quintero','Valpara??so','Regi??n de Valpara??so'),(53,'Villa Alemana','Marga Marga','Regi??n de Valpara??so'),(54,'Vi??a del Mar','Valpara??so','Regi??n de Valpara??so'),(55,'Islade Pascua','Isla de Pascua','Regi??n de Valpara??so'),(56,'Los Andes','Los Andes','Regi??n de Valpara??so'),(57,'Calle Larga','Los Andes','Regi??n de Valpara??so'),(58,'Rinconada','Los Andes','Regi??n de Valpara??so'),(59,'San Esteban','Los Andes','Regi??n de Valpara??so'),(60,'La Ligua','Petorca','Regi??n de Valpara??so'),(61,'Cabildo','Petorca','Regi??n de Valpara??so'),(62,'Papudo','Petorca','Regi??n de Valpara??so'),(63,'Petorca','Petorca','Regi??n de Valpara??so'),(64,'Zapallar','Petorca','Regi??n de Valpara??so'),(65,'Quillota','Quillota','Regi??n de Valpara??so'),(66,'Calera','Quillota','Regi??n de Valpara??so'),(67,'Hijuelas','Quillota','Regi??n de Valpara??so'),(68,'La Cruz','Quillota','Regi??n de Valpara??so'),(69,'Limache','Marga Marga','Regi??n de Valpara??so'),(70,'Nogales','Quillota????','Regi??n de Valpara??so'),(71,'Olmu??','Marga Marga','Regi??n de Valpara??so'),(72,'San Antonio','San Antonio','Regi??n de Valpara??so'),(73,'Algarrobo','San Antonio','Regi??n de Valpara??so'),(74,'Cartagena','San Antonio','Regi??n de Valpara??so'),(75,'El Quisco','San Antonio','Regi??n de Valpara??so'),(76,'El Tabo','San Antonio','Regi??n de Valpara??so'),(77,'Santo Domingo','San Antonio','Regi??n de Valpara??so'),(78,'San Felipe','San Felipe','Regi??n de Valpara??so'),(79,'Catemu','San Felipe','Regi??n de Valpara??so'),(80,'Llaillay','San Felipe','Regi??n de Valpara??so'),(81,'Panquehue','San Felipe','Regi??n de Valpara??so'),(82,'Putaendo','San Felipe','Regi??n de Valpara??so'),(83,'Santa Mar??a','San Felipe','Regi??n de Valpara??so'),(84,'Rancagua','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(85,'Codegua','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(86,'Coinco','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(87,'Coltauco','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(88,'Do??ihue','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(89,'Graneros','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(90,'Las Cabras','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(91,'Machal??','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(92,'Malloa','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(93,'Mostazal','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(94,'Olivar','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(95,'Peumo','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(96,'Pichidegua','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(97,'Quinta de Tilcoco','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(98,'Rengo','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(99,'Requ??noa','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(100,'San Vicente','Cachapoal','Regi??n del Libertador General Bernardo O`Higgins'),(101,'Pichilemu','Cardenal Caro','Regi??n del Libertador General Bernardo O`Higgins'),(102,'La Estrella','Cardenal Caro','Regi??n del Libertador General Bernardo O`Higgins'),(103,'Litueche','Cardenal Caro','Regi??n del Libertador General Bernardo O`Higgins'),(104,'Marchihue','Cardenal Caro','Regi??n del Libertador General Bernardo O`Higgins'),(105,'Navidad','Cardenal Caro','Regi??n del Libertador General Bernardo O`Higgins'),(106,'Paredones','Cardenal Caro','Regi??n del Libertador General Bernardo O`Higgins'),(107,'San Fernando','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(108,'Ch??pica','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(109,'Chimbarongo','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(110,'Lolol','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(111,'Nancagua','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(112,'Palmilla','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(113,'Peralillo','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(114,'Placilla','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(115,'Pumanque','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(116,'Santa Cruz','Colchagua','Regi??n del Libertador General Bernardo O`Higgins'),(117,'Talca','Talca','Regi??n del Maule'),(118,'Constituci??n','Talca','Regi??n del Maule'),(119,'Curepto','Talca','Regi??n del Maule'),(120,'Empedrado','Talca','Regi??n del Maule'),(121,'Maule','Talca','Regi??n del Maule'),(122,'Pelarco','Talca','Regi??n del Maule'),(123,'Pencahue','Talca','Regi??n del Maule'),(124,'R??o Claro','Talca','Regi??n del Maule'),(125,'San Clemente','Talca','Regi??n del Maule'),(126,'San Rafael','Talca','Regi??n del Maule'),(127,'Cauquenes','Cauquenes','Regi??n del Maule'),(128,'Chanco','Cauquenes','Regi??n del Maule'),(129,'Pelluhue','Cauquenes','Regi??n del Maule'),(130,'Curic??','Curico','Regi??n del Maule'),(131,'Huala????','Curico','Regi??n del Maule'),(132,'Licant??n','Curico','Regi??n del Maule'),(133,'Molina','Curico','Regi??n del Maule'),(134,'Rauco','Curico','Regi??n del Maule'),(135,'Romeral','Curico','Regi??n del Maule'),(136,'Sagrada Familia','Curico','Regi??n del Maule'),(137,'Teno','Curico','Regi??n del Maule'),(138,'Vichuqu??n','Curico','Regi??n del Maule'),(139,'Linares','Linares','Regi??n del Maule'),(140,'Colb??n','Linares','Regi??n del Maule'),(141,'Longav??','Linares','Regi??n del Maule'),(142,'Parral','Linares','Regi??n del Maule'),(143,'Retiro','Linares','Regi??n del Maule'),(144,'San Javier','Linares','Regi??n del Maule'),(145,'Villa Alegre','Linares','Regi??n del Maule'),(146,'Yerbas Buenas','Linares','Regi??n del Maule'),(147,'Concepci??n','Concepci??n','Regi??n del Biob??o'),(148,'Coronel','Concepci??n','Regi??n del Biob??o'),(149,'Chiguayante','Concepci??n','Regi??n del Biob??o'),(150,'Florida','Concepci??n','Regi??n del Biob??o'),(151,'Hualqui','Concepci??n','Regi??n del Biob??o'),(152,'Lota','Concepci??n','Regi??n del Biob??o'),(153,'Penco','Concepci??n','Regi??n del Biob??o'),(154,'San Pedro de la Paz','Concepci??n','Regi??n del Biob??o'),(155,'Santa Juana','Concepci??n','Regi??n del Biob??o'),(156,'Talcahuano','Concepci??n','Regi??n del Biob??o'),(157,'Tom??','Concepci??n','Regi??n del Biob??o'),(158,'Hualp??n','Concepci??n','Regi??n del Biob??o'),(159,'Lebu','Arauco','Regi??n del Biob??o'),(160,'Arauco','Arauco','Regi??n del Biob??o'),(161,'Ca??ete','Arauco','Regi??n del Biob??o'),(162,'Contulmo','Arauco','Regi??n del Biob??o'),(163,'Curanilahue','Arauco','Regi??n del Biob??o'),(164,'Los ??lamos','Arauco','Regi??n del Biob??o'),(165,'Tir??a','Arauco','Regi??n del Biob??o'),(166,'Los ??ngeles','B??o-B??o','Regi??n del Biob??o'),(167,'Antuco','B??o-B??o','Regi??n del Biob??o'),(168,'Cabrero','B??o-B??o','Regi??n del Biob??o'),(169,'Laja','B??o-B??o','Regi??n del Biob??o'),(170,'Mulch??n','B??o-B??o','Regi??n del Biob??o'),(171,'Nacimiento','B??o-B??o','Regi??n del Biob??o'),(172,'Negrete','B??o-B??o','Regi??n del Biob??o'),(173,'Quilaco','B??o-B??o','Regi??n del Biob??o'),(174,'Quilleco','B??o-B??o','Regi??n del Biob??o'),(175,'San Rosendo','B??o-B??o','Regi??n del Biob??o'),(176,'Santa B??rbara','B??o-B??o','Regi??n del Biob??o'),(177,'Tucapel','B??o-B??o','Regi??n del Biob??o'),(178,'Yumbel','B??o-B??o','Regi??n del Biob??o'),(179,'Alto Biob??o','B??o-B??o','Regi??n del Biob??o'),(180,'Chill??n','??uble','Regi??n del Biob??o'),(181,'Bulnes','??uble','Regi??n del Biob??o'),(182,'Cobquecura','??uble','Regi??n del Biob??o'),(183,'Coelemu','??uble','Regi??n del Biob??o'),(184,'Coihueco','??uble','Regi??n del Biob??o'),(185,'Chill??n Viejo','??uble','Regi??n del Biob??o'),(186,'El Carmen','??uble','Regi??n del Biob??o'),(187,'Ninhue','??uble','Regi??n del Biob??o'),(188,'??iqu??n','??uble','Regi??n del Biob??o'),(189,'Pemuco','??uble','Regi??n del Biob??o'),(190,'Lo Pinto','??uble','Regi??n del Biob??o'),(191,'Portezuelo','??uble','Regi??n del Biob??o'),(192,'Quill??n','??uble','Regi??n del Biob??o'),(193,'Quirihue','??uble','Regi??n del Biob??o'),(194,'R??nquil','??uble','Regi??n del Biob??o'),(195,'San Carlos','??uble','Regi??n del Biob??o'),(196,'San Fabi??n','??uble','Regi??n del Biob??o'),(197,'San Ignacio','??uble','Regi??n del Biob??o'),(198,'San Nicol??s','??uble','Regi??n del Biob??o'),(199,'Treguaco','??uble','Regi??n del Biob??o'),(200,'Yungay','??uble','Regi??n del Biob??o'),(201,'Temuco','Caut??n','Regi??n de La Araucan??a'),(202,'Carahue','Caut??n','Regi??n de La Araucan??a'),(203,'Cunco','Caut??n','Regi??n de La Araucan??a'),(204,'Curarrehue','Caut??n','Regi??n de La Araucan??a'),(205,'Freire','Caut??n','Regi??n de La Araucan??a'),(206,'Galvarino','Caut??n','Regi??n de La Araucan??a'),(207,'Gorbea','Caut??n','Regi??n de La Araucan??a'),(208,'Lautaro','Caut??n','Regi??n de La Araucan??a'),(209,'Loncoche','Caut??n','Regi??n de La Araucan??a'),(210,'Melipeuco','Caut??n','Regi??n de La Araucan??a'),(211,'Nueva Imperial','Caut??n','Regi??n de La Araucan??a'),(212,'Padre Las Casas','Caut??n','Regi??n de La Araucan??a'),(213,'Perquenco','Caut??n','Regi??n de La Araucan??a'),(214,'Pitrufqu??n','Caut??n','Regi??n de La Araucan??a'),(215,'Puc??n','Caut??n','Regi??n de La Araucan??a'),(216,'Saavedra','Caut??n','Regi??n de La Araucan??a'),(217,'Teodoro Schmidt','Caut??n','Regi??n de La Araucan??a'),(218,'Tolt??n','Caut??n','Regi??n de La Araucan??a'),(219,'Vilc??n','Caut??n','Regi??n de La Araucan??a'),(220,'Villarrica','Caut??n','Regi??n de La Araucan??a'),(221,'Cholchol','Caut??n','Regi??n de La Araucan??a'),(222,'Angol','Malleco','Regi??n de La Araucan??a'),(223,'Collipulli','Malleco','Regi??n de La Araucan??a'),(224,'Curacaut??n','Malleco','Regi??n de La Araucan??a'),(225,'Ercilla','Malleco','Regi??n de La Araucan??a'),(226,'Lonquimay','Malleco','Regi??n de La Araucan??a'),(227,'Los Sauces','Malleco','Regi??n de La Araucan??a'),(228,'Lumaco','Malleco','Regi??n de La Araucan??a'),(229,'Pur??n','Malleco','Regi??n de La Araucan??a'),(230,'Renaico','Malleco','Regi??n de La Araucan??a'),(231,'Traigu??n','Malleco','Regi??n de La Araucan??a'),(232,'Victoria','Malleco','Regi??n de La Araucan??a'),(233,'Valdivia','Valdivia','Regi??n de Los R??os'),(234,'Corral','Valdivia','Regi??n de Los R??os'),(235,'Futrono','Ranco','Regi??n de Los R??os'),(236,'La Uni??n','Ranco','Regi??n de Los R??os'),(237,'Lago Ranco','Ranco','Regi??n de Los R??os'),(238,'Lanco','Valdivia','Regi??n de Los R??os'),(239,'Los Lagos','Valdivia','Regi??n de Los R??os'),(240,'M??fil','Valdivia','Regi??n de Los R??os'),(241,'Mariquina','Valdivia','Regi??n de Los R??os'),(242,'Paillaco','Valdivia','Regi??n de Los R??os'),(243,'Panguipulli','Valdivia','Regi??n de Los R??os'),(244,'R??o Bueno','Ranco','Regi??n de Los R??os'),(245,'Puerto Montt','Llanquihue','Regi??n de Los Lagos'),(246,'Calbuco','Llanquihue','Regi??n de Los Lagos'),(247,'Cocham??','Llanquihue','Regi??n de Los Lagos'),(248,'Fresia','Llanquihue','Regi??n de Los Lagos'),(249,'Frutillar','Llanquihue','Regi??n de Los Lagos'),(250,'Los Muermos','Llanquihue','Regi??n de Los Lagos'),(251,'Llanquihue','Llanquihue','Regi??n de Los Lagos'),(252,'Maull??n','Llanquihue','Regi??n de Los Lagos'),(253,'Puerto Varas','Llanquihue','Regi??n de Los Lagos'),(254,'Castro','Chiloe','Regi??n de Los Lagos'),(255,'Ancud','Chiloe','Regi??n de Los Lagos'),(256,'Chonchi','Chiloe','Regi??n de Los Lagos'),(257,'Curaco de V??lez','Chiloe','Regi??n de Los Lagos'),(258,'Dalcahue','Chiloe','Regi??n de Los Lagos'),(259,'Puqueld??n','Chiloe','Regi??n de Los Lagos'),(260,'Queil??n','Chiloe','Regi??n de Los Lagos'),(261,'Quell??n','Chiloe','Regi??n de Los Lagos'),(262,'Quemchi','Chiloe','Regi??n de Los Lagos'),(263,'Quinchao','Chiloe','Regi??n de Los Lagos'),(264,'Osorno','Osorno','Regi??n de Los Lagos'),(265,'Puerto Octay','Osorno','Regi??n de Los Lagos'),(266,'Purranque','Osorno','Regi??n de Los Lagos'),(267,'Puyehue','Osorno','Regi??n de Los Lagos'),(268,'R??o Negro','Osorno','Regi??n de Los Lagos'),(269,'San Juan de la Costa','Osorno','Regi??n de Los Lagos'),(270,'San Pablo','Osorno','Regi??n de Los Lagos'),(271,'Chait??n','Palena','Regi??n de Los Lagos'),(272,'Futaleuf??','Palena','Regi??n de Los Lagos'),(273,'Hualaihu??','Palena','Regi??n de Los Lagos'),(274,'Palena','Palena','Regi??n de Los Lagos'),(275,'Coihaique','Coihaique????','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(276,'Lago Verde','Coihaique????','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(277,'Ais??n','Ais??n','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(278,'Cisnes','Ais??n','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(279,'Guaitecas','Ais??n','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(280,'Cochrane','Capitan Prat','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(281,'OHiggins','Capitan Prat','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(282,'Tortel','Capitan Prat','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(283,'Chile Chico','General Carrera','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(284,'R??o Ib????ez','General Carrera','Regi??n de Ays??n del General Carlos Ib????ez del Campo'),(285,'Punta Arenas','Magallanes','Regi??n de Magallanes y de la Ant??rtica Chilena'),(286,'Laguna Blanca','Magallanes','Regi??n de Magallanes y de la Ant??rtica Chilena'),(287,'R??o Verde','Magallanes','Regi??n de Magallanes y de la Ant??rtica Chilena'),(288,'San Gregorio','Magallanes','Regi??n de Magallanes y de la Ant??rtica Chilena'),(289,'Cabo de Hornos','Ant??rtica Chilena','Regi??n de Magallanes y de la Ant??rtica Chilena'),(290,'Ant??rtica','Ant??rtica Chilena','Regi??n de Magallanes y de la Ant??rtica Chilena'),(291,'Porvenir','Tierra del Fuego','Regi??n de Magallanes y de la Ant??rtica Chilena'),(292,'Primavera','Tierra del Fuego','Regi??n de Magallanes y de la Ant??rtica Chilena'),(293,'Timaukel','Tierra del Fuego','Regi??n de Magallanes y de la Ant??rtica Chilena'),(294,'Natales','Ultima Esperanza','Regi??n de Magallanes y de la Ant??rtica Chilena'),(295,'Torres del Paine','Ultima Esperanza','Regi??n de Magallanes y de la Ant??rtica Chilena');
/*!40000 ALTER TABLE `tComuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tEstado`
--

DROP TABLE IF EXISTS `tEstado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tEstado` (
  `pEstado` int(10) unsigned NOT NULL,
  `cDeescripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`pEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tEstado`
--

LOCK TABLES `tEstado` WRITE;
/*!40000 ALTER TABLE `tEstado` DISABLE KEYS */;
INSERT INTO `tEstado` VALUES (10,'Ingresado'),(20,'Aprobado'),(30,'Entregado');
/*!40000 ALTER TABLE `tEstado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tFamilia`
--

DROP TABLE IF EXISTS `tFamilia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tFamilia` (
  `pFamilia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cNombre` varchar(15) NOT NULL,
  PRIMARY KEY (`pFamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tFamilia`
--

LOCK TABLES `tFamilia` WRITE;
/*!40000 ALTER TABLE `tFamilia` DISABLE KEYS */;
INSERT INTO `tFamilia` VALUES (1,'bebida'),(2,'cerveza'),(3,'cigarrillo');
/*!40000 ALTER TABLE `tFamilia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tFormaPago`
--

DROP TABLE IF EXISTS `tFormaPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tFormaPago` (
  `pFormaPagoi` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDescripcion` varchar(45) NOT NULL,
  `nDias` smallint(4) NOT NULL,
  PRIMARY KEY (`pFormaPagoi`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tFormaPago`
--

LOCK TABLES `tFormaPago` WRITE;
/*!40000 ALTER TABLE `tFormaPago` DISABLE KEYS */;
INSERT INTO `tFormaPago` VALUES (1,'Contado Efectivo',0),(2,'Cr??dito 7 d??as',7),(3,'Cr??dito 15 d??as',15),(4,'Cr??dito 30 d??as',30),(5,'Cr??dito 45 d??as',45),(6,'Cr??dito 60 d??as',60),(7,'Cr??dito 90 d??as',90),(8,'Cr??dito 120 d??as',120),(9,'Contado Cheque contra entrega',0),(10,'7 d??as Cheque contra entrega',7),(11,'15 d??as Cheque contra entrega',15),(12,'30 d??as Cheque contra entrega',30),(13,'45 d??as Cheque contra entrega',45),(14,'60 d??as Cheque contra entrega',60),(15,'90 d??as Cheque contra entrega',90),(16,'120 d??as Cheque contra entrega',120);
/*!40000 ALTER TABLE `tFormaPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tGiro`
--

DROP TABLE IF EXISTS `tGiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tGiro` (
  `pGiro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDescripcion` varchar(120) NOT NULL,
  PRIMARY KEY (`pGiro`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tGiro`
--

LOCK TABLES `tGiro` WRITE;
/*!40000 ALTER TABLE `tGiro` DISABLE KEYS */;
INSERT INTO `tGiro` VALUES (1,'Abarrotes y Licores'),(2,'Abarrotes\nAbarrotes'),(3,'Alimento para Mascotas\nAlimentos Bebidas\"'),(4,'alimentos embasados confites\nAlmac??n\nAlmacen botiller??a\"'),(5,'Almacen de Comestibles\nAlmacen Rotiseria'),(6,'Almacen y Botilleria'),(7,'Almacen\nAlmacen'),(8,'Almacen\nAlmacen- Botilleria'),(9,'Almacences Peque??os'),(10,'Almacenes Medianos de Alimentos'),(11,'Almacenes Peque??os'),(12,'Almancen de Comestibles y Botilleria'),(13,'Amasanderia\nArriendo Maquinaria\"'),(14,'Artesania inciensos bisuter??a tabaco y productos para el tabaco '),(15,'Autoservicio'),(16,'b0tilleria'),(17,'Banquetera'),(18,'Banqueteria'),(19,'Banquetero'),(20,'Bar'),(21,'Bar-Restaurant-Botilleria '),(22,'Bazar'),(23,'Boriller??a'),(24,'Botelleria'),(25,'BOTIILLERIA MINIMARKET'),(26,'Botileria'),(27,'Botilleeia'),(28,'Botilleira'),(29,'Botillera'),(30,'Botilleri'),(31,'Botiller??a'),(32,'Botilleria  - confites '),(33,'Botilleria  -abarrotes '),(34,'Botilleria  / confites '),(35,'Botilleria  /Confites '),(36,'Botilleria  comercializadora de bebida\nBotilleria  y confites \"'),(37,'Botilleria  y distribuidora  de Bebidas '),(38,'Botilleria - almacen'),(39,'Botilleria - almacen  por menor '),(40,'Botilleria - distribuidora de vinos y licores por mayor y menor - transporte de carga por carretera '),(41,'Botilleria - Fiambreria y Almacen'),(42,'Botilleria - Minimarket'),(43,'Botilleria - Minimarket.'),(44,'Botilleria - restaurant'),(45,'Botilleria -confiteria '),(46,'botilleria almacen '),(47,'Botilleria confiteria almacen y lacteos'),(48,'Botilleria confites'),(49,'botilleria distribuidora'),(50,'Botilleria Minimarket'),(51,'Botilleria Supermercado Licores'),(52,'Botilleria venta de confites-cigarros'),(53,'Botilleria y abarrotes'),(54,'BOTILLERIA Y ALMACEN'),(55,'Botilleria y Confeteria'),(56,'Botilleria y Confiteria'),(57,'Botilleria y Confiteria.'),(58,'Botilleria y Confites'),(59,'Botilleria y Dist. de Licores'),(60,'Botilleria y Distribucion de vinos y Licores'),(61,'Botilleria y Distribuidora al por Mayor y Menor Vinos\nBotilleria y Distribuidora de Licores\"'),(62,'Botilleria y expendio de bebidas alcoholicas '),(63,'Botilleria y Mini Market'),(64,'Botilleria y Minimarket.'),(65,'Botilleria y Transporte de Pasajeros.'),(66,'Botilleria y Venta de Confetis'),(67,'Botilleria y Venta de Confites'),(68,'Botilleria\nBotilleria'),(69,'Botilleria\nBotilleria'),(70,'Botilleria\nBotilleria'),(71,'Botilleria\nBotilleria'),(72,'Botilleria\nBotilleria'),(73,'Botilleria\nBotilleria'),(74,'Botilleria\nBotilleria'),(75,'Botilleria\nBotilleria'),(76,'Botilleria\nBotilleria'),(77,'Botilleria\nBotilleria'),(78,'Botilleria\nBotilleria'),(79,'Botilleria\nBotilleria'),(80,'Bot??ller??a\nBotilleria'),(81,'Botilleria\nBotiller??a'),(82,'Botilleria\nBotilleria'),(83,'Botilleria\nBotilleria'),(84,'Botilleria\nBotilleria'),(85,'Botilleria\nBotilleria'),(86,'Botilleria\nBotilleria- Confites \"'),(87,'Botilleria- Minimarket '),(88,'Botilleria-abarrotes '),(89,'Botilleria-abarrotes-panader??a '),(90,'Botilleria-Confiteria '),(91,'Botilleria-Confites '),(92,'Botilleria-Minimarket '),(93,'Botilleria.'),(94,'Botilleria/ Eventos  / Bar / Discotheke '),(95,'Botillerias'),(96,'BOTILLERRIA '),(97,'Botilletia '),(98,'Botilletia -confites-cigarros'),(99,'Botilletia-abarrotes '),(100,'Botillleria\nBOTILLRIA \"'),(101,'Botillria-confites '),(102,'Botlleria'),(103,'Cabaret y Restaurant'),(104,'COM DISTR IMPORT Y EXPORT DE VINOS'),(105,'Com.Vinos Licores\nComer.de prod text.cigarr'),(106,'Comercial'),(107,'Comercializaci??n de vinos'),(108,'Comercializadora'),(109,'Comercializadora  de alimentos y materia prima para amasanderia'),(110,'comercializadora de alimento y Bebidas Alcoholicas y No Alcoholicas'),(111,'Comercializadora de Alimentos'),(112,'comercializadora de alimentos\nComercializadora de bebidas alcoholicas\"'),(113,'comercializadora de Bebidas y alimentos'),(114,'Comercializadora De Tabacos E Insumos Y Accesorios Relacionados'),(115,'Comercializadora de vinos y licores'),(116,'Comercializadora licores tabaco'),(117,'Comercializadora Mayorista y Minorista'),(118,'Comidas rapidas'),(119,'Compra Vende Animales\nCompra y Venta de Abarrotes\"'),(120,'Compra y venta de bebidas '),(121,'Compra y venta de productos'),(122,'Compra y venta por mayor y menor '),(123,'COMPRAVENTA DE BEBIDAS ALCOH??LICA Y ANALCH??LICAS'),(124,'Confiter??a '),(125,'Confiter??a tabaquer??a '),(126,'Confiteria y Abarrotes'),(127,'Confites \nConstructora\nDelivery \"'),(128,'Depo??sito de licores'),(129,'DEPOSITO DE ALCOHOLES'),(130,'Deposito de Alcoholes\nDEPOSITO DE BEBIDAS ALCOHOLICAS\"'),(131,'Deposito de Bebidas y Licores\nDeposito de Licores\"'),(132,'Deposito de Licores Confiter??a Y Helados'),(133,'Deposito de Licores\nDeposito de Licores'),(134,'Deposito Licores'),(135,'Didistribucion de bebidas alcoholicas y analcoholicas al al por mayor'),(136,'Discoteque \nDist Bebidas Vinos Licores\"'),(137,'Dist de bebidas cervezas vinos y licores '),(138,'dist produccto de aseo'),(139,'DIST VINOS Y LICORES'),(140,'Dist Vinos\nDist y ventas de Bebidas alcoholic??s\"'),(141,'DIST. DE BEBIDAS  '),(142,'DIST. DE BEBIDAS ALCOHOLICAS'),(143,'Dist. de bebidas\nDistribuci??n de bebidas alcoholicas\"'),(144,'Distribucion de De Bebidas Alc y Confites'),(145,'Distribuci??n de Licores y bebidas de Fantasia'),(146,'Distribuci??n y Com. de Alimentos y Bebestibles'),(147,'Distribucion y Venta de bebidas alcoholicas y analcoholicas'),(148,'Distribuidor'),(149,'Distribuidor Mayorista'),(150,'Distribuidora'),(151,'distribuidora  de licores'),(152,'Distribuidora - Botilleria'),(153,'Distribuidora / Lunes A Viernes de 10 A 13 Horas'),(154,'distribuidora abarrotes '),(155,'Distribuidora al Por Mayor y Menor de Bebidas Alcoholicas.'),(156,'Distribuidora Alcohol'),(157,'Distribuidora Bebidas; Licores Vinos'),(158,'DISTRIBUIDORA BOTILLERIA '),(159,'Distribuidora de Alcoholes'),(160,'Distribuidora de bebidas'),(161,'Distribuidora de Bebidas Alcohilicas'),(162,'Distribuidora de Bebidas Alcohlicas y Analcoholicas'),(163,'Distribuidora de Bebidas Alcoholicas'),(164,'Distribuidora de Bebidas Alcoholicas y Analcoholicas'),(165,'Distribuidora de Bebidas Alcoholicas y No Alcoholicas'),(166,'Distribuidora de Licores'),(167,'Distribuidora de Licores Vinos y Bebidas Alcoholicas'),(168,'Distribuidora de Vino\nDistribuidora de vinos\"'),(169,'Distribuidora de Vinos y Bebidas Alcoholicas'),(170,'Distribuidora de Vinos y Licores'),(171,'Distribuidora de vinos y licores por mayor'),(172,'Distribuidora de Vinos\nDistribuidora de vinos'),(173,'Distribuidora de Vinos\nDistribuidora de vinos'),(174,'Distribuidora de Vinos\nDistribuidora de Vinos'),(175,'Distribuidora Licores'),(176,'Distribuidora Licores y Vinos'),(177,'Distribuidora Vinos Bebidas Cervezas ventas por menor y transporte '),(178,'Distribuidora y Botilleria '),(179,'Distribuidora y comercializadora '),(180,'Distribuidora y comercializadora de abarrotes'),(181,'DISTRUBUIDORA ARTI ASEO \nDistruibuidora de Licores\"'),(182,'DITRIBUIDORA'),(183,'elaboraci??n y venta de pizzas empanadas y bebidas'),(184,'Emporio'),(185,'Empresa Publicidad'),(186,'ESTRUCTURAS METALICAS'),(187,'Expendio de Bebidas Alcoholicas\nExpendio de Bebidas Alcoholicas'),(188,'Expend??o de Licores y Abarrotes '),(189,'Farmacia y perfumer??a '),(190,'Grandes Distribuidoras al Detalle'),(191,'Grandes Establecimientos'),(192,'Grandes Establecimientos de Venta de Alimentos y Licores'),(193,'Grandes Establecimientos de Ventas de Alimentos'),(194,'Grandes Tiendas'),(195,'Importacion de Insumos Para La Miner??a'),(196,'Importadora y Distribuidora'),(197,'Licoreria\nLiquior Store\"'),(198,'Los socios '),(199,'Mayorista'),(200,'Mayorista Alcohol'),(201,'mayorista de alcoholicas botilleria'),(202,'Mayorista de Vinos y Bebidas'),(203,'Mayorista de Vinos y Bebidas Alcoholicas'),(204,'Mayorista de Vinos y Bebidas Alcoholicas de Fantasia'),(205,'Mayorista de Vinos y Bebidas Alcoh??licas y de Fantas??a'),(206,'Mayorista de Vinos y Otras Bebidas Alcoholicas'),(207,'Mayorista de Vinos\nMayorista Licores\"'),(208,'Mayorista Vino y Licores'),(209,'Mayoristas de Vinos y Bebidas Alcoholicas'),(210,'Mini distribuidor vino'),(211,'Mini market'),(212,'Mini market y botilleria'),(213,'Mini mercado'),(214,'Mini mercado de alcoholes'),(215,'Minimarket'),(216,'Minimarket - botilleria'),(217,'Minimarket Botilleria'),(218,'Minimarket y botiiller??a'),(219,'Minimarket y Botilleria'),(220,'Minimarket y Botilleria.'),(221,'Minimarket\nMinimarket'),(222,'Minimarket\nMinimarket'),(223,'Minimarket\nMinimarket-Botilleria \"'),(224,'minimarkey'),(225,'minimercado'),(226,'Minimercado de alcoholes'),(227,'minimerket'),(228,'NULL'),(229,'Operaciones Financieras'),(230,'otilleria '),(231,'OTRAS ACTIVIDADES PROFESIONALES\nParitular\nPARTICULAR\nParticular con boleta\"'),(232,'Particulares'),(233,'Pasteleria'),(234,'persona'),(235,'PERSONAL'),(236,'Prod. Comercializacion y Exportacion de Vinos'),(237,'Productora de Eventos y Mayoristas de Vinos y Licores.'),(238,'Provisiones\nQuilicura\nquinta de recreo\"'),(239,'Regalos Gourmet'),(240,'Restaurant'),(241,'Restaurante'),(242,'Restaurantes'),(243,'Restaurantes\nRetaurant\nRotiser??a - botilleria \"'),(244,'servicios  '),(245,'servicios de alimentacion     '),(246,'Servicios generales\nSociedad gastronomica\"'),(247,'Supemercado de Abarrotes'),(248,'Super mercado'),(249,'Supermercado'),(250,'Supermercado con expendi?? de alcoholes '),(251,'Supermercado de licores cervecer??a '),(252,'Supermercado Mayorista'),(253,'Supermercado venta de Licores'),(254,'Supermercado y Botilleria'),(255,'Supermercado y Comercializadora de Licores'),(256,'Supermercado y distribuidora '),(257,'Supermercado\nSupmermercado\nTABAQUERIA \"'),(258,'Tabaqueria.'),(259,'Tienda de Vinos y Licores'),(260,'Tiendas'),(261,'Transporte de carga venta de bebidas y licores '),(262,'Venta   y  Distribuci??n  de aguas  y Bebidas '),(263,'Venta al por mayor'),(264,'Venta al por Mayor de Bebidas Alcoholicas'),(265,'Venta al por Mayor de Bebidas Alcoh??licas y No Alcoh??licas'),(266,'Venta Al Por Mayor De Bebidas Alcoholicas Y No Alcoholicas.'),(267,'Venta al por Mayor No Especializada'),(268,'Venta al por Mayor y Menor de bebidas alcoholicas'),(269,'Venta al por Menor de Alimentos y Bebidas Alcoholicos'),(270,'Venta al por menor de alimentos.'),(271,'Venta al por Menor de Bebidas Alcoholicas'),(272,'Venta Al Por Menor de Bebidas Alcoh??licas  Y No Alcoh??licas En Comercio.'),(273,'Venta al por menor de bebidas alcoholicas y almacen '),(274,'Venta al por Menor de Bebidas Alcoholicas y Analcoholicas'),(275,'Venta al por Menor de Bebidas Alcoholicas y No Alcoholicas'),(276,'Venta al por Menor de Bebidas Alcoh??licas y No Alcoh??licas E'),(277,'Venta al por menor de bebidas y alcoholes'),(278,'Venta al por Menor de Bebidas y Licores'),(279,'Venta al por menor de Bebidas\nVenta al por Menor En Comercios Especializados de Huevos'),(280,'Venta al por Menos de Bebidas y Licores'),(281,'Venta Bebidas Alcoholicas'),(282,'Venta de  licores y bebidas  gaseosas'),(283,'Venta de bebidas alcoholicas'),(284,'Venta de Bebidas Alcoholicas y Analcoholicas'),(285,'Venta de bebidas alcoh??licas y analcoholicas al por mayor'),(286,'Venta de Bebidas Alcoholicas\nVenta de licores\"'),(287,'Venta de Productos al por Mayor'),(288,'Venta de vino\nVenta de Vinos'),(289,'venta en comercios especializados'),(290,'VENTA POR INTERNET'),(291,'Venta por Mayor y Menor Alcohol'),(292,'Venta por menor '),(293,'Venta por Menor de Bebidas Alcoholicas y no Alcoholicas y de Alimentos'),(294,'Venta Por Menor de Bebidas Y Licores'),(295,'Venta y distribuci??n de vinos y licores y bebidas de fantas??a '),(296,'Ventas al por mayor de alimentos bebidas y tabaco'),(297,'Ventas al por mayor de bebidas alcoholicas'),(298,'VENTAS AL POR MAYOR DE BEBIDAS ALCOH??LICAS Y NO ALCOHOLICAS'),(299,'VENTAS AL POR MENOR'),(300,'Ventas al por menor de bebidas'),(301,'Ventas al por menor de Bebidas - Confites'),(302,'Ventas al por menor y por mayor de bebidas alcoholicas'),(303,'Ventas de bebidas alcoholicas y no alcoholicas'),(304,'Ventas de Bebidas y Licores'),(305,'Ventas de Carnes A Domicilio'),(306,'Ventas por mayo y menor de cigarros y alcoholes'),(307,'Vi??a'),(308,'Vitivinicola'),(309,'Vta. De bebidas y licores'),(310,'vta.por mayor y menor export.de vinos licores bebidas\n');
/*!40000 ALTER TABLE `tGiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tMarca`
--

DROP TABLE IF EXISTS `tMarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tMarca` (
  `pMarca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cNombre` varchar(15) NOT NULL,
  PRIMARY KEY (`pMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tMarca`
--

LOCK TABLES `tMarca` WRITE;
/*!40000 ALTER TABLE `tMarca` DISABLE KEYS */;
INSERT INTO `tMarca` VALUES (1,'Cristal'),(2,'Coca Cola'),(3,'Absolute'),(4,'Malboro');
/*!40000 ALTER TABLE `tMarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPedido`
--

DROP TABLE IF EXISTS `tPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPedido` (
  `pPedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dPedido` date NOT NULL,
  `cNota` text,
  `tCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fFormaPago` int(10) unsigned NOT NULL,
  `fEstado` int(10) unsigned NOT NULL DEFAULT '1',
  `fClienteSucursal` int(10) unsigned NOT NULL,
  `fUsuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pPedido`),
  KEY `fk_tPedido_formaPago_idx` (`fFormaPago`),
  KEY `fkPedido_estado_idx` (`fEstado`),
  KEY `fk_tPedido_cliente_idx` (`fClienteSucursal`),
  KEY `fkPedido_usuario_idx` (`fUsuario`),
  CONSTRAINT `fkPedido_cliente` FOREIGN KEY (`fClienteSucursal`) REFERENCES `tClienteSucursal` (`pClienteSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkPedido_estado` FOREIGN KEY (`fEstado`) REFERENCES `tEstado` (`pEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkPedido_formaPago` FOREIGN KEY (`fFormaPago`) REFERENCES `tFormaPago` (`pFormaPagoi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkPedido_usuario` FOREIGN KEY (`fUsuario`) REFERENCES `tUsuario` (`pUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPedido`
--

LOCK TABLES `tPedido` WRITE;
/*!40000 ALTER TABLE `tPedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPedidoDet`
--

DROP TABLE IF EXISTS `tPedidoDet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPedidoDet` (
  `pPedidoDet` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fPedido` int(10) unsigned NOT NULL,
  `fProducto` int(10) unsigned NOT NULL,
  `nCantidad` int(11) NOT NULL,
  `nPrecio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pPedidoDet`),
  KEY `fkPedidoDet_pedido_idx` (`fPedido`),
  KEY `fkPedidoDet_producto_idx` (`fProducto`),
  CONSTRAINT `fkPedidoDet_pedido` FOREIGN KEY (`fPedido`) REFERENCES `tPedido` (`pPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkPedidoDet_producto` FOREIGN KEY (`fProducto`) REFERENCES `tProducto` (`pProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPedidoDet`
--

LOCK TABLES `tPedidoDet` WRITE;
/*!40000 ALTER TABLE `tPedidoDet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tPedidoDet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPerfil`
--

DROP TABLE IF EXISTS `tPerfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPerfil` (
  `pPerfil` int(10) unsigned NOT NULL,
  `cNombre` varchar(45) NOT NULL,
  PRIMARY KEY (`pPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPerfil`
--

LOCK TABLES `tPerfil` WRITE;
/*!40000 ALTER TABLE `tPerfil` DISABLE KEYS */;
INSERT INTO `tPerfil` VALUES (1,'ADM'),(2,'VENDEDOR');
/*!40000 ALTER TABLE `tPerfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tProducto`
--

DROP TABLE IF EXISTS `tProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tProducto` (
  `pProducto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fFamilia` int(10) unsigned NOT NULL,
  `fMarca` int(10) unsigned NOT NULL,
  `cDescripcion` varchar(80) NOT NULL,
  `nPrecio` decimal(15,2) NOT NULL,
  `cSKU` varchar(30) NOT NULL,
  `bVigente` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`pProducto`),
  KEY `fkProducto_familia_idx` (`fFamilia`),
  KEY `fkProducto_marca_idx` (`fMarca`),
  CONSTRAINT `fkProducto_familia` FOREIGN KEY (`fFamilia`) REFERENCES `tFamilia` (`pFamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkProducto_marca` FOREIGN KEY (`fMarca`) REFERENCES `tMarca` (`pMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tProducto`
--

LOCK TABLES `tProducto` WRITE;
/*!40000 ALTER TABLE `tProducto` DISABLE KEYS */;
INSERT INTO `tProducto` VALUES (1,1,1,'Paquete de 500 ml',2304.00,'P500',1),(2,3,4,'Marlboro 10 rubio',1919.00,'MARLBORO-R10',1),(3,2,1,'Cristal Lager 1lt',1975.00,'CRISTAL-LAGER-1000',1);
/*!40000 ALTER TABLE `tProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tUsuario`
--

DROP TABLE IF EXISTS `tUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tUsuario` (
  `pUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cNombre` varchar(45) NOT NULL,
  `cPassword` varchar(45) NOT NULL,
  `cEmail` varchar(45) DEFAULT NULL,
  `fPerfil` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pUsuario`),
  KEY `fkUsuario_perfil_idx` (`fPerfil`),
  CONSTRAINT `fkUsuario_perfil` FOREIGN KEY (`fPerfil`) REFERENCES `tPerfil` (`pPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tUsuario`
--

LOCK TABLES `tUsuario` WRITE;
/*!40000 ALTER TABLE `tUsuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tUsuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-03 23:13:06
