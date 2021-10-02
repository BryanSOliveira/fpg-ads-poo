<%-- 
    Document   : bryan-mega-sena
    Created on : 2 de out. de 2021, 12:50:07
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
            <% 
                if(session.getAttribute("numerosAleatorios") == null) {
                    int numerosAleatorios[] = new int[6];
                    boolean status = false;
                    int j = 0, numeroAleatorio;
                    
                    while(numerosAleatorios[5] == 0) {
                            numeroAleatorio = ((int)(Math.random()*60));
                            
                            for(int i = 0; i < numerosAleatorios.length; i++) {
                                if(numerosAleatorios[i] == numeroAleatorio) {
                                    status = true;
                                }
                            }
                            
                            if(status == false) {
                                numerosAleatorios[j] = numeroAleatorio;
                                j++;
                            }
                            
                            status = false;
                        }
                    
                    session.setAttribute("numerosAleatorios", numerosAleatorios);
                }
                
                int aleatoriosGerados[] = (int[])session.getAttribute("numerosAleatorios");
            %>
            <div class="container">
                <h1>Dica mega-sena</h1>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Número</th>
                      </tr>
                    </thead>
                    <tbody>
                        <% for(int i = 0; i < aleatoriosGerados.length; i++) { %>
                            <tr>
                              <td><%= aleatoriosGerados[i] %></td>
                            </tr>
                        <% } %>
                    </tbody>
                  </table>
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
