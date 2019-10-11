<%-- 
    Document   : exist
    Created on : Jan 4, 2019, 12:22:39 PM
    Author     : mark_
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals?" + "user=weblab&password=");
        PreparedStatement ps = con.prepareStatement("SELECT  * FROM administrator WHERE " + "username = ?");
        ps.setString(1,request.getParameter("userName"));
        ResultSet res = ps.executeQuery();
        if(res.first()){
            out.println("<font color=red>");
            out.print(""+request.getParameter("userName")+" is already in use");
        }else{
            out.println("<font color=green>");
            out.print(""+request.getParameter("userName")+" is available");
        }
    }catch (Exception e){
        System.out.println(e);  
    }


%>
