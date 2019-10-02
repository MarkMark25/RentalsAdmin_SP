<%-- 
    Document   : insertRegistration
    Created on : Dec 6, 2018, 2:37:37 AM
    Author     : mark_
--%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String inputEmail=request.getParameter("inputEmail");
String userName=request.getParameter("userName");
String inputPassword=request.getParameter("inputPassword");
String confirmPassword=request.getParameter("confirmPassword");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String phoneNumber=request.getParameter("phoneNumber");
String address=request.getParameter("address");
String city=request.getParameter("city");
String province=request.getParameter("province");
String postalCode=request.getParameter("postalCode");

MessageDigest alg = MessageDigest.getInstance("MD5");
alg.reset(); 
alg.update(confirmPassword.getBytes());
byte[] digest = alg.digest();
StringBuffer hashedpasswd = new StringBuffer();
String hx;
for (int i=0;i<digest.length;i++){
	hx =  Integer.toHexString(0xFF & digest[i]);
	if(hx.length() == 1){hx = "0" + hx;}
	hashedpasswd.append(hx);
}
String passwordhashed = hashedpasswd.toString();
    if(inputPassword==null && confirmPassword==null){
        response.sendRedirect("register.jsp");
    }else if(!inputPassword.equals(confirmPassword)){
        request.setAttribute("errorMessage", "Password Unmatch");
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
    }else {
        if(inputPassword.equals(confirmPassword)){
            try{
             Class.forName("com.mysql.jdbc.Driver");
               Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_atttirerentals?" + "user=weblab&password=");   
               String sql ="INSERT INTO administrator (username, password,firstname,lastname,phone_number,address_line,city,province,postal_code,email) values (?,?,?,?,?,?,?,?,?,?)";

               PreparedStatement statement = conn.prepareStatement(sql);
               statement.setString(1,userName);
               statement.setString(2,passwordhashed);
               statement.setString(3,firstName);
               statement.setString(4,lastName);
               statement.setString(5,phoneNumber);
               statement.setString(6,address);
               statement.setString(7,city);
               statement.setString(8,province);
               statement.setString(9,postalCode);
               statement.setString(10,inputEmail);

               statement.executeUpdate();
                //request.setAttribute("errorMessage1", "Registered Successfuly, wait for the confirmation of the Super Admin in order to login. Note: It takes sometimes!");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            }   
            catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
            }
        }else {

        }
    }
        %>
