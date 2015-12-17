<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Lista de clientes</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Lista de Clientes</h1>

				<h:form>
					<h:dataTable value="#{ClienteDAO.clienteLista}" var="cli"
						styleClass="order-table" headerClass="order-table-header"
						rowClasses="order-table-odd-row,order-table-even-row">
						<h:column>
							<f:facet name="header">
								<h:outputText value="Ações" />
							</f:facet>
							<h:commandLink value="" action="#{ClienteDAO.altera(cli)}">
								<h:graphicImage value="../img/editar.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
							<h:commandLink value="" action="#{ClienteDAO.remover(cli)}">
								<h:graphicImage value="../img/remover.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Nº Registro" />
							</f:facet>
							<h:outputText value="#{cli.idCliente}" style="size: 2" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Nome" />
							</f:facet>
							<h:inputText tabindex="1" id="nomeCompleto" value="#{cli.nome}"
								onblur="if (this.value == '#{clienteBean.nome}'){this.value = '#{cli.nome}'; }"
								onfocus="if (this.value == '#{cli.nome}') {this.value = '#{clienteBean.nome}'; }">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="CPF" />
							</f:facet>
							<h:inputText tabindex="1" id="cpf" value="#{cli.cpf}"
								onblur="if (this.value == '#{clienteBean.cpf}'){this.value = '#{cli.cpf}'; }"
								onfocus="if (this.value == '#{cli.cpf}') {this.value = '#{clienteBean.cpf}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Senha" />
							</f:facet>
							<h:inputSecret tabindex="1" id="senha" value="#{cli.senha}"
								onblur="if (this.value == '#{clienteBean.senha}'){this.value = '#{cli.senha}'; }"
								onfocus="if (this.value == '#{cli.senha}') {this.value = '#{clienteBean.senha}'; }"
								size="6">
							</h:inputSecret>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Endereço" />
							</f:facet>
							<h:inputText tabindex="1" id="endereco" value="#{cli.endereco}"
								onblur="if (this.value == '#{clienteBean.endereco}'){this.value = '#{cli.endereco}'; }"
								onfocus="if (this.value == '#{cli.endereco}') {this.value = '#{clienteBean.endereco}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Telefone principal" />
							</f:facet>
							<h:inputText tabindex="1" id="foneprn" value="#{cli.foneprn}"
								onblur="if (this.value == '#{clienteBean.foneprn}'){this.value = '#{cli.foneprn}'; }"
								onfocus="if (this.value == '#{cli.foneprn}') {this.value = '#{clienteBean.foneprn}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Telefone alternativo" />
							</f:facet>
							<h:inputText tabindex="1" id="fonesec" value="#{cli.fonesec}"
								onblur="if (this.value == '#{clienteBean.fonesec}'){this.value = '#{cli.fonesec}'; }"
								onfocus="if (this.value == '#{cli.fonesec}') {this.value = '#{clienteBean.fonesec}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="E-mail" />
							</f:facet>
							<h:inputText tabindex="1" id="email" value="#{cli.email}"
								onblur="if (this.value == '#{clienteBean.email}'){this.value = '#{cli.email}'; }"
								onfocus="if (this.value == '#{cli.email}') {this.value = '#{clienteBean.email}'; }"
								size="16">
							</h:inputText>
						</h:column>

					</h:dataTable>
				</h:form>
				<!-- /Clientes -->
			</div>
		</div>
	</f:view>
</body>
</html>
