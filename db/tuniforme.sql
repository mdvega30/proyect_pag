-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2017 a las 20:06:50
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tuniforme`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarInstituto` (IN `nombreInstitucionP` VARCHAR(45), IN `descripcionInstitucionP` VARCHAR(300), IN `urlLogoP` VARCHAR(100), IN `tipoInstitucionP` INT, `idInstitucionP` INT)  BEGIN
if urlLogoP is null or urlLogoP LIKE '' THEN 
UPDATE `institucion` 
SET `Nombre_institucion` = nombreInstitucionP, `Descripcion_institucion` = descripcionInstitucionP, 
`Tipo_institucion_idTipo_institucion` = tipoInstitucionP WHERE `institucion`.`idInstitucion` = idInstitucionP;
ELSE
UPDATE `institucion` 
SET `Nombre_institucion` = nombreInstitucionP, `Descripcion_institucion` = descripcionInstitucionP, `Url_logo_institucion` = urlLogoP, 
`Tipo_institucion_idTipo_institucion` = tipoInstitucionP WHERE `institucion`.`idInstitucion` = idInstitucionP;
END IF;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarInsumo` (IN `Nombre_Insumo` VARCHAR(45), IN `Descripcion_Insumo` VARCHAR(300), IN `unidad_medida_idUnidad_medida` INT(11), IN `url_insumo` VARCHAR(100), IN `precio` DECIMAL(10), IN `idInsu` INT(11))  BEGIN
if url_insumo is null or url_insumo LIKE '' THEN 
UPDATE insumo 
set Nombre_Insumo=Nombre_Insumo, Descripcion_Insumo=Descripcion_Insumo,unidad_medida_idUnidad_medida=unidad_medida_idUnidad_medida,precio=precio
WHERE `idInsumo` = idInsu;
ELSE
UPDATE insumo
set Nombre_Insumo=Nombre_Insumo, Descripcion_Insumo=Descripcion_Insumo,unidad_medida_idUnidad_medida=unidad_medida_idUnidad_medida,url_insumo=url_insumo,precio=precio
WHERE `idInsumo` = idInsu;
END IF;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarToken` (IN `tok` VARCHAR(50))  BEGIN
update usuario
set token=null
where token=tok;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario` (IN `nom1` VARCHAR(30), IN `nom2` VARCHAR(30), IN `ape1` VARCHAR(30), IN `ape2` VARCHAR(30), IN `direc` VARCHAR(45), IN `pass` VARCHAR(50), IN `email` VARCHAR(45))  BEGIN
UPDATE usuario 
set Nombre1=nom1, Nombre2=nom2,Apellido1=ape1,Apellido2=ape2,Direccion=direc,Contraseña=pass
WHERE Correo = email;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario1` (IN `nom1` VARCHAR(30), IN `nom2` VARCHAR(30), IN `ape1` VARCHAR(30), IN `ape2` VARCHAR(30), IN `direc` VARCHAR(45), IN `email` VARCHAR(45))  BEGIN
UPDATE usuario 
set Nombre1=nom1, Nombre2=nom2,Apellido1=ape1,Apellido2=ape2,Direccion=direc
WHERE Correo = email;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_uniforme` (IN `NombreUniforme` VARCHAR(45), IN `Descripcion` VARCHAR(300), IN `ImagenDiseño` VARCHAR(100), IN `precio` DECIMAL, IN `EstadoUniforme` BOOLEAN, IN `TipoUniforme` INT, IN `id_uniforme` INT, IN `Id_institucion` INT)  BEGIN
if ImagenDiseño is null THEN
UPDATE `uniforme` SET `Nombre_Uniforme` = NombreUniforme, `Descripcion_Uniforme` = Descripcion, 
`Precio` = precio, `EstadoUniforme` = EstadoUniforme, 
`Tipo_Uniforme_idTipo_Uniforme` = TipoUniforme,institucion_idInstitucion=Id_institucion  WHERE `idUniforme` = id_uniforme;
ELSE
UPDATE `uniforme` SET `Nombre_Uniforme` = NombreUniforme, `Descripcion_Uniforme` = Descripcion, 
`Url_Diseño_Uniforme` = ImagenDiseño, `Precio` = precio, `EstadoUniforme` = EstadoUniforme, 
`Tipo_Uniforme_idTipo_Uniforme` = TipoUniforme,institucion_idInstitucion=Id_institucion WHERE `idUniforme` = id_uniforme;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticacionAdmin` (IN `email` VARCHAR(45), IN `pass` VARCHAR(45), IN `roll` INT)  BEGIN
select* from usuario where correo=email and contraseña=pass and IdRol=roll;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticacionUsu` (IN `email` VARCHAR(45), IN `pass` VARCHAR(300))  BEGIN
select *
from usuario
where  Correo = email and Contraseña= pass and token is null;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `datosObjUsuario` (IN `email` VARCHAR(45))  BEGIN
select IdUsuario,Id_tipodocumento,IdRol,firstUpper(Nombre1) AS Nombre1,firstUpper(Nombre2) Nombre2,firstUpper(Apellido1) Apellido1,firstUpper(Apellido2) Apellido2,Documento, Correo,firstUpper(Direccion) Direccion, Contraseña
from usuario
where correo = email;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarInstitucion` (IN `idInstitucionP` INT)  BEGIN
DELETE FROM institucion where idInstitucion = idInstitucionP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarInsumo` (IN `id` INT)  BEGIN
DELETE FROM insumo where idInsumo = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUniformes` (IN `id` INT)  BEGIN
DELETE FROM Uniforme where idUniforme = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarInstitucion` (IN `nombreInstitucionP` VARCHAR(45), IN `descripcionInstitucionP` VARCHAR(300), IN `urlLogoP` VARCHAR(100), IN `tipoInstitucionP` INT)  BEGIN
INSERT INTO `institucion` (`idInstitucion`, `Nombre_institucion`, `Descripcion_institucion`, `Url_logo_institucion`, `Tipo_institucion_idTipo_institucion`) 
VALUES (NULL, nombreInstitucionP , descripcionInstitucionP, urlLogoP, tipoInstitucionP);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarInsumos` (IN `NombreInsumo` VARCHAR(45), IN `descripcionInsumo` VARCHAR(300), IN `Unidad_medidad_idUnidad_Medida` INT(11), IN `imagenInsumo` VARCHAR(100), IN `precioInsumo` DECIMAL(10))  INSERT INTO `insumo` (`idInsumo`, `Nombre_Insumo`, `Descripcion_Insumo`, `unidad_medida_idUnidad_medida`, `url_insumo`, `precio`)
values (null,NombreInsumo,descripcionInsumo,Unidad_medidad_idUnidad_Medida,imagenInsumo,precioInsumo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMensaje` (IN `idUsuario` INT, IN `Estado_mensaje` VARCHAR(20), IN `nom1` VARCHAR(30), IN `ape1` VARCHAR(30), IN `correo` VARCHAR(30), IN `empresa` VARCHAR(30), IN `Fecha` DATETIME, IN `asunto` VARCHAR(100), IN `mensaje` VARCHAR(4000))  INSERT INTO `mensajes`(`idMensajes`, `Usuario_idUsuario`, `Estado_mensaje`, `Nombre`, `Apellido`, `Correo`, `Empresa`, `Fecha`, `Asunto`, `mensaje`) 
VALUES (null,idUsuario,Estado_mensaje,nom1,ape1,correo,empresa,Fecha,asunto,mensaje)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarPrenda` (IN `Nombre_PrendaP` VARCHAR(45), IN `Descripcion_prendaP` VARCHAR(300), IN `Url_DiseñoP` VARCHAR(100), IN `uniforme_idUniformeP` INT, `talla_idTalla` INT)  BEGIN
START TRANSACTION;
INSERT INTO `prenda` (`idPrenda`, `Nombre_Prenda`, `Descripcion_prenda`, `Url_Diseño`, `uniforme_idUniforme`) 
VALUES (NULL, Nombre_PrendaP, Descripcion_prendaP, Url_DiseñoP, uniforme_idUniformeP);
INSERT INTO `prenda_talla` (`id_prenda_talla`, `prenda_idPrenda`, `talla_idTalla`) VALUES (NULL, LAST_INSERT_ID(), talla_idTalla);

COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `tpdoc` INT, IN `roll` INT, IN `nom1` VARCHAR(30), IN `nom2` VARCHAR(30), IN `ape1` VARCHAR(30), IN `ape2` VARCHAR(30), IN `doc` VARCHAR(20), IN `email` VARCHAR(45), IN `direc` VARCHAR(45), IN `pass` VARCHAR(60), IN `tok` INT(50))  BEGIN
INSERT INTO `usuario` (`idUsuario`, `Id_tipodocumento`, `IdRol`, `Nombre1`, `Nombre2`, `Apellido1`, `Apellido2`, `Documento`, `Correo`, `Direccion`, `Contraseña`,`token`) 
values(null,tpdoc,roll,nom1,nom2,ape1,ape2,doc,email,direc,pass,tok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_uniforme` (IN `NombreUniforme` VARCHAR(45), IN `Descripcion` VARCHAR(300), IN `ImagenDiseño` VARCHAR(100), IN `precio` DECIMAL, `EstadoUniforme` BOOLEAN, IN `TipoUniforme` INT, IN `Institucion` INT)  BEGIN
INSERT INTO `uniforme` (`idUniforme`, `Nombre_Uniforme`, `Descripcion_Uniforme`, `Url_Diseño_Uniforme`, `Precio`, `EstadoUniforme`, `Tipo_Uniforme_idTipo_Uniforme`,`Institucion_idInstitucion`)
VALUES (NULL, NombreUniforme, Descripcion, ImagenDiseño,precio, EstadoUniforme,TipoUniforme,Institucion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar` (IN `rol` INT)  BEGIN
select concat(nombre1,' ',nombre2)Nombres,concat( apellido1 ,' ',apellido2)Apellidos, Correo,Documento,Direccion
from usuario
where IdRol=rol;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarInstitucion` (IN `pagina` INT, IN `numrRegistros` INT)  BEGIN
SELECT i.idInstitucion, i.Nombre_institucion, i.Descripcion_institucion,i.Url_logo_institucion,ti.Nombre_tipo_institucion
FROM institucion i
INNER JOIN tipo_institucion ti
ON i.Tipo_institucion_idTipo_institucion= ti.idTipo_institucion
limit pagina,numrRegistros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarInsumos` (IN `pagina` INT, IN `numrRegistros` INT)  BEGIN
select i.idInsumo,i.Nombre_Insumo,i.Descripcion_Insumo,i.unidad_medida_idUnidad_medida,
i.url_insumo, i.precio
from insumo i 
inner join unidad_medida m on i.unidad_medida_idUnidad_medida = m.idUnidad_medida
limit pagina,numrRegistros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMensaje` (IN `idUsuario` INT)  select Nombre,Apellido,Correo,Empresa,Fecha,Asunto,mensaje
from mensajes
where Usuario_idUsuario=idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPrendas` (IN `pagina` INT, IN `numrRegistros` INT)  BEGIN
SELECT p.idPrenda,p.Nombre_Prenda, p.Descripcion_prenda, p.Url_Diseño, u.Nombre_Uniforme, t.Talla_nombre
FROM prenda p
INNER JOIN uniforme u 
ON p.uniforme_idUniforme  = u.idUniforme
INNER JOIN prenda_talla pt
ON pt.prenda_idPrenda = p.idPrenda 
INNER JOIN talla t
ON t.idTalla = pt.talla_idTalla
limit pagina,numrRegistros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarTodosUniformes` (IN `estadoUp` TINYINT(1))  BEGIN
SELECT * 
FROM uniforme u
WHERE u.EstadoUniforme is true;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_uniformes` (IN `pagina` INT, IN `numrRegistros` INT)  BEGIN
SELECT u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme, tipo.Nombre_institucion
FROM uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
INNER JOIN institucion tipo ON U.institucion_idInstitucion = tipo.idInstitucion
limit pagina,numrRegistros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_uniformesCatalogo` (IN `pagina` INT, IN `numrRegistros` INT, IN `nombre_Uni` VARCHAR(45))  BEGIN
if nombre_Uni  LIKE '% %'  THEN
select u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,
u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme
from uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
where u.EstadoUniforme=1
limit pagina,numrRegistros;
ELSE
select u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme
from uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
where u.Nombre_Uniforme LIKE concat('%',nombre_Uni,'%') and u.EstadoUniforme=1
limit pagina,numrRegistros;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarToken` (IN `tok` VARCHAR(50))  BEGIN
select token
from usuario
where token=tok;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verImg_Insumo` (IN `id` INT)  BEGIN
SELECT url_insumo FROM insumo WHERE idInsumo = id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verImg_Uniforme` (IN `id` INT)  BEGIN
SELECT Url_Diseño_Uniforme FROM uniforme WHERE idUniforme = id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verInstitucion` (IN `idInstitutoP` INT)  BEGIN
SELECT * FROM institucion WHERE idInstitucion = idInstitutoP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_Insumo` (IN `id` INT)  BEGIN
SELECT * FROM insumo WHERE idInsumo = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_Uniforme` (IN `id` INT)  BEGIN
SELECT u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme, 
u.Url_Diseño_Uniforme,u.Precio,u.EstadoUniforme, 
u.Tipo_Uniforme_idTipo_Uniforme,u.institucion_idInstitucion, 
i.Nombre_institucion, ti.Nombre_Tipo 
FROM uniforme u 
INNER JOIN institucion i 
on i.idInstitucion = u.institucion_idInstitucion 
INNER JOIN tipo_uniforme ti 
on ti.idTipo_Uniforme = u.Tipo_Uniforme_idTipo_Uniforme 
WHERE idUniforme = id; 
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `firstUpper` (`cadena` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET latin1 BEGIN 
DECLARE pos INT DEFAULT 0; 
DECLARE tmp VARCHAR(100) DEFAULT ''; 
DECLARE result VARCHAR(100) DEFAULT ''; 
set cadena=LOWER(cadena);
REPEAT SET pos = LOCATE(' ', cadena); 
 IF pos = 0 THEN SET pos = CHAR_LENGTH(cadena); 
 END IF; 
 SET tmp = LEFT(cadena,pos); 
 SET result = CONCAT(result, UPPER(LEFT(tmp,1)),SUBSTR(tmp,2)); 
 SET cadena = RIGHT(cadena,CHAR_LENGTH(cadena)-pos); 
UNTIL CHAR_LENGTH(cadena) = 0 END REPEAT; 
RETURN result; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono`
--

CREATE TABLE `abono` (
  `idAbono` int(11) NOT NULL,
  `Cantidad_abono` decimal(10,0) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Forma_de_pago_idForma_de_pago` int(11) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `Nombre_ciudad` varchar(45) NOT NULL,
  `Descripcion_ciudad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `idPedido_Talla` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `Estado_Pedido_Talla_idEstado_Pedido_Talla` int(11) NOT NULL DEFAULT '0',
  `prenda_talla_id_prenda_talla` int(11) NOT NULL,
  `tipo_novedad_idTipo_novedad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_detalle_pedido`
--

CREATE TABLE `estado_detalle_pedido` (
  `idEstado_Pedido_Talla` int(11) NOT NULL,
  `Tipo_Estado_Pedido_Talla` varchar(50) NOT NULL,
  `Descripcion_estado` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `idEstado_pedido` int(11) NOT NULL,
  `Tipo_estado` varchar(45) NOT NULL,
  `Descripcion_estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_de_pago`
--

CREATE TABLE `forma_de_pago` (
  `idForma_de_pago` int(11) NOT NULL,
  `Nombre_forma_de_pago` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `idInstitucion` int(11) NOT NULL,
  `Nombre_institucion` varchar(45) NOT NULL,
  `Descripcion_institucion` varchar(300) DEFAULT NULL,
  `Url_logo_institucion` varchar(100) DEFAULT NULL,
  `Tipo_institucion_idTipo_institucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`idInstitucion`, `Nombre_institucion`, `Descripcion_institucion`, `Url_logo_institucion`, `Tipo_institucion_idTipo_institucion`) VALUES
(1, 'Colegio Mayor De Cundinamarca', 'Prueba desde la vista', '5.jpg', 2),
(2, 'Colegio Main', 'solo es una prueba', 'prueba.png', 1),
(3, 'Colegio Main', 'solo es una prueba', 'prueba.png', 1),
(4, 'Colegio Main', 'solo es una prueba', 'prueba.png', 1),
(5, '123', '123', '213', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `idInsumo` int(11) NOT NULL,
  `Nombre_Insumo` varchar(45) NOT NULL,
  `Descripcion_Insumo` varchar(300) DEFAULT NULL,
  `unidad_medida_idUnidad_medida` int(11) NOT NULL,
  `url_insumo` varchar(100) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insumo`
--

INSERT INTO `insumo` (`idInsumo`, `Nombre_Insumo`, `Descripcion_Insumo`, `unidad_medida_idUnidad_medida`, `url_insumo`, `precio`) VALUES
(10, 'Hola mundo probando', 'Editar sin im', 1, '3.jpg', '454'),
(11, 'fg', 'f', 1, '2.jpg', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_prenda_talla`
--

CREATE TABLE `insumo_prenda_talla` (
  `insumo_idInsumo` int(11) NOT NULL,
  `prenda_talla_id_prenda_talla` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idMensajes` int(11) NOT NULL,
  `Estado_mensaje` varchar(20) DEFAULT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Empresa` varchar(30) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Asunto` varchar(100) NOT NULL,
  `mensaje` varchar(4000) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`idMensajes`, `Estado_mensaje`, `Nombre`, `Apellido`, `Correo`, `Empresa`, `Fecha`, `Asunto`, `mensaje`, `usuario_idUsuario`) VALUES
(4, 'assaagfdg', 'ss', 'apesdlsso', 'FCDFSFD', 'dsffdsdf', '2017-02-14 00:00:00', 'aaas', 'asdfdsdsad', 1),
(5, 'assaagfdg', 'ss', 'apesdlsso', 'FCDFSFD', 'dsffdsdf', '2017-02-14 02:01:49', 'aaas', 'asdfdsdsad', 1),
(6, 'assaagfdg', 'ss', 'apesdlsso', 'FCDFSFD', 'dsffdsdf', '2017-02-14 02:01:49', 'aaas', 'asdfdsdsad', 1),
(7, 'assaagfdg', 'ss', 'apesdlsso', 'FCDFSFD', 'dsffdsdf', '2017-02-14 02:01:49', 'aaas', 'asdfdsdsad', 1),
(8, 'Estado', '123123', '123123', '123123', '123123', '2017-02-19 01:24:55', '123123', '123122312', 1),
(9, 'Estado', '123123', '123123', '123123', '123123', '2017-02-19 01:26:09', '123123', '123122312', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `Fecha_pedido` date NOT NULL,
  `Fecha_envio` date DEFAULT NULL,
  `Fecha_entrega` date DEFAULT NULL,
  `Direccion_entrega` varchar(45) NOT NULL,
  `Codigo_postal` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Estado_pedido_idEstado_pedido` int(11) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda`
--

CREATE TABLE `prenda` (
  `idPrenda` int(11) NOT NULL,
  `Nombre_Prenda` varchar(45) NOT NULL,
  `Descripcion_prenda` varchar(300) DEFAULT NULL,
  `Url_Diseño` varchar(100) DEFAULT NULL,
  `uniforme_idUniforme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prenda`
--

INSERT INTO `prenda` (`idPrenda`, `Nombre_Prenda`, `Descripcion_prenda`, `Url_Diseño`, `uniforme_idUniforme`) VALUES
(3, 'rreerres', 'retes', 'erres', 37),
(4, 'ddfsdsd', 'dfssdfsdff', 'fsddfsfds', 36),
(5, 'fddfs', 'sdffdsdf', 'dsfdfs', 36),
(6, 'fddf', 'dsfdfdf', 'dfsdfs', 36),
(7, 'SDFGG', 'GSSGDGD', 'GS', 43),
(8, '12312', '123', '123', 44),
(9, 'prenda prueba main', 'desc prueba main java', 'pruebamain.jpg', 45),
(10, 'prenda prueba main', 'desc prueba main java', 'pruebamain.jpg', 45),
(11, 'prenda prueba main', 'desc prueba main java', 'pruebamain.jpg', 45),
(14, '123', '123', '123', 36),
(19, 'prenda prueba main', 'desc prueba main java', 'pruebamain.jpg', 45),
(21, 'prenda prueba main', 'desc prueba main java', 'pruebamain.jpg', 36),
(22, 'Prueba desde la vista ', 'prueba de la vista', '1.jpg', 36),
(23, 'Prueba dos vista ', 'Prueba dos vista ', '5.jpg', 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda_talla`
--

CREATE TABLE `prenda_talla` (
  `id_prenda_talla` int(11) NOT NULL,
  `prenda_idPrenda` int(11) NOT NULL,
  `talla_idTalla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prenda_talla`
--

INSERT INTO `prenda_talla` (`id_prenda_talla`, `prenda_idPrenda`, `talla_idTalla`) VALUES
(1, 3, 2),
(2, 3, 4),
(3, 3, 3),
(5, 5, 2),
(6, 6, 2),
(7, 8, 2),
(8, 9, 4),
(9, 10, 4),
(10, 11, 4),
(13, 14, 3),
(16, 19, 3),
(17, 21, 3),
(18, 22, 3),
(19, 23, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IdRol` int(11) NOT NULL,
  `Tipo_rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`IdRol`, `Tipo_rol`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `idTalla` int(11) NOT NULL,
  `Precio_talla` decimal(10,0) NOT NULL,
  `Talla_nombre` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`idTalla`, `Precio_talla`, `Talla_nombre`) VALUES
(2, '12121', 'XL'),
(3, '4500', 'L'),
(4, '123123', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `Idtipo_documento` int(11) NOT NULL,
  `Tipo_doc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`Idtipo_documento`, `Tipo_doc`) VALUES
(1, 'Cédula de Ciudadanía (CC)'),
(2, 'Tarjeta de Identidad (TI)'),
(3, 'Cédula de Extranjería (CE)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_institucion`
--

CREATE TABLE `tipo_institucion` (
  `idTipo_institucion` int(11) NOT NULL,
  `Nombre_tipo_institucion` varchar(45) NOT NULL,
  `Descripcion_tipo_institucion` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_institucion`
--

INSERT INTO `tipo_institucion` (`idTipo_institucion`, `Nombre_tipo_institucion`, `Descripcion_tipo_institucion`) VALUES
(1, 'Colegial', 'Colegial'),
(2, 'Universitario', 'Universitario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_novedad`
--

CREATE TABLE `tipo_novedad` (
  `idTipo_novedad` int(11) NOT NULL,
  `Tipo_de_novedad` varchar(45) NOT NULL,
  `Descripcion_novedad` varchar(205) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_uniforme`
--

CREATE TABLE `tipo_uniforme` (
  `idTipo_Uniforme` int(11) NOT NULL,
  `Nombre_Tipo` varchar(45) NOT NULL,
  `Descripcion_tipo_uniforme` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_uniforme`
--

INSERT INTO `tipo_uniforme` (`idTipo_Uniforme`, `Nombre_Tipo`, `Descripcion_tipo_uniforme`) VALUES
(1, 'Uniforme escolar', 'Uniforme escolar'),
(2, 'Uniforme deportivo', 'Uniforme deportivo'),
(3, 'Uniformes militares y de fuerzas de seguridad', 'Uniformes militares y de fuerzas de seguridad'),
(4, 'Uniformes religiosos o hábitos', 'Uniformes religiosos o hábitos'),
(5, 'Otros', 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `idUnidad_medida` int(11) NOT NULL,
  `Nombre_unidad` varchar(45) DEFAULT NULL,
  `Descripcion_media` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`idUnidad_medida`, `Nombre_unidad`, `Descripcion_media`) VALUES
(1, 'metros', 'unidad del Sistema Internacional de Unidades'),
(2, 'cm', 'centimetros'),
(3, 'mts', 'metro'),
(4, 'kg', 'kilogramo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uniforme`
--

CREATE TABLE `uniforme` (
  `idUniforme` int(11) NOT NULL,
  `Nombre_Uniforme` varchar(45) NOT NULL,
  `Descripcion_Uniforme` varchar(400) DEFAULT NULL,
  `Url_Diseño_Uniforme` varchar(100) DEFAULT NULL,
  `Precio` decimal(10,0) DEFAULT NULL,
  `EstadoUniforme` tinyint(1) NOT NULL,
  `Tipo_Uniforme_idTipo_Uniforme` int(11) NOT NULL,
  `institucion_idInstitucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `uniforme`
--

INSERT INTO `uniforme` (`idUniforme`, `Nombre_Uniforme`, `Descripcion_Uniforme`, `Url_Diseño_Uniforme`, `Precio`, `EstadoUniforme`, `Tipo_Uniforme_idTipo_Uniforme`, `institucion_idInstitucion`) VALUES
(36, 'COLEGIO CORAZONISTAS', 'Uniforme para el colegio corazonistas de colombia ', '1.jpg', '500000', 1, 3, 1),
(37, 'COLEGIO MAYOR DE CUNDINAMARCA', 'Uniforme para la universidad colegio mayor', '3.jpg', '20000', 0, 1, 2),
(39, 'COLEGIO DE PRUEBAS', 'Colegio de pruebas 2017', '4.jpg', '100000', 1, 1, 2),
(41, '123', '123', '1.jpg', '123', 1, 1, 2),
(42, 'ssddssd', 'dssdsd', '1.jpg', '26262', 1, 1, 2),
(43, 'dsadsdsa', 'dasadsadssda', '4.jpg', '5', 1, 1, 2),
(44, 'dsadsdsa', 'dasadsadssda', '4.jpg', '5', 1, 1, 2),
(45, 'asasas', 'saasas', '2.jpg', '555', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Id_tipodocumento` int(11) NOT NULL,
  `IdRol` int(11) NOT NULL,
  `Nombre1` varchar(30) NOT NULL,
  `Nombre2` varchar(30) DEFAULT NULL,
  `Apellido1` varchar(30) NOT NULL,
  `Apellido2` varchar(30) DEFAULT NULL,
  `Documento` varchar(20) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(300) NOT NULL,
  `token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Id_tipodocumento`, `IdRol`, `Nombre1`, `Nombre2`, `Apellido1`, `Apellido2`, `Documento`, `Correo`, `Direccion`, `Contraseña`, `token`) VALUES
(1, 1, 1, 'David', NULL, 'Daza', NULL, '1026580', 'dadaza770@misena.edu.cos', 'vaggagaa', '8bffdfb44be01916972e9efa7292496c', NULL),
(32, 1, 2, 'david', 'Andres', 'Daza', 'Diaz', '123', 'admin@admin.co', '123', '6116afedcb0bc31083935c1c262ff4c9', NULL),
(33, 1, 1, 'Davis', 'Diaz', 'Diaz', 'Pedrin', '123', 'user@user.co', 'cra falsa', '6116afedcb0bc31083935c1c262ff4c9', NULL),
(34, 1, 1, 'aaaaaaa', 'aaaaaaa', 'aaaaa', 'aaaa', '123456', 'admin@admin.coss', 'ss65ssss', '8bffdfb44be01916972e9efa7292496c', NULL),
(35, 1, 1, 'david', 'dddd', 'diaz', 'dddd', '123123', 'dadaza770@misena.edu.c', 'cra172n 7-52', '8bffdfb44be01916972e9efa7292496c', NULL),
(36, 1, 1, 'david', 'ddd', 'diaz', 'dddd', '123123', 'dadaza770@misena.edus', 'cra172n 7-52', '8bffdfb44be01916972e9efa7292496c', NULL),
(37, 1, 1, 'david', 'nombre', 'diaz', 'apellido', '1231564', 'dadaza770@misena.edu.co', 'cra172n 7-52', '8bffdfb44be01916972e9efa7292496c', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`idAbono`),
  ADD KEY `fk_Abono_Forma_de_pago1_idx` (`Forma_de_pago_idForma_de_pago`),
  ADD KEY `fk_Abono_Pedido1_idx` (`Pedido_idPedido`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`idPedido_Talla`),
  ADD KEY `fk_Pedido_Talla_Pedido1_idx` (`Pedido_idPedido`),
  ADD KEY `fk_Pedido_Talla_Estado_Pedido_Talla1_idx` (`Estado_Pedido_Talla_idEstado_Pedido_Talla`),
  ADD KEY `fk_detalle_pedido_prenda_talla1_idx` (`prenda_talla_id_prenda_talla`),
  ADD KEY `fk_detalle_pedido_tipo_novedad1_idx` (`tipo_novedad_idTipo_novedad`);

--
-- Indices de la tabla `estado_detalle_pedido`
--
ALTER TABLE `estado_detalle_pedido`
  ADD PRIMARY KEY (`idEstado_Pedido_Talla`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`idEstado_pedido`);

--
-- Indices de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  ADD PRIMARY KEY (`idForma_de_pago`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`idInstitucion`),
  ADD KEY `fk_Institucion_Tipo_institucion1_idx` (`Tipo_institucion_idTipo_institucion`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`idInsumo`),
  ADD KEY `fk_insumo_unidad_medida1_idx` (`unidad_medida_idUnidad_medida`);

--
-- Indices de la tabla `insumo_prenda_talla`
--
ALTER TABLE `insumo_prenda_talla`
  ADD PRIMARY KEY (`insumo_idInsumo`,`prenda_talla_id_prenda_talla`),
  ADD KEY `fk_insumo_has_prenda_talla_prenda_talla1_idx` (`prenda_talla_id_prenda_talla`),
  ADD KEY `fk_insumo_has_prenda_talla_insumo1_idx` (`insumo_idInsumo`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idMensajes`),
  ADD KEY `fk_mensajes_usuario1_idx` (`usuario_idUsuario`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_Pedido_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Pedido_Estado_pedido1_idx` (`Estado_pedido_idEstado_pedido`),
  ADD KEY `fk_Pedido_Ciudad1_idx` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `prenda`
--
ALTER TABLE `prenda`
  ADD PRIMARY KEY (`idPrenda`),
  ADD KEY `fk_prenda_uniforme1_idx` (`uniforme_idUniforme`);

--
-- Indices de la tabla `prenda_talla`
--
ALTER TABLE `prenda_talla`
  ADD PRIMARY KEY (`id_prenda_talla`),
  ADD KEY `fk_prenda_has_talla_talla1_idx` (`talla_idTalla`),
  ADD KEY `fk_prenda_has_talla_prenda1_idx` (`prenda_idPrenda`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IdRol`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`idTalla`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`Idtipo_documento`);

--
-- Indices de la tabla `tipo_institucion`
--
ALTER TABLE `tipo_institucion`
  ADD PRIMARY KEY (`idTipo_institucion`);

--
-- Indices de la tabla `tipo_novedad`
--
ALTER TABLE `tipo_novedad`
  ADD PRIMARY KEY (`idTipo_novedad`);

--
-- Indices de la tabla `tipo_uniforme`
--
ALTER TABLE `tipo_uniforme`
  ADD PRIMARY KEY (`idTipo_Uniforme`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`idUnidad_medida`);

--
-- Indices de la tabla `uniforme`
--
ALTER TABLE `uniforme`
  ADD PRIMARY KEY (`idUniforme`),
  ADD KEY `fk_Uniforme_Tipo_Uniforme1_idx` (`Tipo_Uniforme_idTipo_Uniforme`),
  ADD KEY `fk_uniforme_institucion1_idx` (`institucion_idInstitucion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `Correo_UNIQUE` (`Correo`),
  ADD KEY `fk_Usuario_tipo_documento1_idx` (`Id_tipodocumento`),
  ADD KEY `fk_Usuario_Rol1_idx` (`IdRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abono`
--
ALTER TABLE `abono`
  MODIFY `idAbono` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `idPedido_Talla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_detalle_pedido`
--
ALTER TABLE `estado_detalle_pedido`
  MODIFY `idEstado_Pedido_Talla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `idEstado_pedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  MODIFY `idForma_de_pago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `idInstitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `insumo`
--
ALTER TABLE `insumo`
  MODIFY `idInsumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idMensajes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `prenda`
--
ALTER TABLE `prenda`
  MODIFY `idPrenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `prenda_talla`
--
ALTER TABLE `prenda_talla`
  MODIFY `id_prenda_talla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `IdRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `idTalla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `Idtipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_institucion`
--
ALTER TABLE `tipo_institucion`
  MODIFY `idTipo_institucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_novedad`
--
ALTER TABLE `tipo_novedad`
  MODIFY `idTipo_novedad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_uniforme`
--
ALTER TABLE `tipo_uniforme`
  MODIFY `idTipo_Uniforme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `idUnidad_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `uniforme`
--
ALTER TABLE `uniforme`
  MODIFY `idUniforme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono`
--
ALTER TABLE `abono`
  ADD CONSTRAINT `fk_Abono_Forma_de_pago1` FOREIGN KEY (`Forma_de_pago_idForma_de_pago`) REFERENCES `forma_de_pago` (`idForma_de_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Abono_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido_prenda_talla1` FOREIGN KEY (`prenda_talla_id_prenda_talla`) REFERENCES `prenda_talla` (`id_prenda_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedido_tipo_novedad1` FOREIGN KEY (`tipo_novedad_idTipo_novedad`) REFERENCES `tipo_novedad` (`idTipo_novedad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Talla_Estado_Pedido_Talla1` FOREIGN KEY (`Estado_Pedido_Talla_idEstado_Pedido_Talla`) REFERENCES `estado_detalle_pedido` (`idEstado_Pedido_Talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Talla_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `fk_Institucion_Tipo_institucion1` FOREIGN KEY (`Tipo_institucion_idTipo_institucion`) REFERENCES `tipo_institucion` (`idTipo_institucion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD CONSTRAINT `fk_insumo_unidad_medida1` FOREIGN KEY (`unidad_medida_idUnidad_medida`) REFERENCES `unidad_medida` (`idUnidad_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `insumo_prenda_talla`
--
ALTER TABLE `insumo_prenda_talla`
  ADD CONSTRAINT `fk_insumo_has_prenda_talla_insumo1` FOREIGN KEY (`insumo_idInsumo`) REFERENCES `insumo` (`idInsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_insumo_has_prenda_talla_prenda_talla1` FOREIGN KEY (`prenda_talla_id_prenda_talla`) REFERENCES `prenda_talla` (`id_prenda_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `fk_mensajes_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Estado_pedido1` FOREIGN KEY (`Estado_pedido_idEstado_pedido`) REFERENCES `estado_pedido` (`idEstado_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prenda`
--
ALTER TABLE `prenda`
  ADD CONSTRAINT `fk_prenda_uniforme1` FOREIGN KEY (`uniforme_idUniforme`) REFERENCES `uniforme` (`idUniforme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prenda_talla`
--
ALTER TABLE `prenda_talla`
  ADD CONSTRAINT `fk_prenda_has_talla_prenda1` FOREIGN KEY (`prenda_idPrenda`) REFERENCES `prenda` (`idPrenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prenda_has_talla_talla1` FOREIGN KEY (`talla_idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `uniforme`
--
ALTER TABLE `uniforme`
  ADD CONSTRAINT `fk_uniforme_institucion1` FOREIGN KEY (`institucion_idInstitucion`) REFERENCES `institucion` (`idInstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Uniforme_Tipo_Uniforme1` FOREIGN KEY (`Tipo_Uniforme_idTipo_Uniforme`) REFERENCES `tipo_uniforme` (`idTipo_Uniforme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`IdRol`) REFERENCES `rol` (`IdRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_tipo_documento1` FOREIGN KEY (`Id_tipodocumento`) REFERENCES `tipo_documento` (`Idtipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
