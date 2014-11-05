<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="com.devacademia.model.Aluno"%>
<%@page import="com.devacademia.dao.AlunoDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("acao").equals("remover")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Character permissao = request.getParameter("permissao").charAt(0);
        Usuario usuario = new Usuario();
        AlunoDao dao = new AlunoDao();
        Aluno alu = new Aluno();
        alu.setId(id);
        dao.remove(alu);
        RequestDispatcher rd = request
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        int registro = Integer.parseInt(request.getParameter("tf_registro"));
        int idade = Integer.parseInt(request.getParameter("tf_idade"));
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
        Aluno alu = new Aluno();
        alu.setRegistro(registro);
        alu.setIdade(idade);
        alu.setEmail(email);
        alu.setTelefone(tel);
        alu.setNome(nome);
        alu.setUsuario(usuario);
      
        AlunoDao dao = new AlunoDao();
        dao.adiciona(alu);
       
        response.sendRedirect("Home.jsp");
    } else if (request.getParameter("acao").equals("alterar")) {
        
        int id = Integer.parseInt(request.getParameter("tf_id"));
        int registro = Integer.parseInt(request.getParameter("tf_registro"));
        int idade = Integer.parseInt(request.getParameter("tf_idade"));
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
        Aluno alu = new Aluno();
        alu.setRegistro(registro);
        alu.setIdade(idade);
        alu.setEmail(email);
        alu.setTelefone(tel);
        alu.setNome(nome);
        alu.setUsuario(usuario);
        AlunoDao dao = new AlunoDao();
        dao.altera(alu);
        response.sendRedirect("Home.jsp");

    }
%>
