<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
<html>
    <%@ include file="HeadUsu.jsp" %>

    <body>
         <%    if (session.getAttribute("userName") == null) {
             response.sendRedirect("Home.jsp");
         }
         %>
        <%
            if(request.getParameter("logoff") != null) {
            session.removeAttribute("userName");
            session.removeAttribute("userPass");
            response.sendRedirect("Home.jsp");
        }
            %>
        <div class="container">
            <div class="row clearfix">
                <%@include file="CabecalhoAdministrador.jsp" %>
                
                <div id="paginasdecadastro">
                    <%@include file="CRUDViewCadAdministrador.jsp" %>
                </div>
            </div>

            <%@ include file="Rodape.jsp" %>
            <%@ include file="ModalLogin.jsp" %>			
    </body>
</html>