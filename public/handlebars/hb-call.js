// carga el tpl
function loadTPL(jsonn, tpln, divloadtpl, lang){
   getasJSON(jsonn, lang,function(data, err) {
      getTemplate(tpln, data, function(output, err) {
        $("#"+divloadtpl).html(output);
      });    
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

Handlebars.registerHelper('list', function(items, options) {
  var out = "<ul>";

  for(var i=0, l=items.length; i<l; i++) {
    out = out + "<li>" + options.fn(items[i]) + "</li>";
  }

  return out + "</ul>";
});