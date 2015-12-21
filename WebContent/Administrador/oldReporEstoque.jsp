<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Operação de estoque</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Operação de estoque</h1>

				<h2>Reposição de Produtos</h2>
				<h:form>							
					<h:panelGrid id="panel" columns="6" border="0" cellpadding="10"
						cellspacing="1">
						<h:outputLabel value="Insumo" for="insumo"
							onmouseover="exibirmensagem('Informe o produto')"
							onmouseout="exibirmensagem('')" />
						<h:selectOneMenu tabindex="1" id="insumo"
							value="#{estoqueBean.idEstoque}" label="Informe o produto"
							required="true">
							<f:selectItem itemValue="" itemLabel="Selecione um item" />
							<f:selectItems value="#{EstoqueDAO.menuLista}" />
						</h:selectOneMenu>
						<h:message for="insumo" style="color:red" />

						<h:outputLabel value="Quantidade" for="qtde"
							onmouseover="exibirmensagem('Informe a quatidade de produtos')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="5" id="qtde" value="#{estoqueBean.qtde}"
							size="30" label="Quantidade de produtos" required="true">
							<f:validateLength minimum="1" maximum="10" />
						</h:inputText>
						<h:message for="qtde" style="color:red" />
					</h:panelGrid>
					<h:commandButton id="submit" value="Repor"
						action="#{EstoqueDAO.repor(estoqueBean)}">
					</h:commandButton>
					<div id="msg" class="dcontexto"></div>
				</h:form>
			</div>
		</div>
		<!-- /Operação de estoque -->
	</f:view>
</body>
</html>