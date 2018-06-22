<%-- 
    Document   : logout
    Created on : 2 Aug, 2017, 10:16:48 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
        <%
                session.setAttribute("Username", null);
                session.setAttribute("fname", null);
                session.setAttribute("lname", null);
                session.invalidate();
                response.sendRedirect("index.html");
        %>
    </body>
</html>
