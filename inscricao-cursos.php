<?php include 'header.php'; ?>	
			<section id="content">
				<section class="subscribe-courses">
					<h2>Cursos</h2>
					<h3>Inscrições</h3>
					<p>Preencha ese formulário para fazer sua pré-incrição.</p>
					<form action="">
						<label>
							<span>Nome:</span>
							<input class="clear-text" value="Digite Seu Nome">
						</label>
						<label>
							<span>E-mail:</span>
							<input class="clear-text error" value="Digite Seu E-mail">
						</label>
						<label>
							<span>Telefone:</span>
							<input class="clear-text error" value="Digite Seu Telefone">
						</label>
						<label>
							<span>Endereço:</span>
							<input class="clear-text" value="Digite Seu Endereço">
						</label>
						<label>
							<span>CEP:</span>
							<input class="clear-text" value="Digite Seu CEP">
						</label>
						<label>
							<span>CPF:</span>
							<input class="clear-text" value="Digite Seu CPF">
						</label>
						<label>
							<span>CPF:</span>
							<select name="cursos">
								<option value="Curso01">Curso01</option>
								<option value="Curso02">Curso02</option>
								<option value="Curso03">Curso03</option>
								<option value="Curso04">Curso04</option>
							</select>							
						</label>
						<label class="right">
							<button class="send-form">Enviar</button>
						</label>
					</form>
					<div class="msg-error">
						<p>Por Favor, Verifique os Campos Errados.</p>
					</div>
					<div class="msg-sucess">
						<p>Seu Email foi enviado com Sucesso!! Aguarde nosso contato.</p>
					</div>
				</section>
				<section class="sidebar">
					<h3>Nossos Cursos</h3>	
					<ul class="info-courses">
						<li><a href="#" title="curso 1">Curso 01</a></li>
						<li><a href="#" title="curso 2">Curso 02</a></li>
						<li><a href="#" title="curso 3">Curso 03</a></li>
					</ul>
					<h3>Artigos</h3>
					<ul class="articles">
						<li><a href="#" title="Artigos de número na ordem crescente 1">Artigos de número na ordem crescente 01</a></li>
						<li><a href="#" title="Artigos de número na ordem crescente 2">Artigos de número na ordem crescente 02</a></li>
						<li><a href="#" title="Artigos de número na ordem crescente 3">Artigos de número na ordem crescente 03</a></li>
						<li><a href="#" title="Artigos de número na ordem crescente 4">Artigos de número na ordem crescente 04</a></li>
					</ul>
					<a class="more-articles" href="#" title="Clique e Leia Todos os Artigos">Leia Todos</a>
				</section>
				<!-- #content está fechando no footer -->
<?php include 'footer.php'; ?>					