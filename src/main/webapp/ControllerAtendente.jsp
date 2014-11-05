<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="com.devacademia.model.Atendente"%>
<%@page import="com.devacademia.dao.AtendenteDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("acao").equals("remover")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Character permissao = request.getParameter("permissao").charAt(0);
        Usuario usuario = new Usuario();
        AtendenteDao dao = new AtendenteDao();
        Atendente atd = new Atendente();
        atd.setId(id);
        dao.remove(atd);
        RequestDispatcher rd = request
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        int registro = Integer.parseInt(request.getParameter("tf_registro"));
        String nome = request.getParameter("tf_nome");
        String login = request.getParameter("tf_login");
        String senha = request.getParameter("tf_senha");
        Character permissao = request.getParameter("tf_permissao").charAt(0);

        Usuario usuario = new Usuario();
        usuario.setLogin(login);
        usuario.setSenha(senha);
        usuario.setPermissao(permissao);
        Atendente atdinistrador = new Atendente();
        atdinistrador.setRegistro(registro);
        atdinistrador.setNome(nome);
        atdinistrador.setUsuario(usuario);

        AtendenteDao dao = new AtendenteDao();
        dao.adiciona(atdinistrador);

        response.sendRedirect("Home.jsp");
    } else if (request.getParameter("acao").equals("alterar")) {
        int id = Integer.parseInt(request.getParameter("tf_id"));
        int registro = Integer.parseInt(request.getParameter("tf_registro"));
        String nome = request.getParameter("tf_nome");
        String login = request.getParameter("tf_login");
        String senha = request.getParameter("tf_senha");
        Character permissao = request.getParameter("tf_permissao").charAt(0);

        Usuario usuario = new Usuario();
        usuario.setId(id);
        usuario.setLogin(login);
        usuario.setSenha(senha);
        usuario.setPermissao(permissao);
        Atendente atd = new Atendente();
        atd.setRegistro(registro);
        atd.setNome(nome);
        atd.setUsuario(usuario);
        AtendenteDao dao = new AtendenteDao();
        dao.altera(atd);
        response.sendRedirect("Home.jsp");

    }
%>
