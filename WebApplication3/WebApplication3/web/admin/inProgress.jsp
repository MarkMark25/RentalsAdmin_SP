<%-- 
    Document   : enableRegClient
    Created on : 11 29, 18, 7:59:44 PM
    Author     : a.a
--%>

<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%
  String rNo = request.getParameter("d");
  int no = Integer.parseInt(rNo);
  LocalDate today = LocalDate.now();
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE transaction SET status='InProgress', pickup_date='"+today+"' where reservation_number='"+no+"'");
  response.sendRedirect("transactionMon.jsp#inProgress");
%>
