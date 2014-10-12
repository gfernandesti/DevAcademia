<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>Voluntário na Rede!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/teste.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
        <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="img/favicon.png">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
<script src="angular.js"></script>
<script type="text/javascript" src="lightbox.js"></script>

<meta name="generator" content="TextMate http://macromates.com/">
	<script src="jquery-1.5.2.min.js" type="text/javascript"></script>
	<script src="jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
	
	<script type="text/javascript">

		function findCEP() {
		    if($.trim($("#zipcode").val()) != ""){
		        $("#ajax-loading").css('display','inline');
		        $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#zipcode").val().replace("-", ""), function(){
		            if(resultadoCEP["resultado"] == 1){
		                $("#street").val(unescape(resultadoCEP["tipo_logradouro"])+" "+unescape(resultadoCEP["logradouro"]));
		                $("#district").val(unescape(resultadoCEP["bairro"]));
		                $("#city").val(unescape(resultadoCEP["cidade"]));
		                $("#state").val(unescape(resultadoCEP["uf"]));
		                $("#number").focus();
		            }else{
		                alert("Endereço não encontrado para o cep ");
		            }
		            $("#ajax-loading").hide();
		        });
		    }
		}
		$(document).ready(function(){
		    $("#zipcode").mask("99999-999")
		});

	</script>
</head>
</html>