<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.finanest.annotations.Contato"%>
<%@ page import="com.finanest.DAO.ContatoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Contatos</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<h2>Contatos</h2>

			<div class="jumbotron">
				<div id="conteudo">
					<h:form>
						<h:dataTable value="#{ContatoDAO.contatoLista}" var="con"
							styleClass="order-table" headerClass="order-table-header"
							rowClasses="order-table-odd-row,order-table-even-row">
							<h:column>
								<f:facet name="header">Nº Registro</f:facet>
								<h:column>
									<h:outputText value="#{con.idContato}" />
								</h:column>
							</h:column>

							<h:column>
								<f:facet name="header">Nome</f:facet>
								<h:column>
									<h:outputText value="#{con.nome}" />
								</h:column>
							</h:column>

							<h:column>
								<f:facet name="header">E-mail</f:facet>
								<h:column>
									<h:outputText value="#{con.email}" />
								</h:column>
							</h:column>

							<h:column>
								<f:facet name="header">Instituição</f:facet>
								<h:column>
									<h:outputText value="#{con.instituicao}" />
								</h:column>
							</h:column>

							<h:column>
								<f:facet name="header">Assunto</f:facet>
								<h:column>
									<h:outputText value="#{con.assunto}" />
								</h:column>
							</h:column>

							<h:column>
								<f:facet name="header">Data</f:facet>
								<h:column>
									<h:outputText value="#{con.data}" />
								</h:column>
							</h:column>

							<h:column>
								<f:facet name="header">Ação</f:facet>
								<h:column>
									<h:commandLink value="Remover"
										action="#{ContatoDAO.remover(con)}" />
								</h:column>
							</h:column>
						</h:dataTable>
					</h:form>
				</div>
			</div>
		</div>
		</div>
	</f:view>
</body>
</html>
