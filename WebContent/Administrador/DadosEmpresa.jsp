<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Dados da Empresa</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<h1>Dados da Empresa</h1>

				<form name="registrarEmpresa" method="post" action="index.html">
					<div>
						<label for="razaoSocial">Razão Social:</label><br> <input
							type="text" name="razaoSocial" id="razaoSocial" tabindex="1"
							autofocus="" placeholder="Informe o nome da Razão Social" size=46 />
					</div>
					<div id="validarRazaoSocial"></div>
					<br>

					<div>
						<label for="nomeFantasia">Nome Fantasia</label><br> <input
							type="text" name="nomeFantasia" id="nomeFantasia" tabindex="2"
							autofocus="" placeholder="Informe o Nome Fantasia da sua empresa"
							size="35" />
					</div>
					<div id="validarNomeFantasia"></div>
					<br>

					<div>
						<label for="endereco">Endereço: </label><br> <input
							type="text" name="endereco" id="endereco" tabindex="3"
							autofocus="" placeholder="Informe o endereço da empresa" size=80 />
					</div>
					<div id="validarEndereco"></div>
					<br>

					<div>
						<label for="telefonePrincipal">Telefone Principal: </label><br>
						<input type="text" name="telefonePrincipal" id="telefonePrincipal"
							tabindex="4" autofocus=""
							placeholder="Informe o telefone principal" size=30 />
					</div>
					<div id="validarTelefonePrincipal"></div>
					<br>

					<div>
						<label for="telefoneAlternativo">Telefone Alternativo: </label><br>
						<input type="text" name="telefoneAlternativo"
							id="telefoneAlternativo" tabindex="5" autofocus=""
							placeholder="Informe um telefone alternativo" size=30 />
					</div>
					<div id="validarTelefoneAlternativo"></div>
					<br>

					<div>
						<label for="eMail">E-mail da empresa:</label><br> <input
							type="text" name="eMail" id="eMail" tabindex="6" autofocus=""
							placeholder="Informe seu e-mail" size=46 />
					</div>
					<div id="validarEMail"></div>
					<br>

					<div>
						<label for="siteEmpresa">Site da Empresa:</label><br> <input
							type="text" name="siteEmpresa" id="siteEmpresa" tabindex="7"
							autofocus="" placeholder="Informe o site de sua empresa" size=46 />
					</div>
					<div id="validarSite"></div>
					<br>

					<div>
						<input type="hidden" name="acao" value="env-cont">
						<div id="Salvar">
							<input type="button" name="conf" value="Salvar"> <input
								type="button" value="Voltar" onclick="window.history.back()">
						</div>
					</div>
					<br>
				</form>
			</div>
			<!-- /content -->
		</div>
	</f:view>

</body>
</html>
