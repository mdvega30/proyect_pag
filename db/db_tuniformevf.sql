-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2016 a las 17:31:37
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tuniformevf`
--

DELIMITER $$
--
-- Procedimientos
--
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_uniforme` (IN `NombreUniforme` VARCHAR(45), IN `Descripcion` VARCHAR(300), IN `ImagenDiseño` VARCHAR(100), IN `precio` DECIMAL, IN `EstadoUniforme` BOOLEAN, IN `TipoUniforme` INT, IN `id_uniforme` INT)  BEGIN
if ImagenDiseño is null THEN
UPDATE `uniforme` SET `Nombre_Uniforme` = NombreUniforme, `Descripcion_Uniforme` = Descripcion, 
`Precio` = precio, `EstadoUniforme` = EstadoUniforme, 
`Tipo_Uniforme_idTipo_Uniforme` = TipoUniforme WHERE `idUniforme` = id_uniforme;
ELSE
UPDATE `uniforme` SET `Nombre_Uniforme` = NombreUniforme, `Descripcion_Uniforme` = Descripcion, 
`Url_Diseño_Uniforme` = ImagenDiseño, `Precio` = precio, `EstadoUniforme` = EstadoUniforme, 
`Tipo_Uniforme_idTipo_Uniforme` = TipoUniforme WHERE `idUniforme` = id_uniforme;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUniformes` (IN `id` INT)  BEGIN
DELETE FROM Uniforme where idUniforme = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `tpdoc` INT, IN `roll` INT, IN `nom1` VARCHAR(30), IN `nom2` VARCHAR(30), IN `ape1` VARCHAR(30), IN `ape2` VARCHAR(30), IN `doc` VARCHAR(20), IN `email` VARCHAR(45), IN `direc` VARCHAR(45), IN `pass` VARCHAR(60), IN `tok` INT(50))  BEGIN
INSERT INTO `usuario` (`idUsuario`, `Id_tipodocumento`, `IdRol`, `Nombre1`, `Nombre2`, `Apellido1`, `Apellido2`, `Documento`, `Correo`, `Direccion`, `Contraseña`,`token`) 
values(null,tpdoc,roll,nom1,nom2,ape1,ape2,doc,email,direc,pass,tok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_uniforme` (IN `NombreUniforme` VARCHAR(45), IN `Descripcion` VARCHAR(300), IN `ImagenDiseño` VARCHAR(100), IN `precio` DECIMAL, `EstadoUniforme` BOOLEAN, IN `TipoUniforme` INT)  BEGIN
INSERT INTO `uniforme` (`idUniforme`, `Nombre_Uniforme`, `Descripcion_Uniforme`, `Url_Diseño_Uniforme`, `Precio`, `EstadoUniforme`, `Tipo_Uniforme_idTipo_Uniforme`)
VALUES (NULL, NombreUniforme, Descripcion, ImagenDiseño,precio, EstadoUniforme,TipoUniforme);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar` (IN `rol` INT)  BEGIN
select concat(nombre1,' ',nombre2)Nombres,concat( apellido1 ,' ',apellido2)Apellidos, Correo,Documento,Direccion
from usuario
where IdRol=rol;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_uniformes` (IN `pagina` INT, IN `numrRegistros` INT)  BEGIN
select u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme
from uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
limit pagina,numrRegistros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_uniformesCatalogo` (IN `pagina` INT, IN `numrRegistros` INT)  BEGIN
select u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme
from uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
where u.EstadoUniforme=1
limit pagina,numrRegistros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarToken` (IN `tok` VARCHAR(50))  BEGIN
select token
from usuario
where token=tok;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verImg_Uniforme` (IN `id` INT)  BEGIN
SELECT Url_Diseño_Uniforme FROM uniforme WHERE idUniforme = id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_Uniforme` (IN `id` INT)  BEGIN
SELECT * FROM uniforme WHERE idUniforme = id;
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
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `idEstado_pedido` int(11) NOT NULL,
  `Tipo_estado` varchar(45) NOT NULL,
  `Descripcion_estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido_talla`
--

CREATE TABLE `estado_pedido_talla` (
  `idEstado_Pedido_Talla` int(11) NOT NULL,
  `Tipo_Estado_Pedido_Talla` varchar(50) NOT NULL,
  `Descripcion_estado` varchar(300) DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `idInsumo` int(11) NOT NULL,
  `Nombre_Insumo` varchar(45) NOT NULL,
  `Descripcion_Insumo` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idMensajes` int(11) NOT NULL,
  `Mensaje` varchar(600) NOT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `Estado_mensaje` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad_pedido`
--

CREATE TABLE `novedad_pedido` (
  `idNovedad_pedido` int(11) NOT NULL,
  `Descripcion_novedad` varchar(500) DEFAULT NULL,
  `Precio_incremento_novedad` decimal(10,0) DEFAULT NULL,
  `Id_prenda` varchar(45) DEFAULT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `Tipo_novedad_idTipo_novedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `pedido_talla`
--

CREATE TABLE `pedido_talla` (
  `idPedido_Talla` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `Talla_idTalla` int(11) NOT NULL,
  `Estado_Pedido_Talla_idEstado_Pedido_Talla` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda`
--

CREATE TABLE `prenda` (
  `idPrenda` int(11) NOT NULL,
  `Nombre_Prenda` varchar(45) NOT NULL,
  `Descripcion_prenda` varchar(300) DEFAULT NULL,
  `Url_Diseño` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda_uniforme_institucion`
--

CREATE TABLE `prenda_uniforme_institucion` (
  `idPrenda_Uniforme_Institucion` int(11) NOT NULL,
  `Institucion_idInstitucion` int(11) NOT NULL,
  `Prenda_idPrenda` int(11) NOT NULL,
  `Uniforme_idUniforme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Talla_nombre` varchar(5) NOT NULL,
  `Prenda_Uniforme_Institucion_idPrenda_Uniforme_Institucion` int(11) NOT NULL,
  `Talla_Insumo_idTalla_Insumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla_insumo`
--

CREATE TABLE `talla_insumo` (
  `idTalla_Insumo` int(11) NOT NULL,
  `Cantidad` decimal(10,0) NOT NULL,
  `Insumo_idInsumo` int(11) NOT NULL,
  `Unidad_medida_idUnidad_medida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Tipo_Uniforme_idTipo_Uniforme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `uniforme`
--

INSERT INTO `uniforme` (`idUniforme`, `Nombre_Uniforme`, `Descripcion_Uniforme`, `Url_Diseño_Uniforme`, `Precio`, `EstadoUniforme`, `Tipo_Uniforme_idTipo_Uniforme`) VALUES
(140, 'Prueba ediciones especiales para ninos', 'Prueba edicion especial para nsssssssssso nuemro de reparto ', '1009621723_854.jpg', '1000000', 1, 3),
(143, 'China linda', 'Mujer muy bonita  con uniforme ', 'china.jpg', '34', 1, 1),
(144, 'Camisa deportiva de futbol', 'Es una fea camisa de futbol para fanaticos cutres', 'camisa.jpg', '0', 1, 1),
(153, '', '', '15 - 1.jpg', '0', 1, 1);

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
(1, 1, 2, 'david', 'Andres', 'Daza', 'Diaz', '123', 'admin@admin.co', '123', '6116afedcb0bc31083935c1c262ff4c9', NULL),
(2, 1, 1, 'Davis', 'Diaz', 'Diaz', 'Pedrin', '123', 'user@user.co', 'cra falsa', '6116afedcb0bc31083935c1c262ff4c9', NULL),
(4, 2, 1, 'Pedro', 'Daza', '123', '123', '123456789', '123', '123', 'saaaa', NULL),
(5, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'falso@xxx.xxs', 'Crea 105 n°154a-36', '6116afedcb0bc31083935c1c262ff4c9', NULL),
(7, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'falso@xxx.123', 'Crea 105 n°154a-36', '700c8b805a3e2a265b01c77614cd8b21', NULL),
(8, 1, 2, 'david', 'diaz', 'aaaaaaa', 'diaz', '1241564AAA', 'david@david.co', 'cra172n 7-52', 'b989dd5dfa9cbaa88266944ba129880e', NULL),
(9, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'nose@xxx.123', 'Crea 105 n°154a-36', '700c8b805a3e2a265b01c77614cd8b21', NULL),
(10, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'noe@xxx.123', 'Crea 105 n°154a-36', '700c8b805a3e2a265b01c77614cd8b21', NULL),
(11, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'noe@xx.123', 'Crea 105 n°154a-36', '700c8b805a3e2a265b01c77614cd8b21', NULL),
(12, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'no@xx.123', 'Crea 105 n°154a-36', '700c8b805a3e2a265b01c77614cd8b21', NULL),
(13, 2, 1, 'David', 'Andres', 'Daza', 'Diaz', '1026580077', 'no@x.123', 'Crea 105 n°154a-36', '700c8b805a3e2a265b01c77614cd8b21', NULL),
(28, 1, 1, 'david', '', 'Andres', '', '15544554', 'dadaza770@misena.edu.co', '312345', '3889d5ce28fe61efc68a54b280028995', NULL),
(29, 1, 1, 'david', 'diaz', 'Daza', '', '123123', 'david.d.08@hotmail.com', 'cra172n 7-52', 'cc80ee497f35377053474a3eebf31e7c', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`idAbono`,`Forma_de_pago_idForma_de_pago`,`Pedido_idPedido`),
  ADD KEY `fk_Abono_Forma_de_pago1_idx` (`Forma_de_pago_idForma_de_pago`),
  ADD KEY `fk_Abono_Pedido1_idx` (`Pedido_idPedido`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`idEstado_pedido`);

--
-- Indices de la tabla `estado_pedido_talla`
--
ALTER TABLE `estado_pedido_talla`
  ADD PRIMARY KEY (`idEstado_Pedido_Talla`);

--
-- Indices de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  ADD PRIMARY KEY (`idForma_de_pago`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`idInstitucion`,`Tipo_institucion_idTipo_institucion`),
  ADD UNIQUE KEY `Url_logo_institucion_UNIQUE` (`Url_logo_institucion`),
  ADD KEY `fk_Institucion_Tipo_institucion1_idx` (`Tipo_institucion_idTipo_institucion`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`idInsumo`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idMensajes`,`Usuario_idUsuario`),
  ADD KEY `fk_Mensajes_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `novedad_pedido`
--
ALTER TABLE `novedad_pedido`
  ADD PRIMARY KEY (`idNovedad_pedido`,`Pedido_idPedido`,`Tipo_novedad_idTipo_novedad`),
  ADD KEY `fk_Novedad_pedido_Pedido1_idx` (`Pedido_idPedido`),
  ADD KEY `fk_Novedad_pedido_Tipo_novedad1_idx` (`Tipo_novedad_idTipo_novedad`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`,`Usuario_idUsuario`,`Estado_pedido_idEstado_pedido`,`Ciudad_idCiudad`),
  ADD KEY `fk_Pedido_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Pedido_Estado_pedido1_idx` (`Estado_pedido_idEstado_pedido`),
  ADD KEY `fk_Pedido_Ciudad1_idx` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `pedido_talla`
--
ALTER TABLE `pedido_talla`
  ADD PRIMARY KEY (`idPedido_Talla`,`Pedido_idPedido`,`Talla_idTalla`,`Estado_Pedido_Talla_idEstado_Pedido_Talla`),
  ADD KEY `fk_Pedido_Talla_Pedido1_idx` (`Pedido_idPedido`),
  ADD KEY `fk_Pedido_Talla_Talla1_idx` (`Talla_idTalla`),
  ADD KEY `fk_Pedido_Talla_Estado_Pedido_Talla1_idx` (`Estado_Pedido_Talla_idEstado_Pedido_Talla`);

--
-- Indices de la tabla `prenda`
--
ALTER TABLE `prenda`
  ADD PRIMARY KEY (`idPrenda`),
  ADD UNIQUE KEY `Url_Diseño_UNIQUE` (`Url_Diseño`);

--
-- Indices de la tabla `prenda_uniforme_institucion`
--
ALTER TABLE `prenda_uniforme_institucion`
  ADD PRIMARY KEY (`idPrenda_Uniforme_Institucion`,`Institucion_idInstitucion`,`Prenda_idPrenda`,`Uniforme_idUniforme`),
  ADD KEY `fk_Prenda_Uniforme_Institucion_Institucion1_idx` (`Institucion_idInstitucion`),
  ADD KEY `fk_Prenda_Uniforme_Institucion_Prenda1_idx` (`Prenda_idPrenda`),
  ADD KEY `fk_Prenda_Uniforme_Institucion_Uniforme1_idx` (`Uniforme_idUniforme`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IdRol`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`idTalla`,`Prenda_Uniforme_Institucion_idPrenda_Uniforme_Institucion`,`Talla_Insumo_idTalla_Insumo`),
  ADD KEY `fk_Talla_Prenda_Uniforme_Institucion1_idx` (`Prenda_Uniforme_Institucion_idPrenda_Uniforme_Institucion`),
  ADD KEY `fk_Talla_Talla_Insumo1_idx` (`Talla_Insumo_idTalla_Insumo`);

--
-- Indices de la tabla `talla_insumo`
--
ALTER TABLE `talla_insumo`
  ADD PRIMARY KEY (`idTalla_Insumo`,`Insumo_idInsumo`,`Unidad_medida_idUnidad_medida`),
  ADD KEY `fk_Talla_Insumo_Insumo1_idx` (`Insumo_idInsumo`),
  ADD KEY `fk_Talla_Insumo_Unidad_medida1_idx` (`Unidad_medida_idUnidad_medida`);

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
  ADD PRIMARY KEY (`idUniforme`,`Tipo_Uniforme_idTipo_Uniforme`),
  ADD KEY `fk_Uniforme_Tipo_Uniforme1_idx` (`Tipo_Uniforme_idTipo_Uniforme`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`Id_tipodocumento`,`IdRol`),
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
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `idEstado_pedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_pedido_talla`
--
ALTER TABLE `estado_pedido_talla`
  MODIFY `idEstado_Pedido_Talla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  MODIFY `idForma_de_pago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `idInstitucion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `insumo`
--
ALTER TABLE `insumo`
  MODIFY `idInsumo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idMensajes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `novedad_pedido`
--
ALTER TABLE `novedad_pedido`
  MODIFY `idNovedad_pedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedido_talla`
--
ALTER TABLE `pedido_talla`
  MODIFY `idPedido_Talla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `prenda`
--
ALTER TABLE `prenda`
  MODIFY `idPrenda` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `prenda_uniforme_institucion`
--
ALTER TABLE `prenda_uniforme_institucion`
  MODIFY `idPrenda_Uniforme_Institucion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `IdRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `idTalla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `talla_insumo`
--
ALTER TABLE `talla_insumo`
  MODIFY `idTalla_Insumo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `Idtipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_institucion`
--
ALTER TABLE `tipo_institucion`
  MODIFY `idTipo_institucion` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `idUnidad_medida` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `uniforme`
--
ALTER TABLE `uniforme`
  MODIFY `idUniforme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
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
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `fk_Institucion_Tipo_institucion1` FOREIGN KEY (`Tipo_institucion_idTipo_institucion`) REFERENCES `tipo_institucion` (`idTipo_institucion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `fk_Mensajes_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `novedad_pedido`
--
ALTER TABLE `novedad_pedido`
  ADD CONSTRAINT `fk_Novedad_pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Novedad_pedido_Tipo_novedad1` FOREIGN KEY (`Tipo_novedad_idTipo_novedad`) REFERENCES `tipo_novedad` (`idTipo_novedad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Estado_pedido1` FOREIGN KEY (`Estado_pedido_idEstado_pedido`) REFERENCES `estado_pedido` (`idEstado_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido_talla`
--
ALTER TABLE `pedido_talla`
  ADD CONSTRAINT `fk_Pedido_Talla_Estado_Pedido_Talla1` FOREIGN KEY (`Estado_Pedido_Talla_idEstado_Pedido_Talla`) REFERENCES `estado_pedido_talla` (`idEstado_Pedido_Talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Talla_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Talla_Talla1` FOREIGN KEY (`Talla_idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prenda_uniforme_institucion`
--
ALTER TABLE `prenda_uniforme_institucion`
  ADD CONSTRAINT `fk_Prenda_Uniforme_Institucion_Institucion1` FOREIGN KEY (`Institucion_idInstitucion`) REFERENCES `institucion` (`idInstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prenda_Uniforme_Institucion_Prenda1` FOREIGN KEY (`Prenda_idPrenda`) REFERENCES `prenda` (`idPrenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prenda_Uniforme_Institucion_Uniforme1` FOREIGN KEY (`Uniforme_idUniforme`) REFERENCES `uniforme` (`idUniforme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `talla`
--
ALTER TABLE `talla`
  ADD CONSTRAINT `fk_Talla_Prenda_Uniforme_Institucion1` FOREIGN KEY (`Prenda_Uniforme_Institucion_idPrenda_Uniforme_Institucion`) REFERENCES `prenda_uniforme_institucion` (`idPrenda_Uniforme_Institucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Talla_Talla_Insumo1` FOREIGN KEY (`Talla_Insumo_idTalla_Insumo`) REFERENCES `talla_insumo` (`idTalla_Insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `talla_insumo`
--
ALTER TABLE `talla_insumo`
  ADD CONSTRAINT `fk_Talla_Insumo_Insumo1` FOREIGN KEY (`Insumo_idInsumo`) REFERENCES `insumo` (`idInsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Talla_Insumo_Unidad_medida1` FOREIGN KEY (`Unidad_medida_idUnidad_medida`) REFERENCES `unidad_medida` (`idUnidad_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `uniforme`
--
ALTER TABLE `uniforme`
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
