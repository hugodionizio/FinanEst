/**
 * 
 */

$(document).ready(function(){
		$("#menu a").click(function( e ){
			e.preventDefault();
			var href = $( this ).attr('href');
			$("#conteudo").load( href +" #conteudo");
		});
	});

function alertar() {
	alert("Olá! Este é o FinanEst!\n" +
			"Sistema Financeiro e de Estoque");
}

function anterior() {
    "use strict";
    alert("Voltando...");
}