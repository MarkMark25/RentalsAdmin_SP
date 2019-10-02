<%-- 
    Document   : insertPost
    Created on : 12 10, 18, 5:26:54 AM
    Author     : Swarley
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
 <%@page import="javax.servlet.annotation.MultipartConfig"%>

<%
     String dbURL = "jdbc:mysql://database.com:3306/weblove_atttirerentals";
     String dbUser = "root";
     String dbPass = "";
     FileInputStream fis=null;
     ResultSet rs=null;
     PreparedStatement pstmt = null;
     Connection conn=null;
        String admin = request.getParameter("adminID");
        int admin_id1 = Integer.parseInt(admin);
        String nameOfCostume = request.getParameter("nameOfCostume");
        String description1 = request.getParameter("description");
        String prices = request.getParameter("price");
        String categories = request.getParameter("category");
        int category = Integer.parseInt(categories);
        String myloc  = request.getParameter("picture");
        
        
        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        File image= new File(myloc);
        String sql = "INSERT INTO product (admin_id,name,description,rental_price,images,category_id) values (?,?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, admin_id1);
        pstmt.setString(2, nameOfCostume);
        pstmt.setString(3, description1);
        pstmt.setBigDecimal(4,  new BigDecimal(String.valueOf(prices)));
        pstmt.setInt(6, category);
        fis=new FileInputStream(image);
        pstmt.setBinaryStream(5, (InputStream) fis, (int) (image.length()));
        int count = pstmt.executeUpdate();
        if(count>0)
        {
        out.println("insert successfully");
        }
        else
        {
        out.println("not successfully");
        }
        }
        catch(Exception ex)
        {
        ex.printStackTrace();
        out.println(ex); 
        }
        finally{
        try{
        if(rs!=null){
        rs.close();
        rs= null;
        }
        if(pstmt !=null)
        {
        pstmt.close();
        pstmt=null;
        }
        if(conn!=null)
        {
        conn.close();
        conn=null;
        }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        out.println(e);
        }
        }
        %>
        

