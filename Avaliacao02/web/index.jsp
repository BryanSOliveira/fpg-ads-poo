<%-- 
    Document   : index
    Created on : 22 de nov. de 2021, 15:27:52
    Author     : spbry
--%>

<%@page import="db.Tasks"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception requestException = null;
    ArrayList<Tasks> taskList = new ArrayList<>();
    try {
        if(request.getParameter("add") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.addTask(taskName, (String) session.getAttribute("username"));
            response.sendRedirect(request.getRequestURI());
        }
        if(request.getParameter("remove") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.removeTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        taskList = Tasks.getTasks();
    } catch (Exception ex) {
        requestException = ex;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BryanTaksApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header-bootstrap.jspf" %>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container">
            <% if(requestException != null) { %>
                <div style="color:red">
                    Erro na leitura ou gravação de tarefas:
                    <%= requestException.getMessage() %>
                </div>
            <% } %>
        
            <% if(sessionUsername !=  null) { %>
                <h2>Tarefas</h2>
                <form>
                    <input type="text" name="taskName" />
                    <input type="submit" name="add" value="Adicionar" />
                </form>
                <table class="table mt-2">
                    <tr>
                        <th>ID</th>
                        <th>Usuário</th>
                        <th>Tarefa</th>
                        <th>Remover</th>
                    </tr>
                    <%  for(Tasks taskName: taskList) { %>
                        <tr>
                            <td><%= taskName.getRowId() %></td>
                            <td><%= taskName.getUser() %></td>
                            <td><%= taskName.getTitle() %></td>
                            <td>
                                <form>
                                    <input type="hidden" name="taskName" value="<%= taskName.getTitle() %>" />
                                    <input type="submit" name="remove" value="-" />
                                </form>
                            </td>
                        </tr>
                    <%  } %>
                </table>
            <% } else { %>
                <div class="mt-2">Para visualizar o conteúdo, é necessário a identificação.</div>
            <% } %>
        </div>
    </body>
</html>
