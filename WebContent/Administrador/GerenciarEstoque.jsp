<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de insumos (produtos e/ou serviços)</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Controle de Estoque</h1>

				<h2>Estoque</h2>
				<h:form>
					<h:dataTable value="#{EstoqueDAO.estoqueLista}" var="est"
						styleClass="order-table" headerClass="order-table-header"
						rowClasses="order-table-odd-row,order-table-even-row">
						<h:column>
							<f:facet name="header">
								<h:outputText value="Ações" />
							</f:facet>
							<h:commandLink value="" action="#{EstoqueDAO.altera(est)}">
								<h:graphicImage value="../img/editar.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
							<h:commandLink value="" action="#{EstoqueDAO.remover(est)}">
								<h:graphicImage value="../img/remover.png"
									style="width: 25px; height: 25px; " />
							</h:commandLink>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Nº Registro" />
							</f:facet>
							<h:outputText value="#{est.idEstoque}" style="size: 2" />
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="idFornecedor" />
							</f:facet>
							<h:inputText tabindex="1" id="idFornecedor"
								value="#{est.idFornecedor}"
								onblur="if (this.value == '#{estoqueBean.idFornecedor}'){this.value = '#{est.idFornecedor}'; }"
								onfocus="if (this.value == '#{est.idFornecedor}') {this.value = '#{estoqueBean.idFornecedor}'; }">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Insumo" />
							</f:facet>
							<h:inputText tabindex="1" id="insumo" value="#{est.insumo}"
								onblur="if (this.value == '#{estoqueBean.insumo}'){this.value = '#{est.insumo}'; }"
								onfocus="if (this.value == '#{est.insumo}') {this.value = '#{estoqueBean.insumo}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Preço" />
							</f:facet>
							<h:inputText tabindex="1" id="preco" value="#{est.preco}"
								onblur="if (this.value == '#{estoqueBean.preco}'){this.value = '#{est.preco}'; }"
								onfocus="if (this.value == '#{est.preco}') {this.value = '#{estoqueBean.preco}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Quantidade" />
							</f:facet>
							<h:inputText tabindex="1" id="qtde" value="#{est.qtde}"
								onblur="if (this.value == '#{estoqueBean.qtde}'){this.value = '#{est.qtde}'; }"
								onfocus="if (this.value == '#{est.qtde}') {this.value = '#{estoqueBean.qtde}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Tipo" />
							</f:facet>
							<h:inputText tabindex="1" id="tipo" value="#{est.tipo}"
								onblur="if (this.value == '#{estoqueBean.tipo}'){this.value = '#{est.tipo}'; }"
								onfocus="if (this.value == '#{est.tipo}') {this.value = '#{estoqueBean.tipo}'; }"
								size="14">
							</h:inputText>
						</h:column>

						<h:column>
							<f:facet name="header">
								<h:outputText value="Data" />
							</f:facet>
							<h:inputText tabindex="1" id="data" value="#{est.data}"
								onblur="if (this.value == '#{estoqueBean.data}'){this.value = '#{est.data}'; }"
								onfocus="if (this.value == '#{est.data}') {this.value = '#{estoqueBean.data}'; }"
								size="14">
							</h:inputText>
						</h:column>

					</h:dataTable>
				</h:form>
				<!-- /Estoque -->

				<h2>Cadastro de Produtos</h2>
				<h:form>
					<h:panelGrid id="panel" columns="6" border="0" cellpadding="10"
						cellspacing="1">
						<h:outputLabel value="Insumo" for="insumo"
							onmouseover="exibirmensagem('Informe o produto')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="1" id="insumo"
							value="#{estoqueBean.insumo}" size="30" label="Informe o produto"
							required="true">
							<f:validateLength minimum="2" maximum="30" />
						</h:inputText>
						<h:message for="insumo" style="color:red" />

						<h:outputLabel value="Fornecedor" for="idFornecedor"
							onmouseover="exibirmensagem('Informe qual fornecedor')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="1" id="idFornecedor"
							value="#{estoqueBean.idFornecedor}" size="30"
							label="Nome do fornecedor" required="true">
							<f:validateLength minimum="1" maximum="10" />
						</h:inputText>
						<h:message for="idFornecedor" style="color:red" />

						<h:outputLabel value="Preço" for="preco"
							onmouseover="exibirmensagem('Informe o preço do produto')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="2" id="preco" value="#{estoqueBean.preco}"
							size="30" label="Preço do produto" required="true">
							<f:validateLength minimum="1" maximum="11" />
						</h:inputText>
						<h:message for="preco" style="color:red" />

						<h:outputLabel value="Quantidade" for="qtde"
							onmouseover="exibirmensagem('Informe a quatidade de produtos')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="5" id="qtde" value="#{estoqueBean.qtde}"
							size="30" label="Quantidade de produtos" required="true">
							<f:validateLength minimum="1" maximum="10" />
						</h:inputText>
						<h:message for="qtde" style="color:red" />

						<h:outputLabel value="Tipo de insumo" for="tipo"
							onmouseover="exibirmensagem('Informe o tipo de insumo')"
							onmouseout="exibirmensagem('')" />
						<h:selectOneRadio tabindex="6" id="tipo"
							value="#{estoqueBean.tipo}" label="Tipo de insumo"
							required="true">
							<f:selectItem itemValue="Produto" itemLabel="Produto" />
							<f:selectItem itemValue="Serviço" itemLabel="Serviço" />
						</h:selectOneRadio>
						<h:message for="tipo" style="color:red" />

					</h:panelGrid>
					<h:commandButton id="submit" value="Cadastrar"
						action="#{EstoqueDAO.salvar(estoqueBean)}" />
					<div id="msg" class="dcontexto"></div>

				</h:form>
			</div>
			<!-- /Estoque -->
	</f:view>

</body>
</html>
