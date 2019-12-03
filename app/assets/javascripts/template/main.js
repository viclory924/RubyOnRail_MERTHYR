// Some general UI pack related JS

$(function () {
    // Custom selects
    $("select").dropkick();
});
function equalHeights(el){
	var window_width = $(window).width();
	if(window_width >= 1200){
		var hh = 0;
		el.removeAttr('style');
		el.each(function(){
			var curH = $(this).height();
			if( curH > hh) hh = curH;
		});	
		el.css({height : hh});
	}else if(window_width > 640){
		el.removeAttr('style');		
		var h_1 = el.eq(0).height();
		var h_2 = el.eq(1).height();
		var h_3 = el.eq(2).height();
		var h_4 = el.eq(3).height();
		if(h_1 >= h_2){
			el.eq(0).css({height : h_1});
			el.eq(1).css({height : h_1});
		}else{
			el.eq(0).css({height : h_2});
			el.eq(1).css({height : h_2});
		}
		if(h_3 >= h_4){
			el.eq(2).css({height : h_3});
			el.eq(3).css({height : h_3});
		}else{
			el.eq(2).css({height : h_4});
			el.eq(3).css({height : h_4});
		}
	}else{
		el.removeAttr('style');
	}
}
$(document).ready(function() {
		equalHeights($('.equalHeights')); // make all .border the same height
		$(window).resize(function(){ equalHeights($('.equalHeights'));});
    // Todo list
    $(".todo li").click(function() {
        $(this).toggleClass("todo-done");
    });

    // Init tooltips
    $("[data-toggle=tooltip]").tooltip("show");

    // Init tags input
    $("#tagsinput").tagsInput();

    // Init jQuery UI slider
    $("#slider").slider({
        min: 1,
        max: 5,
        value: 2,
        orientation: "horizontal",
        range: "min",
    });

    // JS input/textarea placeholder
    $("input, textarea").placeholder();

    // Make pagination demo work
    $(".pagination a").click(function() {
        if (!$(this).parent().hasClass("previous") && !$(this).parent().hasClass("next")) {
            $(this).parent().siblings("li").removeClass("active");
            $(this).parent().addClass("active");
        }
    });

    $(".btn-group a").click(function() {
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
    });

    // Disable link click not scroll top
    $("a[href='#']").click(function() {
        return false
    });

});

