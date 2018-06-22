<%-- 
    Document   : getcon
    Created on : 2 Aug, 2017, 12:41:26 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sql connection</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %> 
<%!Statement st=null; 
%> 
<% 
            java.sql.Connection con ;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","");
            st=con.createStatement(); 
%> 
    </body>
</html>
