<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/script.js"></script>
<title>Exemplo de mensagem</title>
</head>
<body>
	<f:view>
		<h:form>
			<h:panelGrid id="panel" columns="3" border="0" cellpadding="10"
				cellspacing="1">
				<h:outputLabel value="Usuário" for="usuario"
					onmouseover="exibirmensagem('Informe o e-mail do usuário')"
					onmouseout="exibirmensagem('')">			
				</h:outputLabel>
				<h:inputText tabindex="1" id="usuario" value="#{usuBean.email}"
					size="20" label="Login do usuário" required="true">
					<f:validateLength minimum="1" maximum="80" />
				</h:inputText>
				<h:message for="usuario" style="color:red" />

				<h:outputLabel value="Senha" for="senha"
					onmouseover="exibirmensagem('Informe a senha do usuário')"
					onmouseout="exibirmensagem('')" />
				<h:inputSecret tabindex="2" id="senha" value="#{usuBean.senha}"
					size="20" label="Senha do usuário" required="true" redisplay="true">
					<f:validateLength minimum="6" maximum="50" />
				</h:inputSecret>
				<h:message for="senha" style="color:red" />
				<h:commandButton id="submit" value="Enviar"
					action="#{UsuarioDAO.verificarLogin(usuBean.email, usuBean.senha)}" />
			</h:panelGrid>
			<div id="msg"></div>
		</h:form>
	</f:view>
</body>
</html>