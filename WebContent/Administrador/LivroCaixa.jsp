<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Livro-Caixa</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Livro Caixa</h1>

				<h:form>
					<h:dataTable value="#{CaixaDAO.caixaLista}" var="livro"
						styleClass="order-table" headerClass="order-table-header"
						rowClasses="order-table-odd-row,order-table-even-row">
						<h:column>
							<f:facet name="header">
								<h:outputText value="Ações" />
							</f:facet>
							<h:commandLink value="" action="#{CaixaDAO.altera(livro)}">
								<h:graphicImage value="../img/editar.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
							<h:commandLink value="" action="#{CaixaDAO.remover(livro)}">
								<h:graphicImage value="../img/remover.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Nº Registro" />
							</f:facet>
							<h:outputText value="#{livro.idCaixa}" style="size: 2" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Data" />
							</f:facet>
							<h:inputText tabindex="1" id="data" value="#{livro.data}"
								onblur="if (this.value == '#{caixaBean.data}'){this.value = '#{livro.data}'; }"
								onfocus="if (this.value == '#{livro.data}') {this.value = '#{caixaBean.data}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Histórico" />
							</f:facet>
							<h:inputText tabindex="1" id="historico" value="#{livro.historico}"
								onblur="if (this.value == '#{caixaBean.historico}'){this.value = '#{livro.historico}'; }"
								onfocus="if (this.value == '#{livro.historico}') {this.value = '#{caixaBean.historico}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Complemento" />
							</f:facet>
							<h:inputText tabindex="1" id="complemento"
								value="#{livro.complemento}"
								onblur="if (this.value == '#{caixaBean.complemento}'){this.value = '#{livro.complemento}'; }"
								onfocus="if (this.value == '#{livro.complemento}') {this.value = '#{caixaBean.complemento}'; }">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Entradas" />
							</f:facet>
							<h:inputText tabindex="1" id="entrada" value="#{livro.entrada}"
								onblur="if (this.value == '#{caixaBean.entrada}'){this.value = '#{livro.entrada}'; }"
								onfocus="if (this.value == '#{livro.entrada}') {this.value = '#{caixaBean.entrada}'; }"
								size="14">
							</h:inputText>
						</h:column>
						
						<h:column>
							<f:facet name="header">
								<h:outputText value="Saídas" />
							</f:facet>
							<h:inputText tabindex="1" id="saida" value="#{livro.saida}"
								onblur="if (this.value == '#{caixaBean.saida}'){this.value = '#{livro.saida}'; }"
								onfocus="if (this.value == '#{livro.saida}') {this.value = '#{caixaBean.saida}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Saldo" />
							</f:facet>
							<h:inputText tabindex="1" id="saldo" value="#{livro.saldo}"
								onblur="if (this.value == '#{caixaBean.saldo}'){this.value = '#{livro.saldo}'; }"
								onfocus="if (this.value == '#{livro.saldo}') {this.value = '#{caixaBean.saldo}'; }"
								size="14">
							</h:inputText>
						</h:column>
					</h:dataTable>
				</h:form>
				<!-- /Livro-Caixa -->
				<input type="button" value="Mês anterior" onclick="mesAnterior();">
				<input type="button" value="Mês posterior" onclick="mesPosterior();"><br>

				<input type="button" value="Ano anterior" onclick="anoAnterior();">
				<input type="button" value="Ano posterior" onclick="anoposterior();"><br>

				<input type="button" value="Enviar para contador"
					onclick="contador();">
			</div>
	</f:view>
</body>
</html>
