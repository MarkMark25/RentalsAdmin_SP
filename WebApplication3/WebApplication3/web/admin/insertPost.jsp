<%@page import="java.security.MessageDigest"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.util.*"%>
<%
            try{
             Class.forName("com.mysql.jdbc.Driver");
               Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weblab?" + "user=root&password=");    
                InputStream inputStream = null; 
                String title=(request.getParameter("title"));
                String description=(request.getParameter("description"));
                String category=(request.getParameter("category"));
                String price=(request.getParameter("price"));

                String file = request.getParameter("myimg");
                int fcate = 3;

                FileInputStream fis = null;
                File image = new File(file);
                fis = new FileInputStream(image);
                
                    int he = 2;
                    int hee = 1;
                    String sql = "INSERT INTO product (name, description,category_id,rental_price,availability,product_image,admin_id) values (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, title);
                    statement.setString(2, description);
                    statement.setInt(3, fcate);
                    statement.setString(4,price);
                    statement.setInt(5,hee);
                    statement.setInt(7,he);
             
                    statement.setBinaryStream(6, (InputStream) fis, (int) (image.length()));
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        System.out.println("File uploaded!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response);
                    }
                    else
                    {
                        System.out.println("Couldn't upload your file!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response);
                    }    
                //request.setAttribute("errorMessage1", "Registered Successfuly, wait for the confirmation of the Super Admin in order to login. Note: It takes sometimes!");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }   
            catch(Exception e){
            e.printStackTrace();
            }
        %>
