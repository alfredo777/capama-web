// carga el tpl
function loadDBTPL(data, tpln, divloadtpl){
    getTemplate(tpln, data, function(output, err) {
      $("#"+divloadtpl).html(output);
    });  
}

function getRecipt(jsonn, tpln, divloadtpl){
   var datax = {"cuenta": jsonn};
   getasJSONRecipt(datax,function(data, err) {
      console.log(data);
      getTemplate(tpln, data, function(output, err) {
        $("#"+divloadtpl).html(output);
      });    
   });
}

function getPayIntension(jsonn, tpln, divloadtpl){
   var datax = {"cuenta": jsonn};
   getJSONINTENSION(datax,function(data, err) {
      console.log(data);
      getTemplate(tpln, data, function(output, err) {
        $("#"+divloadtpl).html(output);
      });    
   });
}


function loadTPL(jsonn, tpln, divloadtpl, lang){
   getasJSON(jsonn, lang,function(data, err) {
      getTemplate(tpln, data, function(output, err) {
        $("#"+divloadtpl).html(output);
      });    
   });
}

// cargar tpl api
function loadTPLAPI(jsonn, tpln, divloadtpl){
   getasJSONAPI(jsonn,function(data, err) {
      getTemplate(tpln, data, function(output, err) {
        $("#"+divloadtpl).html(output);
      });    
   });
}

// cargar tpl add
function loadTPLAPIADD(jsonn, tpln, divloadtpl){
   getasJSONAPI(jsonn,function(data, err) {
      getTemplate(tpln, data, function(output, err) {
        $("#"+divloadtpl).after(output);
      });    
   });
}

// cargar paginando

function loadTPLpaginate(data, tpln, divloadtpl){
  getTemplate(tpln, data, function(output, err) {
    $("#"+divloadtpl).append(output);
  });
}

// se dirige al tpl
function getTemplate(name, context, callback) {
  $.ajax({
    url: '/tpl/' + name + '.html',
    cache: true,
    success: function (data) {
      var tpl = Handlebars.compile(data),
      output = tpl(context);
      callback(output, null);
    },
    error: function(err) {
      callback(null, err);
    }
  });
}

// se conecta al json interno
function getasJSON(json_file, lang ,callback){
  $.ajax({
    dataType: "json",
    url: '/json/'+lang+"/"+ json_file + '.json',
    cache: true,
    success: function (data) {
      callback(data, null);
    },
    error: function(err) {
      callback(null, err);
    }
  });
}
// se conecta al json  API
function getasJSONAPI(json_file ,callback){
  $.ajax({
    dataType: "json",
    url: '/api/'+ json_file + '.json',
    cache: true,
    success: function (data) {
      callback(data, null);
    },
    error: function(err) {
      callback(null, err);
    }
  });
}

function getasJSONRecipt(acount,callback){
  $.ajax({
    dataType: "jsonp",
    url: "http://www.capama.gob.mx/net/recibo/",
    data: acount,
    cache: true,
    type: 'GET',
    success: function (data) {
      callback(data, null);
    },
    error: function(err) {
      callback(null, err);
    }
  });
}

function getJSONINTENSION(acount, callback){
  $.ajax({
    dataType: "jsonp",
    url: "http://www.capama.gob.mx/net/recibo/adeudo.php",
    data: acount,
    cache: true,
    type: 'GET',
    success: function (data) {
      callback(data, null);
    },
    error: function(err) {
      callback(null, err);
    }
  });
}

Handlebars.registerHelper('list', function(items, options) {
  var out = "<ul>";

  for(var i=0, l=items.length; i<l; i++) {
    out = out + "<li>" + options.fn(items[i]) + "</li>";
  }

  return out + "</ul>";
});

Handlebars.registerHelper('trimString', function(passedString) {
    var theString = passedString.substring(0,420);
    return new Handlebars.SafeString(theString)
});

Handlebars.registerHelper("prettifyDate", function(date) {
    var parse = new Date(date);
    var weekday = parse.getDay();
    var year = parse.getFullYear();
    var month = parse.getMonth();
    var parsedDate = weekday +"-"+ month +"-"+ year;
    return new Handlebars.SafeString(parsedDate)
});

Handlebars.registerHelper ('truncate', function (str, len) {
        if (str.length > len) {
            var new_str = str.substr (0, len+1);

            while (new_str.length) {
                var ch = new_str.substr ( -1 );
                new_str = new_str.substr ( 0, -1 );

                if (ch == ' ') {
                    break;
                }
            }

            if ( new_str == '' ) {
                new_str = str.substr ( 0, len );
            }

            return new Handlebars.SafeString ( new_str +'...' ); 
        }
        return str;
    });
