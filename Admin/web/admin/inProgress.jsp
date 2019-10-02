<%-- 
    Document   : enableRegClient
    Created on : 11 29, 18, 7:59:44 PM
    Author     : a.a
--%>

<%@page import="java.sql.*"%>
<%
  String rNo = request.getParameter("d");
  int no = Integer.parseInt(rNo);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_atttirerentals","root","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE transaction SET status='InProgress' where reservation_number='"+no+"'");
  response.sendRedirect("transactionMon.jsp");
%>
