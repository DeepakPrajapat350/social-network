<%-- 
    Document   : profile
    Created on : 31 Jul, 2017, 11:31:46 PM
    Author     : Deepak
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile</title>
    </head>
    <body>
        <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %> 
        <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%> 
        <%@ page import="org.apache.commons.fileupload.*"%> 
        <%@ page import="java.util.*, java.io.*" %> 
        <%@ page import="java.util.Iterator"%> 
        <%@ page import="java.util.List"%> 
        <%@ page import="java.io.File"%> 
        <%@ include file="getcon.jsp"%><!-- to connect a database--> 
    <% 
    try 
    { 
        String ImageFile=""; 
        String itemName = ""; 
        boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
        if (!isMultipart) 
        { 
        } 
        else 
        { 
            FileItemFactory factory = new DiskFileItemFactory(); 
            ServletFileUpload upload = new ServletFileUpload(factory); 
            List items = null; 
            try 
            { 
                items = upload.parseRequest(request); 
            } 
            catch (FileUploadException e) 
            { 
                e.getMessage(); 
            } 
            Iterator itr = items.iterator(); 
            while (itr.hasNext()) 
            { 
                FileItem item = (FileItem) itr.next(); 
                if (item.isFormField()) 
                { 
                    String name = item.getFieldName(); 
                    String value = item.getString(); 
                    if(name.equals("ImageFile")) 
                    { 
                        ImageFile=value; 
                    } 
                } 
                else 
                { 
                    try 
                    { 
                        itemName = item.getName(); 
                        File savedFile = new File("C:/Users/deepa/Documents/NetBeansProjects/socialnetwork/web/photo", itemName); 
                        item.write(savedFile); 
                    } 
                    catch (Exception e) 
                    { 
                        out.println("Error"+e.getMessage()); 
                    } 
                } 
            } 
            try 
            { 
              st.executeUpdate("update users set profilepic = '"+itemName+"'where username= '"+session.getAttribute("Username") +"'"); 
                ResultSet rs=null; 
                rs=st.executeQuery("select profilepic from users where username='"+session.getAttribute("Username")+"'"); 
                while(rs.next()) 
                {   String pic = rs.getString("profilepic");
                    session.setAttribute("pro", pic);
                }
                    response.sendRedirect("home.jsp");
            } 
            catch(Exception el) 
            { 
                out.println("Inserting error"+el.getMessage()); 
            } 
        } 
    } 
    catch (Exception e){ 
        out.println(e.getMessage()); 
    } 
    %> 
    </body>
</html>
