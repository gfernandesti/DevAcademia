<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div class="col-md-12 column">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a href="Home.jsp"><img src="img/logo.png " /></a>
	</div>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

		<div class="btn-group pull-right">
			<a class="btn btn-info dropdown-toggle" data-toggle="modal"
				href="#LoginModal" style="margin-left: 150px">Bem Vindo, <%=session.getAttribute("userName")%></a>
			<form action="AdicionadoComSucesso.jsp" method="get"
				style="float: right">
				<input type="hidden" name="logoff" />
				<button class="btn btn-danger dropdown-toggle" type="submit" >Sair</button>
			</form>
		</div>
		<table>
			<tr>
				<td><a href="Mapa.jsp" class="btn btn-success"> Encontre
						ONG's no Mapa<span class="glyphicon glyphicon-search"></span>

				</a></td>
			</tr>
		</table>
		<ul class="nav navbar-nav" style="margin-left: 0px">
			<li class="btn-info"><a data-toggle="modal" href="#UsuarioModal">Meu Perfil</a></li>
			<li class="btn-success" style="margin-left: 50px"><a
				data-toggle="modal" href="#myModal">Projetos que Participo</a></li>
			<li class="btn-warning" style="margin-left: 50px"><a
				href="Sobre.jsp">Minhas Ongs</a></li>
		</ul>
	</div>
</div>

<div class="jumbotron">
	<h1>Faça parte da transformação que você espera para o Mundo!</h1>

</div>
</html>