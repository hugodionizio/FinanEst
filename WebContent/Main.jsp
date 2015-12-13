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
		<ul id="menu" class="nav navbar-nav">
			<li><a href="">Sair</a></li>
			<li><a href="DadosEmpresa.jsp">Dados da Empresa</a></li>
			<li><a href="CadastroFuncionario.jsp">Funcionários</a></li>
			<li><a href="CadastroFornecedor.jsp">Fornecedores</a></li>
			<li><a href="CadastroInsumo.jsp">Estoque</a></li>
			<li><a href="ReporEstoque.jsp">Reposição</a></li>
			<li><a href="LivroCaixa.jsp">Livro Caixa</a></li>
			<li><a href="ProjetarCaixa.jsp">Projeção de Caixa</a></li>
			<li><a href="CadastroCliente.jsp">Clientes</a></li>
			<li><a href="VendaInsumo.jsp">Comprar</a></li>
			<li><a href="Contatos.jsp">Contato</a></li>
		</ul>
		<!-- /menu -->
	</div>
	</nav>

	<div id="home" class="container">
		<div id="conteudo">

			<div align="center">
				<div class="jumbotron">

					<h1>FinanEst</h1>
					<p>Sistema Financeiro e de Estoque</p>
				</div>
				<f:view>
				</f:view>
			</div>
		</div>
		<!-- /content -->
	</div>
</body>
</html>