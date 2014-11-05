<%-- 
    Document   : CadastrarAtendente
    Created on : 20/10/2014, 19:19:34
    Author     : academia
--%>

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
        <h1>Cadastrar Aluno!</h1>
        <div class="form-group">
                <label class="col-md-4 control-label" for="bt_cancel"></label>
                <div class="col-md-4">
                    <a href="FormAluCad.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Novo Aluno</a>
                </div>
            </div>
<br /> <br />

<table class="table table-hover">
<tr>
<th>Id</th>
<th>Registro</th>
<th>Idade</th>
<th>Nome</th>
<th>Tel</th>
<th>Email</th>
<th>Login</th>
<th>Senha</th>
<th>Permissao</th>
</tr>
<%
    int id;
    int registro;
    int idade;
    String nome;
    String tel;
    String email;
    String login;
    String senha;
    Character permissao;
    AlunoDao lista = new AlunoDao();
    for(Aluno aln:lista.getLista()){
        id = aln.getUsuario().getId();
        registro=aln.getRegistro();
        idade=aln.getIdade();
        nome= aln.getNome();
        tel= aln.getTelefone();
        email=aln.getEmail();
        login=aln.getUsuario().getLogin();
        senha=aln.getUsuario().getSenha();
        permissao=aln.getUsuario().getPermissao();
        %>

<tr>
<td><%=id%></td>
<td><%=registro%></td>
<td><%=idade%></td>
<td><%=nome%></td>
<td><%=tel%></td>
<td><%=email%></td>
<td><%=login%></td>
<td><%=senha%></td>
<td><%=permissao%></td>
<td><a href="ControllerAluno.jsp?acao=remover&id=<%=id%>&login=<%=login%>&senha=<%=senha%>&permissao=<%=permissao%>&registro=<%=registro%>&idade=<%=idade%>&acao=remover" class=" btn btn-danger">Remover</a></td>
<td><a href="FormAluEdit.jsp?tf_id=<%=id%>&tf_nome=<%=nome%>&tf_tel=<%=tel%>&tf_email=<%=email%>&tf_login=<%=login%>&tf_senha=<%=senha%>&tf_permissao=<%=permissao%>&tf_registro=<%=registro%>&tf_idade=<%=idade%>" class=" btn btn-info">Alterar</a></td>
</tr>
<%}%>

 
</table>
    </body>
</html>
