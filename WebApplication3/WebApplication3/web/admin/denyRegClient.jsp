<%-- 
    Document   : denyRegClient
    Created on : 11 29, 18, 8:11:33 PM
    Author     : Gigabyte
--%>

<%@page import="java.sql.*"%>
<%
  String id = request.getParameter("d");
  int no = Integer.parseInt(id);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE client SET status='Denied' where client_id='"+no+"'");
  response.sendRedirect("manageUsers.jsp");
%>
