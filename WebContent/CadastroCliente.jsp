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
<title>Contato</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuVisitante.jsp" />

		</nav>

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Cadastro de Cliente</h1>
			</div>
			<h:form>
				<h:panelGrid id="panel" columns="6" border="0" cellpadding="10"
					cellspacing="1">
					<h:outputLabel value="Nome Completo" for="nomeCompleto"
						onmouseover="exibirmensagem('Informe o nome completo')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="1" id="nomeCompleto"
						value="#{clienteBean.nome}" size="30" label="Nome Completo"
						required="true">
						<f:validateLength minimum="1" maximum="20" />
					</h:inputText>
					<h:message for="nomeCompleto" style="color:red" />

					<h:outputLabel value="CPF" for="cpf"
						onmouseover="exibirmensagem('Informe o seu CPF')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="2" id="cpf" value="#{clienteBean.cpf}"
						size="30" label="CPF do cliente" required="true">
						<f:validateLength minimum="11" maximum="14" />
					</h:inputText>
					<h:message for="cpf" style="color:red" />

					<h:outputLabel value="Senha" for="senha"
						onmouseover="exibirmensagem('Informe uma senha')"
						onmouseout="exibirmensagem('')" />
					<h:inputSecret tabindex="3" id="senha" value="#{clienteBean.senha}"
						size="30" label="Senha do cliente" required="true">
						<f:validateLength minimum="6" maximum="20" />
					</h:inputSecret>
					<h:message for="senha" style="color:red" />

					<h:outputLabel value="Confirmar senha" for="confsenha"
						onmouseover="exibirmensagem('Confirmar uma senha')"
						onmouseout="exibirmensagem('')" />
					<h:inputSecret tabindex="4" id="confsenha" value="confsenha"
						size="30" label="Confirmação de senha" required="true"
						onblur="valSenha()">
						<f:validateLength minimum="6" maximum="20" />
					</h:inputSecret>
					<h:message id="msgsenha" for="confsenha" style="color:red" />


					<h:outputLabel value="Telefone" for="foneprn"
						onmouseover="exibirmensagem('Informe o telefone principal')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="5" id="foneprn"
						value="#{clienteBean.foneprn}" size="30"
						label="Telefone principal do cliente" required="true">
						<f:validateLength minimum="1" maximum="20" />
					</h:inputText>
					<h:message for="foneprn" style="color:red" />

					<h:outputLabel value="Telefone alternativo" for="fonesec"
						onmouseover="exibirmensagem('Informe o telefone secundário')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="6" id="fonesec"
						value="#{clienteBean.fonesec}" size="30">
					</h:inputText>
					<div></div>

					<h:outputLabel value="Endereço" for="endereco"
						onmouseover="exibirmensagem('Informe o endereço')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="7" id="endereco"
						value="#{clienteBean.endereco}" size="30"
						label="Endereço do cliente" required="true">
						<f:validateLength minimum="1" maximum="20" />
					</h:inputText>
					<h:message for="endereco" style="color:red" />

					<h:outputLabel value="E-mail" for="eMail"
						onmouseover="exibirmensagem('Informe o seu e-mail')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="8" id="eMail" value="#{clienteBean.email}"
						size="30" label="E-mail" required="true">
						<f:validateLength minimum="1" maximum="30" />
					</h:inputText>
					<h:message for="eMail" style="color:red" />

					<h:message for="endereco" style="color:red" />
				</h:panelGrid>
				<h:commandButton id="submit" value="Enviar"
					action="#{ClienteDAO.salvar(clienteBean)}" />
				<div id="msg" class="dcontexto"></div>

			</h:form>
		</div>
	</f:view>
</body>
</html>