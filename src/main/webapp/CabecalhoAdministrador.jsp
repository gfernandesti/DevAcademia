<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <body style="background-color: yellowgreen">
        <br><br><br><br>

        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a href="Home.jsp"><img src="img/Titulo.PNG" /></a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                    <div class="btn-group pull-right">
                        <a class="btn btn-info dropdown-toggle" data-toggle="modal"
                           href="#LoginModal" style="margin-left: 150px">Bem Vindo, <%=session.getAttribute("userName")%></a>
                        <form action="Home.jsp" method="get"
                              style="float: right">
                            <input type="hidden" name="logoff" />
                            <button class="btn btn-danger dropdown-toggle" type="submit" >Sair</button>
                        </form>
                    </div>

                    <ul class="nav navbar-nav" style="margin-left: 0px">
                        <li class="btn-info"><a
                                data-toggle="modal" href="CadastrarAtendente.jsp">CadastrarAtendente</a></li>
                        <li class="btn-success" style="margin-left: 50px"><a
                                data-toggle="modal" href="CadastrarAluno.jsp">CadastrarAluno</a></li>
                        <li class="btn-warning" style="margin-left: 50px"><a
                                href="CadastrarAparelho.jsp">CadastrarAparelho</a></li>
                        <li class="btn-default" style="margin-left: 50px" ><a
                                data-toggle="modal" href="CadastrarInstrutor.jsp">CadastrarInstrutor</a></li>
                    </ul>
                </div>
        </div>
    </body>
</html>