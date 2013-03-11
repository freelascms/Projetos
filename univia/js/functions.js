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
	
	$("#phone").focus(function(){
		$("#phone").mask("(99) 9999-9999");
	});
	
	$('.send-sucess').hide();
	$('.send-error').hide();

	$('form.form-inscricoes').submit(function(){
		
		var nome = $('#name');
		var email = $('#mail');
		var fone = $('#phone');
		var curso = $('#courses');
		var mensagem = $('#comments');
		
		var error = false;
		
		//alert(curso.val());
		
		if(nome.val() == "Nome" || nome.val() == ""){
			//alert('Campo nome inválido.');
			error = true;
		}
		
		if(!validateEmail(email.val())){
			//alert('Campo e-mail inválido.');
			error = true;
		}
		
		if(fone.val() == ""){
			//alert('Campo nome inválido.');
			error = true;
		}
		
		if(mensagem.val() == "Mensagem" || mensagem.val() == ""){
			//alert('Digite a sua mensagem.');
			error = true;
		}
		
		if (error) {
			$('.send-sucess').hide();
			$('.send-error').show();
		} else {
			$.ajax({
				type: "POST",
				url: "inc/send.php",
				data: $(this).serialize()
			}).done(function(msg){
				//alert(msg);
				if (msg == 1) {
					$('.send-sucess').show();
					$('.send-error').hide();
					$('form.form-inscricoes').get(0).reset();
				} else {
					$('.send-sucess').hide();
					$('.send-error').show();
					//$('form.form-inscricoes').get(0).reset();
				};
			});
		};
		return false;
		
	});
	
});

$(document).ready(function(){
	$('a[rel=external]').attr('target','_blank');
	$('.clear-text').clearDefault();
});

function validateEmail(email) {
	var ret = false;
	var em = new String();
	em = String(email);
	var RegExPattern = /^[\w-]+(\.[\w-]+)*@(([A-Za-z\d][A-Za-z\d-]{0,61}[A-Za-z\d]\.)+[A-Za-z]{2,6}|\[\d{1,3}(\.\d{ 1,3}){3}\])$/; 
	if ( em.match(RegExPattern) ) {
		ret = true;
	}
	return ret;
}