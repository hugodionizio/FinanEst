<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="../css/estilo.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.float.js"></script>
<script type="text/javascript" src="../js/cycle.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/finanest.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
<script type="text/javascript" src="../js/confirmar.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<h:form>
			<div class="navbar-header">
				<a class="navbar-brand" href="AreaAdmin.jsp">FinanEst</a>
				<ul id="menu" class="nav navbar-nav">
					<li><h:commandLink value="" action="/index.jsp" >
					<h:graphicImage value="../img/sair.png"
									style="width: 25px; height: 25px; " />
					</h:commandLink></a></li>
					<!-- li><h:commandLink value="Dados da Empresa"
							action="DadosEmpresa.jsp" /></a></li>
					<li><h:commandLink value="Funcionários"
							action="CadastroFuncionario.jsp" /></a></li -->
					<li><h:commandLink value="Fornecedores"
							action="CadastroFornecedor.jsp" /></a></li>
					<li><h:commandLink value="Estoque"
							action="GerenciarEstoque.jsp" /></a></li>
					<li><h:commandLink value="Reposição" action="ReporEstoque.jsp" /></a></li>
					<li><h:commandLink value="Livro Caixa" action="LivroCaixa.jsp" /></a></li>
					<li><h:commandLink value="Projeção de Caixa"
							action="ProjetarCaixa.jsp" /></a></li>
					<li><h:commandLink value="Clientes"
							action="GerenciarClientes.jsp" /></a></li>
					<li><h:commandLink value="Contatos" action="Contatos.jsp" /></a></li>
				</ul>
				<!-- /menu -->
			</div>
		</h:form>
	</div>
	</nav>
</body>
</html>
