<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de funcionários</title>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />
		<div id="home" class="container">
			<div id="conteudo">
				<h1>Cadastro de Funcionários</h1>
				<form name="cadastroFuncionario" method="post" action="Menu.html">
					<div>
						<label for="nomeCompleto">Nome completo:</label><br> <input
							type="text" name="nomeCompleto" id="nomeCompleto" tabindex="1"
							autofocus="" placeholder="Informe seu nome completo" size=46 />
					</div>
					<div id="validarNome"></div>
					<br>

					<div>
						<label for="CPF">CPF: </label><br> <input type="text"
							name="CPF" id="CPF" tabindex="1" autofocus=""
							placeholder="Informe seu CPF" size=14
							onkeypress="return valCPF(event, this);
	                return false;"
							onkeyUp="if (this.value.length == 14)
	                  this.form.senha.focus();" />
					</div>
					<div id="validarCPF"></div>
					<br>

					<div>
						<label for="senha">Senha: </label><br> <input type="password"
							name="senha" id="senha" tabindex="1" autofocus=""
							placeholder="Informe sua senha" maxlength="50" />
					</div>
					<div id="validarSenha"></div>
					<br>

					<div>
						<label for="confirmarSenha">Confirmar senha: </label><br> <input
							type="password" name="confirmarSenha" id="confirmarSenha"
							tabindex="1" autofocus="" placeholder="Repita sua senha"
							maxlength="50" />
					</div>
					<div id="validarConfirmarSenha"></div>
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
						<label for="eMail">e-mail:</label><br> <input type="text"
							name="eMail" id="eMail" tabindex="1" autofocus=""
							placeholder="Informe seu e-mail" size=46 />
					</div>
					<div id="validarEMail"></div>
					<br>

					<div>
						<input type="hidden" name="acao" value="env-cont">
						<div id="Cadastrar">
							<input type="button" name="conf" value="Cadastrar"
								id="botaoVermelho" onclick="lembrar();"> <input
								type="button" value="Voltar" onclick="voltar();">
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
