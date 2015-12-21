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
	<% String user;
	 %>
	<f:view>
		<jsp:directive.include file="MenuVisitante.jsp" />

		<div id="home" class="container">
			<div id="conteudo">

				<div align="center">
					<div class="jumbotron">

						<h1>FinanEst</h1>
						<p>Sistema Financeiro e de Estoque</p>
					</div>

					<h:form>
						<h:panelGrid id="panel" columns="3" border="0" cellpadding="10"
							cellspacing="1">
							<h:outputLabel value="Usuário" for="usuario"
								onmouseover="exibirmensagem('Informe o e-mail do usuário')"
								onmouseout="exibirmensagem('')" />

							<h:inputText tabindex="1" id="usuario" value="#{usuBean.email}"
								size="20" label="Login do usuário" required="true">
								<f:validateLength minimum="1" maximum="80" />
							</h:inputText>
							<h:message for="usuario" style="color:red" />

							<h:outputLabel value="Senha" for="senha"
								onmouseover="exibirmensagem('Informe a senha do usuário')"
								onmouseout="exibirmensagem('')" />
							<h:inputSecret tabindex="2" id="senha" value="#{usuBean.senha}"
								size="20" label="Senha do usuário" required="true"
								redisplay="true">
								<f:validateLength minimum="6" maximum="50" />
							</h:inputSecret>
							<h:message for="senha" style="color:red" />
						</h:panelGrid>

						<h:commandButton id="loginCliente" value="Login"
							action="#{ClienteDAO.verificarLogin(usuBean.email, usuBean.senha)}" />

						<input class='recuperarSenha' type="button"
							onclick="recuperarSenha()" value='Recuperar Senha' />

						<h:commandButton id="loginAdministrador" value="Administrador"
							action="#{UsuarioDAO.verificarLogin(usuBean.email, usuBean.senha)}" />
						<br>
						<br>
						<div class="submeterEMail">
							<label for="eMail">e-mail:</label><br> <input type="text"
								name="eMail" id="eMail" tabindex="3" autofocus=""
								placeholder="Informe seu e-mail de cadastro" />
							<div id="validarEMail"></div>
							<input type="submit" name="sub" value="Enviar por e-mail" /> <br>
							<br> <label for="codSMS">Código enviado pela
								operadora:</label><br> <input type="text" name="codSMS" id="codSMS"
								tabindex="4" autofocus=""
								placeholder="Informe o código enviado pela operadora" />
							<div id="validarCódigo"></div>
							<input type="submit" name="sub" value="Confirmar código" /> <input
								type="submit" name="sub" value="Novo código" /> <br> <br>
						</div>

						<input type="hidden" name="acao" value="env-cont">
						<div id="msg" class="dcontexto"></div>
					</h:form>
				</div>
			</div>
			<!-- /content -->
		</div>
	</f:view>
</body>
</html>