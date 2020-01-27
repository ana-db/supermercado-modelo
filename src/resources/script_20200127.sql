-- --------------------------------------------------------
-- Host:                         192.168.0.73
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
	(7, 'cine'),
	(3, 'electrodomesticos'),
	(5, 'fotografia'),
	(8, 'fruteria'),
	(6, 'jugueteria'),
	(1, 'mock1578649529903'),
	(2, 'musica'),
	(4, 'nueva');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla supermercado_grupo.historico: ~13 rows (aproximadamente)
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
	(10, 1, '2020-01-10 08:24:12', 8),
	(11, 70, '2020-01-27 10:35:17', 64),
	(12, 4, '2020-01-27 10:44:29', 22),
	(13, 0, '2020-01-27 10:46:22', 29);
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

-- Volcando datos para la tabla supermercado_grupo.producto: ~20 rows (aproximadamente)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `descripcion`, `descuento`, `id_usuario`, `id_categoria`, `fecha_modificacion`) VALUES
	(8, 'Unicornio', 20, 'https://s1.thcdn.com/productimg/1600/1600/11489650-1684492597117008.jpg', 'Peluche de la pelicula Gru, Mi villano favorito', 0, 1, 6, '2020-01-27 10:20:57'),
	(12, 'Sabor a unicornio', 7, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201705/11/00125940257790____1__1200x1200.jpg', 'Banda sonora original de la pelicula Gru, Mi villano favorito', 0, 1, 2, '2020-01-27 10:22:14'),
	(21, 'Cafetera', 15, 'https://electrohogar.eroski.es/electroventa/SendImage/18427138_1.jpg', 'Cafetera de goteo', 0, 4, 3, '2020-01-27 09:26:51'),
	(22, 'Morcilla', 2.45, 'https://supermercado.eroski.es/images/20164984.jpg', 'Morcilla de arroz RIOS, 2 unid., sobre aprox. 600 g', 2, 1, 1, '2020-01-27 10:44:29'),
	(29, 'Morcilla de burgos', 2.45, 'https://supermercado.eroski.es/images/21719919.jpg', 'Rodajas de morcilla de Burgos RIOS, bandeja 220 g', 0, 1, 1, '2020-01-27 10:46:22'),
	(30, 'Queso de burgos', 1, 'https://quesodeoveja.org/wp-content/uploads/2015/08/queso-fresco-con-uvas.jpg', 'Queso de Burgos EROSKI basic, pack 4x62,5 g', 50, 1, 1, '2020-01-27 10:52:52'),
	(31, 'Queso manchego', 4.5, 'https://quesosdeeuropa.com/wp-content/uploads/2018/07/Manchego.jpg', 'Queso D.O. Manchego DON BERNARDO, al corte, compra mínima 250 g', 10, 1, 1, '2020-01-27 10:49:51'),
	(37, 'Lechuga', 1, 'https://academiavascadegastronomia.com/files/2017/07/lechuga-01.jpg', 'Lechuga Batavia del País Vasco, unidad', 0, 4, 8, '2020-01-27 10:53:50'),
	(40, 'Tomates', 1.5, 'https://www.pisos.com/aldia/wp-content/uploads/2015/07/tomates-rojos.jpg', 'Tomate en rama EROSKI Natur, al peso, compra mínima 500 g', 10, 4, 8, '2020-01-27 10:57:48'),
	(42, 'Patatas', 2, 'https://bonduelle.es/media/zoo/images/patata_781da11b65e9c08ff1fa4c25079f5fdb.jpg', 'Patata Selección, al peso, compra mínima 1 kg', 5, 4, 8, '2020-01-27 10:56:49'),
	(45, 'Ordenador', 270, 'https://electrohogar.eroski.es/electroventa/SendImage/23245715_1.jpg', 'Ordenador portatil 15 255 G7 A4 4 1', 10, 4, 3, '2020-01-27 09:25:30'),
	(47, 'Vengadores Endgame', 28, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201908/23/00125980324682____2__1200x1200.jpg', 'Vengadores Endgame (Blu-Ray)', 10, 12, 2, '2020-01-27 10:26:14'),
	(48, 'Auriculares', 10, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA02/CONTENIDOS/201501/12/00138545714115____3__1200x1200.jpg', 'Auriculares de botón Sony MDR-EX15APB para smartphones', 20, 12, 2, '2020-01-27 09:25:27'),
	(54, 'Manzanas', 2, 'https://www.saborusa.com/wp-content/uploads/2019/10/Manzanas-de-Washington-sabor-y-frescura-al-gusto-de-los-colombianos-450x350.png', 'Manzana Golden, al peso, compra mínima 1 kg', 0, 4, 8, '2020-01-27 10:55:50'),
	(56, 'Oso', 25, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201911/04/00108340909137____1__1200x1200.jpg', 'Peluche Oso de peluche de 28 cm Beige', 5, 4, 6, '2020-01-27 09:25:16'),
	(58, 'Guardianes de la Galaxia', 10, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA02/CONTENIDOS/201410/17/00125940357236____2__1200x1200.jpg', 'DVD de la pelicula Guardianes de la Galaxia', 5, 4, 7, '2020-01-27 10:24:54'),
	(61, 'Impresora de fotos', 160, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201910/14/00128615700144____1__1200x1200.jpg', 'Impresora fotográfica portátil HP Sprocket Plus Blanca + Funda dorada', 20, 4, 5, '2020-01-27 10:16:04'),
	(62, 'Camara de fotos', 109, 'https://electrohogar.eroski.es/electroventa/SendImage/19828243_1.jpg', 'Cámara digital compacta Canon IXUS 185 roja', 5, 4, 5, '2020-01-27 09:25:01'),
	(64, 'Microondas', 75, 'https://electrohogar.eroski.es/electroventa/SendImage/19829373_1.jpg', 'Microondas con grill', 10, 1, 3, '2020-01-27 10:35:17'),
	(65, 'Coche', 100, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA02/CONTENIDOS/201510/29/00102711503371____3__1200x1200.jpg', 'Coche Audi R8 rojo', 15, 1, 6, '2020-01-27 09:25:07');
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

-- Volcando estructura para disparador supermercado_grupo.tau_producto_historico
DROP TRIGGER IF EXISTS `tau_producto_historico`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tau_producto_historico` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN

	-- cada vez que se actualice el precio de un producto, se copiará su nombre y precio en la tabla histórico:
	-- (el id y la fecha se actualizarán solos)
	
	IF NEW.precio <> OLD.precio THEN  
		INSERT INTO historico (precio, id_producto) VALUES (OLD.precio, OLD.id);
	END IF;	

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

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

-- Volcando estructura para disparador supermercado_grupo.tbi_producto
DROP TRIGGER IF EXISTS `tbi_producto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tbi_producto` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN

	/* 
		Comprobamos que el descuento sea entre 0 y 100
		si descuento < 0, entonces descuento = 0
		si descuento > 0, entonces descuento = 100
	*/

	IF NEW.descuento < 0 THEN 
		SET NEW.descuento = 0; 
	END IF;
	
	IF NEW.descuento > 100 THEN 
		SET NEW.descuento = 100; 
	END IF;

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

-- Volcando estructura para disparador supermercado_grupo.tbu_producto
DROP TRIGGER IF EXISTS `tbu_producto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tbu_producto` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN

	/* 
		Comprobamos que el descuento sea entre 0 y 100
		si descuento < 0, entonces descuento = 0
		si descuento > 0, entonces descuento = 100
	*/

	IF NEW.descuento < 0 THEN 
		SET NEW.descuento = 0; 
	END IF;
	
	IF NEW.descuento > 100 THEN 
		SET NEW.descuento = 100; 
	END IF;

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
