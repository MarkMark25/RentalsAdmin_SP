<%-- 
    Document   : successTransac
    Created on : 12 8, 18, 5:29:39 PM
    Author     : Gigabyte
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.*"%>
<%
  String rNo = request.getParameter("d");
  int no = Integer.parseInt(rNo);
  LocalDate today = LocalDate.now();
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE transaction SET status='Success', return_date='"+today+"' where reservation_number='"+no+"'");
  response.sendRedirect("transactionMon.jsp#success");
%>
