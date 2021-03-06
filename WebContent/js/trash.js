/**
 * 
 */

// Botões
function voltar() {
	"use strict";
	window.history.back();
}

function avisar() {
	"use strict";
	div = document;
	div = document.getElementById("Enviar");
	div.innerHTML = '\
		<input type="submit" name="button" value="Enviar" id="botaoVermelho" onclick="avisar()">\
		<input type="button" value="Voltar" onclick="voltar()">\
		<p id="validarFormulario">Todos os campos obrigatórios precisam ser preenchidos.</p>';
}

function botaoEnviar(nomeValidado, eMailValidado, assuntoValidado,
		mensagemValidada) {
	"use strict";
	div = document.getElementById("Enviar");

	if (nomeValidado && eMailValidado && assuntoValidado && mensagemValidada)
		div.innerHTML = '<input type="submit" name="conf" value="Enviar">\
				<input type="button" value="Voltar" onclick="voltar()">';
	else
		div.innerHTML = '\
			<input type="submit" name="button" value="Enviar" id="botaoVermelho" onclick="avisar()">\
			<input type="button" value="Voltar" onclick="voltar()">';
}

// Inscrições
function lembrar() {
	"use strict";
	var tipoPreenchimento = document.getElementById("tipoPreenchimento").innerHTML;
	var div = document.getElementById("Inscrever");

	div.innerHTML = '<input type="submit" name="conf" value="'
			+ tipoPreenchimento
			+ '" id="botaoVermelho" onclick="lembrar()">\
				<input type="button" value="Voltar" onclick="voltar()">';
	$('#alertaPreenchimento').show();
}

function botaoInscrever(nomeValidado, CPFValidado, senhaValidada,
		confirmarSenhaValidada, CAPTCHAValidado, eMailValidado) {
	"use strict";
	var tipoPreenchimento = document.getElementById("tipoPreenchimento").innerHTML;
	var div = document.getElementById("Inscrever");

	if (nomeValidado, CPFValidado, senhaValidada, confirmarSenhaValidada,
			CAPTCHAValidado, eMailValidado) {
		div.innerHTML = '<input type="submit" name="conf" value="'
				+ tipoPreenchimento
				+ '">\
				<input type="button" value="Voltar" onclick="voltar()">';
		$('#alertaPreenchimento').hide();
	}

	else {
		div.innerHTML = '\
			<input type="submit" name="conf" value="'
				+ tipoPreenchimento
				+ '" id="botaoVermelho" onclick="lembrar()">\
			<input type="button" value="Voltar" onclick="voltar()">';
		$('#alertaPreenchimento').hide();
	}
}

// Validações
// Formato de e-mail
function IsEmail(email) {
	"use strict";
	var exclude = /[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1/;
	var check = /@[\w\-]+\./;
	var checkend = /\.[a-zA-Z]{2,3}$/;

	if (((email.search(exclude) != -1) || (email.search(check)) == -1)
			|| (email.search(checkend) == -1)) {
		return false;
	} else {
		return true;
	}
}

// Login
function mostrarMenus() {
	var login = $('#login');
	var home = $('#home');

	login.css({
		visibility : "visible",
		left: "9%",
		top: "15px"
	});
	
	home.css({
		visibility: "hidden"
	});
}

function exibirmensagem(mensagem){  
    var msg = document.getElementById("msg")  
    msg.innerHTML = mensagem  
}

function IsCPF(CPF) {
	"use strict";
	return true;
}

// Formato de CPF
/* permite somente valores numericos */
function valCPF(e, campo) {
	var tecla = (window.event) ? event.keyCode : e.which;

	if ((tecla > 47 && tecla < 58)) {
		mascara(campo, '###.###.###-##');
		return true;
	} else {
		if (tecla != 8)
			return false;
		else
			return true;
	}
}

/* cria a mascara */
function mascara(src, mask) {
	var i = src.value.length;
	var saida = mask.substring(1, 2);
	var texto = mask.substring(i);

	if (texto.substring(0, 1) != saida) {
		src.value += texto.substring(0, 1);
	}
}

function recuperarSenha() {
	var X = $(this).attr('id');

	if ($(this).attr('id') != 1) {
		$('.submeterEMail').show();
		$(this).attr('id', '1');
	} else {
		$('.submeterEMail').hide();
		$(this).attr('id', '0');
	}
}

function selecionarParticipacao() {
	$('.areaOrganizadores').css({
		textAlign : "left"
	});
	gerenciar();
}

function avaliar() {
	gerenciar();
}

function ministrar() {
	gerenciar();
}

function gerenciar() {
	var areaRestrita = $('.areaRestrita');
	var X = $(this).attr('id');

	if ($(this).attr('id') != 1) {
		areaRestrita.css({
			top : 40
		});
		$('.areaOrganizadores').show();
		$(this).attr('id', '1');
	} else {
		$('.areaOrganizadores').hide();
		$(this).attr('id', '0');
	}
}

function excluir() {
	var decisao = confirm("Você tem certeza que deseja excluir este inscrito?");
	if (decisao) {
		return true;
	} else {
		return false;
	}
}

function posicionarMenu() {
	var limites = {
		superior : 0,
		inferior : 0
	}, menuContainer = $('.menu'), menu = $('.scrollable'), content = $('.content'), wnd = $(window), deslocamento = 210, rodape = {
		offset : 0,
		topo : 0,
		base : 0
	};

	wnd.on(
			'scroll',
			function(event) {
				var offset = menuContainer.offset();
				limites.superior = offset.top;
				limites.inferior = offset.top + menuContainer.height()
						- menu.height();
				rodape.offset = content.offset();
				rodape.topo = rodape.offset.top;
				rodape.base = rodape.offset.top + menuContainer.height()
						- menu.height();

				var st = limites.superior;
				st = wnd.scrollTop() > st ? wnd.scrollTop() : st;
				st = st > limites.inferior ? st = limites.inferior : st;
				var stN = 0;

				// alert(st+"\n"+rodape.topo+"\n"+rodape.base);
				if (st < deslocamento && st > wnd.scrollTop() - rodape.topo) {
					menu.css({
						bottom : st - deslocamento
					});
					stN = st;
				}
			}).triggerHandler('scroll');
}

function mostrarPosicao(url, hash, node, heightSize, posicion) {
	alert("Window.location: " + window.location + "\nurl: " + url
			+ "\nurl.indexOf(\"#\"): " + url.indexOf("#") + "\nhash: " + hash
			+ "\nnode: " + node + "\nheightSize: " + heightSize
			+ "\nscrollTop(): " + $(document).scrollTop() + "\nposicion: "
			+ posicion);
}

function posicionarAbaixoCabecalho() {
	var url = "" + window.location;
	var idx = url.indexOf("#");
	var hash = idx !== -1 ? url.substring(idx + 1) : "";

	if (hash !== "") {
		var node = document.getElementById(hash).offsetTop;
		var heightSize = document.body.offsetHeight;
		if (node + 745 < heightSize && $(document).scrollTop() == 0) {
			var position = Math.abs($(document).scrollTop() - (node + 90));
			$('html, body').animate({
				scrollTop : position
			});
		} else {
			if (node + 745 < heightSize) {
				$('html, body').animate({
					scrollTop : node + 60
				});
			}
		}
	}
}

$(document)
		.ready(
				function() {
					// Variáveis Globais
					var nomeValidado;
					var CPFValidado;
					var senhaValidada;
					var confirmacaoSenhaValidada;
					var eMailValidado;
					var CAPTCHAValidado;
					var instituicaoValidada;
					var assuntoValidado;
					var mensagemValidada;
					var destination;
					var scrolling;
					var offset;

					// Index - Menu
					$(function() {
						posicionarMenu();
					});

					$('#subir').click(function() {
						$('html, body').animate({
							scrollTop : 90
						}, 'slow');

						return false;
					});

					$('a.ancora').click(function() {
						var elementClicked = $(this).attr("href");
						destination = $(elementClicked).offset().top;
						$("html:not(:animated),body:not(:animated)").animate({
							scrollTop : destination - 200
						}, 0);
						return false;
					});

					// Início - Slide Show
					$("#slideshow").css("overflow", "hidden");

					$("ul#slides").cycle({
						randomizeEffects : true,
						fx : 'scrollLeft,scrollDown,scrollRight,scrollUp,fade',
						speed : 1500,
						timeout : 2000,
						prev : '#prev',
						next : '#next',
					});

					// Tópicos - Posicionar âncora abaixo do cabeçalho
					posicionarAbaixoCabecalho();

					// Contato - Formulário
					var div;

					// Contato - Formulário - Campo focado
					$("input").focus(
							function() {
								var teste = true;

								switch ($(this).attr('id')) {
								case "nomeCompleto":
									nomeValidado = true;
									botaoEnviar(nomeValidado, eMailValidado,
											assuntoValidado, mensagemValidada);
									break;
								case "usuario":
								case "CPF":
									CPFValidado = true;
									break;
								case "senha":
									senhaValidada = true;
									break;
								case "confirmarSenha":
									confirmarSenhaValidada = true;
									break;
								case "captcha_code":
									CAPTCHAValidado = true;
									break;
								case "eMail":
									eMailValidado = true;
									botaoEnviar(nomeValidado, eMailValidado,
											assuntoValidado, mensagemValidada);
									break;
								default:
									teste = false;
								}
								if (teste)
									botaoInscrever(nomeValidado, CPFValidado,
											senhaValidada,
											confirmarSenhaValidada,
											CAPTCHAValidado, eMailValidado);
							});

					// Contato - Formulário - Campo desfocado
					$("input")
							.blur(
									function() {
										var teste = true;
										var idCampo = $(this).attr('id');
										var valorCampo;
										var div;

										switch (idCampo) {
										case "nomeCompleto":
											valorCampo = "Nome completo";
											div = document
													.getElementById("validarNome");
											break;
										case "usuario":
										case "CPF":
											valorCampo = "CPF";
											div = document
													.getElementById("validarCPF");
											break;
										case "senha":
											valorCampo = "Senha";
											div = document
													.getElementById("validarSenha");
											break;
										case "confirmarSenha":
											valorCampo = "Confirmar senha";
											div = document
													.getElementById("validarConfirmarSenha");
											break;
										case "captcha_code":
											valorCampo = "CAPTCHA";
											div = document
													.getElementById("validarCAPTCHA");
											break;
										case "eMail":
											valorCampo = "e-mail";
											div = document
													.getElementById("validarEMail");
											break;
										default:
											teste = false;
										}

										if (document.getElementById(idCampo).value == ""
												&& teste) { // Falsea um campos
															// simples
											$(this).parent().addClass(
													"focoAtual")
													.children("div").toggle();
											div.innerHTML = "<p id='validarFormulario'>Por favor, preencha o campo \""
													+ valorCampo + "\"</p>";

											switch (idCampo) {
											case "nomeCompleto":
												nomeValidado = false;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
												break;
											case "usuario":
											case "CPF":
												CPFValidado = false;
												break;
											case "senha":
												senhaValidada = false;
												break;
											case "confirmarSenha":
												confirmarSenhaValidada = false;
												break;
											case "captcha_code":
												CAPTCHAValidado = false;
												break;
											case "eMail":
												eMailValidado = false;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
												break;
											}
											botaoInscrever(nomeValidado,
													CPFValidado, senhaValidada,
													confirmarSenhaValidada,
													CAPTCHAValidado,
													eMailValidado);
										} else if (idCampo == "CPF"
												|| idCampo == "usuario") {
											var CPF;
											if (idCampo == "CPF")
												CPF = document
														.getElementById("CPF").value;
											else
												CPF = document
														.getElementById("usuario").value;

											if (!IsCPF(CPF)) {
												$(this).parent().addClass(
														"focoAtual").children(
														"div").toggle();
												div.innerHTML = "<p id='validarFormulario'>Formato de CPF inválido, reescreva, por favor.</p>";
												CPFValidado = false;
											} else {
												$(this).parent().removeClass(
														"focoAtual").children(
														"div").toggle();
												div.innerHTML = "";
												CPFValidado = true;
											}
										} else if (idCampo == "eMail") {
											var eMail = document
													.getElementById("eMail").value;

											if (!IsEmail(eMail)) {
												$(this).parent().addClass(
														"focoAtual").children(
														"div").toggle();
												div.innerHTML = "<p id='validarFormulario'>Formato de e-mail inválido, reescreva, por favor.</p>";
												eMailValidado = false;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
											} else {
												$(this).parent().removeClass(
														"focoAtual").children(
														"div").toggle();
												div.innerHTML = "";
												eMailValidado = true;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
											}
										} else { // Corrobora um campo
													// simples
											$(this).parent().removeClass(
													"focoAtual")
													.children("div").toggle();
											div.innerHTML = "";

											switch (idCampo) {
											case "nomeCompleto":
												nomeValidado = true;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
												break;
											case "senha":
												senhaValidada = true;
												break;
											case "confirmarSenha":
												confirmarSenhaValidada = true;
												break;
											case "captcha_code":
												CAPTCHAValidado = true;
												break;
											}
										}
										if (teste)
											botaoInscrever(nomeValidado,
													CPFValidado, senhaValidada,
													confirmarSenhaValidada,
													CAPTCHAValidado,
													eMailValidado);
									});
					$(
							'<div class="NomeCompleto"></div><div class="Instituicao">\
	</div><div class="Assunto"></div><div class="Mensagem"></div>')
							.appendTo("div.formulario");

					$("select").focus(
							function() {
								assuntoValidado = true;
								botaoEnviar(nomeValidado, eMailValidado,
										assuntoValidado, mensagemValidada);
							});

					$("select")
							.blur(
									function() {
										div = document
												.getElementById("validarAssunto");

										var texto
										texto = "<br>O número de opções do select: "
												+ document.formulario.assunto.length
										var indice = document.formulario.assunto.selectedIndex
										texto += "<br>Indice da opção escolhida: "
												+ indice
										var valor = document.formulario.assunto.options[indice].value
										texto += "<br>Valor da opção escolhida: "
												+ valor
										var textoEscolhido = document.formulario.assunto.options[indice].text
										texto += "<br>Texto da opção escolhida: "
												+ textoEscolhido

										if (valor == "") {
											$(this).parent().addClass(
													"focoAtual")
													.children("div").toggle();
											div.innerHTML = "<p id='validarFormulario'>Por favor, escolha um assunto</p>";
											assuntoValidado = false;
											botaoEnviar(nomeValidado,
													eMailValidado,
													assuntoValidado,
													mensagemValidada);
										}

										else {
											$(this).parent().removeClass(
													"focoAtual")
													.children("div").toggle();
											div.innerHTML = "";
											assuntoValidado = true;
											botaoEnviar(nomeValidado,
													eMailValidado,
													assuntoValidado,
													mensagemValidada);
										}
									});

					$("textarea").focus(
							function() {
								mensagemValidada = true;
								botaoEnviar(nomeValidado, eMailValidado,
										assuntoValidado, mensagemValidada);
							});

					$("textarea")
							.blur(
									function() {
										if ($(this).attr('id') === "mensagem") {
											div = document
													.getElementById("validarMensagem");

											if (document
													.getElementById("mensagem").value === "") {
												$(this).parent().addClass(
														"focoAtual").children(
														"div").toggle();
												div.innerHTML = "<p id='validarFormulario'>Por favor, preencha o campo \"Mensagem\"</p>";
												mensagemValidada = false;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
											} else {
												$(this).parent().removeClass(
														"focoAtual").children(
														"div").toggle();
												div.innerHTML = "";
												mensagemValidada = true;
												botaoEnviar(nomeValidado,
														eMailValidado,
														assuntoValidado,
														mensagemValidada);
											}
										}
									});

					$(
							'<div id="validarNome"></div><div id="validarEMail"></div><div id="validarAssunto"></div><div id="validarMensagem"></div>')
							.appendTo('<div id="validarFormulario"></div>');
				});

// Tabela do Formulário
function medidasDaTabela() {
	var tbl = document.getElementById("contato");
	var largura = tbl.offsetWidth;
	var altura = tbl.offsetHeight;
	window.alert("W: " + largura + "\nH: " + altura);
}
// window.onload=medidasDaTabela;

// Outras funções
function replaceT(obj) {
	var newO = document.createElement('input');
	newO.setAttribute('type', 'password');
	newO.setAttribute('name', obj.getAttribute('name'));
	obj.parentNode.replaceChild(newO, obj);
	newO.focus();
}