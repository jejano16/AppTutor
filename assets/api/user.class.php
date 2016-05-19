<?php 
	
class User
{
    private $list;

    public function loginSend($arr){

        $arr["v_Email"] = $arr["v_Email"]."@campusucc.edu.co";
        $arr["v_Pass"] = md5(md5($arr["v_Pass"]));
        $qry = "SELECT u.Id, Id_TypeDoc, DocIde, u.Name, Name1, LastName, CodStudent, DateInUni, Email, Pass, RqPass, StateUser, Profile, td.Name tdoc FROM user u INNER JOIN typedoc td ON (u.Id_TypeDoc = td.Id) WHERE Email = :v_Email AND Pass = :v_Pass";
        $objCon = new conDB; //instanciamos conector
        $rsQry = $objCon->queryDB($qry, $arr);

        if(count($rsQry) == 1){  

                $v = $rsQry[0];
                $_SESSION["Id"] = $v["Id"];
                $_SESSION["Id_TypeDoc"] = $v["Id_TypeDoc"];
                $_SESSION["DocIde"] = $v["DocIde"];
                $_SESSION["Name"] = $v["Name"];
                $_SESSION["Name1"] = $v["Name1"];
                $_SESSION["LastName"] = $v["LastName"];
                $_SESSION["CodStudent"] = $v["CodStudent"];
                $_SESSION["DateInUni"] = $v["DateInUni"];
                $_SESSION["Email"] = $v["Email"];
                $_SESSION["Pass"] = $v["Pass"];
                $_SESSION["RqPass"] = $v["RqPass"];
                $_SESSION["StateUser"] = $v["StateUser"];
                $_SESSION["Profile"] = $v["Profile"];
                $_SESSION["tdoc"] = $v["tdoc"];
                $_SESSION["index"] = ($v["Profile"] == "Admin")? "admin.php" : "student.php";
                
                $ar["v"] = true;
                $ar["msj"] = "<b>".$v["Name"]."</b>";
                $ar["dir"]= $_SESSION["index"];
            }else{
                $ar["v"] = false;
                $ar["msj"] = "Usuario y/o contraseña incorrectos";
            }

        return $ar;
    }
 
    public function listTDoc(){
        $qry = "SELECT * FROM typedoc td ORDER BY td.Id";
        $valores = null;
 
        $oConectar = new conDB; //instanciamos conector
        $this->list = $oConectar->queryDB($qry,$valores);
 
        return $this->list;
    }    

    public function listUser(){
        $qry = "SELECT * FROM user";
        $valores = null;
 
        $oConectar = new conDB; //instanciamos conector
        $this->list = $oConectar->queryDB($qry,$valores);
 
        return $this->list;
    } //Termina funcion listUser();
 
    public function newUser($arr){
        $arr["v_Pass"] = md5(md5($arr["v_Pass"]));
        $qry = "CALL spCRUDUser (NULL, :v_IdTDoc, :v_DocIde, :v_Name, :v_Name1, :v_LastName, :v_CodSt , :v_DateInUni, :v_Email, :v_Pass, 1, :v_StateUser, :v_Profile, 'ins')";
        $arr["v_Email"] = $arr["v_Email"]."@campusucc.edu.co";
        $objCon = new conDB; //instanciamos conector
        $rsQry = $objCon->queryDB($qry, $arr);
 
        return $rsQry[0];
    } //Termina funcion newUser()

    public function editUser($arr){
        $qry = "CALL spCRUDUser (:v_Id, :v_IdTDoc, :v_DocIde, :v_Name, :v_Name1, :v_LastName, :v_CodSt , :v_DateInUni, :v_Email, :v_Pass, :v_RqPass, :v_StateUser, :v_Profile, 'upd')";
 
        $objCon = new conDB; //instanciamos conector
        $rsQry = $objCon->queryDB($qry, $arr);
 
        return $rsQry[0];
    } //Termina funcion editUser()

    public function delUser($arr){
        $qry = "CALL spCRUDUser (:v_Id, :v_IdTDoc, :v_DocIde, NULL, NULL, NULL, NULL , NULL, NULL, NULL, NULL, NULL, NULL, 'del')";
 
        $objCon = new conDB; //instanciamos conector
        $rsQry = $objCon->queryDB($qry, $arr);
 
        return $rsQry[0];
    } //Termina funcion editUser()
}/// TERMINA CLASE User ///

?>