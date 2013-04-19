<?php require_once('inc/header.php'); ?>
	
	<section id="content" class="content">
	<?php require_once('inc/sidebar.php'); ?>	
		<section class="main">
			<section class="top-header">
				<h2>Banners / <em>Formatos</em></h2>
				<a class="new-add" href="#" title="Adicionar Novo Banner">Adicionar Novo</a>
				<form class="search">
					<h3>Buscar Banner</h3>
					<label>
						<input class="clear-text" value="Digite sua pesquisa">
						<button class="send-search">Ok</button>
					</label>
				</form>
			</section>	
			<section class="add-new">
				<h4>Adicionar Novo Formato</h4>
				<form>
					<label>
						<span>Nome do Formato:</span>
						<input class="clear-text" value="Nome do Formato" >
					</label>
					<label>
						<span>Largura:</span>
						<input class="clear-text large" value="Largura" >
					</label>
					<label>
						<span>Altura:</span>
						<input class="clear-text large" value="Altura" >
					</label>
					<label>
						<button class="add-new-banner">Adicionar</button>
					</label>
				</form>
				<h4>Formatos já Existentes</h4>
			</section>
			<section class="list-banner">
				<ul>
					<li>
						<a href="#">» Mussum ipsum cacilds, vidis litro abertis.</a>
						<div class="show-elements">
							<a class="edit" href="#" title="Editar">Editar |</a>
							<a class="delete" href="#" title="Excluir"> Excluir</a>
						</div>		
						<div class="info-banner">
							<p>Banner Principal</p>
							<em>960x320</em>
						</div>
					</li>
					<li>
						<a href="#">» Mussum ipsum cacilds, vidis litro abertis.</a>
						<div class="show-elements">
							<a class="edit" href="#" title="Editar">Editar |</a>
							<a class="delete" href="#" title="Excluir"> Excluir</a>
						</div>		
						<div class="info-banner">
							<p>Banner Principal</p>
							<em>960x320</em>
						</div>
					</li>
				</ul>
			</section>
		</section>	
	</section><!-- #content -->
<?php require_once('inc/footer.php'); ?>			