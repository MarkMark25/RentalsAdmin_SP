<%-- 
    Document   : BlockAdmin
    Created on : Dec 2, 2018, 5:31:14 PM
    Author     : mark_
--%>

<%@page import="java.sql.*"%>
<%
  String id = request.getParameter("d");
  int no = Integer.parseInt(id);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE administrator SET status='Disabled' where admin_id='"+no+"'");
  response.sendRedirect("RegisteredUser.jsp");
%>
