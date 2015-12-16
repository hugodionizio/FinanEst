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

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Contato</h1>
			</div>
			<h:form>
				<h:panelGrid id="panel" columns="6" border="0" cellpadding="10"
					cellspacing="1">
					<h:outputLabel value="Nome Completo" for="nomeCompleto"
						onmouseover="exibirmensagem('Informe o nome completo')"
						onmouseout="exibirmensagem('')" />

					<h:inputText tabindex="1" id="nomeCompleto"
						value="#{contatoBean.nome}" size="20" label="Nome Completo"
						required="true">
						<f:validateLength minimum="1" maximum="20" />
					</h:inputText>
					<h:message for="nomeCompleto" style="color:red" />

					<h:outputLabel value="E-mail" for="eMail"
						onmouseover="exibirmensagem('Informe o seu e-mail')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="2" id="eMail" value="#{contatoBean.email}"
						size="30" label="E-mail" required="true">
						<f:validateLength minimum="1" maximum="30" />
					</h:inputText>
					<h:message for="eMail" style="color:red" />

					<h:outputLabel value="Instituição" for="intituicao"
						onmouseover="exibirmensagem('Informe a instituição')"
						onmouseout="exibirmensagem('')" />
					<h:inputText tabindex="3" id="intituicao"
						value="#{contatoBean.instituicao}" size="30"
						label="Nome da instituição" required="true">
						<f:validateLength minimum="1" maximum="30" />
					</h:inputText>
					<h:message for="intituicao" style="color:red" />

					<h:outputLabel value="Assunto" for="assunto"
						onmouseover="exibirmensagem('Informe o assunto')"
						onmouseout="exibirmensagem('')" />
					<h:selectOneMenu tabindex="4" id="assunto"
						value="#{contatoBean.assunto}" label="Assunto da mensagem"
						required="true">
						<f:selectItem itemValue="" itemLabel="Escolha um assunto" />
						<f:selectItem itemValue="Elogios" itemLabel="Elogios" />
						<f:selectItem itemValue="Sugestões" itemLabel="Sugestões" />
						<f:selectItem itemValue="Reclamações" itemLabel="Reclamações" />
						<f:selectItem itemValue="Outro" itemLabel="Outro" />
					</h:selectOneMenu>
					<h:message for="assunto" style="color:red" />

					<h:outputLabel value="Mensagem" for="mensagem"
						onmouseover="exibirmensagem('Informe a mensagem')"
						onmouseout="exibirmensagem('')" />
					<h:inputTextarea tabindex="5" id="mensagem" rows="3" cols="50"
						value="#{contatoBean.mensagem}" label="Texto da mensagem"
						required="true">
						<f:validateLength minimum="1" maximum="100" />
					</h:inputTextarea>
					<h:message for="mensagem" style="color:red" />
				</h:panelGrid>
				<h:commandButton id="submit" value="Enviar"
					action="#{ContatoDAO.salvar(contatoBean)}" />
				<div id="msg" class="dcontexto"></div>

			</h:form>
		</div>
	</f:view>
</body>
</html>