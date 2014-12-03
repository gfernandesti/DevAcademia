<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="com.devacademia.model.Aparelho"%>
<%@page import="com.devacademia.dao.AparelhoDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("acao").equals("remover")) {
        int id = Integer.parseInt(request.getParameter("id"));
        AparelhoDao dao = new AparelhoDao();
        Aparelho apr = new Aparelho();
        apr.setId(id);
        dao.remove(apr);
        RequestDispatcher rd = request
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        int codigo = Integer.parseInt(request.getParameter("tf_codigo"));
        String nf = request.getParameter("tf_nf");
        String descricao = request.getParameter("tf_descricao");
        int quantidade = Integer.parseInt(request.getParameter("tf_quantidade"));
        Aparelho apr = new Aparelho();
        apr.setCodigo(codigo);
        apr.setDescricao(descricao);
        apr.setNotafiscal(nf);
        apr.setQuantidade(quantidade);
        
        AparelhoDao dao = new AparelhoDao();
        dao.adiciona(apr);
       
        response.sendRedirect("Home.jsp");
    } else if (request.getParameter("acao").equals("alterar")) {
        int id = Integer.parseInt(request.getParameter("tf_id"));
        int codigo = Integer.parseInt(request.getParameter("tf_codigo"));
        int quantidade = Integer.parseInt(request.getParameter("tf_quantidade"));
        String descricao = request.getParameter("tf_descricao");
        String nf = request.getParameter("tf_nf");
       
        Aparelho apr = new Aparelho();
        apr.setCodigo(codigo);
        apr.setDescricao(descricao);
        apr.setNotafiscal(nf);
        apr.setQuantidade(quantidade);
        apr.setId(id);
        
        AparelhoDao dao = new AparelhoDao();
        dao.altera(apr);
        response.sendRedirect("Home.jsp");

    }
%>
