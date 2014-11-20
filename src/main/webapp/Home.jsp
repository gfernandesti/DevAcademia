<%@page import="com.devacademia.dao.AdministradorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ include file="Head.jsp" %>
    <%@ page import="com.devacademia.model.*"%>
    <%
        AdministradorDao dao = new AdministradorDao();
        String permissao;
        if (request.getParameter("login") != null) {

            for (Administrador adm : dao.getLista()) {
                if (adm.getUsuario().getLogin().equals(
                        request.getParameter("Ulogin"))
                        && adm.getUsuario().getSenha().equals(
                                request.getParameter("Usenha"))) {
                    System.out.println(adm.getUsuario().getLogin());
                    session.setAttribute("userName",
                            request.getParameter("Ulogin"));
                    session.setAttribute("userPass",
                            request.getParameter("Usenha"));
                    session.setAttribute("userPermissao",
                            adm.getUsuario().getPermissao());
                    permissao = String.valueOf(adm.getUsuario().getPermissao());
                }
            }
        } else if (request.getParameter("logoff") != null) {
            session.removeAttribute("userName");
            session.removeAttribute("userPass");
            response.sendRedirect("Home.jsp");
        }

    %>

    <body background="img/Backgreen.jpg">
        <br><br><br><br>
        <%@include file="Cabecalho.jsp" %>
        <br>
        <div class="container">

            <div class="row clearfix">



                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail" style="background-color:#c1d62f">
                            <img alt="300x200" src="img/imagem(3).jpg">
                            <div class="caption" >
                                <h3>NATAÇÃO</h3>
                                <p>Conheça os benefícios da Natação para Bebês.</p>
                                <p>
                                    <a class="btn btn-primary" href="#">Conferir</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail" style="background-color:#c1d62f">
                            <img alt="300x200" src="img/imagem(4).jpg">
                            <div class="caption">
                                <h3>ATENÇÃO</h3>
                                <p>Causas e tratamentos da obesidade.</p>
                                <p>
                                    <a class="btn btn-primary" href="#">Conferir</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail" style="background-color:#c1d62f">
                            <img alt="300x200" src="img/imagem(5).jpg">
                            <div class="caption">
                                <h3>DICAS</h3>
                                <p>Bike + Depp Running.</p>
                                <p>
                                    <a class="btn btn-primary" href="#">Conferir</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail" style="background-color:#c1d62f">
                            <img alt="300x200" src="img/imagem(6).jpg">
                            <div class="caption">
                                <h3>DICAS</h3>
                                <p>5 Dicas para um abdômen definido e corpo saudável</p>
                                <p>
                                    <a class="btn btn-primary" href="#">Conferir</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail" style="background-color:#c1d62f">
                            <img alt="300x200" src="img/imagem(7).jpg">
                            <div class="caption">
                                <h3>INFO</h3>
                                <p>Mitos e verdades sobre Musculação e Mulheres.</p>
                                <p>
                                    <a class="btn btn-primary" href="#">Conferir</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail" style="background-color:#c1d62f">
                            <img alt="300x200" src="img/imagem(9).jpg">
                            <div class="caption">
                                <h3>ECO</h3>
                                <p>Seis perguntas e respostas do consumo consciente.</p>
                                <p>
                                    <a class="btn btn-primary" href="#">Conferir</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%    if (session.getAttribute("userName") == null) {%>
        <%@ include file="ModalLogin.jsp" %>	
        <%
            } else {

                if ("M".equals(session.getAttribute("userPermissao").toString())) {
                    RequestDispatcher rd = request
                            .getRequestDispatcher("PagAdministrador.jsp");
                    rd.forward(request, response);
                } else if ("A".equals(session.getAttribute("userPermissao").toString())) {
                    RequestDispatcher rd = request
                            .getRequestDispatcher("PagAtendente.jsp");
                    rd.forward(request, response);
                } else if ("I".equals(session.getAttribute("userPermissao").toString())) {
                    RequestDispatcher rd = request
                            .getRequestDispatcher("PagInstrutor.jsp");
                    rd.forward(request, response);

                } else {
                    RequestDispatcher rd = request
                            .getRequestDispatcher("PagAluno.jsp");
                    rd.forward(request, response);

                }
            }
        %>
        <%@ include file="Rodape.jsp" %>

    </body>
</html>
