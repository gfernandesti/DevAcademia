<%-- 
    Document   : CadastrarAtendente
    Created on : 20/10/2014, 19:19:34
    Author     : academia
--%>

<%@page import="java.util.List"%>
<%@page import="com.devacademia.model.Exercicio"%>
<%@page import="com.devacademia.dao.ExercicioDao"%>
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

        <table class="table table-bordered table-hover ">
            <tr>
                
                <th style="color: #d9534f">Aluno</th>
                <th style="color: #d9534f">Idade</th>  
                <th style="color: #d9534f">Telefone</th>
                <th style="color: #d9534f">Email</th>  
                <th style="color: #269abc">Instrutor</th>  
                <th style="color: gray">Aparelho</th>  
                <th style="color: #356635">Dia</th>
                <th style="color: #ffffff">Exercício</th>
                <th style="color: #ffffff">GruopoMuscular</th>
                <th style="color: #ffffff">Série</th>
                <th style="color: #ffffff">Repetição</th>
                

            </tr>
            <%
                int id;
                String descricao;
                String aluno;
                int idade;
                int serie;
                int repeticao;
                String telefone;
                String email;
                String instrutor;
                String aparelho;
                String grupo;
                String dia;

                ExercicioDao lista = new ExercicioDao();
                for (Exercicio tre : lista.getLista()) {

                    id = tre.getTreino().getId();
                    aluno = tre.getAluno().getNome();
                    idade = tre.getAluno().getIdade();
                    telefone = tre.getAluno().getTelefone();
                    email = tre.getAluno().getEmail();
                    instrutor = tre.getInstrutor().getNome();
                    aparelho = tre.getAparelho().getDescricao();
                    dia = tre.getTreino().getDia();
                    descricao = tre.getDescricao();
                    grupo=tre.getGrupomuscular();
                    serie = tre.getSerie();
                    repeticao = tre.getRepeticoes();
                
            %>

            <tr>
                
                <td><%=aluno%></td>
                <td><%=idade%></td>
                <td><%=telefone%></td>
                <td><%=email%></td>
                <td><%=instrutor%></td>
                <td><%=aparelho%></td>
                <td><%=dia%></td>
                <td><%=descricao%></td>
                <td><%=grupo%></td>
                <td><%=serie%></td>
                <td><%=repeticao%></td>
                <td><a href="ControllerTreino.jsp?acao=remover&id=<%=id%>&acao=remover" class=" btn btn-danger">Remover</a></td>
                <!--<td><a href="FormTreEdit.jsp?tf_id=<%=id%>&tf_aluno=<%=aluno%>&tf_idade=<%=idade%>&tf_email=<%=email%>&tf_telefone=<%=telefone%>&tf_instrutor=<%=instrutor%>&tf_aparelho=<%=aparelho%>&tf_dia=<%=dia%>&tf_descricao=<%=descricao%>&tf_grupo=<%=grupo%>&tf_serie=<%=serie%>&tf_repeticao=<%=repeticao%>" class=" btn btn-info">Alterar</a></td>-->

            

            <%}%>
            
            </tr>

            </table>
            

        
    </body>
</html>
