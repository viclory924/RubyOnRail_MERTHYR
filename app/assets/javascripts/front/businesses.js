var loadBusinessesForPagination = function(page, url){
  $('#infinite-loader').show('fast');
  $.ajax({
    url: url,
    type: 'GET',
    data: "page="+ page ,
    dataType: 'script',
    success: function(){
      $('#infinite-loader').hide();
    }
  });
  return false;
}
