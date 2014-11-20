<%-- 
    Document   : Controller
    Created on : 01/11/2014, 00:43:03
    Author     : academia
--%>

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
                .getRequestDispatcher("Home.jsp");//direciona p/pagina q contem a resposta html
        rd.forward(request, response);
    } else if (request.getParameter("acao").equals("adicionar")) {
        String descricoes[]=request.getParameterValues("sl_descricao");
        String series[]=request.getParameterValues("sl_serie");
        String repeticoes[] = request.getParameterValues("sl_repeticao");
        String grupos [] = request.getParameterValues("sl_grupomuscular");
        int apa =Integer.parseInt(request.getParameter("sl_aparelho"));
        int alu =Integer.parseInt(request.getParameter("sl_aluno"));
        int ins =Integer.parseInt(request.getParameter("sl_instrutor"));
        String dia = request.getParameter("rb_dia");
    
       /*int [] descricoesint = new int[descricoes.length];
        for(int i=0;i<=descricoes.length-1;i++){
            descricoesint[i]=Integer.parseInt(descricoes[i]);
        }
        /*
        for(int i=0;i<=series.length-1;i++){
            out.println(series[i]);
        }
        for(int i=0;i<=grupos.length-1;i++){
            out.println(grupos[i]);
        }
        for(int i=0;i<=repeticoes.length-1;i++){
            out.println(repeticoes[i]);
        }*/
        
    
        
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
      
        //TreinoDao dao = new TreinoDao();
        //dao.adiciona(tre);
        
        Exercicio exe = new Exercicio();
        exe.setDescricao(descricoes);
        exe.setGrupomuscular(grupos);
       // exe.setSerie(series);
       // exe.setRepeticoes(repeticoes);
        
       /* for(int i=0;i<=descricoes.length-1;i++){
            exe.setDescricao(descricoes[i]);
             ExercicioDao dao = new ExercicioDao();
             dao.adiciona(exe);
        }*/
       
        
       
        
       
        //response.sendRedirect("Home.jsp");
    } else if (request.getParameter("acao").equals("alterar")) {
        
        String descricao=request.getParameter("tf_descricao");
        String sequencia = request.getParameter("rd_sequencia");
        String grupo = request.getParameter("sl_grupomuscular");
        String exercicio = request.getParameter("sl_exercicio");
        int apa =Integer.parseInt(request.getParameter("sl_aparelho"));
        int alu =Integer.parseInt(request.getParameter("sl_aluno"));
        int ins =Integer.parseInt(request.getParameter("sl_instrutor"));
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
