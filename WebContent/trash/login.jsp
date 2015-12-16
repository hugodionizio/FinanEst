<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tela de Login</title>
</head>
<body>
	<f:view>
		<h:form>
			<h:outputLabel value="Usuário (email): " id="usuario" />
			<h:inputText id="usu" value="#{usuBean.email}" />
			<br>

			<h:outputLabel value="Senha:" />
			<h:inputText id="senha" value="#{usuBean.senha}" />
			<br>
			<h:commandButton value="Enviar"
				action="#{UsuarioDAO.verificarLogin(usuBean.email, usuBean.senha)}" />
		</h:form>
	</f:view>
</body>
</html>