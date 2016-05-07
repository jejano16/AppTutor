DROP PROCEDURE `spCRUDUser`;
CREATE PROCEDURE `spCRUDUser`(IN `v_Id` INT(10), IN `v_IdTDoc` INT(10), IN `v_DocIde` VARCHAR(30) CHARSET utf8, IN `v_Name` VARCHAR(40) CHARSET utf8, IN `v_Name1` VARCHAR(40) CHARSET utf8, IN `v_LastName` VARCHAR(100) CHARSET utf8, IN `v_CodSt` VARCHAR(50) CHARSET utf8, IN `v_DateInUni` DATE, IN `v_Email` VARCHAR(50) CHARSET utf8, IN `v_Pass` VARCHAR(128) CHARSET utf8, IN `v_RqPass` INT(1), IN `v_StateUser` TINYINT(1) UNSIGNED, IN `v_Profile` ENUM('Admin','Student'), IN `v_crud` ENUM('ins','upd','del','') CHARSET utf8) COMMENT 'Procedimiento para realizar un CRUD a un usuario' NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN
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

END


/* EJEMPLO EJECUTADO*/


CALL spCRUDUser(NULL, 1, 1032454463, 'Mario', 'Alejandro', 'Castiblanco Hernández', '302772', '2011-01-01' , 'mario.castiblancoh@campusucc.edu.co', md5(md5('12345')), 1, 1, 'Student', 'ins')


spCRUDUser(:v_Id, :v_IdTDoc, :v_DocIde, :v_Name, :v_Name1, :v_LastName, :v_CodSt, :v_DateInUni, :v_Email, :v_Pass, :v_RqPass, :v_StateUser, :v_Profile, :v_crud)


-- Reset ID Table
ALTER TABLE user AUTO_INCREMENT = 2
/*
array php
*/
$val = array(
	"v_Id" => 1,
	"v_IdTDoc" => 1,
	"v_DocIde" => 1032454463,
	"v_Name" => 'Mario',
	"v_Name1" => 'Alejandro',
	"v_LastName" => 'Castiblanco Hernández',
	"v_CodSt" => '302772',
	"v_DateInUni" => '2011-01-01' ,
	"v_Email" => 'mario.castiblancoh@campusucc.edu.co',
	"v_Pass" => md5(md5('12345')),
	"v_RqPass" => 1,
	"v_StateUser" => 1,
	"v_Profile" => 'Student',
	"v_crud" => 'ins'
)



-- Store procedure spCRUDTopic
BEGIN
DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO topic(`Name`, `UrlTopic`, `Level`)VALUES ( `v_Name`, `v_UrlTopic`, `v_Level`);
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
END


-- Store procedure spCRUDEval


CREATE PROCEDURE `spCRUDEval`(IN `v_Id` INT(11), IN `v_Title` VARCHAR(50), IN `v_QuesTot` INT(3), IN `v_crud` VARCHAR(3))
    MODIFIES SQL DATA
BEGIN
DECLARE affect INT;
CASE `v_crud`
WHEN 'ins' THEN 
	INSERT INTO eval(`Title`, `QuesTot`, `DateCreate`, `DateModify`) VALUES (`v_Title`, `v_QuesTot`, NOW(), NOW());
	SELECT ROW_COUNT() INTO affect;
	IF affect = 0 THEN
		SELECT 'false' v, 'No se ha realizado ningún registro' msj;
	ELSE
		SELECT 'true' v, CONCAT('Se ha registrado ',affect,' nuevo tema') msj, LAST_INSERT_ID() idEval;
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
END


-- Store procedure spCRUDQuest

CREATE PROCEDURE `spCRUDQuest`(IN `v_Id` INT(10), IN `v_Id_Eval` INT(10), IN `v_Id_Topic` INT(10), IN `v_Quest` TEXT, IN `v_UrlQuest` VARCHAR(200), IN `v_crud` VARCHAR(3))
    MODIFIES SQL DATA
BEGIN
END

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

-- Store procedure spCRUDAnswer
`Id`, `Id_Quest`, `NumAns`, `Correct`, `Ans`, `UrlAns`, `DateModify`

CREATE PROCEDURE `spCRUDAnswer`(IN `v_Id` INT(10), IN `v_Id_Quest` INT(10), IN `v_NumAns` TINYINT(1), IN `v_Correct` ENUM('false', 'true', ''), IN `v_Ans` TEXT, IN `v_UrlAns` VARCHAR(200), IN `v_crud` VARCHAR(3))
    MODIFIES SQL DATA
BEGIN
END

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


-- Store procedure spCRUDresolveeval
`Id_User`, `Id_Eval`, `Id_Quest`, `Id_Answer`, `DateCreate`

CREATE PROCEDURE `spCRUDResolveeval`(IN `v_Id_User` INT(10), IN `v_Id_Eval` INT(10), IN `v_Id_Quest` INT(10), IN `v_Id_Answer` INT(10), IN `v_crud` VARCHAR(3))
    MODIFIES SQL DATA
BEGIN
END

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