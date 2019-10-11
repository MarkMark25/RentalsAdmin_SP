package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import database.Db_Connection;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class UploadFileController extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                InputStream inputStream = null;
                //InputStream inputStream2 = null;
                Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));
                String id=(request.getParameter("id"));
                String title=(request.getParameter("title"));
                String description=(request.getParameter("description"));
                String category=(request.getParameter("category"));
                String price=(request.getParameter("price"));
                String quantity=(request.getParameter("qty"));
                String sizes = request.getParameter("sizes");
                String gender = request.getParameter("gender");
                int q = Integer.parseInt(quantity);
                int p_check = Integer.parseInt(price);
                String i_check = (request.getParameter("file_uploaded"));
                String avail = "";
                Part filePart = request.getPart("file_uploaded");
                //Part filePart2 = request.getPart("file_uploaded2");
                int fcate = 0;
                if(null==category){
                    System.out.println("Error out of range, tabbed!~~");
                }else switch (category) {
                    case "Casual":
                    fcate=3;
                    break;
                case "Christmas":
                    fcate=4;
                    break;
                case "Cosplay":
                    fcate=5;
                    break;
                case "Formal":
                    fcate=6;
                    break;
                case "halloween":
                    fcate=7;
                    break;
                case "others":
                    fcate=8;
                    break;
                default:
                    System.out.println("Error out of range, tabbed!~~");
                    break;
                }

                try 
                {
                    int he = 3;
                    int hee = 1;
                    Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
                    String sql = "INSERT INTO product (name, description,category_id,rental_price,availability,image,admin_id,quantity, size, genre, category, product_image) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, title);
                    statement.setString(2, description);
                    statement.setInt(3, fcate);
                    statement.setString(4,price);
                    statement.setString(5,"1");
                    statement.setString(7,id);
                    statement.setInt(8,q);
                    statement.setString(9, sizes);
                    statement.setString(10, category);
                    statement.setString(11, gender);
                    statement.setString(12, title);
                            
                    if(p_check < 0 || p_check == 0){
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Price cannot either be lower or equal to 0.');");
                        out.println("</script>");
                        conn.close();
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response);
                    }
                    
                    if(q < 0 || q == 0){
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Quantity cannot either be zero or negative.');");
                        out.println("</script>");
                        conn.close();
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response);
                    }
                    if (filePart != null && filePart.getSize()!=0) { // && filePart2 != null && filePart2.getSize() != 0
                        System.out.println(filePart.getName());
                        System.out.println(filePart.getSize());
                        System.out.println(filePart.getContentType());
                        inputStream = filePart.getInputStream();
                        //inputStream2 = filePart2.getInputStream();
                        statement.setBinaryStream(6, inputStream, (int) filePart.getSize());
                        //statement.setBinaryStream(8, inputStream2, (int) filePart2.getSize());
                    }else{
                       out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please upload an image.');");
                        out.println("</script>");
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response); 
                    }  
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('File successfully uploaded.');");
                        out.println("</script>");
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response);
                    }
                    else
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Something went wrong! Try uploading your file again later.');");
                        out.println("</script>");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("adminPostServices.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){
                    
                }     
    }   
}