<%-- 
    Document   : terminateTransac
    Created on : 12 2, 18, 5:57:09 PM
    Author     : Gigabyte
--%>

<%@page import="java.sql.*"%>
<%
  String rNo = request.getParameter("code");
  int no = Integer.parseInt(rNo);
  String name = request.getParameter("name");
  String description = request.getParameter("desc");
  String availability = request.getParameter("avail");
  int avail = Integer.parseInt(availability);
  String price = request.getParameter("price");
  double pri = Double.parseDouble(price);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE product SET name='"+name+"', description='"+description+"', availability='"+avail+"', rental_price='"+pri+"' where product_code='"+no+"'");
  response.sendRedirect("adminShowServices.jsp");
%>
