$(document).ready(function(){

	//Foundation
	$(document).foundation();

	// Preloader
	setTimeout(function(){
		$('body').addClass('loaded');
	}, 3000);

	// Your code here.

	// Add button to submenu.
	$('.is-accordion-submenu-parent').children('a').append(document.createElement('span'));

	// Detects if menu has been opened adds element styling.
	$('.is-accordion-submenu-parent').children('a').on('click', function (e) {
		e.preventDefault();
		$(this).parent().toggleClass('is-open');
	});

	$('#hero-slider').owlCarousel({
		loop:true,
		autoplay: true,
		autoplayTimeout: 10000,
		margin: 30,
		nav: false,
		navText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>'],
		dots: true,
		items: 1,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:1
			}
		}
	});

	$('.post-vertical-slider').owlCarousel({
		loop:true,
		autoplay: true,
		autoplayTimeout: 10000,
		margin: 30,
		nav: false,
		navText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>'],
		dots: true,
		items: 1,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:1
			}
		}
	});

	$('.image-carousel').owlCarousel({
		loop:true,
		autoplay: true,
		autoplayTimeout: 10000,
		margin: 30,
		nav: false,
		navText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>'],
		dots: false,
		items: 1,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:1
			}
		}
	});

	// Options for masonry.js grid, reinitalizes masonry after images have loaded to avoid overlapping issues.
	/*var $grid = $('.card-grid').masonry({
					columnWidth: '.card-sizer',
					itemSelector: '.card-wrap'
				});

	$grid.imagesLoaded(function(){
		$grid.masonry();
	});

	$(window).on('load', function(){
		$grid.masonry();
	});*/

	$(window).on('load', function(){

		Foundation.reInit('data-equalizer');

	});

});