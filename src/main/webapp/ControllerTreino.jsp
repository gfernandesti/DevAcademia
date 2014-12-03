<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.devacademia.dao.ExercicioDao"%>
<%@page import="com.devacademia.model.Exercicio"%>
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
        TreinoDao dao = new TreinoDao();
        Treino tre = new Treino();
        tre.setId(id);
        dao.remove(tre);
        RequestDispatcher rd = request
                .getRequestDispatcher("PagAdministrador.jsp?acao=treino");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        String descricoes[] = request.getParameterValues("sl_descricao");
        String series[] = request.getParameterValues("sl_serie");
        String repeticoes[] = request.getParameterValues("sl_repeticao");
        String grupos[] = request.getParameterValues("sl_grupomuscular");
        int apa = Integer.parseInt(request.getParameter("sl_aparelho"));
        int alu = Integer.parseInt(request.getParameter("sl_aluno"));
        int ins = Integer.parseInt(request.getParameter("sl_instrutor"));
        String dia = request.getParameter("rb_dia");

        ArrayList<Exercicio> lista = new ArrayList<>();
        int qtd = series.length;
        for (int i = 0; i <= qtd - 1; i++) {
            Exercicio exe = new Exercicio();
            exe.setDescricao(descricoes[i]);
            exe.setSerie(Integer.parseInt(series[i]));
            exe.setRepeticoes(Integer.parseInt(repeticoes[i]));
            exe.setGrupomuscular(grupos[i]);
            if (i == 0) {
                Aluno aluno = new Aluno();
                aluno.setId(alu);

                Aparelho aparelho = new Aparelho();
                aparelho.setId(apa);

                Instrutor instrutor = new Instrutor();
                instrutor.setId(ins);

                Treino tre = new Treino();
                tre.setDia(dia);
                tre.setAluno(aluno);
                tre.setAparelho(aparelho);
                tre.setInstrutor(instrutor);
                exe.setTreino(tre);
           }
            lista.add(exe);
        }

       //TreinoDao dao = new TreinoDao();
        //dao.adiciona(tre);
        ExercicioDao daoexe = new ExercicioDao();
        daoexe.adiciona(lista);
        System.out.println("Tamanho: " + lista.size());
        response.sendRedirect("PagAdministrador.jsp?acao=treino");
    } else if (request.getParameter("acao").equals("alterar")) {

        String descricao = request.getParameter("tf_descricao");
        String sequencia = request.getParameter("rd_sequencia");
        String grupo = request.getParameter("sl_grupomuscular");
        String exercicio = request.getParameter("sl_exercicio");
        int apa = Integer.parseInt(request.getParameter("sl_aparelho"));
        int alu = Integer.parseInt(request.getParameter("sl_aluno"));
        int ins = Integer.parseInt(request.getParameter("sl_instrutor"));
        String dia = request.getParameter("rb_dia");

        Treino tre = new Treino();
        tre.setDia(dia);

        Aluno aluno = new Aluno();
        aluno.setId(alu);
        Aparelho aparelho = new Aparelho();
        aparelho.setId(apa);
        Instrutor instrutor = new Instrutor();
        instrutor.setId(ins);

        tre.setAluno(aluno);
        tre.setAparelho(aparelho);
        tre.setInstrutor(instrutor);

        TreinoDao dao = new TreinoDao();
        dao.altera(tre);
        response.sendRedirect("Home.jsp");

    }


%>
