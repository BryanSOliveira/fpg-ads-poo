<%-- 
    Document   : index
    Created on : 25 de out. de 2021, 14:50:07
    Author     : t2s-user-cod197
--%>

<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data padrão = new Data();
    
    Data hoje = new Data();
    hoje.setDia(25);
    hoje.setMês(10);
    hoje.setAno(2021);
    
    Data bryanNiver = new Data(26, 2, 2002);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data - Java OO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>CLASSE DATA</h2>
        <h3>Data padrão da classe:</h3>
        <div><%= padrão.getDia() %>/<%= padrão.getMês() %>/<%= padrão.getAno() %></div>
        <h3>Data de hoje:</h3>
        <div><%= hoje.getData() %></div>
        <h3>Aniversário do Bryan Santos:</h3>
        <div><%= bryanNiver.getData() %></div>
    </body>
</html>