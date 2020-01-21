-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.18 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para supermercado_grupo
CREATE DATABASE IF NOT EXISTS `supermercado_grupo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermercado_grupo`;

-- Volcando estructura para tabla supermercado_grupo.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.categoria: ~9 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`) VALUES
	(14, '0categoria'),
	(3, 'electrodomesticos'),
	(8, 'fruteria'),
	(1, 'mock1578649529903'),
	(2, 'musica'),
	(4, 'nueva'),
	(5, 'nueva2'),
	(6, 'otra'),
	(7, 'otra333');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.historico
CREATE TABLE IF NOT EXISTS `historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` float NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_producto` (`id_producto`),
  CONSTRAINT `FK_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.historico: ~10 rows (aproximadamente)
DELETE FROM `historico`;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` (`id`, `precio`, `fecha`, `id_producto`) VALUES
	(1, 12, '2020-01-10 08:21:25', 8),
	(2, 12, '2020-01-10 08:21:34', 8),
	(3, 56, '2020-01-10 08:21:40', 8),
	(4, 100, '2020-01-10 08:21:52', 8),
	(5, 400, '2020-01-10 08:22:15', 8),
	(6, 400, '2020-01-10 08:22:23', 8),
	(7, 400, '2020-01-10 08:22:25', 8),
	(8, 400, '2020-01-10 08:24:02', 8),
	(9, 0, '2020-01-10 08:24:06', 8),
	(10, 1, '2020-01-10 08:24:12', 8);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `imagen` varchar(150) NOT NULL DEFAULT 'https://image.flaticon.com/icons/png/512/372/372627.png',
  `descripcion` mediumtext NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0' COMMENT 'porcentaje descuento de 0 a 100',
  `id_usuario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `FK_usuario` (`id_usuario`),
  KEY `FK_categoria` (`id_categoria`),
  CONSTRAINT `FK_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.producto: ~8 rows (aproximadamente)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `descripcion`, `descuento`, `id_usuario`, `id_categoria`, `fecha_modificacion`) VALUES
	(8, 'unicornio', 2, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 0, 1, 1, '2020-01-10 13:59:20'),
	(12, 'Sabor a unicornio', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 0, 1, 2, '2020-01-10 13:52:11'),
	(21, 'nuevo33333', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 0, 4, 1, '2020-01-10 13:52:11'),
	(22, 'morcilla', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 2, 1, 1, '2020-01-10 13:52:11'),
	(29, 'morcilla de burgos', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 0, 1, 1, '2020-01-10 13:52:11'),
	(30, 'queso de burgos', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 50, 1, 1, '2020-01-10 13:52:11'),
	(31, 'queso manchego', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 100, 1, 1, '2020-01-10 13:52:11');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '1: Usuario normal   2: Administrador',
  `nombre` varchar(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.rol: ~2 rows (aproximadamente)
DELETE FROM `rol`;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`, `nombre`) VALUES
	(2, 'administrador'),
	(1, 'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `contrasenia` varchar(50) NOT NULL DEFAULT '0',
  `id_rol` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `FK_rol` (`id_rol`),
  CONSTRAINT `FK_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.usuario: ~2 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `contrasenia`, `id_rol`) VALUES
	(1, 'admin', 'admin', 2),
	(4, 'Dolores', '123456', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_delete
DELIMITER //
CREATE PROCEDURE `pa_categoria_delete`(
	IN `pId` INT
)
BEGIN

	DELETE FROM categoria WHERE id = pId;

END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_getall
DELIMITER //
CREATE PROCEDURE `pa_categoria_getall`()
BEGIN

   	-- nuestro primer PA
   	/*  tiene pinta que tambien comentarios de bloque */
    SELECT id, nombre FROM categoria ORDER BY nombre ASC LIMIT 500;
    
    -- desde java executeQuery
    -- retorna ResultSet

END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_get_by_id
DELIMITER //
CREATE PROCEDURE `pa_categoria_get_by_id`(
	IN `pId` INT
)
BEGIN

	SELECT id, nombre FROM categoria WHERE id = pId;

END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_insert
DELIMITER //
CREATE PROCEDURE `pa_categoria_insert`(
	IN `p_nombre` VARCHAR(100),
	OUT `p_id` INT
)
BEGIN

	-- crear nuevo registro
	INSERT INTO categoria ( nombre ) VALUES ( p_nombre );
	
	-- obtener el ID generado y SETearlo al parametro salida p_id
	SET p_id = LAST_INSERT_ID();
	

END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_update
DELIMITER //
CREATE PROCEDURE `pa_categoria_update`(
	IN `pId` INT,
	IN `pNombre` VARCHAR(100)
)
BEGIN


	UPDATE categoria SET nombre = pNombre WHERE id = pId;
	
	-- desde java executeUpdate, retorna affectedRows int

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
