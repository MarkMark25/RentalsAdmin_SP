<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://database.com:3306/weblove_attirerentals";%>
<%!String user = "weblab";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String username = request.getParameter("user");
String emailaddress = request.getParameter("email");
String firstname = request.getParameter("first");
String lastname = request.getParameter("last");
String address_line = request.getParameter("address");
String siti = request.getParameter("city");
String prabins = request.getParameter("province");
String postalcode = request.getParameter("postal");
String phoneno = request.getParameter("phone");
String real="";
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update administrator set username=?,firstname=?,lastname=?,phone_number=?,address_line=?,city=?,province=?,postal_code=?,email=? where admin_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, username);
ps.setString(2, firstname);
ps.setString(3, lastname);
ps.setString(4, phoneno);
ps.setString(5, address_line);
ps.setString(6, siti);
ps.setString(7, prabins);
ps.setString(8, postalcode);
ps.setString(9, emailaddress);
int i = ps.executeUpdate();
if(i > 0)
{
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Profile Updated.');");
    out.println("</script>");
    con.close();
    RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
    rs.include(request, response);
response.sendRedirect("profile.jsp");
}
else
{
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Something went wrong, try again later.');");
    out.println("</script>");
    con.close();
    RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
    rs.include(request, response);
} 
}
catch(Exception e)
{
out.println(e);
}
}
%>