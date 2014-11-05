<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="com.devacademia.model.Administrador"%>
<%@page import="com.devacademia.dao.AdministradorDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("acao").equals("remover")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Character permissao = request.getParameter("permissao").charAt(0);
        Usuario usuario = new Usuario();
        AdministradorDao dao = new AdministradorDao();
        Administrador adm = new Administrador();
        adm.setId(id);
        dao.remove(adm);
        RequestDispatcher rd = request
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
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
        Administrador administrador = new Administrador();
        administrador.setEmail(email);
        administrador.setTelefone(tel);
        administrador.setNome(nome);
        administrador.setUsuario(usuario);
        //usuario.setCadastroNoSite(cadastronosite);
        //System.out.println("email: " + administrador.getEmail() + "senha:" + administrador.getSenha());
        // salva o contato
        System.out.println(administrador.getUsuario().getPermissao());
        AdministradorDao dao = new AdministradorDao();
        dao.adiciona(administrador);
        //request.setAttribute("administrador", administrador);

        // RequestDispatcher rd = request
        //      .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        //  rd.forward(request, response);
        response.sendRedirect("Home.jsp");
    } else if (request.getParameter("acao").equals("alterar")) {
        int id = Integer.parseInt(request.getParameter("tf_id"));
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
        Administrador administrador = new Administrador();
        administrador.setEmail(email);
        administrador.setTelefone(tel);
        administrador.setNome(nome);
        administrador.setUsuario(usuario);
        AdministradorDao dao = new AdministradorDao();
        dao.altera(administrador);
        response.sendRedirect("Home.jsp");

    }
%>
