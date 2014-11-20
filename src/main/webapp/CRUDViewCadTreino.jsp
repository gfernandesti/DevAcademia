<%-- 
    Document   : CadastrarAtendente
    Created on : 20/10/2014, 19:19:34
    Author     : academia
--%>

<%@page import="com.devacademia.model.Treino"%>
<%@page import="com.devacademia.dao.TreinoDao"%>
<%@page import="com.devacademia.model.Aluno"%>
<%@page import="com.devacademia.dao.AlunoDao"%>
<%@include file="Head.jsp" %>
<%@page import="com.devacademia.dao.UsuarioDao"%>
<%@page import="com.devacademia.model.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar Treino!</h1>
        <div class="form-group">
            <label class="col-md-4 control-label" for="bt_cancel"></label>
            <div class="col-md-4">
                <a href="FormTreinoCad.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Novo Treino</a>
            </div>
        </div>
        <br /> <br />

        <table class="table table-hover">
            <tr>
                <th>ID</th>
                <th>Aluno</th>
                <th>AlunoIdade</th>  
                <th>AlunoTelefone</th>
                <th>AlunoEmail</th>  
                <th>Instrutor</th>  
                <th>Aparelho</th>  
                <th>Dia</th>

            </tr>
            <%
                int id;
                String descricao;
                String aluno;
                int idade;
                String telefone;
                String email;
                String instrutor;
                String aparelho;
                String grupo;
                String exercicio;
                String sequencia;
                String dia;

                TreinoDao lista = new TreinoDao();
                for (Treino tre : lista.getLista()) {
                  
                    id = tre.getId();
                    aluno = tre.getAluno().getNome();
                    idade = tre.getAluno().getIdade();
                    telefone = tre.getAluno().getTelefone();
                    email = tre.getAluno().getEmail();
                    instrutor = tre.getInstrutor().getNome();
                    aparelho = tre.getAparelho().getDescricao();
                    dia = tre.getDia();
            %>

            <tr>
                <td><%=id%></td>
                <td><%=aluno%></td>
                <td><%=idade%></td>
                <td><%=telefone%></td>
                <td><%=email%></td>
                <td><%=instrutor%></td>
                <td><%=aparelho%></td>
                <td><%=dia%></td>


                <td><a href="ControllerTreino.jsp?acao=remover&id=<%=id%>&acao=remover" class=" btn btn-danger">Remover</a></td>
                <td><a href="FormTreinoEdit.jsp?tf_id=<%=id%>&sl_aparelho=<%=aparelho%>&sl_aluno=<%=aluno%>&sl_instrutor=<%=instrutor%>&rb_dia=<%=dia%>" class=" btn btn-info">Alterar</a></td>
            </tr>
            <%}%>


        </table>
    </body>
</html>
