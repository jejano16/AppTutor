(function () {
    var debug = true;
    if (debug === false) {
        if ( typeof(window.console) === 'undefined') { window.console = {}; }
        window.console.log = function () {};
        window.console.info = function () {};
        window.console.warn = function () {};
    }

    // document.oncontextmenu = function(){return false;};
})()

// configuración de ajax.Setup
$.ajaxSetup({
    url: "assets/api/control.php",
    timeout: 0,
    type: "POST",
    dataType: "json",
    cache: false,
    contentType: false,
    processData: false
})


function getUrlObj(){
    var url= location.search.replace("?", "");
    var arrUrl = url.split("&");
    var urlObj={};   
    for(var i=0; i<arrUrl.length; i++){
        var x= arrUrl[i].split("=");
        urlObj[x[0]]=x[1]
    }
    return urlObj;
}

function getAttrObj(obj, attr){
    for (var p in obj)
    {
        if ( p == attr)
        {
            return obj[p];
        }
    }
}

function extractObj(list, ind, attr,  val){
    var result;
    $.each(list, function(i,v){
        var item = getAttrObj(v, attr);
        if(ind){
            if(i == attr){
                result = v;
                return false;
            }
        }else{
            if(item == val){
                result = v;
                return false;
            }
        }
        
    });
    return result;
}

// extractObj(Array Object, true, int)
// extractObj(Array Object, bool, string ,  mixed)

function roundDec(no, dec)
{
    var flotante = parseFloat(no);
    var result = Math.round(flotante*Math.pow(10,dec))/Math.pow(10,dec);
    if(isNaN(flotante)){
        return '';
    }else{
        return result;
    }
}



//Jquery function
(function( $ ) {
    // Fechas en Español
    moment.locale('es');

    $.fn.parseDT = function(){
        var dt = this.attr("data-dt");
        var parse = moment(dt).format("YYYY/MM/DD hh:mm:ss a");
        this.text(parse);
    }
    
    $("time").parseDT();
    // Alertas

    $.fn.alertGen = function(t,i,txt){
        var type = (t == null || t.length == 0)? "warning" : t;
        var classAlert = (i == null || i.length == 0)? "" : i;
        var text = (txt == null || txt.length == 0)? '<b><i class="glyphicon glyphicon-refresh"></i></b> Esperando respuesta del servidor': txt;
        var html = '<div class="alert alert-'+type+' '+classAlert+' alert-dismissible fade in" role="alert" >\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>\
                '+text+'\
            </div>';
        this.html(html);
    }

    $.fn.alertGenTmp = function(t,i,txt){
        var type = (t == null || t.length == 0)? "warning" : t;
        var classAlert = (i == null || i.length == 0)? "" : i;
        var text = (txt == null || txt.length == 0)? '<b><i class="glyphicon glyphicon-refresh"></i></b> Esperando respuesta del servidor': txt;
        var html = '<div class="alert alert-'+type+' '+classAlert+' alert-dismissible fade in" role="alert" >\
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>\
                '+text+'\
            </div>';
            // this.html(html);
        this.html(html).find(".alert").slideUp(5000, function(){
            $(this).hiddenAlert();
        });
    }

    $.fn.toggleBtn = function(ok, tmp, time) {
        var _this = this;
        if(_this.is("button")){
            if (ok) {
                _this.prop( "disabled", false );
            }else{
                if(tmp){
                _this.prop( "disabled", true );
                setTimeout(function() { _this.prop( "disabled", false ); }, time);
                }else{
                    _this.prop( "disabled", true );
                }
            }
        }
    };
 
    $.fn.hiddenAlert = function() {
        this.each(function(i,v){
            $(v).find(".close").click();
        });
    };

    $.fn.reset = function () {
      $(this).each (function() { this.reset(); });
    }
 
}( jQuery ));



$("table").stupidtable({
    "date":function(a,b){
      aDate = moment(a).format("X");
      bDate = moment(b).format("X");
      return aDate - bDate;
    }
  });


function sortNumJSON(data, key, way) {
    return data.sort(function(a, b) {
        var x = a[key]; var y = b[key];
        if (way === '123' ) { return ((x < y) ? -1 : ((x > y) ? 1 : 0)); }
        if (way === '321') { return ((x > y) ? -1 : ((x < y) ? 1 : 0)); }
    });
}


function sortDateJSON(data, key) {
    return data.sort(function(a, b) {
        return moment(eval('a.'+key)).format("x") - moment(eval('b.'+key)).format("x");
    });
}

// Modal js

(function( $ ) {
    // Modal Functions

    $.fn.openModal = function(txt){
        if(txt != undefined || txt != null || $.trim(txt) != ''){
            $(this).find('.msj-loading').text(txt);
        }
        $(this).modal({
          backdrop : 'static',
          keyboard: false
        })
    }

    $.fn.txtModal = function(txt){
        $(this).find('.msj-loading').text(txt);
    }

    $.fn.closeModal = function(time){
        if(time != undefined || time != null || $.trim(time) != 0){
            $(this).find('.msj-loading').text('');
            $(this).modal('hide');
        }else{
            setTimeout(function(th) {
                th.find('.msj-loading').text('');
                th.modal('hide');
            }($(this)), time);
        }
        
    }
 
}( jQuery ));

// Modal js

(function( $ ) {
    // Modal Functions
    $.fn.jsonChildDom = function(elm){
        $(this).each(console.log($(this)));
        $(this).modal({
          backdrop : 'static',
          keyboard: false
        })
    }
 
}( jQuery ));

// Get all Attr for element
(function(old) {
  $.fn.attrAll = function() {
    if(arguments.length === 0) {
      if(this.length === 0) {
        return null;
      }

      var obj = {};
      $.each(this[0].attributes, function() {
        if(this.specified) {
          obj[this.name] = this.value;
        }
      });
      return obj;
    }

    return old.apply(this, arguments);
  };
})($.fn.attrAll);

// Opcional
$(function(){

    // resize window
    // $(window).resize(hghTabsInfo);

})


function hghTabsInfo(){
    var elm = $(".table-static-pg");
    if(elm.length > 0){
        var hgh = $(window).height() - elm.offset().top - 5;
        elm.css("height",hgh);
    }
    
}
