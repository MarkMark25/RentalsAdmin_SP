<%-- 
    Document   : terminateTransac
    Created on : 12 2, 18, 5:57:09 PM
    Author     : Gigabyte
--%>

<%@page import="java.sql.*"%>
<%
  String rNo = request.getParameter("d");
  int no = Integer.parseInt(rNo);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_atttirerentals","root","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE transaction SET status='Terminated' where reservation_number='"+no+"'");
  response.sendRedirect("transactionMon.jsp");
%>
