<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/script.js"></script>
<title>Controle de fornecedores</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Controle de Fornecedores</h1>
				<h2>Lista de Fornecedores</h2>
				<h:form>
					<h:dataTable value="#{FornecedorDAO.fornecedorLista}" var="frn"
						styleClass="order-table" headerClass="order-table-header"
						rowClasses="order-table-odd-row,order-table-even-row">
						<h:column>
							<f:facet name="header">
								<h:outputText value="Nº Registro" />
							</f:facet>
							<h:outputText value="#{frn.idFornecedor}" style="size: 2" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Razão Social" />
							</f:facet>
							<h:inputText tabindex="1" id="rzsocial" value="#{frn.rzsocial}"
								onblur="if (this.value == '#{fornecedorBean.rzsocial}'){this.value = '#{frn.rzsocial}'; }"
								onfocus="if (this.value == '#{frn.rzsocial}') {this.value = '#{fornecedorBean.rzsocial}'; }">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Nome Fantasia" />
							</f:facet>
							<h:inputText tabindex="1" id="nmfantasia" value="#{frn.nmfantasia}"
								onblur="if (this.value == '#{fornecedorBean.nmfantasia}'){this.value = '#{frn.nmfantasia}'; }"
								onfocus="if (this.value == '#{frn.nmfantasia}') {this.value = '#{fornecedorBean.nmfantasia}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="CNPJ" />
							</f:facet>
							<h:inputText tabindex="1" id="cnpj" value="#{frn.cnpj}"
								onblur="if (this.value == '#{fornecedorBean.cnpj}'){this.value = '#{frn.cnpj}'; }"
								onfocus="if (this.value == '#{frn.cnpj}') {this.value = '#{fornecedorBean.cnpj}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Telefone principal" />
							</f:facet>
							<h:inputText tabindex="1" id="foneprn" value="#{frn.foneprn}"
								onblur="if (this.value == '#{fornecedorBean.foneprn}'){this.value = '#{frn.foneprn}'; }"
								onfocus="if (this.value == '#{frn.foneprn}') {this.value = '#{fornecedorBean.foneprn}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Telefone alternativo" />
							</f:facet>
							<h:inputText tabindex="1" id="fonesec" value="#{frn.fonesec}"
								onblur="if (this.value == '#{fornecedorBean.fonesec}'){this.value = '#{frn.fonesec}'; }"
								onfocus="if (this.value == '#{frn.fonesec}') {this.value = '#{fornecedorBean.fonesec}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Endereço" />
							</f:facet>
							<h:inputText tabindex="1" id="endereco" value="#{frn.endereco}"
								onblur="if (this.value == '#{fornecedorBean.endereco}'){this.value = '#{frn.endereco}'; }"
								onfocus="if (this.value == '#{frn.endereco}') {this.value = '#{fornecedorBean.endereco}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="E-mail" />
							</f:facet>
							<h:inputText tabindex="1" id="email" value="#{frn.email}"
								onblur="if (this.value == '#{fornecedorBean.email}'){this.value = '#{frn.email}'; }"
								onfocus="if (this.value == '#{frn.email}') {this.value = '#{fornecedorBean.email}'; }"
								size="16">
							</h:inputText>
						</h:column>
						
						<h:column>
							<f:facet name="header">
								<h:outputText value="Site" />
							</f:facet>
							<h:inputText tabindex="1" id="site" value="#{frn.site}"
								onblur="if (this.value == '#{fornecedorBean.site}'){this.value = '#{frn.site}'; }"
								onfocus="if (this.value == '#{frn.site}') {this.value = '#{fornecedorBean.site}'; }"
								size="16">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Ações" />
							</f:facet>
							<h:commandLink value="" action="#{FornecedorDAO.altera(frn)}">
								<h:graphicImage value="../img/editar.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
							<h:commandLink value="" action="#{FornecedorDAO.remover(frn)}">
								<h:graphicImage value="../img/remover.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
						</h:column>
					</h:dataTable>
				</h:form>
				<!-- /Clientes -->

				<h2>Cadastro de Novo Fornecedor</h2>
				<h:form>
					<h:panelGrid id="panel" columns="6" border="0" cellpadding="10"
						cellspacing="1">
						<h:outputLabel value="Razão Social" for="rzsocial"
							onmouseover="exibirmensagem('Informe a razão social')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="1" id="rzsocial"
							value="#{fornecedorBean.rzsocial}" size="30" label="Razão Social"
							required="true">
							<f:validateLength minimum="1" maximum="20" />
						</h:inputText>
						<h:message for="rzsocial" style="color:red" />

						<h:outputLabel value="Nome Fantasia" for="nmfantasia"
							onmouseover="exibirmensagem('Informe o nome fantasia')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="1" id="nmfantasia"
							value="#{fornecedorBean.nmfantasia}" size="30"
							label="Nome Fantasia" required="true">
							<f:validateLength minimum="1" maximum="20" />
						</h:inputText>
						<h:message for="nmfantasia" style="color:red" />

						<h:outputLabel value="CNPJ" for="cnpj"
							onmouseover="exibirmensagem('Informe o CNPJ')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="2" id="cnpj" value="#{fornecedorBean.cnpj}"
							size="30" label="CNPJ do fornecedor" required="true">
							<f:validateLength minimum="11" maximum="14" />
						</h:inputText>
						<h:message for="cnpj" style="color:red" />

						<h:outputLabel value="Telefone" for="foneprn"
							onmouseover="exibirmensagem('Informe o telefone principal')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="5" id="foneprn"
							value="#{fornecedorBean.foneprn}" size="30"
							label="Telefone principal do fornecedor" required="true">
							<f:validateLength minimum="1" maximum="20" />
						</h:inputText>
						<h:message for="foneprn" style="color:red" />

						<h:outputLabel value="Telefone alternativo" for="fonesec"
							onmouseover="exibirmensagem('Informe o telefone secundário')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="6" id="fonesec"
							value="#{fornecedorBean.fonesec}" size="30">
						</h:inputText>
						<div></div>

						<h:outputLabel value="Endereço" for="endereco"
							onmouseover="exibirmensagem('Informe o endereço')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="7" id="endereco"
							value="#{fornecedorBean.endereco}" size="30"
							label="Endereço do cliente" required="true">
							<f:validateLength minimum="1" maximum="20" />
						</h:inputText>
						<h:message for="endereco" style="color:red" />

						<h:outputLabel value="E-mail" for="eMail"
							onmouseover="exibirmensagem('Informe o seu e-mail')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="8" id="eMail"
							value="#{fornecedorBean.email}" size="30" label="E-mail"
							required="true">
							<f:validateLength minimum="1" maximum="30" />
						</h:inputText>
						<h:message for="eMail" style="color:red" />
						
						<h:outputLabel value="Site" for="site"
							onmouseover="exibirmensagem('Informe o site')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="8" id="site"
							value="#{fornecedorBean.site}" size="30" label="Site">
						</h:inputText>
					</h:panelGrid>
					<h:commandButton id="submit" value="Cadastrar"
						action="#{FornecedorDAO.salvar(fornecedorBean)}" />
					<div id="msg" class="dcontexto"></div>

				</h:form>
			</div>
			<!-- /Fornecedor -->
		</div>
	</f:view>

</body>
</html>
