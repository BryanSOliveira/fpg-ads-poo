<%-- 
    Document   : tabela-price
    Created on : 13 de set. de 2021, 17:00:24
    Author     : spbry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String messageError = null;
    double valorPresente = 1000.0, prestacao = 0.0 ,juros = 0.0, amortizacao = 0.0, taxaJuros = 10.0;
    int periodo = 12, mes = 1;
    
    try {
        valorPresente = Double.parseDouble(request.getParameter("valorPresente"));
    } catch (Exception e) {
        messageError = "Erro: ao ler parâmetro, o valor presente '" + request.getParameter("valorPresente") + "' é inválido";
    }
    
    try {
        periodo = Integer.parseInt(request.getParameter("periodo"));
    } catch (Exception e) {
        messageError = "Erro: ao ler parâmetro, o periodo '" + request.getParameter("periodo") + "' é inválido";
    }
    
    try {
        taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
    } catch (Exception e) {
        messageError = "Erro: ao ler parâmetro, a taxa de juros '" + request.getParameter("taxaJuros") + "' é inválido";
    }
    
    try {
        taxaJuros /= 100;
        prestacao = valorPresente * ((Math.pow((1 + taxaJuros), periodo) * taxaJuros) / (Math.pow((1 + taxaJuros), periodo) - 1));
        prestacao = Math.round((prestacao * 100d) / 100d);
    } catch (Exception e) {
        messageError = "Erro: ao calcular a prestação";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <%@include file="WEB-INF/jspf/bootstrap-head.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
            <form class="row g-3">
                <div class="mb-2 col-md-2">
                    <label for="formGroupExampleInput" class="form-label">Valor Presente (R$)</label>
                    <input type="number" name="valorPresente" class="form-control" id="formGroupExampleInput" value="<%= valorPresente %>">
                </div>
                <div class="mb-2 col-md-2">
                    <label for="formGroupExampleInput2" class="form-label">Período (meses)</label>
                    <input type="number" name="periodo" class="form-control" id="formGroupExampleInput2" value="<%= periodo %>">
                </div>
                <div class="mb-2 col-md-2">
                    <label for="formGroupExampleInput2" class="form-label">Juros (%)</label>
                    <input type="number" name="taxaJuros" class="form-control" id="formGroupExampleInput2" step="0.01" value="<%= taxaJuros * 100 %>">
                </div>
                <div>
                    <input type="submit" value="Gerar"/>
                </div>
            </form>
        <% if(messageError == null) { %>
            <table class="table table-bordered border-primary mt-3">
                <tr>
                    <th>Período</th>
                    <th>Saldo Devedor</th>
                    <th>Parcela</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                </tr>
                <% while(valorPresente >= 0) { %>
                    <tr>
                        <td><%= mes++ %></td>
                        <% 
                            juros = Math.round(valorPresente * taxaJuros); 
                            amortizacao = Math.round(prestacao - juros);
                        %>
                        <td><%= valorPresente %></td>
                        <% 
                            valorPresente = Math.round(valorPresente - amortizacao);
                        %>
                        <td><%= prestacao %></td>
                        <td><%= juros %></td>
                        <td><%= amortizacao %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <div style="color: red"><%= messageError %></div>
        <% } %>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>