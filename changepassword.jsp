<%-- 
    Document   : changepassword
    Created on : 3 Aug, 2017, 12:23:37 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change password</title>
    </head>
    <body>
        <%@ include file="getcon.jsp"%>
        <%  try{
            String cpass = request.getParameter("cpassword") ;
            String npass = request.getParameter("npassword") ;
            String cnpass = request.getParameter("cnpassword") ;
            if(cpass.equals(session.getAttribute("pass")))
            {
               if(npass.equals(cnpass))
               {
                   st.executeUpdate("update users set password = '"+npass+"'where username= '"+session.getAttribute("Username") +"'"); 
                   out.println("<script type=\"text/javascript\">");
                    out.println("alert('Password Changed!');");
                    out.println("location='home.jsp';");
                    out.println("</script>");
               }
               else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('new password and confirm new password are not same!Please try again');");
                    out.println("location='home.jsp';");
                    out.println("</script>");
               }
            }
            else
            {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Current password Wrong!Please try again');");
                    out.println("location='home.jsp';");
                    out.println("</script>");
            }
        }
        catch(Exception e){
        out.print("error" + e.getMessage());
        }
            %>
    </body>
</html>
