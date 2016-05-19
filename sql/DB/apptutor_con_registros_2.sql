-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-05-2016 a las 20:58:32
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apptutor`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`u610882130_root`@`localhost` PROCEDURE `spCRUDAnswer` (IN `v_Id` INT(10), IN `v_Id_Quest` INT(10), IN `v_NumAns` TINYINT(1), IN `v_Correct` ENUM('false','true',''), IN `v_Ans` TEXT, IN `v_UrlAns` VARCHAR(200), IN `v_crud` VARCHAR(3))  MODIFIES SQL DATA
BEGIN

DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO answer( `Id_Quest`, `NumAns`, `Correct`, `Ans`, `UrlAns`, `DateModify`) VALUES (`v_Id_Quest`, `v_NumAns`, `v_Correct`, `v_Ans`, `v_UrlAns`, NOW());
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha creado ',affect,' registro') msj, LAST_INSERT_ID() idEval;
	END IF;
	
WHEN 'upd' THEN
	UPDATE answer SET `Id_Quest` = `v_Id_Quest`, `NumAns` = `v_NumAns`, `Correct` = `v_Correct`, `Ans` = `v_Ans` , `UrlAns` = `v_UrlAns`, `DateModify` = NOW() WHERE `Id` = `v_Id` ;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha actualizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha actualizado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
WHEN 'del' THEN
	DELETE FROM answer WHERE `Id` = `v_Id`;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se han eliminado registros' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha eliminado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
ELSE
	BEGIN
	END;
END CASE;
END$$

CREATE DEFINER=`u610882130_root`@`localhost` PROCEDURE `spCRUDEval` (IN `v_Id` INT(11), IN `v_Title` VARCHAR(50), IN `v_QuesTot` INT(3), IN `v_crud` VARCHAR(3))  MODIFIES SQL DATA
BEGIN
DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO eval(`Title`, `QuesTot`, `DateCreate`, `DateModify`) VALUES (`v_Title`, `v_QuesTot`, NOW(), NOW());
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha creado ',affect,' registro') msj, LAST_INSERT_ID() idEval;
	END IF;
	
WHEN 'upd' THEN
	UPDATE eval SET `Title` = `v_Title`, `QuesTot` = `v_QuesTot`, `DateModify` = NOW() WHERE `Id` = `v_Id` ;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha actualizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha actualizado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
WHEN 'del' THEN
	DELETE FROM eval WHERE `Id` = `v_Id`;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se han eliminado registros' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha eliminado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
ELSE
	BEGIN
	END;
END CASE;
END$$

CREATE DEFINER=`u610882130_root`@`localhost` PROCEDURE `spCRUDQuest` (IN `v_Id` INT(10), IN `v_Id_Eval` INT(10), IN `v_Id_Topic` INT(10), IN `v_Quest` TEXT, IN `v_UrlQuest` VARCHAR(200), IN `v_crud` VARCHAR(3))  MODIFIES SQL DATA
BEGIN

DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO quest(`Id_Eval`, `Id_Topic`, `Quest`, `UrlQuest`, `DateModify`) VALUES (`v_Id_Eval`, `v_Id_Topic`, `v_Quest`, `v_UrlQuest`, NOW());
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha creado ',affect,' registro') msj, LAST_INSERT_ID() idEval;
	END IF;
	
WHEN 'upd' THEN
	UPDATE quest SET `Id_Eval` = `v_Id_Eval`, `Id_Topic` = `v_Id_Topic`, `Quest` = `v_Quest`, `UrlQuest` = `v_UrlQuest`, `DateModify` = NOW() WHERE `Id` = `v_Id` ;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha actualizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha actualizado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
WHEN 'del' THEN
	DELETE FROM quest WHERE `Id` = `v_Id`;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se han eliminado registros' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha eliminado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
ELSE
	BEGIN
	END;
END CASE;
END$$

CREATE DEFINER=`u610882130_root`@`localhost` PROCEDURE `spCRUDResolveeval` (IN `v_Id_User` INT(10), IN `v_Id_Eval` INT(10), IN `v_Id_Quest` INT(10), IN `v_Id_Answer` INT(10), IN `v_crud` VARCHAR(3))  MODIFIES SQL DATA
BEGIN

DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO resolveeval( `Id_User`, `Id_Eval`, `Id_Quest`, `Id_Answer`, `DateCreate`) VALUES (`v_Id_User`, `v_Id_Eval`, `v_Id_Quest`, `v_Id_Answer`, NOW());
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha creado ',affect,' registro') msj, LAST_INSERT_ID() idEval;
	END IF;
WHEN 'del' THEN
	DELETE FROM resolveeval WHERE `Id_User` = `v_Id_User` AND `Id_Eval` = `v_Id_Eval`;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se han eliminado registros' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha eliminado ',affect, ' registro(s)') msj, v_Id idEval;
	END IF;
ELSE
	BEGIN
	END;
END CASE;
END$$

CREATE DEFINER=`u610882130_root`@`localhost` PROCEDURE `spCRUDTopic` (IN `v_Id` INT(11), IN `v_Name` VARCHAR(50), IN `v_UrlTopic` VARCHAR(200), IN `v_Level` INT(2), IN `v_crud` VARCHAR(3))  MODIFIES SQL DATA
BEGIN
DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO topic( `Name`, `UrlTopic`, `Level`)VALUES ( `v_Name`, `v_UrlTopic`, `v_Level`);
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha registrado ',affect,' nuevo tema') msj, LAST_INSERT_ID() idTopic;
	END IF;
	
WHEN 'upd' THEN
	UPDATE topic SET `Name` = `v_Name`, `UrlTopic` = `v_UrlTopic`, `Level` = `v_Level` WHERE `Id` = `v_Id` ;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha actualizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha actualizado ',affect, ' registro(s)') msj, v_Id idTopic;
	END IF;
WHEN 'del' THEN
	DELETE FROM topic WHERE `Id` = `v_Id`;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se han eliminado registros' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha eliminado ',affect, ' registro(s)') msj, v_Id idTopic;
	END IF;
ELSE
	BEGIN
	END;
END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCRUDUser` (IN `v_Id` INT(10), IN `v_IdTDoc` INT(10), IN `v_DocIde` VARCHAR(30) CHARSET utf8, IN `v_Name` VARCHAR(40) CHARSET utf8, IN `v_Name1` VARCHAR(40) CHARSET utf8, IN `v_LastName` VARCHAR(100) CHARSET utf8, IN `v_CodSt` VARCHAR(50) CHARSET utf8, IN `v_DateInUni` DATE, IN `v_Email` VARCHAR(50) CHARSET utf8, IN `v_Pass` VARCHAR(128) CHARSET utf8, IN `v_RqPass` INT(1), IN `v_StateUser` TINYINT(1) UNSIGNED, IN `v_Profile` ENUM('Admin','Student'), IN `v_crud` ENUM('ins','upd','del','') CHARSET utf8)  BEGIN
DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO user( `Id_TypeDoc`, `DocIde`, `Name`, `Name1`, `LastName`, `CodStudent`, `DateInUni`, `Email`, `Pass`, `RqPass`, `StateUser`, `Profile`) VALUES ( `v_IdTDoc`, `v_DocIde`, `v_Name`, `v_Name1`, `v_LastName`, `v_CodSt`, `v_DateInUni`, `v_Email`, `v_Pass`, `v_RqPass`, `v_StateUser`, `v_Profile`);
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha ingresado ',affect, ' registro(s)') msj, LAST_INSERT_ID() idUser;
	END IF;
	
WHEN 'upd' THEN
	UPDATE user SET `Id_TypeDoc` = `v_IdTDoc`, `DocIde` = `v_DocIde`, `Name` = `v_Name`, `Name1` = `v_Name1`, `LastName` = `v_LastName`, `CodStudent` = `v_CodSt`, `DateInUni` = `v_DateInUni`, `Email` = `v_Email`, `Pass` = `v_Pass`, `RqPass` = `v_RqPass`, `StateUser` = `v_StateUser`, `Profile` = `v_Profile` WHERE `Id` = `v_Id` ;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha actualizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha actualizado ',affect, ' registro(s)') msj, v_Id idUser;
	END IF;
WHEN 'del' THEN
	DELETE FROM user WHERE `Id` = `v_Id` AND `Id_TypeDoc` = `v_IdTDoc` AND `DocIde`= `v_DocIde`;
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se han eliminado registros' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha eliminado ',affect, ' registro(s)') msj, v_Id idUser;
	END IF;
ELSE
	BEGIN
	END;
END CASE;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answer`
--

CREATE TABLE `answer` (
  `Id_Quest` int(10) NOT NULL,
  `NumAns` tinyint(1) UNSIGNED NOT NULL,
  `Correct` enum('False','true','') NOT NULL DEFAULT '',
  `Ans` text NOT NULL,
  `UrlAns` varchar(200) NOT NULL,
  `DateModify` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eval`
--

CREATE TABLE `eval` (
  `Id` int(10) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `QuesTot` int(3) UNSIGNED NOT NULL,
  `DateCreate` date NOT NULL,
  `DateModify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quest`
--

CREATE TABLE `quest` (
  `Id` int(10) NOT NULL,
  `Id_Eval` int(10) NOT NULL,
  `Id_Topic` int(10) NOT NULL,
  `Quest` text NOT NULL,
  `UrlQuest` varchar(200) NOT NULL,
  `DateModify` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolveeval`
--

CREATE TABLE `resolveeval` (
  `Id_User` int(10) NOT NULL,
  `Id_Quest` int(10) NOT NULL,
  `Id_Answer` int(10) NOT NULL,
  `DateCreate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topic`
--

CREATE TABLE `topic` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UrlTopic` varchar(200) NOT NULL,
  `Level` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `topic`
--

INSERT INTO `topic` (`Id`, `Name`, `UrlTopic`, `Level`) VALUES
(1, 'Variables', 'Estructura de datos', 1),
(2, 'Condicionales', 'Estructura de datos', 1),
(3, 'Iteraciones', 'Estructura de datos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typedoc`
--

CREATE TABLE `typedoc` (
  `Id` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `typedoc`
--

INSERT INTO `typedoc` (`Id`, `Name`) VALUES
(1, 'Cédula de ciudadania'),
(2, 'Tarjeta de identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `Id` int(10) NOT NULL,
  `Id_TypeDoc` int(10) NOT NULL,
  `DocIde` varchar(30) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Name1` varchar(40) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `CodStudent` varchar(50) NOT NULL,
  `DateInUni` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Pass` varchar(128) NOT NULL,
  `RqPass` int(1) NOT NULL DEFAULT '1',
  `StateUser` tinyint(1) UNSIGNED NOT NULL,
  `Profile` enum('Admin','Student') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`Id`, `Id_TypeDoc`, `DocIde`, `Name`, `Name1`, `LastName`, `CodStudent`, `DateInUni`, `Email`, `Pass`, `RqPass`, `StateUser`, `Profile`) VALUES
(1, 1, '1032454463', 'Mario', 'Alejandro', 'Castiblanco Hernández', '302772', '2011-01-01', 'mario.castiblancoh@campusucc.edu.co', '1f32aa4c9a1d2ea010adcf2348166a04', 1, 1, 'Student'),
(2, 2, '93010600047', 'Mario', '', 'Castiblanco Hern', '', '0000-00-00', 'mario.castiblancoh@campusucc.edu.co', '14e1b600b1fd579f47433b88e8d85291', 1, 1, 'Student'),
(3, 1, '1030236345', 'Julian', 'Felipe', 'Castiblanco Hern', '3215346', '2014-06-01', 'julian.castiblancoh@campusucc.edu.co', '1f32aa4c9a1d2ea010adcf2348166a04', 1, 1, 'Student'),
(4, 1, '12345', 'Yeisson', 'David', 'Romero', '309572', '0000-00-00', 'yeisson.romerom@campusucc.edu.co', '1f32aa4c9a1d2ea010adcf2348166a04', 1, 1, 'Student'),
(5, 1, 'Admin', 'Admin UCC', '', 'Universidad', '', '2016-05-19', 'admin@campusucc.edu.co', 'c3284d0f94606de1fd2af172aba15bf3', 1, 1, 'Admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`Id_Quest`);

--
-- Indices de la tabla `eval`
--
ALTER TABLE `eval`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`Id`,`Id_Eval`,`Id_Topic`),
  ADD KEY `Id_Eval` (`Id_Eval`),
  ADD KEY `Id_Topic` (`Id_Topic`);

--
-- Indices de la tabla `resolveeval`
--
ALTER TABLE `resolveeval`
  ADD PRIMARY KEY (`Id_User`,`Id_Quest`,`Id_Answer`),
  ADD KEY `Id_Quest` (`Id_Quest`);

--
-- Indices de la tabla `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indices de la tabla `typedoc`
--
ALTER TABLE `typedoc`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`,`Id_TypeDoc`),
  ADD UNIQUE KEY `Id_TypeDoc` (`Id_TypeDoc`,`DocIde`,`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eval`
--
ALTER TABLE `eval`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `quest`
--
ALTER TABLE `quest`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `topic`
--
ALTER TABLE `topic`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `typedoc`
--
ALTER TABLE `typedoc`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Id_Quest`) REFERENCES `quest` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `quest`
--
ALTER TABLE `quest`
  ADD CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`Id_Eval`) REFERENCES `eval` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `quest_ibfk_2` FOREIGN KEY (`Id_Topic`) REFERENCES `topic` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `resolveeval`
--
ALTER TABLE `resolveeval`
  ADD CONSTRAINT `resolveeval_ibfk_2` FOREIGN KEY (`Id_Quest`) REFERENCES `quest` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resolveeval_ibfk_3` FOREIGN KEY (`Id_User`) REFERENCES `user` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Id_TypeDoc`) REFERENCES `typedoc` (`Id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
