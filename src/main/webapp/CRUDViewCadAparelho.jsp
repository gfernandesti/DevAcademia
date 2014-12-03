<%-- 
    Document   : CadastrarAtendente
    Created on : 20/10/2014, 19:19:34
    Author     : academia
--%>

<%@page import="com.devacademia.dao.AparelhoDao"%>
<%@page import="com.devacademia.model.Aparelho"%>
<%@page import="com.devacademia.dao.AparelhoDao"%>
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
        <h1>Cadastrar Aparelho!</h1>
        <div class="form-group">
                <label class="col-md-4 control-label" for="bt_cancel"></label>
                <div class="col-md-4">
                    <a href="FormAprCad.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Novo Aparelho</a>
                </div>
            </div>
<br /> <br />

<table class="table table-hover">
<tr>
<th>Id</th>
<th>Codigo</th>
<th>Descrição</th>
<th>NF</th>
<th>Quantidade</th>
</tr>
<%
    int id;
    int codigo;
    int quantidade;
    String descricao;
    String nf;

    AparelhoDao lista = new AparelhoDao();
    for(Aparelho apr:lista.getLista()){
        id = apr.getId();
        codigo=apr.getCodigo();
        quantidade=apr.getQuantidade();
        descricao= apr.getDescricao();
        nf= apr.getNotafiscal();
        %>

<tr>
<td><%=id%></td>
<td><%=codigo%></td>
<td><%=descricao%></td>
<td><%=nf%></td>
<td><%=quantidade%></td>

<td><a href="ControllerAparelho.jsp?acao=remover&id=<%=id%>&codigo=<%=codigo%>&quantidade=<%=quantidade%>&descricao=<%=descricao%>&nf=<%=nf%>&acao=remover" class=" btn btn-danger">Remover</a></td>
<td><a href="FormAprEdit.jsp?tf_id=<%=id%>&tf_codigo=<%=codigo%>&tf_quantidade=<%=quantidade%>&tf_descricao=<%=descricao%>&tf_nf=<%=nf%>" class=" btn btn-info">Alterar</a></td>
</tr>
<%}%>

 
</table>
    </body>
</html>
