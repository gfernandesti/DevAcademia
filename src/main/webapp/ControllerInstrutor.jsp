<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="com.devacademia.model.Instrutor"%>
<%@page import="com.devacademia.dao.InstrutorDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("acao").equals("remover")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Character permissao = request.getParameter("permissao").charAt(0);
        Usuario usuario = new Usuario();
        InstrutorDao dao = new InstrutorDao();
        Instrutor ins = new Instrutor();
        ins.setId(id);
        dao.remove(ins);
        RequestDispatcher rd = request
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        int registro = Integer.parseInt(request.getParameter("tf_registro"));
        String email = request.getParameter("tf_email");
        String tel = request.getParameter("tf_tel");
        String nome = request.getParameter("tf_nome");
        String login = request.getParameter("tf_login");
        String senha = request.getParameter("tf_senha");
        Character permissao = request.getParameter("tf_permissao").charAt(0);

        Usuario usuario = new Usuario();
        usuario.setLogin(login);
        usuario.setSenha(senha);
        usuario.setPermissao(permissao);
        Instrutor ins = new Instrutor();
        ins.setRegistro(registro);
        ins.setEmail(email);
        ins.setTelefone(tel);
        ins.setNome(nome);
        ins.setUsuario(usuario);
      
        InstrutorDao dao = new InstrutorDao();
        dao.adiciona(ins);
       
        response.sendRedirect("Home.jsp");
    } else if (request.getParameter("acao").equals("alterar")) {
        
        int id = Integer.parseInt(request.getParameter("tf_id"));
        int registro = Integer.parseInt(request.getParameter("tf_registro"));
        String email = request.getParameter("tf_email");
        String tel = request.getParameter("tf_tel");
        String nome = request.getParameter("tf_nome");
        String login = request.getParameter("tf_login");
        String senha = request.getParameter("tf_senha");
        Character permissao = request.getParameter("tf_permissao").charAt(0);

        Usuario usuario = new Usuario();
        usuario.setId(id);
        usuario.setLogin(login);
        usuario.setSenha(senha);
        usuario.setPermissao(permissao);
        Instrutor ins = new Instrutor();
        ins.setRegistro(registro);
        ins.setEmail(email);
        ins.setTelefone(tel);
        ins.setNome(nome);
        ins.setUsuario(usuario);
        InstrutorDao dao = new InstrutorDao();
        dao.altera(ins);
        response.sendRedirect("Home.jsp");

    }
%>
