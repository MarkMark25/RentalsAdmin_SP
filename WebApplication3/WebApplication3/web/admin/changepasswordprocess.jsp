<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.security.MessageDigest"%>

<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://database.com:3306/weblove_attirerentals";%>
<%!String user = "weblab";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String oldpassword = request.getParameter("newpass");
String newpassword = request.getParameter("newconpass");

if(id != null && (oldpassword.equals(newpassword)))
{
MessageDigest alg = MessageDigest.getInstance("MD5");
alg.reset(); 
alg.update(newpassword.getBytes());
byte[] digest = alg.digest();
StringBuffer hashedpasswd = new StringBuffer();
String hx;
    for (int i=0;i<digest.length;i++){
            hx =  Integer.toHexString(0xFF & digest[i]);
            if(hx.length() == 1){hx = "0" + hx;}
            hashedpasswd.append(hx);
    }
String newpasshashed = hashedpasswd.toString();
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update administrator set password=? where admin_id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, newpasshashed);
int i = ps.executeUpdate();
if(i > 0)
{
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Password Changed.');");
    out.println("</script>");
    con.close();
    RequestDispatcher rs = request.getRequestDispatcher("changepassword.jsp");
    rs.include(request, response);
}
else
{
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Something went wrong, please try again later.');");
    out.println("</script>");
    con.close();
    RequestDispatcher rs = request.getRequestDispatcher("changepassword.jsp");
    rs.include(request, response);
} 
}
catch(Exception e)
{
out.println(e);
}
}
%>