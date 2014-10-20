<%-- 
    Document   : Teste
    Created on : 20/10/2014, 19:41:41
    Author     : academia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

        <script>
            $(document).ready(function() {
                var domContent = $("#content");

                $(".nav-link").click(function() {
                    domContent.load($(this).attr("href"));
                    return false;
                });
            });
        </script>

    </head>

    <body>
        <div id="header">
            <h1>Header</h1>
            <a class="nav-link" href="CadastrarAluno.jsp">Carrega P&aacute;gina teste.html</a> |
            <a class="nav-link" href="CadastrarAparelho.jsp">Carrega P&aacute;gina teste2.html</a>
            <hr />
        </div>

        <div id="content">
            Aqui sera carregado o conteudo
        </div>

        <div id="footer">
            <hr />
            <h6>FOOTER</h6>            
        </div>
    </body>
</html>
