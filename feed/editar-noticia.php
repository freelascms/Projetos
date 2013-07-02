<?php require_once('inc/header.php'); ?>
	<section id="content" class="content">
	<?php require_once('inc/sidebar.php'); ?>	
		<section class="main">
			<section class="top-header">
				<h2>Editar Notícia</h2>
				<a class="new-add" href="#" title="Adicionar Nova Notícia">Adicionar Nova</a>
				<form class="search">
					<h3>Buscar Notícia</h3>
					<label>
						<input class="clear-text" value="Digite sua pesquisa">
						<button class="send-search">Ok</button>
					</label>
				</form>
			</section>	
			<section class="page-edit">
				<form>
					<section class="page-edit-content">
						<label>
							<span>Título da Notícia</span>
							<input class="clear-text">
						</label>
						<label>
							<span>Conteúdo da Notícia</span>
							<textarea name="" class="clear-text">Inserir Conteúdo </textarea>
						</label>
						<label>
							<span>Resumo ou Chamada</span>
							<textarea name="" class="clear-text">Inserir Resumo </textarea>
						</label>
						<label>
							<span>Imagem da Notícia</span>
							<input type="file">
						</label>
					</section>	
					<section class="sidebar-edit">
						<label>
							<span>Status</span>
							<select name="" id="">
								<option value="Publicado">Publicado</option>
								<option value="Não Publicado">Não Publicado</option>
							</select>
						</label>
						<label>
							<span>Favorito?</span>
							<select name="" id="">
								<option value="Está Notícia é Favorita">Está Notícia é Favorita</option>
								<option value="Está Notícia não é Favorita">Está Notícia não é Favorita</option>
							</select>
						</label>
						<span class="title-category">Categorias</span>
						<div class="category">
							<label>Categoria 01<input name="categoria" type="checkbox"></label>
							<label>Categoria 02<input name="categoria" type="checkbox"></label>
							<label>Categoria 03<input name="categoria" type="checkbox"></label>
							<label>Categoria 04<input name="categoria" type="checkbox"></label>
							<label>Categoria 05<input name="categoria" type="checkbox"></label>
						</div>
					</section>
					<button class="btn-complete" href="#" title="Concluir">Concluir</button>
				</form>
			</section>
		</section>	
	</section><!-- #content -->
<?php require_once('inc/footer.php'); ?>			