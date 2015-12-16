<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Venda de produtos ou Agendamento de Serviços</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuCliente.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Venda de produtos ou Agendamento de Serviços</h1>
				<select>
					<optgroup label="Produtos">
						<option>Produto 1</option>
						<option>Produto 2</option>
						<option>Produto 3</option>
						<option>Produto 4</option>
					</optgroup>
					<optgroup label="Serviços">
						<option>Serviço 1</option>
						<option>Serviço 2</option>
						<option>Serviço 3</option>
						<option>Serviço 4</option>
					</optgroup>
				</select><br>
				<br> Quantidade <input type="text" name=""><br>
				<br> Preço <input type="text" name=""><br>
				<br> <input type="button" name="cadastrar" value="Comprar"><br>
				<br> <input type="button" name="cadastrar"
					value="Tirar do carrinho"><br>
				<br> <input type="button" name="cadastrar"
					value="Efetuar compras"><br>
				<br>
			</div>
			<!-- /content -->
		</div>
	</f:view>

</body>
</html>
