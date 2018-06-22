<%-- 
    Document   : forgotpassword2
    Created on : 7 Aug, 2017, 10:09:37 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password2</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %> 
        <%!     Statement st=null; 
                Connection cn=null; 
        %>
        <% 
        try
        {   java.sql.Connection con ;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","");
            st=con.createStatement();
            String pass= request.getParameter("pwd");
            String cpass = request.getParameter("cpwd");
            if(pass.equals(cpass))
            {
                st.executeUpdate("update users set password = '"+pass+"'where username='"+session.getAttribute("user")+"'"); 
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password Changed!');");
                out.println("location='index.html';");
                out.println("</script>");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password And Confirm Does not Match! Try Again.');");
                out.println("location='index.html';");
                out.println("</script>");
            }
        }
        catch(Exception e)
        {
            out.print("error" + e.getMessage());
        }
            
        %>
    </body>
</html>
