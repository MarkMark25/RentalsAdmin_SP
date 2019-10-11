<%-- 
    Document   : deleteRegClient
    Created on : 11 29, 18, 5:36:18 PM
    Author     : a.a
--%>

<%@page import="java.sql.*"%>
<%
  String id = request.getParameter("d");
  int no = Integer.parseInt(id);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE client SET status='Disabled' where client_id='"+no+"'");
  response.sendRedirect("manageUsers.jsp");
%>
