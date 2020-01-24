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
DROP DATABASE IF EXISTS `supermercado_grupo`;
CREATE DATABASE IF NOT EXISTS `supermercado_grupo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermercado_grupo`;

-- Volcando estructura para tabla supermercado_grupo.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.categoria: ~9 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`) VALUES
	(14, '0categoria'),
	(3, 'electrodomesticos'),
	(8, 'fruteria'),
	(6, 'jugueteria'),
	(1, 'mock1578649529903'),
	(2, 'musica'),
	(4, 'nueva'),
	(5, 'nueva2'),
	(7, 'otra333');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.historico
DROP TABLE IF EXISTS `historico`;
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

-- Volcando estructura para tabla supermercado_grupo.inactivo
DROP TABLE IF EXISTS `inactivo`;
CREATE TABLE IF NOT EXISTS `inactivo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_eliminado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_eliminado` (`id_eliminado`),
  CONSTRAINT `FK_eliminado` FOREIGN KEY (`id_eliminado`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla supermercado_grupo.inactivo: ~0 rows (aproximadamente)
DELETE FROM `inactivo`;
/*!40000 ALTER TABLE `inactivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `inactivo` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.producto
DROP TABLE IF EXISTS `producto`;
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.producto: ~19 rows (aproximadamente)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `descripcion`, `descuento`, `id_usuario`, `id_categoria`, `fecha_modificacion`) VALUES
	(8, 'unicornio', 2, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'peluche', 0, 1, 6, '2020-01-13 13:08:54'),
	(12, 'Sabor a unicornio', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 0, 1, 2, '2020-01-10 13:52:11'),
	(21, 'cafetera', 15, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'prueba', 0, 4, 3, '2020-01-24 08:39:12'),
	(22, 'morcilla', 4, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'de arroz', 2, 1, 1, '2020-01-24 09:51:29'),
	(29, 'morcilla de burgos', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 0, 1, 1, '2020-01-10 13:52:11'),
	(30, 'queso de burgos', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 50, 1, 1, '2020-01-10 13:52:11'),
	(31, 'queso manchego', 0, 'https://image.flaticon.com/icons/png/512/372/372627.png', '0', 100, 1, 1, '2020-01-10 13:52:11'),
	(37, 'lechuga', 1, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'Para llevar', 0, 4, 8, '2020-01-13 08:47:56'),
	(40, 'tomates', 2, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'De la huerta', 10, 4, 8, '2020-01-13 12:01:48'),
	(42, 'patatas', 2, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'De la huerta', 0, 4, 8, '2020-01-13 12:06:22'),
	(45, 'ordenador', 100, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'portatil', 10, 4, 3, '2020-01-13 12:56:50'),
	(47, 'disco', 15, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'mezclas', 5, 12, 2, '2020-01-14 10:56:06'),
	(48, 'auriculares', 10, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'portatil', 10, 12, 2, '2020-01-14 11:26:40'),
	(54, 'manzana', 2, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'verde', 0, 4, 8, '2020-01-23 09:34:01'),
	(56, 'oso', 20, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'peluche', 5, 4, 6, '2020-01-23 12:14:49'),
	(58, 'dvd I', 20, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'dvd gira', 5, 4, 2, '2020-01-23 10:18:29'),
	(61, 'dvd II', 20, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'dvd gira', 5, 4, 2, '2020-01-23 09:59:19'),
	(62, 'dvd III', 20, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'dvd gira', 5, 4, 2, '2020-01-23 10:02:06'),
	(64, 'microondas', 50, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'mediano', 10, 1, 3, '2020-01-23 12:52:28'),
	(65, 'coche', 15, 'https://image.flaticon.com/icons/png/512/372/372627.png', 'tamanio mediano', 5, 1, 6, '2020-01-24 11:19:45');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla supermercado_grupo.rol
DROP TABLE IF EXISTS `rol`;
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
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `contrasenia` varchar(50) NOT NULL DEFAULT '0',
  `id_rol` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `FK_rol` (`id_rol`),
  CONSTRAINT `FK_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.usuario: ~4 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `contrasenia`, `id_rol`) VALUES
	(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2),
	(4, 'Dolores', 'e10adc3949ba59abbe56e057f20f883e', 1),
	(11, 'pruebas', 'ee2ec3cc66427bb422894495068222a8', 1),
	(12, 'usuarioNuevoModificado', '6e7fecb9cb8c63bf956e245458f06b89', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_delete
DROP PROCEDURE IF EXISTS `pa_categoria_delete`;
DELIMITER //
CREATE PROCEDURE `pa_categoria_delete`(
	IN `pId` INT
)
BEGIN

	DELETE FROM categoria WHERE id = pId;

END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_getall
DROP PROCEDURE IF EXISTS `pa_categoria_getall`;
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
DROP PROCEDURE IF EXISTS `pa_categoria_get_by_id`;
DELIMITER //
CREATE PROCEDURE `pa_categoria_get_by_id`(
	IN `pId` INT
)
BEGIN

	SELECT id, nombre FROM categoria WHERE id = pId;

END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_categoria_insert
DROP PROCEDURE IF EXISTS `pa_categoria_insert`;
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
DROP PROCEDURE IF EXISTS `pa_categoria_update`;
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

-- Volcando estructura para procedimiento supermercado_grupo.pa_productos_busqueda
DROP PROCEDURE IF EXISTS `pa_productos_busqueda`;
DELIMITER //
CREATE PROCEDURE `pa_productos_busqueda`(
	IN `pIdCategoria` INT,
	IN `pNombreProducto` VARCHAR(100)
)
BEGIN

	-- buscador de categoria y/o producto
	
	-- 1) si se seleciona 1 categoría y un producto:
	IF pIdCategoria <> 0 && pNombreProducto <> "" THEN  
		SELECT p.id 'id_producto', p.nombre 'nombre_producto', p.descripcion, p.imagen, p.precio, p.descuento, u.id 'id_usuario', u.nombre 'nombre_usuario', c.id 'id_categoria', c.nombre 'nombre_categoria' 
		FROM producto p, usuario u, categoria c 
		WHERE p.id_usuario = u.id AND p.id_categoria = c.id AND c.id = pIdCategoria AND p.nombre LIKE CONCAT('%',pNombreProducto,'%')
		ORDER BY p.nombre ASC LIMIT 500;	
	END IF;	
	
	-- 2) si se seleciona 1 categoría y ningún producto, deberá sacar una lista con todos los productos de esa categoria:
	IF pIdCategoria <> 0 && pNombreProducto = "" THEN  
		SELECT p.id 'id_producto', p.nombre 'nombre_producto', p.descripcion, p.imagen, p.precio, p.descuento, u.id 'id_usuario', u.nombre 'nombre_usuario', c.id 'id_categoria', c.nombre 'nombre_categoria' 
		FROM producto p, usuario u, categoria c 
		WHERE 
		p.id_usuario = u.id AND
		p.id_categoria = c.id AND 
		c.id = pIdCategoria
		ORDER BY p.nombre ASC LIMIT 500;
	END IF;	
	
	-- 3) si se seleciona 1 producto y ninguna categoria, deberá sacar una lista con todos los productos con ese nombre:
	IF pIdCategoria = 0 && pNombreProducto <> "" THEN  
		SELECT p.id 'id_producto', p.nombre 'nombre_producto', p.descripcion, p.imagen, p.precio, p.descuento, u.id 'id_usuario', u.nombre 'nombre_usuario', c.id 'id_categoria', c.nombre 'nombre_categoria' 
		FROM producto p, usuario u, categoria c 
		WHERE p.id_usuario = u.id AND p.id_categoria = c.id AND p.nombre LIKE CONCAT('%',pNombreProducto,'%')
		ORDER BY p.nombre ASC LIMIT 500;
	END IF;
	
	-- 4) si no se seleciona ninguna opción, deberá sacar una lista con todos los productos de la bd:
	IF pIdCategoria = 0 && pNombreProducto = "" THEN  
		SELECT p.id 'id_producto', p.nombre 'nombre_producto', p.descripcion, p.imagen, p.precio, p.descuento, u.id 'id_usuario', u.nombre 'nombre_usuario', c.id 'id_categoria', c.nombre 'nombre_categoria' 
		FROM producto p, usuario u, categoria c 
		WHERE p.id_usuario = u.id AND p.id_categoria = c.id
		ORDER BY p.nombre ASC LIMIT 500;
	END IF;
	
	
	
	
/*	
	-- 1) si se seleciona 1 categoría y un producto:
	IF pIdCategoria <> 0 && pNombreProducto <> "" THEN  
		SELECT c.id 'id_categoria1', p.nombre 'nombre_producto' 
		FROM categoria c, producto p 
		WHERE p.id_categoria = c.id AND c.id = pIdCategoria AND p.nombre LIKE CONCAT('%',pNombreProducto,'%')
		ORDER BY p.nombre ASC LIMIT 500;	
	END IF;	
	
	-- 2) si se seleciona 1 categoría y ningún producto, deberá sacar una lista con todos los productos de esa categoria:
	IF pIdCategoria <> 0 && pNombreProducto = "" THEN  
		SELECT c.id 'id_categoria2', p.nombre 'nombre_producto' 
		FROM categoria c, producto p 
		WHERE 
		p.id_categoria = c.id AND 
		c.id = pIdCategoria
		ORDER BY p.nombre ASC LIMIT 500;
	END IF;	
	
	-- 3) si se seleciona 1 producto y ninguna categoria, deberá sacar una lista con todos los productos con ese nombre:
	IF pIdCategoria = 0 && pNombreProducto <> "" THEN  
		SELECT c.id 'id_categoria3', p.nombre 'nombre_producto' 
		FROM categoria c, producto p 
		WHERE p.id_categoria = c.id AND p.nombre LIKE CONCAT('%',pNombreProducto,'%')
		ORDER BY p.nombre ASC LIMIT 500;
	END IF;
	
	-- 4) si no se seleciona ninguna opción, deberá sacar una lista con todos los productos de la bd:
	IF pIdCategoria = 0 && pNombreProducto = "" THEN  
		SELECT c.id 'id_categoria4', p.nombre 'nombre_producto' 
		FROM categoria c, producto p 
		WHERE p.id_categoria = c.id
		ORDER BY p.nombre ASC LIMIT 500;
	END IF;
    
	-- desde java executeQuery
	-- retorna ResultSet
*/
END//
DELIMITER ;

-- Volcando estructura para procedimiento supermercado_grupo.pa_producto_getall_ordenado
DROP PROCEDURE IF EXISTS `pa_producto_getall_ordenado`;
DELIMITER //
CREATE PROCEDURE `pa_producto_getall_ordenado`(
	IN `pOrden` VARCHAR(4),
	IN `pColumna` VARCHAR(50)
)
BEGIN

	-- ordenar productos por nombre ASC o DESC
	
	-- 1) orden ASC:
	IF pOrden = "ASC" THEN  
		SELECT 
			p.id 'id_producto', 
			p.nombre 'nombre_producto', 
			p.descripcion, p.imagen, p.precio, p.descuento, 
			u.id 'id_usuario', 
			u.nombre 'nombre_usuario', 
			c.id 'id_categoria', 
			c.nombre 'nombre_categoria'
		FROM 
			producto p, usuario u, categoria c
		WHERE 
			p.id_usuario = u.id AND p.id_categoria = c.id
		ORDER BY pColumna ASC LIMIT 100;
	END IF;	

	-- 2) orden DESC:
	IF pOrden = "DESC" THEN   
		SELECT 
			p.id 'id_producto', 
			p.nombre 'nombre_producto', 
			p.descripcion, p.imagen, p.precio, p.descuento, 
			u.id 'id_usuario', 
			u.nombre 'nombre_usuario', 
			c.id 'id_categoria', 
			c.nombre 'nombre_categoria'
		FROM 
			producto p, usuario u, categoria c
		WHERE 
			p.id_usuario = u.id AND p.id_categoria = c.id
		ORDER BY pColumna DESC LIMIT 100;
	END IF;	

END//
DELIMITER ;

-- Volcando estructura para disparador supermercado_grupo.tbd_producto
DROP TRIGGER IF EXISTS `tbd_producto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tbd_producto` BEFORE DELETE ON `producto` FOR EACH ROW BEGIN
	
	--	comentamos este trigger porque como esta parte no está terminada, nos da error al eliminar desde POSTMAN
	-- INSERT INTO inactivo (id, nombre, precio ) VALUES ( OLD.id , OLD.nombre, OLD.precio );
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador supermercado_grupo.tbi_usuario
DROP TRIGGER IF EXISTS `tbi_usuario`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tbi_usuario` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN

SET NEW.contrasenia = MD5(NEW.contrasenia);

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador supermercado_grupo.tbu_usuario
DROP TRIGGER IF EXISTS `tbu_usuario`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tbu_usuario` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN

SET NEW.contrasenia = MD5(NEW.contrasenia);

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
