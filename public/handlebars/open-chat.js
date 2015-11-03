$(document).ready(function(){
  $(".chat").animate({ scrollTop: $(".chat")[0].scrollHeight}, 1000);
  $('#form-chat').submit(function() {
    var url = "/messages/create";
    var data = $('#form-chat').serialize();
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      dataType: 'json'
    });

    $("#form-chat")[0].reset();

    return false;
  });

});