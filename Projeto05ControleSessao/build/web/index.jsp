<%-- 
    Document   : index
    Created on : 20 de set. de 2021, 17:04:03
    Author     : t2s-user-cod197
--%>
<% int qtd = 1; %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="WEB-INF/jspf/bootstrap-head.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <% if(sessionUsername == null && sessionPassword == null) { %>
            <p class="alert alert-danger" role="alert">Permissão negada. Inicie uma sessão para ver este conteúdo.</p>
        <% } else { %>
            <h2>Seus Números Aleatórios</h2>
            <table class="table table-bordered border-primary">
                <%
                    if(session.getAttribute("numerosAleatorios") == null) {
                        int numerosAleatorios[] = new int[6];
                        qtd = 1;
                        for(int i = 0; i <= 5 ; i++) {
                            int numAleatorio = ((int)(Math.random() * 100)) - 50; 
                            numerosAleatorios[i] = numAleatorio;
                        }
                        session.setAttribute("numerosAleatorios", numerosAleatorios); 
                    }
                %>
                <% for(int i = 0; i <= 5 ; i++) { %>
                    <tr>
                        <th><%= qtd++ %></th>
                        <td>
                            <% int aleatoriosGerados[] = (int[])session.getAttribute("numerosAleatorios"); %>
                            <%= aleatoriosGerados[i] %>
                        </td>
                    </tr>
                <% } %>
            </table>
        <% } %>
        <h2></h2>
        
        </div>
    </body>
</html>