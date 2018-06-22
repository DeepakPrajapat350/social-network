<%-- 
    Document   : forgotpassword
    Created on : 6 Aug, 2017, 7:19:52 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="w3.css">
        <script href="bootstrap/js/bootstrap.min.js"></script>
        <title>Forgot Password</title>
        <style>
            #label1,#label2{
                height: 30px;width: 150px;color: white;margin-bottom: 20px;
            }
            #input1,#input2{
                width: 200px;border: 2px solid purple;border-radius: 5px;height: 30px;margin-bottom: 20px;
            }
            #btn3{
                margin-left: 150px;height: 40px;width: 150px;
            }
        </style>
    </head>
    <body style="background-image:url('photo/pic90.jpg');background-repeat:no-repeat;background-size:100%;">
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
            ResultSet rs;
            String uname= request.getParameter("uname");
            String em = request.getParameter("email");
            rs = st.executeQuery("select * from users where username='" + uname + "' and Email='" + em + "'");
            if(rs.next()) 
            {
                String user = rs.getString("username");
                session.setAttribute("user", user);
            %>
            <div class="w3-container w3-transparent w3-display-topmiddle" style=" margin-top: 100px;">
           `    <h1 class="w3-center w3-text-white">Forgot Password :</h1>
                <form action="forgotpassword2.jsp" method="post" style="height: 300px;width: 500px; margin-left: 30px; margin-top: 50px;">
                    <label id="label1" >Enter New Password :</label><input id="input1" type="password" name="pwd" placeholder="New Password" style=" margin-left: 70px;"><br>
                    <label id="label2" >Confirm New Password : </label><input type="password" id="input2" name="cpwd" placeholder="Confirm New Password" style="margin-left: 45px;"><br>
                    <input id="btn3" type="submit" value="Confirm" class="w3-btn w3-round-large w3-grey w3-hover-purple">
                </form>
            </div>
            <%
            } 
            else 
            {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Username or Email!');");
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
