function paginatePost(page){
  $.get('/api/posts?page='+page+'&pagination=true', function( data ) {
    loadTPLpaginate(data, "news_paginate", "puts-posts");
    var paginatepluss = page + 1;
    if (paginatepluss > data.total_pages){
      $('#paginate-posts').addClass('btn-purple');
      $('#paginate-posts').removeClass('btn-defaul');
      $('#paginate-posts').attr('onclick', '');
      $('#paginate-posts').html('No hay mas páginas por cargar');
    }else{
      var advance_paginate = 'paginatePost('+paginatepluss+')';
      $('#paginate-posts').attr('onclick',advance_paginate);
    }
  });
}


