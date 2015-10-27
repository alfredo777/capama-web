$(document).ready(function(){
  $(".chat").animate({ scrollTop: $(".chat")[0].scrollHeight}, 1000);
  $('#form-chat').submit(function() {
    var $form = $(this),
        $loadingMsg = $('.loading'),
        url = $form.attr('action'),
        formData = new FormData( $form[0] );

    $loadingMsg.show();

    ajaxFormChat(url, formData, function(data, err) {
        $loadingMsg.hide();
        $('#form-chat')[0].reset();

    });

    return false;
  });

  function ajaxFormChat (url, formData, callback) {
    $.ajax({
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