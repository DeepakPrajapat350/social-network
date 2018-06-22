<%-- 
    Document   : editdetails
    Created on : 3 Aug, 2017, 11:13:23 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Details</title>
    </head>
    <body>
        <%@ include file="getcon.jsp"%>
        <%      try
                {
                    String Fname = request.getParameter("fname");
                    String Lname = request.getParameter("lname");
                    String Mobile = request.getParameter("mno");
                    String Email = request.getParameter("email");
                    String Dob = request.getParameter("dob");
                    String Uname = request.getParameter("uname");
                    st.executeUpdate("update users set username = '"+Uname+"',Fname='"+Fname+"',Lname = '"+Lname+"',Mobile = '"+Mobile+"',Email = '"+Email+"',Dob = '"+Dob+"'where username= '"+session.getAttribute("Username") +"'");
                    session.setAttribute("Username", Uname);
                    session.setAttribute("fname", Fname);
                    session.setAttribute("lname", Lname);
                    session.setAttribute("email", Email);
                    session.setAttribute("mobile", Mobile);
                    session.setAttribute("dob", Dob);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Data Saved Successfully.');");
                    out.println("location='home.jsp';");
                    out.println("</script>");
                } 
                catch(Exception e)
                {
                    out.print("error" + e.getMessage());
                }
        %>
    </body>
</html>
