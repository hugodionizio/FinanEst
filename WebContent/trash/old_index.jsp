<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/finan%C3%A7as.jpg"
	type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.float.js"></script>
<script type="text/javascript" src="js/cycle.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/finanest.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<title>FinanEst - Sistema Financeiro e de Estoque</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">FinanEst</a>
		</div>
		<div id="login">
			<ul id="menu" class="nav navbar-nav">
				<li><a href="">Home</a></li>
				<li><a href="DadosEmpresa.html">Dados da Empresa</a></li>
				<li><a href="CadastroFuncionario.html">Funcionários</a></li>
				<li><a href="CadastroFornecedor.html">Fornecedores</a></li>
				<li><a href="CadastroInsumo.html">Estoque</a></li>
				<li><a href="ReporEstoque.html">Reposição</a></li>
				<li><a href="LivroCaixa.html">Livro Caixa</a></li>
				<li><a href="ProjetarCaixa.html">Projeção de Caixa</a></li>
				<li><a href="CadastroCliente.html">Clientes</a></li>
				<li><a href="VendaInsumo.html">Comprar</a></li>
				<li><a href="Contato.html">Contato</a></li>
			</ul>
			<!-- /menu -->
		</div>
		<div id="home">
			<ul id="menu" class="nav navbar-nav">
				<li><a href="" onclick="mostrarMenus()">Home</a></li>
				<li><a href="Contato.html">Contato</a></li>
			</ul>
			<!-- /menu -->
		</div>
	</div>
	</nav>

	<div class="container">
		<div id="conteudo">

			<div align="center">
				<div class="jumbotron">
					<form name="login" method="post" action="index.html">
						<h1>FinanEst</h1>
						<p>Sistema Financeiro e de Estoque</p>
				</div>
				<div>
					<label for="usuario">Usuário (e-mail):</label><br> <input
						type="text" name="usuario" id="usuario" tabindex="1" autofocus=""
						placeholder="Informe seu e-mail"
						onkeypress="return valCPF(event, this);
                 return false;"
						onkeyUp="if (this.value.length == 14)
                   this.form.senha.focus()" />

					<h:outputLabel value="Usuário: "></h:outputLabel>
					<h:inputText id="usu" value="#{usuBean.email}"></h:inputText>
					<br>

				</div>
				<div id="validarCPF"></div>
				<br>

				<div>
					<label for="senha">Senha:</label><br> <input type="password"
						name="senha" id="senha" tabindex="1" autofocus=""
						placeholder="Informe sua senha" maxlength="50" />

					<h:outputLabel value="Senha: "></h:outputLabel>
					<h:inputText id="senha" value="#{usuBean.senha}"></h:inputText>
					<br>

					<h:inputSecret id="password" size="20" label="Senha"
						required="true" redisplay="true">
						<f:validateLength minimum="5" maximum="10" />
					</h:inputSecret>
					<h:message for="password" style="color:red" />
				</div>
				<div id="validarSenha"></div>
				<br> <input type="submit" name="sub" value="Cadastrar-se" /> <input
					type="submit" name="sub" value="Entrar" />
				<h:commandButton value="Enviar"
					action="#{UsuarioDAO.verificarLogin(usuBean.email, usuBean.senha)}"></h:commandButton>
				<input class='recuperarSenha' type="button"
					onclick="recuperarSenha()" value='Recuperar Senha' /><br> <br>
				<div class="submeterEMail">
					<label for="eMail">e-mail:</label><br> <input type="text"
						name="eMail" id="eMail" tabindex="1" autofocus=""
						placeholder="Informe seu e-mail de cadastro" />
					<div id="validarEMail"></div>
					<input type="submit" name="sub" value="Enviar por e-mail" /> <br>
					<br> <label for="codSMS">Código enviado pela
						operadora:</label><br> <input type="text" name="codSMS" id="codSMS"
						tabindex="1" autofocus=""
						placeholder="Informe o código enviado pela operadora" />
					<div id="validarCódigo"></div>
					<input type="submit" name="sub" value="Confirmar código" /> <input
						type="submit" name="sub" value="Novo código" /> <br> <br>
				</div>

				<input type="hidden" name="acao" value="env-cont">

				</form>
			</div>
		</div>
		<!-- /content -->
</body>
</html>