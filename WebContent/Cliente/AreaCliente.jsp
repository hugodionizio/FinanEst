<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FinanEst - Sistema Financeiro e de Estoque</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuCliente.jsp" />

		<div id="home" class="container">
			<div id="conteudo">

				<div align="center">
					<div class="jumbotron">

						<h1>FinanEst</h1>
						<p>Sistema Financeiro e de Estoque</p>
						<h:outputText value="Olá, #{ClienteDAO.clienteSession.nome}!" />
												
					</div>
				</div>
			</div>
			<!-- /content -->
		</div>
	</f:view>
</body>
</html>
