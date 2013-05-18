/* Clear forms */
(function($){
	$.fn.clearDefault = function(){
		return this.each(function(){
			var default_value = $(this).val();
			$(this).focus(function(){
				if ($(this).val() === default_value) $(this).val("");
			});
			$(this).blur(function(){
				if ($(this).val() === "") $(this).val(default_value);
			});
		});
	};
})(jQuery);

$(document).ready(function(){
	$('a[rel=external]').attr('target','_blank');
	$('.clear-text').clearDefault();

// Ir para o Topo - página de notícias
$("a[href='#top']").click(function() {
  $("html, body").animate({ scrollTop: 0 }, 1500);
	return false;
});

	

// Animação troca de cores
$('.send-news, .next-course, .prev-course, .more-articles, .pagination ul li a, .send-form, .read-more-notices').hover(function(){
	$(this).stop().animate({'backgroundColor':'#43b776','color':'#FFF'}, 150);
	}, function(){
	$(this).stop().animate({'backgroundColor':'#FFF','color':'#107f41'}, 150);
});
// Animação Box Nossos Cursos
$('ul.info-courses li').hover(function(){
	$(this).stop().animate({'backgroundColor':'#409967','color':'#FFF'}, 150);
	}, function(){
	$(this).stop().animate({'backgroundColor':'#88bfa0','color':'#107f41'}, 150);
});
// Animação link da noticia/artigo
$('.list-notices ul li, .list-articles ul li').hover(function(){
	$(this).find('p').stop().animate({'color':'#409967'}, 150);
	}, function(){
	$(this).find('p').stop().animate({'color':'#107f41'}, 150);
});
	$('.list-courses').cycle({ 
	    fx:     'scrollHorz', 
	    speed:  'slow', 
	    timeout: 0, 
	    next:   '.next-course', 
	    prev:   '.prev-course',
	    easing:  'easeInOutBack'
	});

});