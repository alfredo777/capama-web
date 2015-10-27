 (function(){
    var source = new EventSource('/messages/events');
    source.addEventListener('messages.create', function(e) {
       var m = $.parseJSON(e.data).message_act;
       var message = $.parseJSON(m);
       var u = $.parseJSON(e.data).user_x;
       var user = $.parseJSON(u);
       if (m){ 
       message = '<li class="clearfix chat-list"><div class="conversation-text"><div class="ctext-wrap"><i>'+user.name+'</i><p>'+ message.message + '</p></div></div></li>';
       $(".chat").animate({ scrollTop: $(".chat")[0].scrollHeight}, 1000);
       } 
       var new_messsge = $('#chat-message').append(message);
    });
}).call(this);