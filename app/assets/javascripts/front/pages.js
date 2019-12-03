$(document).ready(function(){
 $("#download-dropdown li a").click(function(){
    $("#select-category-btn").text($(this).text());
    $("#select-category-btn").val($(this).text());
    $('#downloadlist a').hide()
    var klass = $(this).prop('class');
    $('.download_links .' + klass).show();
    $('#download-dropdown').foundation('toggle');
   });
});
