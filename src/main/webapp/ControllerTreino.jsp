<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="com.devacademia.model.Instrutor"%>
<%@page import="com.devacademia.model.Aparelho"%>
<%@page import="com.devacademia.model.Aluno"%>
<%@page import="com.devacademia.model.Treino"%>
<%@page import="com.devacademia.dao.TreinoDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("acao").equals("remover")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        Character permissao = request.getParameter("permissao").charAt(0);
        Usuario usuario = new Usuario();
        TreinoDao dao = new TreinoDao();
        Treino tre = new Treino();
        tre.setId(id);
        dao.remove(tre);
        RequestDispatcher rd = request
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        String descricao=request.getParameter("tf_descricao");
        String sequencia = request.getParameter("rd_sequencia");
        String grupo = request.getParameter("sl_grupomuscular");
        String exercicio = request.getParameter("sl_exercicio");
        int apa =Integer.parseInt(request.getParameter("sl_aparelho"));
        int alu =Integer.parseInt(request.getParameter("sl_aluno"));
        int ins =Integer.parseInt(request.getParameter("sl_instrutor"));
        String dia = request.getParameter("rb_dia");
        //Date horario=request.getParameter("tf_horario");
        
        Aluno aluno = new Aluno();
        aluno.setId(alu);
        
        Aparelho aparelho = new Aparelho();
        aparelho.setId(apa);
        
        Instrutor instrutor = new Instrutor();
        instrutor.setId(ins);

        Treino tre = new Treino(sequencia, descricao, grupo, exercicio,aluno, aparelho, instrutor, dia);
      
        TreinoDao dao = new TreinoDao();
        dao.adiciona(tre);
       
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
        Treino tre = new Treino();
       
        TreinoDao dao = new TreinoDao();
        dao.altera(tre);
        response.sendRedirect("Home.jsp");

    }
%>
