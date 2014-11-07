<%-- 
    Document   : CadastrarAtendente
    Created on : 20/10/2014, 19:19:34
    Author     : academia
--%>

<%@page import="com.devacademia.model.Instrutor"%>
<%@page import="com.devacademia.dao.InstrutorDao"%>
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
        <h1>Cadastrar Instrutor!</h1>
        <div class="form-group">
                <label class="col-md-4 control-label" for="bt_cancel"></label>
                <div class="col-md-4">
                    <a href="FormInsCad.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Novo Instrutor</a>
                </div>
            </div>
<br /> <br />

<table class="table table-hover">
<tr>
<th>Id</th>
<th>Registro</th>
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
    String nome;
    String tel;
    String email;
    String login;
    String senha;
    Character permissao;
    InstrutorDao lista = new InstrutorDao();
    for(Instrutor ins:lista.getLista()){
        id = ins.getUsuario().getId();
        registro=ins.getRegistro();
        nome= ins.getNome();
        tel= ins.getTelefone();
        email=ins.getEmail();
        login=ins.getUsuario().getLogin();
        senha=ins.getUsuario().getSenha();
        permissao=ins.getUsuario().getPermissao();
        %>

<tr>
<td><%=id%></td>
<td><%=registro%></td>
<td><%=nome%></td>
<td><%=tel%></td>
<td><%=email%></td>
<td><%=login%></td>
<td><%=senha%></td>
<td><%=permissao%></td>
<td><a href="ControllerInstrutor.jsp?acao=remover&id=<%=id%>&login=<%=login%>&senha=<%=senha%>&permissao=<%=permissao%>&registro=<%=registro%>&acao=remover" class=" btn btn-danger">Remover</a></td>
<td><a href="FormInsEdit.jsp?tf_id=<%=id%>&tf_nome=<%=nome%>&tf_tel=<%=tel%>&tf_email=<%=email%>&tf_login=<%=login%>&tf_senha=<%=senha%>&tf_permissao=<%=permissao%>&tf_registro=<%=registro%>" class=" btn btn-info">Alterar</a></td>
</tr>
<%}%>

 
</table>
    </body>
</html>
