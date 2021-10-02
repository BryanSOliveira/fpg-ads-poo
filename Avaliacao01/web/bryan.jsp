<%-- 
    Document   : bryan
    Created on : 2 de out. de 2021, 12:49:42
    Author     : spbry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/header-bootstrap.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <% if(sessionUsername != null) { %>
            <div class="container">
                <h1>Page Bryan</h1>
                <hr />
                <h2>RA: 1290482012005</h2>
                <h2>Bryan Santos de Oliveira</h2>
                <h2>Ingresso na FATEC-PG em 2020</h2>
                <h2></h2>
                <h2>GitHub: <a href="https://github.com/BryanSOliveira" target="_blank">BryanSOliveira</a></h2>
                <hr />
                <h2>Disciplinas em curso</h2>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Disciplina</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Programação Orientada a Objetos</td>
                      </tr>
                      <tr>
                        <td>Banco de Dados</td>
                      </tr>
                      <tr>
                        <td>Sistemas Operacionais II</td>
                      </tr>
                      <tr>
                        <td>Engenharia de Software III</td>
                      </tr>
                      <tr>
                        <td>Metodologia da Pesquisa Científico Tecnológica</td>
                      </tr>
                      <tr>
                        <td>Inglês IV</td>
                      </tr>
                    </tbody>
                  </table>
                  <hr />
            </div>
        <% } else { %>
            <div class="container">
                <hr />
                <div class="alert alert-danger" role="alert">
                    Você não tem permissão para ver este conteúdo.
                </div>
            </div>
        <% } %>
    </body>
</html>