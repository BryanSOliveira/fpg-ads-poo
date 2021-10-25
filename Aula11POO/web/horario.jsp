<%-- 
    Document   : index
    Created on : 25 de out. de 2021, 14:50:07
    Author     : t2s-user-cod197
--%>

<%@page import="model.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Horario atual = new Horario();
    Horario intervalo = new Horario(16, 40, 0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horario - Java OO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>CLASSE HORARIO</h2>
        <h3>Horário atual:</h3>
        <div><%= atual.getHorario() %></div>
        <h3>Horário do intervalo:</h3>
        <div><%= intervalo.getHorario() %></div>
    </body>
</html>