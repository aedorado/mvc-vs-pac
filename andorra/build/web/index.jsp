<%-- 
    Document   : index
    Created on : 11 Apr, 2017, 6:08:21 PM
    Author     : dorado
--%>

<%
    if (session.getAttribute("username") == null) {
//        out.println("hello");
        response.sendRedirect("login.jsp"); 
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--<jsp:useBean id="user" scope="session" class="model.UserBean" />--%>
<%--<jsp:setProperty name="user" property="username" value="Anurag" />--%>
<%--<jsp:getProperty name="user" property="username" />--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
    </head>
    <body>
        <h1>Hello <% out.println(session.getAttribute("username")); %>!</h1>
    </body>
</html>