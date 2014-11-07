<%-- 
    Document   : CadastrarAtendente
    Created on : 20/10/2014, 19:19:34
    Author     : academia
--%>

<%@page import="com.devacademia.model.Atendente"%>
<%@page import="com.devacademia.dao.AtendenteDao"%>
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
        <h1>Cadastrar Atendente!</h1>
        <div class="form-group">
                <label class="col-md-4 control-label" for="bt_cancel"></label>
                <div class="col-md-4">
                    <a href="FormAtdCad.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Novo Atendente</a>
                </div>
            </div>
<br /> <br />

<table class="table table-hover">
<tr>
<th>Id</th>
<th>Registro</th>
<th>Nome</th>
<th>Login</th>
<th>Senha</th>
<th>Permissao</th>
</tr>
<%
    int id;
    String nome;
    int registro;
    String login;
    String senha;
    Character permissao;
    AtendenteDao lista = new AtendenteDao();
    for(Atendente adt:lista.getLista()){
        id = adt.getUsuario().getId();
        nome= adt.getNome();
        registro=adt.getRegistro();
        login=adt.getUsuario().getLogin();
        senha=adt.getUsuario().getSenha();
        permissao=adt.getUsuario().getPermissao();
        %>

<tr>
<td><%=id%></td>
<td><%=registro%></td>
<td><%=nome%></td>
<td><%=login%></td>
<td><%=senha%></td>
<td><%=permissao%></td>
<td><a href="ControllerAtendente.jsp?acao=remover&id=<%=id%>&login=<%=login%>&senha=<%=senha%>&permissao=<%=permissao%>&acao=remover" class=" btn btn-danger">Remover</a></td>
<td><a href="FormAtdEdit.jsp?tf_id=<%=id%>&tf_nome=<%=nome%>&tf_registro=<%=registro%>&tf_login=<%=login%>&tf_senha=<%=senha%>&tf_permissao=<%=permissao%>" class=" btn btn-info">Alterar</a></td>
</tr>
<%}%>

 
</table>
    </body>
</html>
