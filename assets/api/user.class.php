<?php 
	
class User
{
    private $list;
 
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