<%-- 
    Document   : adminNewClientUser
    Created on : Nov 29, 2018, 5:56:18 PM
    Author     : a.a
--%>
<%@page import="java.sql.*"%>
<%
if (session.getAttribute( "Name" ) == null){
    response.sendRedirect("index.jsp");
}else {
  try{
  String x = request.getParameter("d");
  int no = Integer.parseInt(x);
  String newDesc = request.getParameter("e");
  String newPrice = request.getParameter("f");
  double h = Double.parseDouble(newPrice);
  //String newAvailability = request.getParameter("g");
  //int i = Integer.parseInt(newAvailability);
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals","weblab","");
  Statement stmt = conn.createStatement();
  stmt.executeUpdate("UPDATE product SET description='"+newDesc+"' where product_code='"+no+"'");
  response.sendRedirect("adminShowServices.jsp");
      
  }catch(Exception e){
      out.print(e);
  }
}
%>