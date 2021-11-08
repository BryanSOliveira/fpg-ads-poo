<%-- 
    Document   : index
    Created on : 8 de nov. de 2021, 15:36:06
    Author     : spbry
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Tasks"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    Exception requestException = null;
    ArrayList<String> taskList = new ArrayList<>();
    try {
        if(request.getParameter("add") != null) {
            String taskName = request.getParameter("taskName");
            Tasks.addTask(taskName);
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
        <title>JDBC - To-do list</title>
    </head>
    <body>
        <h1>JDBC - Bryan Santos</h1>
        <div><%= new Date() %></div>
        <h2>To-do list</h2>
        <% if(requestException != null) { %>
            <div style="color:red">
                Erro na leitura ou gravação de tarefas:
                <%= requestException.getMessage() %>
            </div>
        <% } %>
        <h3>Tarefas</h3>
        <form>
            <input type="text" name="taskName" />
            <input type="submit" name="add" value="Adicionar" />
        </form>
        <table>
            <%  for(String taskName: taskList) { %>
                <tr>
                    <td><%= taskName %></td>
                    <td>
                        <form>
                            <input type="hidden" name="taskName" value="<%= taskName %>" />
                            <input type="submit" name="remove" value="-" />
                                   
                        </form>
                    </td>
                </tr>
            <%  } %>
        </table>
    </body>
</html>
