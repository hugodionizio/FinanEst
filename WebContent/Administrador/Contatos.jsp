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
<title>Mensagens de contato</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<h2>Mensagens de contato</h2>

			<div class="jumbotron">
				<div id="conteudo">
					<h:form>
						<h:dataTable value="#{ContatoDAO.contatoLista}" var="con"
							styleClass="order-table" headerClass="order-table-header"
							rowClasses="order-table-odd-row,order-table-even-row">
							<h:column>
								<f:facet name="header">
									<h:outputText value="Ações" />
								</f:facet>
								<h:commandLink value="" action="#{ContatoDAO.remover(con)}">
									<h:graphicImage value="../img/remover.png"
										style="width: 25px; height: 25px; " />
								</h:commandLink>
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="Nº Registro" />
								</f:facet>
								<h:outputText value="#{con.idContato}" />
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="Nome" />
								</f:facet>
								<h:outputText value="#{con.nome}" />
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="E-mail" />
								</f:facet>
								<h:outputText value="#{con.email}" />
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="Instituição" />
								</f:facet>
								<h:outputText value="#{con.instituicao}" />
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="Assunto" />
								</f:facet>
								<h:outputText value="#{con.assunto}" />
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="Mensagem" />
								</f:facet>
								<h:outputText value="#{con.mensagem}" />
							</h:column>

							<h:column>
								<f:facet name="header">
									<h:outputText value="Data" />
								</f:facet>
								<h:outputText value="#{con.data}" />
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
