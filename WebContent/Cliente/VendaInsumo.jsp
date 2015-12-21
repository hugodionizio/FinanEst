<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Venda de produtos ou Agendamento de Serviços</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuCliente.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Venda de produtos ou Agendamento de Serviços</h1>

				<h2>Estoque</h2>
				<h:form>
					<h:dataTable value="#{EstoqueDAO.estoqueLista}" var="est"
						styleClass="order-table" headerClass="order-table-header"
						rowClasses="order-table-odd-row,order-table-even-row">
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
					</h:dataTable>
				</h:form>
				<!-- /Estoque -->

				<h2>Sessão de compras e agendamentos</h2>
				<h:form>
					<h:panelGrid id="panel" columns="6" border="0" cellpadding="10"
						cellspacing="1">
						<h:outputLabel value="Número do insumo" for="idEstoque"
							onmouseover="exibirmensagem('Informe o número do insumo')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="1" id="idEstoque"
							value="#{estoqueBean.idEstoque}" size="30"
							label="Informe o número" required="true">
							<f:validateLength minimum="1" maximum="10" />
						</h:inputText>
						<h:message for="idEstoque" style="color:red" />

						<h:outputLabel value="Quantidade" for="qtde"
							onmouseover="exibirmensagem('Informe a quatidade de produtos')"
							onmouseout="exibirmensagem('')" />
						<h:inputText tabindex="5" id="qtde" value="#{estoqueBean.qtde}"
							size="30" label="Quantidade de produtos" required="true">
							<f:validateLength minimum="1" maximum="10" />
						</h:inputText>
						<h:message for="qtde" style="color:red" />
						<h:message for="idEstoque" style="color:red" />
					</h:panelGrid>
					<h:commandButton id="submit" value="Comprar"
						action="#{EstoqueDAO.comprar(estoqueBean)}" />
					<div id="msg" class="dcontexto"></div>
				</h:form>
			</div>
		</div>
		<!-- /Operação de estoque -->
	</f:view>

</body>
</html>
