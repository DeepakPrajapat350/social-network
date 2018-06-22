<%-- 
    Document   : signup
    Created on : 29 Jul, 2017, 9:07:21 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signup</title>
    </head>
    <%@ include file="getcon.jsp"%>
    <% 
        try
        {
            String Fname = request.getParameter("fname");
            String Lname = request.getParameter("lname");
            String Mobile = request.getParameter("mno");
            String Email = request.getParameter("email");
            String Password = request.getParameter("pwd");
            String Dob = request.getParameter("dob");
            String Gender = request.getParameter("gender");
            String Uname = request.getParameter("uname");
            PreparedStatement pst;
            ResultSet rs,rs2;
            String query = "select * from users where username='"+Uname+"'";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery(query);
            if(rs.next())
            {   out.println("<script type=\"text/javascript\">");
                out.println("alert('Username already exist!Please try another.');");
                out.println("location='index.html';");
                out.println("</script>");
            }
            else
            {
                String query1 = "INSERT INTO `users`(`Fname`,`Lname`,`Mobile`,`Email`,`username`, `password`,`Dob`,`Gender`,`profilepic`,`Coverpic`) VALUES (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement s = con.prepareStatement(query1);
                s.setString(1, Fname);
                s.setString(2, Lname);
                s.setString(3, Mobile);
                s.setString(4, Email);
                s.setString(5, Uname);
                s.setString(6, Password);
                s.setString(7, Dob);
                s.setString(8, Gender);
                s.setString(9, "");
                s.setString(10, "");
                s.execute();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registration successful.Please Login To Your account.');");
                out.println("location='index.html';");
                out.println("</script>");
            }
        }
        catch(Exception e){
            out.print("error1" + e.getMessage());
        }
    %>
</html>
