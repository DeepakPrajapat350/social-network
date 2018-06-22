<%-- 
    Document   : jsp1
    Created on : 28 Jul, 2017, 10:07:38 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <%@ include file="getcon.jsp"%>
        <% 
           try{   
            ResultSet rs;
            String username= request.getParameter("username");
            String password = request.getParameter("password");
            rs = st.executeQuery("select * from users where username='" + username + "' and password='" + password + "'");
            if (rs.next()) 
            {
                String Id = rs.getString("id");
                String fname = rs.getString("Fname");
                String lname = rs.getString("Lname");
                String pro = rs.getString("profilepic");
                String cov = rs.getString("Coverpic");
                String pass = rs.getString("password");
                String em = rs.getString("Email");
                String dob = rs.getString("Dob");
                String mob = rs.getString("Mobile");
                session.setAttribute("Username", username);
                session.setAttribute("fname", fname);
                session.setAttribute("lname", lname);
                session.setAttribute("pro", pro);
                session.setAttribute("cov", cov);
                session.setAttribute("pass", pass);
                session.setAttribute("email", em);
                session.setAttribute("mobile", mob);
                session.setAttribute("dob", dob);
                response.sendRedirect("home.jsp");
            } 
            else 
            {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Username or Password!');");
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
