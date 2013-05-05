	<? $this->load->view('template/inc/header-login'); ?>
	<nav class="screen-reader">
		<a href="#content" accesskey="c">Alt + Shift + C ir para o conteúdo</a>
	</nav><!-- .screen-reader -->
	<div id="wrap">
		<div id="container">
			<section id="content" class="login">
				<section class="box-login">
					<h1>The Manager - Web Content Manager</h1>
					<div class="box-form">
						<form>
							<label>
								<span>Nome de Usuário:</span>
								<input type="text">
							</label>
							<label>
								<span>Senha:</span>
								<input type="password">
							</label>
							<a href="#" title="Esqueceu a senha?" class="forgot-password">Esqueceu a senha?</a>
							<input class="btn" type="button" value="Acessar">
						</form>
					</div>	
				</section>	
			</section><!-- #content -->
		</div><!-- #container -->
	</div><!-- #wrap -->
	<? $this->load->view('template/inc/footer-login'); ?>
	