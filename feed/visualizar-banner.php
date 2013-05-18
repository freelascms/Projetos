<?php require_once('inc/header.php'); ?>
	
	<section id="content" class="content">
	<?php require_once('inc/sidebar.php'); ?>	
		<section class="main">
			<section class="top-header">
				<h2>Banner Topo Index Três (nome do Banner)</h2>
				<a class="new-add" href="#" title="Adicionar Novo Banner">Adicionar Novo</a>
				<form class="search">
					<h3>Buscar Banner</h3>
					<label>
						<input class="clear-text" value="Digite sua pesquisa">
						<button class="send-search">Ok</button>
					</label>
				</form>
			</section>	
			<section class="add-banner">
				<h4>Preencha abaixo os campos do novo banner</h4>
				<form>
					<label>
						<span>Nome do Banner</span>
						<input class="clear-text" type="text" value="Nome do Banner">
					</label>
					<label>
						<span>Formato</span>
						<select>
							<option value="opção 01">Opção 01</option>
							<option value="opção 02">Opção 02</option>
							<option value="opção 03">Opção 03</option>
						</select>	
					</label>
					<label class="tag-img">
						<span>Imagens</span>
						<input class="insert-img" type="file">
						<a class="more-img" href="#" title="Adicionar Mais Imagens">*(Adicionar Mais Imagens)</a>
					</label>
					<label class="right">
						<button class="btn-concluid">Atualizar</button>
					</label> 
				</form>
				<section class="edit-info">
					<h4>Lista de Imagens deste Banner (2)</h4>
					<form class="list-info">
						<div class="info-img">
							<figure>
								<img src="http://placehold.it/1010x350" alt="imagem do banner">
							</figure>
							<label>
								<span>Legenda da Imagem</span>
								<input class="clear-text" type="text" value="Legenda da Imagem">
							</label>
							<label>
								<span>Descrição da Imagem</span>
								<textarea class="clear-text">Descrição da Imagem</textarea>
							</label>
						</div>	
						<div class="info-img">
							<figure>
								<img src="http://placehold.it/1010x350" alt="imagem do banner">
							</figure>
							<label>
								<span>Legenda da Imagem</span>
								<input class="clear-text" type="text" value="Legenda da Imagem">
							</label>
							<label>
								<span>Descrição da Imagem</span>
								<textarea class="clear-text">Descrição da Imagem</textarea>
							</label>
						</div>
						<label class="right">
							<button class="btn-concluid">Atualizar</button>
						</label> 
					</form>
				</section>
			</section>

		</section>	
	</section><!-- #content -->
<?php require_once('inc/footer.php'); ?>			