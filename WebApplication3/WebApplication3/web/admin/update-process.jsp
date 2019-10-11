<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://database.com:3306/weblove_attirerentals";%>
<%!String user = "weblab";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String city_name=request.getParameter("city_name");
String real="";
if(city_name.equals("Available")){
	real="1";
}else{
	real="0";
}
String email=request.getParameter("email");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update product set name=?,description=?,availability=?,rental_price=? where product_code="+id;
ps = con.prepareStatement(sql);
ps.setString(1, first_name);
ps.setString(2, last_name);
ps.setString(3, real);
ps.setString(4, email);
int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("adminShowServices.jsp");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>