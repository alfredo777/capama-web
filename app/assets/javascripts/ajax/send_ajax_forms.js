$(document).ready(function(){
  $('#form-ajax').submit(function() {
    var $form = $(this),
        $loadingMsg = $('.loading'),
        url = $form.attr('action'),
        formData = new FormData( $form[0] );

    $loadingMsg.show();

    ajaxForm(url, formData, function(data, err) {
        if (err) 
            return alert("Error...");
        setTimeout(function(){ $loadingMsg.hide(); }, 3000);
        
    });

    return false;
  });

  function ajaxForm (url, formData, callback) {
    $.ajax({
        xhr: function()
        {
          var xhr = new window.XMLHttpRequest();
          xhr.upload.addEventListener("progress", function(evt){
            if (evt.lengthComputable) {
              var percentComplete = (evt.loaded / evt.total)*100;
              $("#porcentloadbar").html(percentComplete);
            }
          }, false);
          return xhr;
        },
        url: url,
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function(data) {
            callback(data, null);
        },
        error: function(err) {
            callback(null, err);
        }
    });
  };
});