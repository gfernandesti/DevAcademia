<%-- 
    Document   : FormTreinoCad
    Created on : 07/11/2014, 13:25:43
    Author     : academia
--%>

<%@page import="com.devacademia.model.Instrutor"%>
<%@page import="com.devacademia.dao.InstrutorDao"%>
<%@page import="com.devacademia.model.Aparelho"%>
<%@page import="com.devacademia.dao.AparelhoDao"%>
<%@page import="com.devacademia.model.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="com.devacademia.dao.AlunoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ include file="Head.jsp" %>
    <%@include file="CabecalhoAdministrador.jsp" %>
    <form class="form-horizontal" action="ControllerTreino.jsp">
        <fieldset>

            <!-- Form Name -->
            <legend>Cadastrar Treino!</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tf_descricao">Descrição</label>  
                <div class="col-md-6">
                    <input id="tf_descricao" name="tf_descricao" type="text" placeholder="descrição.." class="form-control input-md" required="">

                </div>
            </div>

            <!-- Multiple Radios (inline) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="rd_sequencia">Sequência</label>
                <div class="col-md-4"> 
                    <label class="radio-inline" for="rd_sequencia-0">
                        <input type="radio" name="rd_sequencia" id="rd_sequencia-0" value="5" checked="checked">
                        5
                    </label> 
                    <label class="radio-inline" for="rd_sequencia-1">
                        <input type="radio" name="rd_sequencia" id="rd_sequencia-1" value="10">
                        10
                    </label> 
                    <label class="radio-inline" for="rd_sequencia-2">
                        <input type="radio" name="rd_sequencia" id="rd_sequencia-2" value="15">
                        15
                    </label> 
                    <label class="radio-inline" for="rd_sequencia-3">
                        <input type="radio" name="rd_sequencia" id="rd_sequencia-3" value="20">
                        20
                    </label>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="sl_grupomuscular">GrupoMuscular</label>
                <div class="col-md-5">
                    <select id="sl_grupomuscular" name="sl_grupomuscular" class="form-control">
                        <option value="Braço">Braço</option>
                        <option value="Perna">Perna</option>
                        <option value="Ombro">Ombro</option>
                        <option value="Costas">Costas</option>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="sl_exercicio">Exercício</label>
                <div class="col-md-5">
                    <select id="sl_exercicio" name="sl_exercicio" class="form-control">
                        <option value="Supino">Supino</option>
                        <option value="Trapézio">Trapézio</option>
                        <option value="Peck Deck">Peck Deck</option>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="sl_aparelho">Aparelho</label>
                <div class="col-md-5">
                    <select id="sl_aparelho" name="sl_aparelho" class="form-control">
                        <%AparelhoDao apa = new AparelhoDao();
                            List<Aparelho> lista = apa.getLista();
                            for (Aparelho aparelho : lista) {
                        %>

                        <option value="<%=aparelho.getId()%>"><%=aparelho.getDescricao()%></option>
                        <%}%>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="sl_aluno">Aluno</label>
                <div class="col-md-5">
                    <select id="sl_aluno" name="sl_aluno" class="form-control">
                        <%AlunoDao alu = new AlunoDao();
                            List<Aluno> lista2 = alu.getLista();
                            for (Aluno aluno : lista2) {
                        %>
                        <option value="<%=aluno.getId()%>"><%=aluno.getNome()%></option>
                        <%}%>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="sl_instrutor">Instrutor</label>
                <div class="col-md-4">
                    <select id="sl_instrutor" name="sl_instrutor" class="form-control">
                        <%InstrutorDao ins = new InstrutorDao();
                            List<Instrutor> lista3 = ins.getLista();
                            for (Instrutor instrutor : lista3) {
                        %>
                        <option value="<%=instrutor.getId()%>"><%= instrutor.getNome()%></option>
                        <%}%>
                    </select>
                </div>
            </div>

            <!-- Multiple Radios (inline) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="rb_dia">Dia</label>
                <div class="col-md-4"> 
                    <label class="radio-inline" for="rb_dia-0">
                        <input type="radio" name="rb_dia" id="rb_dia-0" value="Segunda" checked="checked">
                        Segunda
                    </label> 
                    <label class="radio-inline" for="rb_dia-1">
                        <input type="radio" name="rb_dia" id="rb_dia-1" value="Terça">
                        Terça
                    </label> 
                    <label class="radio-inline" for="rb_dia-2">
                        <input type="radio" name="rb_dia" id="rb_dia-2" value="Quarta">
                        Quarta
                    </label> 
                    <label class="radio-inline" for="rb_dia-3">
                        <input type="radio" name="rb_dia" id="rb_dia-3" value="Quinta">
                        Quinta
                    </label>
                </div>
            </div>

            <!-- Text input-->
           <!-- <div class="form-group">
                <label class="col-md-4 control-label" for="tf_horario">Horário</label>  
                <div class="col-md-4">
                    <input id="tf_horario" name="tf_horario" type="text" placeholder="horário.." class="form-control input-md">

                </div>
            </div>
           -->


            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="bt_enviar"></label>
                <div class="col-md-4">
                    <button id="bt_add" name="acao" class="btn btn-primary" value="adicionar">Adicionar</button>
                    <a href="Home.jsp" id="bt_add" name="cancel" class="btn btn-primary"  >Cancelar</a>
                </div>
            </div>

        </fieldset>
    </form>

