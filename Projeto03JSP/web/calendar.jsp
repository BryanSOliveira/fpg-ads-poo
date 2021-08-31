<%-- 
    Document   : calendar
    Created on : 30 de ago. de 2021, 18:13:57
    Author     : spbry
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String messageError = null, titleMes = "01", titleAno = "2021";
    int mes = 0, ano = 0;
    
    try {
        mes = Integer.parseInt(request.getParameter("mes"));
        if(request.getParameter("mes").length() == 1) {
            titleMes = "0" + request.getParameter("mes");
        } else {
            titleMes = request.getParameter("mes");
        }
    } catch (Exception e) {
        messageError = "Erro: o mês '" + request.getParameter("mes") + "' é inválido"; 
    }
    
    try {
        ano = Integer.parseInt(request.getParameter("ano"));
        titleAno = request.getParameter("ano");
    } catch (Exception e) {
        messageError = "Erro: o ano '" + request.getParameter("ano") + "' é inválido"; 
    }
    
    boolean anoBissexto = (((ano % 4 == 0) && (ano % 100 != 0)) || (ano % 400 == 0)) ? true : false;
    int[] tamanhoMeses= {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if(anoBissexto) {
        tamanhoMeses[1] = 29;
    }    
    
    // Cálculo para descobrir o dia da semana em que o mês começa
    int dayWeek = ano + 1 + 3 * (mes - 1) - 1;
    if (mes < 3) {
        ano --;
    } else {
        dayWeek -= ((int)(0.4 * mes + 2.3));
    }
    
    dayWeek += ((int)(ano / 4) - ((int)((ano / 100 + 1) * 0.75))); 
    dayWeek %= 7;
    dayWeek += 1;
    
    // Contador de células para adicionar uma nova linha a cada 7 células
    int contCelulas = 0;
%>
<html>
    <head>
        <title>Projeto - Calendário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-1">
            <a href="index.html">Voltar</a>
            <h1>Calendário <%= titleMes %>/<%= titleAno %></h1>
            <% if(messageError == null) { %>
                <table class="table table-bordered border-primary">
                    <tr>
                        <th>Domingo</th>
                        <th>Segunda-Feira</th>
                        <th>Terça-Feira</th>
                        <th>Quarta-Feira</th>
                        <th>Quinta-Feira</th>
                        <th>Sexta-Feira</th>
                        <th>Sábado</th>
                    </tr>
                    <tr>
                        <% 
                        for(int j = 1; j < dayWeek; j++) { 
                            contCelulas++; 
                        %>
                            <td></td>
                        <% } 
                        for(int i = 1; i <= tamanhoMeses[mes - 1]; i++) { 
                            contCelulas++;
                            if(i < 10) { %>
                                <td>0<%= i %></td>
                            <% } else { %>
                                <td><%= i %></td>
                            <% } 
                            if(contCelulas % 7 == 0) { %>
                                <tr></tr>
                            <% } 
                        } 
                        while(contCelulas % 7 != 0) { %>
                            <td></td>
                            <% contCelulas++; 
                        } %>
                    </tr>
                </table>
            <% } else { %>
                <div style="color: red"><%= messageError %></div>
            <% } %>
        </div>
    </body>
</html>