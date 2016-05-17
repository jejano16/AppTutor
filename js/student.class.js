$(function(){
    /*$("form [required]").prop("required", false);
    console.warn("Error");*/
    // Form temporal de registro
    $("#reg-tmp-us").on("submit", createTmpUser);

    // Form definitivo de registro
    $("#reg-us").on("submit", createUser);

    // Seleccionar pestaña de Login
    $(".loginuser").on("click",function(){
        $('#tab-index a[href="#tab-2"]').tab('show');
    })

    // Cerrando modal de registro
    $("#modalregus").on("hidden.bs.modal", function(){
        $("form :input[readonly]").prop("readonly", false);
        $(".btn[type=submit]").toggleBtn(true, false);
    })

})

function createUser(e){
        e.preventDefault();
        var msj = $(this).find(".msj");
        var _this = $(this);
        var btn =  $(this).find("button[type=submit]");
        var modal = $("#modalregus");
        var pass1 = $(this).find("#v_Pass").val();
        var pass2 = $(this).find("#confirmPass").val();

        if(pass1 != pass2){
            msj.alertGen(null, null,'<b><i class="glyphicon glyphicon-warning"></i> Advertencia:</b> Las contraseñas no coincide, Intentalo nuevamente');
            $(this).find("#v_Pass").focus();
            return false;
        }

        var formData = new FormData(this);
            formData.append("v_RqPass", 1);
            formData.append("v_StateUser", 1);
            formData.append("v_Profile", "Student");
            formData.append("func", "create_user");
            console.log(formData);
            $.ajax({
                data: formData ,
                beforeSend: function(){
                    msj.alertGen();
                    btn.toggleBtn(false, false);
                },
                error : function(a,b,c){
                    btn.toggleBtn(true);
                    console.warn("Error en envío "+b); console.warn(c); console.warn(a);
                    msj.alertGen('danger', null,'<b><i class="glyphicon glyphicon-error"></i> Error:</b> No se pudo enviar la información, Intentalo nuevamente');
                }
            }).done(function(json){
                console.info(json);
                msj.hiddenAlert();
                if(json.v){
                    $(".msj-prin").alertGen('success', null,'<b><i class="glyphicon glyphicon-ok-circle"></i></b> Bienvenido(a) a Code Gram. Ingresa a la plataforma con el usuario que creaste');
                    $('#tab-index a[href="#tab-2"]').tab('show')
                    modal.modal("hide");
                    $("form").reset();
                    $("form.reg-form :input[readonly]").prop("readonly", false);
                    $(".btn[type=submit]").toggleBtn(true, false);
                }else{
                    btn.toggleBtn(true);
                    msj.alertGen('danger', null,'<b><i class="glyphicon glyphicon-remove-circle"></i> Error</b> '+json.msj);
                    _this.find("input[type=password]").val("");
                }
            });
}


function createUser(e){
        e.preventDefault();
        var msj = $(this).find(".msj");
        var _this = $(this);
        var btn =  $(this).find("button[type=submit]");
        var modal = $("#modalregus");
        var pass1 = $(this).find("#v_Pass").val();
        var pass2 = $(this).find("#confirmPass").val();

        if(pass1 != pass2){
            msj.alertGen(null, null,'<b><i class="glyphicon glyphicon-warning"></i> Advertencia:</b> Las contraseñas no coincide, Intentalo nuevamente');
            $(this).find("#v_Pass").focus();
            return false;
        }

        var formData = new FormData(this);
            formData.append("v_RqPass", 1);
            formData.append("v_StateUser", 1);
            formData.append("v_Profile", "Student");
            formData.append("func", "create_user");
            console.log(formData);
            $.ajax({
                data: formData ,
                beforeSend: function(){
                    msj.alertGen();
                    btn.toggleBtn(false, false);
                },
                error : function(a,b,c){
                    btn.toggleBtn(true);
                    console.warn("Error en envío "+b); console.warn(c); console.warn(a);
                    msj.alertGen('danger', null,'<b><i class="glyphicon glyphicon-error"></i> Error:</b> No se pudo enviar la información, Intentalo nuevamente');
                }
            }).done(function(json){
                console.info(json);
                msj.hiddenAlert();
                if(json.v){
                    $(".msj-prin").alertGen('success', null,'<b><i class="glyphicon glyphicon-ok-circle"></i></b> Bienvenido(a) a Code Gram. Ingresa a la plataforma con el usuario que creaste');
                    $('#tab-index a[href="#tab-2"]').tab('show')
                    modal.modal("hide");
                    $("form").reset();
                    $("form.reg-form :input[readonly]").prop("readonly", false);
                    $(".btn[type=submit]").toggleBtn(true, false);
                }else{
                    btn.toggleBtn(true);
                    msj.alertGen('danger', null,'<b><i class="glyphicon glyphicon-remove-circle"></i> Error</b> '+json.msj);
                    _this.find("input[type=password]").val("");
                }
            });
}

function createTmpUser(e){
        e.preventDefault();
        var objIn = $(this).serializeArray();
        var modal = $("#modalregus");
        $.each(objIn, function(i,v){
            $("form#reg-us #"+v.name).val(v.value);
        })
        $(this).find(":input").prop("readonly", true);
        $(this).find(".btn[type=submit]").toggleBtn(false, false);
        $("form#reg-us :input:first").focus();
        modal.modal("show");
}