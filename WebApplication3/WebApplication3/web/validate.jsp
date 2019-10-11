<%-- 
    Document   : validate
    Created on : Nov 27, 2018, 8:54:24 PM
    Author     : mark_
--%>

<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("email");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    MessageDigest alg = MessageDigest.getInstance("MD5");
    alg.reset(); 
    alg.update(password.getBytes());
    byte[] digest = alg.digest();
    StringBuffer hashedpasswd = new StringBuffer();
    String hx;
    for (int i=0;i<digest.length;i++){
            hx =  Integer.toHexString(0xFF & digest[i]);
            if(hx.length() == 1){hx = "0" + hx;}
            hashedpasswd.append(hx);
    }
    String passwordhashed = hashedpasswd.toString();
    
    if ((username == null) || (password == null) || (email == null) ){
        response.sendRedirect("index.jsp");
    }else {
        try{
 
            String firstname="";
            String lastname="";
            String user="";
            String emailaddress="";
            String address_li="";
            String cit="";
            String provinc="";
            String postal_cod="";
            String phoneno="";
            String rolee="";
            int admin_id = 0;
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_attirerentals?" + "user=weblab&password=");   
            PreparedStatement pst = conn.prepareStatement("Select * from administrator where (username=? or email=?) and password=? and (role = 'superadmin' or role='admin') and status= 'Approved'");
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, passwordhashed);
            ResultSet rs = pst.executeQuery();
                if(rs.next()){
                     if((rs.getString("status").equals("Approved"))&& (rs.getString("role").equals("superadmin"))){
                       firstname = rs.getString("FirstName");
                       session.setAttribute("Name",firstname);
                       response.sendRedirect("SuperAdmin/home.jsp");
                    }else if((rs.getString("status").equals("Approved"))&&(rs.getString("role").equals("admin"))){
                       firstname = rs.getString("FirstName");
                       lastname = rs.getString("lastname");
                       user = rs.getString("userName");
                       emailaddress = rs.getString("email");
                       admin_id = rs.getInt("admin_id");
                       address_li = rs.getString("address_line");
                       cit = rs.getString("city");
                       provinc = rs.getString("province");
                       phoneno = rs.getString("phone_number");
                       postal_cod = rs.getString("postal_code");
                       rolee = rs.getString("role");
                       session.setAttribute("role",rolee);
                       session.setAttribute("phone",phoneno);
                       session.setAttribute("address",address_li);
                       session.setAttribute("city",cit);
                       session.setAttribute("province",provinc);
                       session.setAttribute("postal_code",postal_cod);
                       session.setAttribute("Name",firstname);
                       session.setAttribute("last",lastname);
                       session.setAttribute("Email",emailaddress);
                       session.setAttribute("adminID",admin_id);
                       session.setAttribute("username",user);
                       response.sendRedirect("admin/home.jsp");         
                    }else if(rs.next()==(rs.getString("status").equals("Pending"))&& (rs.getString("role").equals("admin"))){
                        session.invalidate();
                        request.setAttribute("errorMessage", "Account is Pending for Accept");
                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        rd.forward(request, response);  
                    }else if((rs.getString("status").equals("Disabled"))&& (rs.getString("role").equals("admin"))){
                        session.invalidate();
                        request.setAttribute("errorMessage", "Account is disabled");
                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        rd.forward(request, response);
                    }else if((rs.getString("status").equals("Denied"))&& (rs.getString("role").equals("admin"))){
                        session.invalidate();
                        request.setAttribute("errorMessage", "Account is denied");
                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        rd.forward(request, response);
                    }
                }else{
                    session.invalidate();
                    request.setAttribute("errorMessage", "Invalid username or password");
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                              
                }                
            }
       catch(Exception e){       
           out.println(e); 
       }
    }
    
%>
