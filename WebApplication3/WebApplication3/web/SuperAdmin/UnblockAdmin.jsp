<%-- 
    Document   : UnblockAdmin
    Created on : Dec 2, 2018, 3:34:06 PM
    Author     : mark_
--%>

<%@page import="java.sql.*"%>
<%
  String id = request.getParameter("d");
  int no = Integer.parseInt(id);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE administrator SET status='Approved' where admin_id='"+no+"'");
  response.sendRedirect("SuperAdminBlockUsers.jsp");
%>
