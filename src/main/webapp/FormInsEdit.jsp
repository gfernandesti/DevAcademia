<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ include file="Head.jsp" %>
    <%@include file="CabecalhoAdministrador.jsp" %>
   
    <form class="form-horizontal" action="ControllerInstrutor.jsp" >
        <fieldset>

            <!-- Form Name -->
            <legend>Alterar Cadastro!</legend>
            
             <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_registro">Registro</label>  
                <div class="col-md-4">
                    <input id="tf_registro" name="tf_registro" type="text" value="<%=request.getParameter("tf_registro")%>"  class="form-control input-md" required="">

                </div>
            </div>
           
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_nome">Nome</label>  
                <div class="col-md-4">
                    <input id="tf_nome" name="tf_nome" type="text" value="<%=request.getParameter("tf_nome")%>"  class="form-control input-md" required="">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_tel">Telefone</label>  
                <div class="col-md-4">
                    <input id="tf_tel" name="tf_tel" type="text" value="<%=request.getParameter("tf_tel")%>" class="form-control input-md" required="">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_email">Email</label>  
                <div class="col-md-5">
                    <input id="tf_email" name="tf_email" type="text" value="<%=request.getParameter("tf_email")%>" class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_login">Login</label>  
                <div class="col-md-4">
                    <input id="tf_login" name="tf_login" type="text" value="<%=request.getParameter("tf_login")%>" class="form-control input-md" required="">

                </div>
            </div>

            <!-- Password input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_senha">Senha</label>
                <div class="col-md-4">
                    <input id="tf_senha" name="tf_senha" type="password" value="<%=request.getParameter("tf_senha")%>" class="form-control input-md" required="">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_permissao">Permissão</label>  
                <div class="col-md-4">
                    <input id="tf_permissao" name="tf_permissao" type="text" value="<%=request.getParameter("tf_permissao")%>" class="form-control input-md" required="">
                    <span class="help-block">Ex:A(atendente)M(admin)S(aluno)I(instrutor)</span>  
                </div>
            </div>
                    <input type="hidden" name="tf_id" value="<%=request.getParameter("tf_id")%>">

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="bt_add"></label>
                <div class="col-md-4">
                    <button id="bt_add" name="acao" class="btn btn-primary" value="alterar">Adicionar</button>
                     <a href="Home.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Cancelar</a>
                </div>
            </div>
            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="bt_cancel"></label>
                <div class="col-md-4">
                   
                </div>
            </div>

        </fieldset>
    </form>

