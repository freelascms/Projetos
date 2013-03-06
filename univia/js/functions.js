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

$('.gallery').cycle({ 
    fx:     'fade', 
    speed:  'slow', 
    timeout: 0, 
    next:   '.next', 
    prev:   '.prev' 
});

$(function(){
	$('select.form-select').selectmenu({style:'dropdown'});
});

$(document).ready(function(){
	$('a[rel=external]').attr('target','_blank');
	$('.clear-text').clearDefault();
});