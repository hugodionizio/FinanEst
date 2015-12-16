<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flot Examples: Canvas text</title>
<link href="../flot/examples.css" rel="stylesheet" type="text/css">
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="../../excanvas.min.js"></script><![endif]-->
<script language="javascript" type="text/javascript"
	src="../flot/jquery.js"></script>
<script language="javascript" type="text/javascript"
	src="../flot/jquery.flot.js"></script>
<script language="javascript" type="text/javascript"
	src="../flot/jquery.flot.time.js"></script>
<script language="javascript" type="text/javascript"
	src="../flot/jquery.flot.canvas.js"></script>
</head>
<body>
	<f:view>
		<jsp:directive.include file="MenuAdmin.jsp" />

		<div id="home" class="container">
			<div id="conteudo">
				<div id="header">
					<h1>Projeção de Caixa</h1>
				</div>

				<div id="content">

					<div align="center">
						<div class="demo-container">
							<img src="../img/projecao.jpg" />
						</div>
					</div>
				</div>
	</f:view>
</body>
</html>
