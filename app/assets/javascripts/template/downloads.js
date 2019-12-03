$(document).ready(function(){
 $(".download-dropdown li a").click(function(){
    $(".btn:first-child").text($(this).text());
    $(".btn:first-child").val($(this).text());
    $('#downloadlist a').hide()
    var klass = $(this).prop('class');
    $('.download_links .' + klass).show();
    $(this).closest(".download-dropdown").prev().dropdown("toggle");
   });
});
