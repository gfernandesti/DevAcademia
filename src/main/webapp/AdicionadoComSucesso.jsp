
<%@page import="br.com.voluntarionarede.jdbc.VoluntarioDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="br.com.voluntarionarede.models.*"%>
<%
	VoluntarioDao dao = new VoluntarioDao();
	if (request.getParameter("login") != null) {

		for (Voluntario voluntario : dao.getLista()) {
			if (voluntario.getEmail().equals(
					request.getParameter("Uemail"))
					&& voluntario.getSenha().equals(
							request.getParameter("Usenha"))) {
				session.setAttribute("userName",
						request.getParameter("Uemail"));
				session.setAttribute("userPass",
						request.getParameter("Usenha"));
			}
		}
	} else if (request.getParameter("logoff") != null) {
		session.removeAttribute("userName");
		session.removeAttribute("userPass");
		response.sendRedirect("Home.jsp");
		%>
		
	<% }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="Head.jsp"%>
<%@ include file="Cabecalho.jsp"%>


<body>

	<h2>Olá ${param.Uemail}, você foi cadastrado(a) com Sucesso!</h2>
	<h3>Agora acesse sua área de Usuário no site!</h3>
	<br>
	<hr>

	<%
		if (session.getAttribute("userName") == null) {
	%>

	<form class="form-horizontal" action="AdicionadoComSucesso.jsp">
		<fieldset>

			<!-- Button (Double) -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="button1id"></label>
				<div class="col-md-8">
					<div id="" class="btn btn-success">Faça seu Login!</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="Uemaill"></label>
				<div class="col-md-4">
					<input id="Unome" name="Uemail" type="text" placeholder="Nome.."
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="passwordinput"></label>
				<div class="col-md-4">
					<input id="Uemail" name="Usenha" type="text" placeholder="Email.."
						class="form-control input-md" required="">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="singlebutton"></label>
				<div class="col-md-4">
					<input type="hidden" name="login" />
					<button type="submit" id="singlebutton" name="singlebutton"
						class="btn btn-primary">Entrar</button>
				</div>
			</div>
		</fieldset>
	</form>
	<%
		} else {
			RequestDispatcher rd = request
					.getRequestDispatcher("HomeUsuario.jsp");
			rd.forward(request, response);

		}
	%>
	<div>
		<div>
			<%@ include file="rodape.jsp"%>
			<%@ include file="ModalCadastrarONG.jsp"%>
			<%@ include file="ModalCadastrarUsuario.jsp"%>
			<%@ include file="ModalLogin.jsp"%>
		</div>
	</div>
</body>
</html>