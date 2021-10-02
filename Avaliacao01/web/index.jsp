<%-- 
    Document   : index
    Created on : 2 de out. de 2021, 12:37:13
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
        <div class="container">
            <h3>Quantidade de usuários online</h3>
            <% if(usuarios == null) { %>
                <div>0</div>
            <% } else { %>
            <div><%= usuarios.size() %></div>
            <% } %>
            
            <% if(sessionUsername != null) { %>
                <h3>Nome dos usuários online</h3>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Usuário</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% for(int i = 0; i < usuarios.size(); i++){ %>
                        <tr>
                            <td><%= usuarios.get(i) %></td>
                        </tr>
                      <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>
    </body>
</html>
