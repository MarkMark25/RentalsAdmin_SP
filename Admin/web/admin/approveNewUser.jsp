<%-- 
    Document   : adminNewClientUser
    Created on : Nov 29, 2018, 5:56:18 PM
    Author     : a.a
--%>
<%@page import="java.sql.*"%>
<%
  String id = request.getParameter("d");
  int no = Integer.parseInt(id);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_atttirerentals","root","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE client SET status='Approved' where client_id='"+no+"'");
  response.sendRedirect("manageUsers.jsp");
%>