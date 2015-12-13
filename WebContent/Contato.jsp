<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contato</title>
</head>
<body>
	<div id="conteudo">
	<h1>Contato</h1>	
  <form name="formulario" method="post" action="">
    <div class="NomeCompleto">
      <label for="nomeCompleto">Nome completo*:</label><br>
      <input type="text" name="nomeCompleto"
             id="nomeCompleto" tabindex="1" autofocus="" placeholder="Informe seu nome" size=46 />
    </div>
    <div id="validarNome"></div>
    <br>

    <div class="EMail">
      <label for="eMail">e-mail*:</label><br>
      <input type="text" name="eMail"
             id="eMail" tabindex="1" autofocus="" placeholder="Informe seu e-mail" size=46 />
    </div>
    <div id="validarEMail"></div>
    <br>

    <div class="Instituicao">
      <label for="instituicao">Institui��o (universidade/escrit�rio):</label><br>
      <input type="text" name="instituicao"
             id="instituicao" tabindex="1" autofocus="" placeholder="Informe sua institui��o" size=47 />
    </div>
    <div id="validarInstituicao"></div>
    <br>

    <div class="Assunto">
      <label for="assunto">Assunto*:</label><br>
      <select name="assunto">
        <optgroup label="Assunto">
          <option value="">Escolha um assunto</option>
          <option value="Elogios">Elogios</option>
          <option value="Sugest�es">Sugest�es</option>
          <option value="Reclama��es">Reclama��es</option>
          <option value="Outro">Outro</option>
      </select>
    </div>
    <div id="validarAssunto"></div>
    <br>

    <div class="Mensagem">
      <label for="mensagem">Mensagem*:</label><br>
      <textarea name="mensagem" id="mensagem" tabindex="1" autofocus="" placeholder="Escreva sua mensagem" rows="3" cols="50"
                ></textarea>
    </div>
    <div id="validarMensagem"></div>
    <p>* Preenchimento de campos obrigat�rio</p>

    <div>
      <input type="hidden" name="acao" value="env-cont">
      <div id="Enviar">
        <input type="submit" name="button" value="Enviar" id="botaoVermelho" onclick="avisar()">
        <input type="button" value="Voltar" onclick="voltar()">
      </div>
    </div>
    <br>
  </form>
	</div>
</body>
</html>