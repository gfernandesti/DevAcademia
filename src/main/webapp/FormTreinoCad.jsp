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
            <!-- Form Name -->
            <h2>Cadastrar Treino!</h2>
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
                    <label class="radio-inline" for="rb_dia-3">
                        <input type="radio" name="rb_dia" id="rb_dia-3" value="Sexta">
                        Sexta
                    </label>
                    <label class="radio-inline" for="rb_dia-3">
                        <input type="radio" name="rb_dia" id="rb_dia-3" value="Sábado">
                        Sabado
                    </label>
                    <label class="radio-inline" for="rb_dia-3">
                        <input type="radio" name="rb_dia" id="rb_dia-3" value="Domingo">
                        Domingo
                    </label>
                </div>
            </div>

            <!-- Tabela Dinamica Cadastro Exercício-->
            <h3 align="center">Grade de Exercícios</h3>
            <hr />
            <div class="table-responsive">
                <table id="products-table" class="table table-hover table-bordered">
                    <tbody>
                        <tr>
                            <th>Descrição</th>
                            <th>Série</th>
                            <th>Repetições</th>
                            <th>GrupoMuscular</th>
                            <th class="actions">Ações</th>
                        </tr>
                        <tr>
                            <td><select id="sl_descricao" name="sl_descricao" class="form-control">
                                    <option value="Perna Estendida">Perna Estendida</option>
                                    <option value="Leg Press Inclinado">Leg Press Inclinado</option>
                                    <option value="Supino Reto">Supino Reto</option>
                                    <option value="Elevação Frontal">Elevação Frontal</option>
                                    <option value="Crucifixo (ou Fly)">Crucifixo (ou Fly)</option>
                                    <option value="Remada Unilateral">Remada Unilateral</option>
                                    <option value="Triângulo e Polia Alta">Triângulo e Polia Alta</option>
                                </select></td>
                            <td> <select id="sl_serie" name="sl_serie" class="form-control">
                                    <option value="5">1</option>
                                    <option value="10">2</option>
                                    <option value="15">3</option>
                                    <option value="20">4</option>
                                </select></td>
                            <td><select id="sl_repeticao" name="sl_repeticao" class="form-control">
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                </select></td>
                            <td><select id="sl_grupomuscular" name="sl_grupomuscular" class="form-control">
                                    <option value="Braço">Braço</option>
                                    <option value="Perna">Perna</option>
                                    <option value="Ombro">Ombro</option>
                                    <option value="Costas">Costas</option>
                                </select></td>
                            <td class="actions">
                                <button class="btn btn-large btn-danger" onclick="RemoveTableRow(this)" type="button">Remover</button>
                            </td>
                        </tr>

                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" style="text-align: left;">
                                <button class="btn btn-large btn-success" onclick="AddTableRow(this)" type="button">Adicionar Exercício</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>



            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="bt_enviar"></label>
                <div class="col-md-4">
                    <button id="bt_add" name="acao" class="btn btn-primary" value="adicionar">SalvarTreino</button>
                    <a href="PagAdministrador.jsp?acao=treino" id="bt_add" name="cancel" class="btn btn-primary"  >Cancelar</a>
                </div>
            </div>

        </fieldset>
    </form>
