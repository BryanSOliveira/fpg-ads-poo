<%-- 
    Document   : about
    Created on : 20 de set. de 2021, 17:05:17
    Author     : t2s-user-cod197
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre</title>
        <%@include file="WEB-INF/jspf/bootstrap-head.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <% if(sessionUsername == null) { %>
        <p class="alert alert-danger" role="alert">Permissão negada. Inicie uma sessão para ver este conteúdo.</p>
        <% } else { %>
            <h2>Bryan Santos de Oliveira</h2>
            <h3>RA: 1290482012005</h3>
            <h3>Github: <a href="https://github.com/BryanSOliveira" target="_blank">github.com/BryanSOliveira</a></h3>
        <% } %>
        
        </div>
    </body>
</html>
