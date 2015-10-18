$(document).ready(function(){
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
        reader.onload = function (e) {
        $('#img-prev').attr('src', e.target.result);
      }
    reader.readAsDataURL(input.files[0]);
    }
  }
  $("#file").change(function(){
      readURL(this);
  });

  $('#form-ajax-image').submit(function(){
    var $form = $(this),
        $loadingMsg = $('#porcentVar'),
        url = $form.attr('action'),
        formData = new FormData( $form[0] );
    $loadingMsg.show();
    sendImage(url, formData, function(data, err) {
        if (err) 
            return alert("Error...");
        setTimeout(function(){ $loadingMsg.hide(); $("#porcentVar").css('width','0%');}, 2000); 
    });
    return false;
  });

  function sendImage(url, formData, callback){
    $.ajax({
      xhr: function()
      {
        var xhr = new window.XMLHttpRequest();
        xhr.upload.addEventListener("progress", function(evt){
          if (evt.lengthComputable) {
            var percentComplete = (evt.loaded / evt.total)*100;
            var porcentString = percentComplete + '%'
            $("#porcentVar").css('width',porcentString);
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
  }

});
