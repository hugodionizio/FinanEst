<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de insumos (produtos e/ou serviços)</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Cadastro de Insumos (Produtos/Serviços)</h1>
				<form name="cadastroInsumo" method="post" action="Menu.html">

					Insumo <input type="text" name=""><br>
					<br> Preço <input type="text" name=""><br>
					<br> <input type="button" name="cadastrar" value="Cancelar">

					<input type="button" name="cadastrar" value="Cadastrar">
			</div>
			<!-- /content -->
		</div>
	</f:view>

</body>
</html>
