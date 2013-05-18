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

$('.sidebar nav ul li').hover(function(){
	$(this).stop().animate({'backgroundColor':'#d4501b'}, 300);
	}, function(){
	$(this).stop().animate({'backgroundColor':'#dddddd'}, 300);
});
$('.sidebar nav ul li').hover(function(){
	$(this).children('.sidebar nav ul li a').stop().animate({'color':'#FFF'}, 120);
	}, function(){
	$(this).children('.sidebar nav ul li a').stop().animate({'color':'#6c6c5e'}, 120);
});
$('.sidebar nav ul li .submenu li').hover(function(){
	$(this).stop().animate({'backgroundColor':'#d1d1d1'}, 300);
	}, function(){
	$(this).stop().animate({'backgroundColor':'#dddddd'}, 300);
});
// hover das listas
$('.main .list-box ul li, .new-add, .list-gallery ul li, .list-banner ul li, .send-search, .add-new-banner, .btn-add-category, .edit-new-notice a, .back-list a').hover(function(){
	$(this).stop().animate({'backgroundColor':'#d1d1d1'}, 300);
	}, function(){
	$(this).stop().animate({'backgroundColor':'#ededed'}, 300);
});

$(function() {
    $( ".list-sortable" ).sortable();
    $( ".list-sortable" ).disableSelection();
  });


$(document).ready(function(){
	$('a[rel=external]').attr('target','_blank');
	$('.clear-text').clearDefault();
});