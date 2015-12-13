<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/script.js"></script>
<title>Cadastro de fornecedores</title>
</head>
<body>
	<div id="conteudo">
		<h1>Cadastro de Fornecedores</h1>
	  <form name="cadastrarFornecedor" method="post" action="index.html">
	   <div>
	     <label for="razaoSocial">Razão Social:</label><br>
	     <input type="text" name="razaoSocial"
	            id="razaoSocial" tabindex="1" autofocus="" placeholder="Informe o nome da Razão Social" size=46 />
	   </div>
	   <div id="validarRazaoSocial"></div>
	   <br>
	
        <div>
        <label for="nomeFantasia">Nome Fantasia</label><br>
        <input type="text" name="nomeFantasia" id="nomeFantasia" tabindex="2"
             autofocus="" placeholder="Informe o Nome Fantasia do novo fornecedor" size="40"
        />
        </div>
        <div id="validarNomeFantasia"></div>
        <br>
          
	   <div>
	     <label for="endereco">Endereço:
	     </label><br>
	     <input type="text" name="endereco" id="endereco" tabindex="3"
                autofocus="" placeholder="Informe o endereço do fornecedor" size=80 />
	   </div>
	   <div id="validarEndereco"></div>
	   <br>
	
	   <div>
	     <label for="telefonePrincipal">Telefone Principal:
	     </label><br>
	     <input type="text" name="telefonePrincipal"
	            id="telefonePrincipal" tabindex="4" autofocus="" placeholder="Informe o telefone principal"  size=30 />
	   </div>
	   <div id="validarTelefonePrincipal"></div>
	   <br>
	
	   <div>
	     <label for="telefoneAlternativo">Telefone Alternativo:
	     </label><br>
	     <input type="text" name="telefoneAlternativo"
	            id="telefoneAlternativo" tabindex="5" autofocus="" placeholder="Informe um telefone alternativo" size=30 />
	   </div>
	   <div id="validarTelefoneAlternativo"></div>
	   <br>
	
	   <div>
	     <label for="eMail">E-mail do fornecedor:</label><br>
	     <input type="text" name="eMail" id="eMail" tabindex="6" autofocus="" placeholder="Informe seu e-mail" size=46 />
	   </div>
	   <div id="validarEMail"></div>
	   <br>

	   <div>
	     <label for="siteFornecedor">Site do fornecedor:</label><br>
	     <input type="text" name="siteFornecedor" id="siteFornecedor" tabindex="7" autofocus="" placeholder="Informe o site do novo fornecedor" size=46 />
	   </div>
	   <div id="validarSite"></div>
	   <br>

	   <div>
	     <input type="hidden" name="acao" value="env-cont">
	     <div id="Cadastrar">
	         <input type="button" name="conf" value="Salvar">
	       <input type="button" value="Voltar" onclick="window.history.back()">
	     </div>
	   </div>
	   <br>
	 </form>
	</div><!-- /content -->
</body>
</html>