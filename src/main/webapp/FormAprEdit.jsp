<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ include file="Head.jsp" %>
      <%@include file="CabecalhoAdministrador.jsp" %>
      <form class="form-horizontal" action="ControllerAparelho.jsp" >
        <fieldset>

            <!-- Form Name -->
            <legend>Alterar Cadastro!</legend>
                 <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_codigo">Cogigo</label>  
                <div class="col-md-4">
                    <input id="tf_codigo" name="tf_codigo" type="text" value="<%=request.getParameter("tf_codigo")%>" class="form-control input-md" required="">

                </div>
            </div>
                 <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_descricao">Descrição</label>  
                <div class="col-md-4">
                    <input id="tf_descricao" name="tf_descricao" type="text" value="<%=request.getParameter("tf_descricao")%>" class="form-control input-md" required="">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_nf">NF</label>  
                <div class="col-md-4">
                    <input id="tf_nf" name="tf_nf" type="text" value="<%=request.getParameter("tf_nf")%>" class="form-control input-md" required="">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_quantidade">Quantidade</label>  
                <div class="col-md-4">
                    <input id="tf_quantidade" name="tf_quantidade" type="text" value="<%=request.getParameter("tf_quantidade")%>" class="form-control input-md" required="">

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

        </fieldset>
    </form>

