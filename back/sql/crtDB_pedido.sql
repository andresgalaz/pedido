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
INSERT INTO `tComuna` VALUES (1,'Arica','Arica','Región de Arica y Parinacota'),(2,'Camarones','Arica','Región de Arica y Parinacota'),(3,'Putre','Parinacota','Región de Arica y Parinacota'),(4,'General Lagos','Parinacota','Región de Arica y Parinacota'),(5,'Iquique','Iquique','Región de Tarapacá'),(6,'Camiña','Tamarugal','Región de Tarapacá'),(7,'Colchane','Tamarugal','Región de Tarapacá'),(8,'Huara','Tamarugal','Región de Tarapacá'),(9,'Pica','Tamarugal','Región de Tarapacá'),(10,'Pozo Almonte','Tamarugal','Región de Tarapacá'),(11,'Alto Hospicio','Iquique','Región de Tarapacá'),(12,'Antofagasta','Antofagasta','Región de Antofagasta'),(13,'Mejillones','Antofagasta','Región de Antofagasta'),(14,'Sierra Gorda','Antofagasta','Región de Antofagasta'),(15,'Taltal','Antofagasta','Región de Antofagasta'),(16,'Calama','El Loa','Región de Antofagasta'),(17,'Ollagüe','El Loa','Región de Antofagasta'),(18,'San Pedro de Atacama','El Loa','Región de Antofagasta'),(19,'Tocopilla','Tocopilla','Región de Antofagasta'),(20,'María Elena','Tocopilla','Región de Antofagasta'),(21,'Copiapó','Copiapó','Región de Atacama'),(22,'Caldera','Copiapó','Región de Atacama'),(23,'Tierra Amarilla','Copiapó','Región de Atacama'),(24,'Chañaral','Chañaral','Región de Atacama'),(25,'Diego de Almagro','Chañaral','Región de Atacama'),(26,'Vallenar','Huasco','Región de Atacama'),(27,'Alto del Carmen','Huasco','Región de Atacama'),(28,'Freirina','Huasco','Región de Atacama'),(29,'Huasco','Huasco','Región de Atacama'),(30,'La Serena','Elqui','Región de Coquimbo'),(31,'Coquimbo','Elqui','Región de Coquimbo'),(32,'Andacollo','Elqui','Región de Coquimbo'),(33,'La Higuera','Elqui','Región de Coquimbo'),(34,'Paiguano','Elqui','Región de Coquimbo'),(35,'Vicuña','Elqui','Región de Coquimbo'),(36,'Illapel','Choapa','Región de Coquimbo'),(37,'Canela','Choapa','Región de Coquimbo'),(38,'Los Vilos','Choapa','Región de Coquimbo'),(39,'Pichidangui','Choapa','Región de Coquimbo'),(40,'Salamanca','Choapa','Región de Coquimbo'),(41,'Ovalle','Limari','Región de Coquimbo'),(42,'Combarbalá','Limari','Región de Coquimbo'),(43,'Monte Patria','Limari','Región de Coquimbo'),(44,'Punitaqui','Limari','Región de Coquimbo'),(45,'Río Hurtado','Limari','Región de Coquimbo'),(46,'Valparaíso','Valparaíso','Región de Valparaíso'),(47,'Casablanca','Valparaíso','Región de Valparaíso'),(48,'Concón','Valparaíso','Región de Valparaíso'),(49,'Juan Fernández','Valparaíso','Región de Valparaíso'),(50,'Puchuncaví','Valparaíso','Región de Valparaíso'),(51,'Quilpué','Marga Marga','Región de Valparaíso'),(52,'Quintero','Valparaíso','Región de Valparaíso'),(53,'Villa Alemana','Marga Marga','Región de Valparaíso'),(54,'Viña del Mar','Valparaíso','Región de Valparaíso'),(55,'Islade Pascua','Isla de Pascua','Región de Valparaíso'),(56,'Los Andes','Los Andes','Región de Valparaíso'),(57,'Calle Larga','Los Andes','Región de Valparaíso'),(58,'Rinconada','Los Andes','Región de Valparaíso'),(59,'San Esteban','Los Andes','Región de Valparaíso'),(60,'La Ligua','Petorca','Región de Valparaíso'),(61,'Cabildo','Petorca','Región de Valparaíso'),(62,'Papudo','Petorca','Región de Valparaíso'),(63,'Petorca','Petorca','Región de Valparaíso'),(64,'Zapallar','Petorca','Región de Valparaíso'),(65,'Quillota','Quillota','Región de Valparaíso'),(66,'Calera','Quillota','Región de Valparaíso'),(67,'Hijuelas','Quillota','Región de Valparaíso'),(68,'La Cruz','Quillota','Región de Valparaíso'),(69,'Limache','Marga Marga','Región de Valparaíso'),(70,'Nogales','Quillota  ','Región de Valparaíso'),(71,'Olmué','Marga Marga','Región de Valparaíso'),(72,'San Antonio','San Antonio','Región de Valparaíso'),(73,'Algarrobo','San Antonio','Región de Valparaíso'),(74,'Cartagena','San Antonio','Región de Valparaíso'),(75,'El Quisco','San Antonio','Región de Valparaíso'),(76,'El Tabo','San Antonio','Región de Valparaíso'),(77,'Santo Domingo','San Antonio','Región de Valparaíso'),(78,'San Felipe','San Felipe','Región de Valparaíso'),(79,'Catemu','San Felipe','Región de Valparaíso'),(80,'Llaillay','San Felipe','Región de Valparaíso'),(81,'Panquehue','San Felipe','Región de Valparaíso'),(82,'Putaendo','San Felipe','Región de Valparaíso'),(83,'Santa María','San Felipe','Región de Valparaíso'),(84,'Rancagua','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(85,'Codegua','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(86,'Coinco','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(87,'Coltauco','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(88,'Doñihue','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(89,'Graneros','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(90,'Las Cabras','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(91,'Machalí','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(92,'Malloa','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(93,'Mostazal','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(94,'Olivar','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(95,'Peumo','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(96,'Pichidegua','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(97,'Quinta de Tilcoco','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(98,'Rengo','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(99,'Requínoa','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(100,'San Vicente','Cachapoal','Región del Libertador General Bernardo O`Higgins'),(101,'Pichilemu','Cardenal Caro','Región del Libertador General Bernardo O`Higgins'),(102,'La Estrella','Cardenal Caro','Región del Libertador General Bernardo O`Higgins'),(103,'Litueche','Cardenal Caro','Región del Libertador General Bernardo O`Higgins'),(104,'Marchihue','Cardenal Caro','Región del Libertador General Bernardo O`Higgins'),(105,'Navidad','Cardenal Caro','Región del Libertador General Bernardo O`Higgins'),(106,'Paredones','Cardenal Caro','Región del Libertador General Bernardo O`Higgins'),(107,'San Fernando','Colchagua','Región del Libertador General Bernardo O`Higgins'),(108,'Chépica','Colchagua','Región del Libertador General Bernardo O`Higgins'),(109,'Chimbarongo','Colchagua','Región del Libertador General Bernardo O`Higgins'),(110,'Lolol','Colchagua','Región del Libertador General Bernardo O`Higgins'),(111,'Nancagua','Colchagua','Región del Libertador General Bernardo O`Higgins'),(112,'Palmilla','Colchagua','Región del Libertador General Bernardo O`Higgins'),(113,'Peralillo','Colchagua','Región del Libertador General Bernardo O`Higgins'),(114,'Placilla','Colchagua','Región del Libertador General Bernardo O`Higgins'),(115,'Pumanque','Colchagua','Región del Libertador General Bernardo O`Higgins'),(116,'Santa Cruz','Colchagua','Región del Libertador General Bernardo O`Higgins'),(117,'Talca','Talca','Región del Maule'),(118,'Constitución','Talca','Región del Maule'),(119,'Curepto','Talca','Región del Maule'),(120,'Empedrado','Talca','Región del Maule'),(121,'Maule','Talca','Región del Maule'),(122,'Pelarco','Talca','Región del Maule'),(123,'Pencahue','Talca','Región del Maule'),(124,'Río Claro','Talca','Región del Maule'),(125,'San Clemente','Talca','Región del Maule'),(126,'San Rafael','Talca','Región del Maule'),(127,'Cauquenes','Cauquenes','Región del Maule'),(128,'Chanco','Cauquenes','Región del Maule'),(129,'Pelluhue','Cauquenes','Región del Maule'),(130,'Curicó','Curico','Región del Maule'),(131,'Hualañé','Curico','Región del Maule'),(132,'Licantén','Curico','Región del Maule'),(133,'Molina','Curico','Región del Maule'),(134,'Rauco','Curico','Región del Maule'),(135,'Romeral','Curico','Región del Maule'),(136,'Sagrada Familia','Curico','Región del Maule'),(137,'Teno','Curico','Región del Maule'),(138,'Vichuquén','Curico','Región del Maule'),(139,'Linares','Linares','Región del Maule'),(140,'Colbún','Linares','Región del Maule'),(141,'Longaví','Linares','Región del Maule'),(142,'Parral','Linares','Región del Maule'),(143,'Retiro','Linares','Región del Maule'),(144,'San Javier','Linares','Región del Maule'),(145,'Villa Alegre','Linares','Región del Maule'),(146,'Yerbas Buenas','Linares','Región del Maule'),(147,'Concepción','Concepción','Región del Biobío'),(148,'Coronel','Concepción','Región del Biobío'),(149,'Chiguayante','Concepción','Región del Biobío'),(150,'Florida','Concepción','Región del Biobío'),(151,'Hualqui','Concepción','Región del Biobío'),(152,'Lota','Concepción','Región del Biobío'),(153,'Penco','Concepción','Región del Biobío'),(154,'San Pedro de la Paz','Concepción','Región del Biobío'),(155,'Santa Juana','Concepción','Región del Biobío'),(156,'Talcahuano','Concepción','Región del Biobío'),(157,'Tomé','Concepción','Región del Biobío'),(158,'Hualpén','Concepción','Región del Biobío'),(159,'Lebu','Arauco','Región del Biobío'),(160,'Arauco','Arauco','Región del Biobío'),(161,'Cañete','Arauco','Región del Biobío'),(162,'Contulmo','Arauco','Región del Biobío'),(163,'Curanilahue','Arauco','Región del Biobío'),(164,'Los Álamos','Arauco','Región del Biobío'),(165,'Tirúa','Arauco','Región del Biobío'),(166,'Los Ángeles','Bío-Bío','Región del Biobío'),(167,'Antuco','Bío-Bío','Región del Biobío'),(168,'Cabrero','Bío-Bío','Región del Biobío'),(169,'Laja','Bío-Bío','Región del Biobío'),(170,'Mulchén','Bío-Bío','Región del Biobío'),(171,'Nacimiento','Bío-Bío','Región del Biobío'),(172,'Negrete','Bío-Bío','Región del Biobío'),(173,'Quilaco','Bío-Bío','Región del Biobío'),(174,'Quilleco','Bío-Bío','Región del Biobío'),(175,'San Rosendo','Bío-Bío','Región del Biobío'),(176,'Santa Bárbara','Bío-Bío','Región del Biobío'),(177,'Tucapel','Bío-Bío','Región del Biobío'),(178,'Yumbel','Bío-Bío','Región del Biobío'),(179,'Alto Biobío','Bío-Bío','Región del Biobío'),(180,'Chillán','Ñuble','Región del Biobío'),(181,'Bulnes','Ñuble','Región del Biobío'),(182,'Cobquecura','Ñuble','Región del Biobío'),(183,'Coelemu','Ñuble','Región del Biobío'),(184,'Coihueco','Ñuble','Región del Biobío'),(185,'Chillán Viejo','Ñuble','Región del Biobío'),(186,'El Carmen','Ñuble','Región del Biobío'),(187,'Ninhue','Ñuble','Región del Biobío'),(188,'Ñiquén','Ñuble','Región del Biobío'),(189,'Pemuco','Ñuble','Región del Biobío'),(190,'Lo Pinto','Ñuble','Región del Biobío'),(191,'Portezuelo','Ñuble','Región del Biobío'),(192,'Quillón','Ñuble','Región del Biobío'),(193,'Quirihue','Ñuble','Región del Biobío'),(194,'Ránquil','Ñuble','Región del Biobío'),(195,'San Carlos','Ñuble','Región del Biobío'),(196,'San Fabián','Ñuble','Región del Biobío'),(197,'San Ignacio','Ñuble','Región del Biobío'),(198,'San Nicolás','Ñuble','Región del Biobío'),(199,'Treguaco','Ñuble','Región del Biobío'),(200,'Yungay','Ñuble','Región del Biobío'),(201,'Temuco','Cautín','Región de La Araucanía'),(202,'Carahue','Cautín','Región de La Araucanía'),(203,'Cunco','Cautín','Región de La Araucanía'),(204,'Curarrehue','Cautín','Región de La Araucanía'),(205,'Freire','Cautín','Región de La Araucanía'),(206,'Galvarino','Cautín','Región de La Araucanía'),(207,'Gorbea','Cautín','Región de La Araucanía'),(208,'Lautaro','Cautín','Región de La Araucanía'),(209,'Loncoche','Cautín','Región de La Araucanía'),(210,'Melipeuco','Cautín','Región de La Araucanía'),(211,'Nueva Imperial','Cautín','Región de La Araucanía'),(212,'Padre Las Casas','Cautín','Región de La Araucanía'),(213,'Perquenco','Cautín','Región de La Araucanía'),(214,'Pitrufquén','Cautín','Región de La Araucanía'),(215,'Pucón','Cautín','Región de La Araucanía'),(216,'Saavedra','Cautín','Región de La Araucanía'),(217,'Teodoro Schmidt','Cautín','Región de La Araucanía'),(218,'Toltén','Cautín','Región de La Araucanía'),(219,'Vilcún','Cautín','Región de La Araucanía'),(220,'Villarrica','Cautín','Región de La Araucanía'),(221,'Cholchol','Cautín','Región de La Araucanía'),(222,'Angol','Malleco','Región de La Araucanía'),(223,'Collipulli','Malleco','Región de La Araucanía'),(224,'Curacautín','Malleco','Región de La Araucanía'),(225,'Ercilla','Malleco','Región de La Araucanía'),(226,'Lonquimay','Malleco','Región de La Araucanía'),(227,'Los Sauces','Malleco','Región de La Araucanía'),(228,'Lumaco','Malleco','Región de La Araucanía'),(229,'Purén','Malleco','Región de La Araucanía'),(230,'Renaico','Malleco','Región de La Araucanía'),(231,'Traiguén','Malleco','Región de La Araucanía'),(232,'Victoria','Malleco','Región de La Araucanía'),(233,'Valdivia','Valdivia','Región de Los Ríos'),(234,'Corral','Valdivia','Región de Los Ríos'),(235,'Futrono','Ranco','Región de Los Ríos'),(236,'La Unión','Ranco','Región de Los Ríos'),(237,'Lago Ranco','Ranco','Región de Los Ríos'),(238,'Lanco','Valdivia','Región de Los Ríos'),(239,'Los Lagos','Valdivia','Región de Los Ríos'),(240,'Máfil','Valdivia','Región de Los Ríos'),(241,'Mariquina','Valdivia','Región de Los Ríos'),(242,'Paillaco','Valdivia','Región de Los Ríos'),(243,'Panguipulli','Valdivia','Región de Los Ríos'),(244,'Río Bueno','Ranco','Región de Los Ríos'),(245,'Puerto Montt','Llanquihue','Región de Los Lagos'),(246,'Calbuco','Llanquihue','Región de Los Lagos'),(247,'Cochamó','Llanquihue','Región de Los Lagos'),(248,'Fresia','Llanquihue','Región de Los Lagos'),(249,'Frutillar','Llanquihue','Región de Los Lagos'),(250,'Los Muermos','Llanquihue','Región de Los Lagos'),(251,'Llanquihue','Llanquihue','Región de Los Lagos'),(252,'Maullín','Llanquihue','Región de Los Lagos'),(253,'Puerto Varas','Llanquihue','Región de Los Lagos'),(254,'Castro','Chiloe','Región de Los Lagos'),(255,'Ancud','Chiloe','Región de Los Lagos'),(256,'Chonchi','Chiloe','Región de Los Lagos'),(257,'Curaco de Vélez','Chiloe','Región de Los Lagos'),(258,'Dalcahue','Chiloe','Región de Los Lagos'),(259,'Puqueldón','Chiloe','Región de Los Lagos'),(260,'Queilén','Chiloe','Región de Los Lagos'),(261,'Quellón','Chiloe','Región de Los Lagos'),(262,'Quemchi','Chiloe','Región de Los Lagos'),(263,'Quinchao','Chiloe','Región de Los Lagos'),(264,'Osorno','Osorno','Región de Los Lagos'),(265,'Puerto Octay','Osorno','Región de Los Lagos'),(266,'Purranque','Osorno','Región de Los Lagos'),(267,'Puyehue','Osorno','Región de Los Lagos'),(268,'Río Negro','Osorno','Región de Los Lagos'),(269,'San Juan de la Costa','Osorno','Región de Los Lagos'),(270,'San Pablo','Osorno','Región de Los Lagos'),(271,'Chaitén','Palena','Región de Los Lagos'),(272,'Futaleufú','Palena','Región de Los Lagos'),(273,'Hualaihué','Palena','Región de Los Lagos'),(274,'Palena','Palena','Región de Los Lagos'),(275,'Coihaique','Coihaique  ','Región de Aysén del General Carlos Ibáñez del Campo'),(276,'Lago Verde','Coihaique  ','Región de Aysén del General Carlos Ibáñez del Campo'),(277,'Aisén','Aisén','Región de Aysén del General Carlos Ibáñez del Campo'),(278,'Cisnes','Aisén','Región de Aysén del General Carlos Ibáñez del Campo'),(279,'Guaitecas','Aisén','Región de Aysén del General Carlos Ibáñez del Campo'),(280,'Cochrane','Capitan Prat','Región de Aysén del General Carlos Ibáñez del Campo'),(281,'OHiggins','Capitan Prat','Región de Aysén del General Carlos Ibáñez del Campo'),(282,'Tortel','Capitan Prat','Región de Aysén del General Carlos Ibáñez del Campo'),(283,'Chile Chico','General Carrera','Región de Aysén del General Carlos Ibáñez del Campo'),(284,'Río Ibáñez','General Carrera','Región de Aysén del General Carlos Ibáñez del Campo'),(285,'Punta Arenas','Magallanes','Región de Magallanes y de la Antártica Chilena'),(286,'Laguna Blanca','Magallanes','Región de Magallanes y de la Antártica Chilena'),(287,'Río Verde','Magallanes','Región de Magallanes y de la Antártica Chilena'),(288,'San Gregorio','Magallanes','Región de Magallanes y de la Antártica Chilena'),(289,'Cabo de Hornos','Antártica Chilena','Región de Magallanes y de la Antártica Chilena'),(290,'Antártica','Antártica Chilena','Región de Magallanes y de la Antártica Chilena'),(291,'Porvenir','Tierra del Fuego','Región de Magallanes y de la Antártica Chilena'),(292,'Primavera','Tierra del Fuego','Región de Magallanes y de la Antártica Chilena'),(293,'Timaukel','Tierra del Fuego','Región de Magallanes y de la Antártica Chilena'),(294,'Natales','Ultima Esperanza','Región de Magallanes y de la Antártica Chilena'),(295,'Torres del Paine','Ultima Esperanza','Región de Magallanes y de la Antártica Chilena');
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
INSERT INTO `tFormaPago` VALUES (1,'Contado Efectivo',0),(2,'Crédito 7 días',7),(3,'Crédito 15 días',15),(4,'Crédito 30 días',30),(5,'Crédito 45 días',45),(6,'Crédito 60 días',60),(7,'Crédito 90 días',90),(8,'Crédito 120 días',120),(9,'Contado Cheque contra entrega',0),(10,'7 días Cheque contra entrega',7),(11,'15 días Cheque contra entrega',15),(12,'30 días Cheque contra entrega',30),(13,'45 días Cheque contra entrega',45),(14,'60 días Cheque contra entrega',60),(15,'90 días Cheque contra entrega',90),(16,'120 días Cheque contra entrega',120);
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
INSERT INTO `tGiro` VALUES (1,'Abarrotes y Licores'),(2,'Abarrotes\nAbarrotes'),(3,'Alimento para Mascotas\nAlimentos Bebidas\"'),(4,'alimentos embasados confites\nAlmacén\nAlmacen botillería\"'),(5,'Almacen de Comestibles\nAlmacen Rotiseria'),(6,'Almacen y Botilleria'),(7,'Almacen\nAlmacen'),(8,'Almacen\nAlmacen- Botilleria'),(9,'Almacences Pequeños'),(10,'Almacenes Medianos de Alimentos'),(11,'Almacenes Pequeños'),(12,'Almancen de Comestibles y Botilleria'),(13,'Amasanderia\nArriendo Maquinaria\"'),(14,'Artesania inciensos bisutería tabaco y productos para el tabaco '),(15,'Autoservicio'),(16,'b0tilleria'),(17,'Banquetera'),(18,'Banqueteria'),(19,'Banquetero'),(20,'Bar'),(21,'Bar-Restaurant-Botilleria '),(22,'Bazar'),(23,'Borillería'),(24,'Botelleria'),(25,'BOTIILLERIA MINIMARKET'),(26,'Botileria'),(27,'Botilleeia'),(28,'Botilleira'),(29,'Botillera'),(30,'Botilleri'),(31,'Botillería'),(32,'Botilleria  - confites '),(33,'Botilleria  -abarrotes '),(34,'Botilleria  / confites '),(35,'Botilleria  /Confites '),(36,'Botilleria  comercializadora de bebida\nBotilleria  y confites \"'),(37,'Botilleria  y distribuidora  de Bebidas '),(38,'Botilleria - almacen'),(39,'Botilleria - almacen  por menor '),(40,'Botilleria - distribuidora de vinos y licores por mayor y menor - transporte de carga por carretera '),(41,'Botilleria - Fiambreria y Almacen'),(42,'Botilleria - Minimarket'),(43,'Botilleria - Minimarket.'),(44,'Botilleria - restaurant'),(45,'Botilleria -confiteria '),(46,'botilleria almacen '),(47,'Botilleria confiteria almacen y lacteos'),(48,'Botilleria confites'),(49,'botilleria distribuidora'),(50,'Botilleria Minimarket'),(51,'Botilleria Supermercado Licores'),(52,'Botilleria venta de confites-cigarros'),(53,'Botilleria y abarrotes'),(54,'BOTILLERIA Y ALMACEN'),(55,'Botilleria y Confeteria'),(56,'Botilleria y Confiteria'),(57,'Botilleria y Confiteria.'),(58,'Botilleria y Confites'),(59,'Botilleria y Dist. de Licores'),(60,'Botilleria y Distribucion de vinos y Licores'),(61,'Botilleria y Distribuidora al por Mayor y Menor Vinos\nBotilleria y Distribuidora de Licores\"'),(62,'Botilleria y expendio de bebidas alcoholicas '),(63,'Botilleria y Mini Market'),(64,'Botilleria y Minimarket.'),(65,'Botilleria y Transporte de Pasajeros.'),(66,'Botilleria y Venta de Confetis'),(67,'Botilleria y Venta de Confites'),(68,'Botilleria\nBotilleria'),(69,'Botilleria\nBotilleria'),(70,'Botilleria\nBotilleria'),(71,'Botilleria\nBotilleria'),(72,'Botilleria\nBotilleria'),(73,'Botilleria\nBotilleria'),(74,'Botilleria\nBotilleria'),(75,'Botilleria\nBotilleria'),(76,'Botilleria\nBotilleria'),(77,'Botilleria\nBotilleria'),(78,'Botilleria\nBotilleria'),(79,'Botilleria\nBotilleria'),(80,'Botíllería\nBotilleria'),(81,'Botilleria\nBotillería'),(82,'Botilleria\nBotilleria'),(83,'Botilleria\nBotilleria'),(84,'Botilleria\nBotilleria'),(85,'Botilleria\nBotilleria'),(86,'Botilleria\nBotilleria- Confites \"'),(87,'Botilleria- Minimarket '),(88,'Botilleria-abarrotes '),(89,'Botilleria-abarrotes-panadería '),(90,'Botilleria-Confiteria '),(91,'Botilleria-Confites '),(92,'Botilleria-Minimarket '),(93,'Botilleria.'),(94,'Botilleria/ Eventos  / Bar / Discotheke '),(95,'Botillerias'),(96,'BOTILLERRIA '),(97,'Botilletia '),(98,'Botilletia -confites-cigarros'),(99,'Botilletia-abarrotes '),(100,'Botillleria\nBOTILLRIA \"'),(101,'Botillria-confites '),(102,'Botlleria'),(103,'Cabaret y Restaurant'),(104,'COM DISTR IMPORT Y EXPORT DE VINOS'),(105,'Com.Vinos Licores\nComer.de prod text.cigarr'),(106,'Comercial'),(107,'Comercialización de vinos'),(108,'Comercializadora'),(109,'Comercializadora  de alimentos y materia prima para amasanderia'),(110,'comercializadora de alimento y Bebidas Alcoholicas y No Alcoholicas'),(111,'Comercializadora de Alimentos'),(112,'comercializadora de alimentos\nComercializadora de bebidas alcoholicas\"'),(113,'comercializadora de Bebidas y alimentos'),(114,'Comercializadora De Tabacos E Insumos Y Accesorios Relacionados'),(115,'Comercializadora de vinos y licores'),(116,'Comercializadora licores tabaco'),(117,'Comercializadora Mayorista y Minorista'),(118,'Comidas rapidas'),(119,'Compra Vende Animales\nCompra y Venta de Abarrotes\"'),(120,'Compra y venta de bebidas '),(121,'Compra y venta de productos'),(122,'Compra y venta por mayor y menor '),(123,'COMPRAVENTA DE BEBIDAS ALCOHÓLICA Y ANALCHÓLICAS'),(124,'Confitería '),(125,'Confitería tabaquería '),(126,'Confiteria y Abarrotes'),(127,'Confites \nConstructora\nDelivery \"'),(128,'Depoósito de licores'),(129,'DEPOSITO DE ALCOHOLES'),(130,'Deposito de Alcoholes\nDEPOSITO DE BEBIDAS ALCOHOLICAS\"'),(131,'Deposito de Bebidas y Licores\nDeposito de Licores\"'),(132,'Deposito de Licores Confitería Y Helados'),(133,'Deposito de Licores\nDeposito de Licores'),(134,'Deposito Licores'),(135,'Didistribucion de bebidas alcoholicas y analcoholicas al al por mayor'),(136,'Discoteque \nDist Bebidas Vinos Licores\"'),(137,'Dist de bebidas cervezas vinos y licores '),(138,'dist produccto de aseo'),(139,'DIST VINOS Y LICORES'),(140,'Dist Vinos\nDist y ventas de Bebidas alcoholicás\"'),(141,'DIST. DE BEBIDAS  '),(142,'DIST. DE BEBIDAS ALCOHOLICAS'),(143,'Dist. de bebidas\nDistribución de bebidas alcoholicas\"'),(144,'Distribucion de De Bebidas Alc y Confites'),(145,'Distribución de Licores y bebidas de Fantasia'),(146,'Distribución y Com. de Alimentos y Bebestibles'),(147,'Distribucion y Venta de bebidas alcoholicas y analcoholicas'),(148,'Distribuidor'),(149,'Distribuidor Mayorista'),(150,'Distribuidora'),(151,'distribuidora  de licores'),(152,'Distribuidora - Botilleria'),(153,'Distribuidora / Lunes A Viernes de 10 A 13 Horas'),(154,'distribuidora abarrotes '),(155,'Distribuidora al Por Mayor y Menor de Bebidas Alcoholicas.'),(156,'Distribuidora Alcohol'),(157,'Distribuidora Bebidas; Licores Vinos'),(158,'DISTRIBUIDORA BOTILLERIA '),(159,'Distribuidora de Alcoholes'),(160,'Distribuidora de bebidas'),(161,'Distribuidora de Bebidas Alcohilicas'),(162,'Distribuidora de Bebidas Alcohlicas y Analcoholicas'),(163,'Distribuidora de Bebidas Alcoholicas'),(164,'Distribuidora de Bebidas Alcoholicas y Analcoholicas'),(165,'Distribuidora de Bebidas Alcoholicas y No Alcoholicas'),(166,'Distribuidora de Licores'),(167,'Distribuidora de Licores Vinos y Bebidas Alcoholicas'),(168,'Distribuidora de Vino\nDistribuidora de vinos\"'),(169,'Distribuidora de Vinos y Bebidas Alcoholicas'),(170,'Distribuidora de Vinos y Licores'),(171,'Distribuidora de vinos y licores por mayor'),(172,'Distribuidora de Vinos\nDistribuidora de vinos'),(173,'Distribuidora de Vinos\nDistribuidora de vinos'),(174,'Distribuidora de Vinos\nDistribuidora de Vinos'),(175,'Distribuidora Licores'),(176,'Distribuidora Licores y Vinos'),(177,'Distribuidora Vinos Bebidas Cervezas ventas por menor y transporte '),(178,'Distribuidora y Botilleria '),(179,'Distribuidora y comercializadora '),(180,'Distribuidora y comercializadora de abarrotes'),(181,'DISTRUBUIDORA ARTI ASEO \nDistruibuidora de Licores\"'),(182,'DITRIBUIDORA'),(183,'elaboración y venta de pizzas empanadas y bebidas'),(184,'Emporio'),(185,'Empresa Publicidad'),(186,'ESTRUCTURAS METALICAS'),(187,'Expendio de Bebidas Alcoholicas\nExpendio de Bebidas Alcoholicas'),(188,'Expendío de Licores y Abarrotes '),(189,'Farmacia y perfumería '),(190,'Grandes Distribuidoras al Detalle'),(191,'Grandes Establecimientos'),(192,'Grandes Establecimientos de Venta de Alimentos y Licores'),(193,'Grandes Establecimientos de Ventas de Alimentos'),(194,'Grandes Tiendas'),(195,'Importacion de Insumos Para La Minería'),(196,'Importadora y Distribuidora'),(197,'Licoreria\nLiquior Store\"'),(198,'Los socios '),(199,'Mayorista'),(200,'Mayorista Alcohol'),(201,'mayorista de alcoholicas botilleria'),(202,'Mayorista de Vinos y Bebidas'),(203,'Mayorista de Vinos y Bebidas Alcoholicas'),(204,'Mayorista de Vinos y Bebidas Alcoholicas de Fantasia'),(205,'Mayorista de Vinos y Bebidas Alcohólicas y de Fantasía'),(206,'Mayorista de Vinos y Otras Bebidas Alcoholicas'),(207,'Mayorista de Vinos\nMayorista Licores\"'),(208,'Mayorista Vino y Licores'),(209,'Mayoristas de Vinos y Bebidas Alcoholicas'),(210,'Mini distribuidor vino'),(211,'Mini market'),(212,'Mini market y botilleria'),(213,'Mini mercado'),(214,'Mini mercado de alcoholes'),(215,'Minimarket'),(216,'Minimarket - botilleria'),(217,'Minimarket Botilleria'),(218,'Minimarket y botiillería'),(219,'Minimarket y Botilleria'),(220,'Minimarket y Botilleria.'),(221,'Minimarket\nMinimarket'),(222,'Minimarket\nMinimarket'),(223,'Minimarket\nMinimarket-Botilleria \"'),(224,'minimarkey'),(225,'minimercado'),(226,'Minimercado de alcoholes'),(227,'minimerket'),(228,'NULL'),(229,'Operaciones Financieras'),(230,'otilleria '),(231,'OTRAS ACTIVIDADES PROFESIONALES\nParitular\nPARTICULAR\nParticular con boleta\"'),(232,'Particulares'),(233,'Pasteleria'),(234,'persona'),(235,'PERSONAL'),(236,'Prod. Comercializacion y Exportacion de Vinos'),(237,'Productora de Eventos y Mayoristas de Vinos y Licores.'),(238,'Provisiones\nQuilicura\nquinta de recreo\"'),(239,'Regalos Gourmet'),(240,'Restaurant'),(241,'Restaurante'),(242,'Restaurantes'),(243,'Restaurantes\nRetaurant\nRotisería - botilleria \"'),(244,'servicios  '),(245,'servicios de alimentacion     '),(246,'Servicios generales\nSociedad gastronomica\"'),(247,'Supemercado de Abarrotes'),(248,'Super mercado'),(249,'Supermercado'),(250,'Supermercado con expendió de alcoholes '),(251,'Supermercado de licores cervecería '),(252,'Supermercado Mayorista'),(253,'Supermercado venta de Licores'),(254,'Supermercado y Botilleria'),(255,'Supermercado y Comercializadora de Licores'),(256,'Supermercado y distribuidora '),(257,'Supermercado\nSupmermercado\nTABAQUERIA \"'),(258,'Tabaqueria.'),(259,'Tienda de Vinos y Licores'),(260,'Tiendas'),(261,'Transporte de carga venta de bebidas y licores '),(262,'Venta   y  Distribución  de aguas  y Bebidas '),(263,'Venta al por mayor'),(264,'Venta al por Mayor de Bebidas Alcoholicas'),(265,'Venta al por Mayor de Bebidas Alcohólicas y No Alcohólicas'),(266,'Venta Al Por Mayor De Bebidas Alcoholicas Y No Alcoholicas.'),(267,'Venta al por Mayor No Especializada'),(268,'Venta al por Mayor y Menor de bebidas alcoholicas'),(269,'Venta al por Menor de Alimentos y Bebidas Alcoholicos'),(270,'Venta al por menor de alimentos.'),(271,'Venta al por Menor de Bebidas Alcoholicas'),(272,'Venta Al Por Menor de Bebidas Alcohólicas  Y No Alcohólicas En Comercio.'),(273,'Venta al por menor de bebidas alcoholicas y almacen '),(274,'Venta al por Menor de Bebidas Alcoholicas y Analcoholicas'),(275,'Venta al por Menor de Bebidas Alcoholicas y No Alcoholicas'),(276,'Venta al por Menor de Bebidas Alcohólicas y No Alcohólicas E'),(277,'Venta al por menor de bebidas y alcoholes'),(278,'Venta al por Menor de Bebidas y Licores'),(279,'Venta al por menor de Bebidas\nVenta al por Menor En Comercios Especializados de Huevos'),(280,'Venta al por Menos de Bebidas y Licores'),(281,'Venta Bebidas Alcoholicas'),(282,'Venta de  licores y bebidas  gaseosas'),(283,'Venta de bebidas alcoholicas'),(284,'Venta de Bebidas Alcoholicas y Analcoholicas'),(285,'Venta de bebidas alcohólicas y analcoholicas al por mayor'),(286,'Venta de Bebidas Alcoholicas\nVenta de licores\"'),(287,'Venta de Productos al por Mayor'),(288,'Venta de vino\nVenta de Vinos'),(289,'venta en comercios especializados'),(290,'VENTA POR INTERNET'),(291,'Venta por Mayor y Menor Alcohol'),(292,'Venta por menor '),(293,'Venta por Menor de Bebidas Alcoholicas y no Alcoholicas y de Alimentos'),(294,'Venta Por Menor de Bebidas Y Licores'),(295,'Venta y distribución de vinos y licores y bebidas de fantasía '),(296,'Ventas al por mayor de alimentos bebidas y tabaco'),(297,'Ventas al por mayor de bebidas alcoholicas'),(298,'VENTAS AL POR MAYOR DE BEBIDAS ALCOHÓLICAS Y NO ALCOHOLICAS'),(299,'VENTAS AL POR MENOR'),(300,'Ventas al por menor de bebidas'),(301,'Ventas al por menor de Bebidas - Confites'),(302,'Ventas al por menor y por mayor de bebidas alcoholicas'),(303,'Ventas de bebidas alcoholicas y no alcoholicas'),(304,'Ventas de Bebidas y Licores'),(305,'Ventas de Carnes A Domicilio'),(306,'Ventas por mayo y menor de cigarros y alcoholes'),(307,'Viña'),(308,'Vitivinicola'),(309,'Vta. De bebidas y licores'),(310,'vta.por mayor y menor export.de vinos licores bebidas\n');
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
