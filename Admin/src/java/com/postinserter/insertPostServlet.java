/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Swarley
 */
import java.io.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name="insertPostServlet", urlPatterns={"/insertPostServlet"})
@MultipartConfig(maxFileSize = 16177215)  
public class insertPostServlet {
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String admin_id = request.getParameter("adminID");
        String nameOfCostume = request.getParameter("nameOfCostume");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        //String image  = request.getParameter("car_image");

        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("picture");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        //byte[] bytes = IOUtils.toByteArray(inputStream);
        //String str = new sun.misc.BASE64Encoder().encode(bytes);
        //String imageStr = Base64.encodeBase64String(inputStream);
        //byte[] encodedBytes = Base64.getEncoder().encode(inputStream.getBytes());
        
        /*FileInputStream fileInputStreamReader = new FileInputStream(file);
        byte[] bytes = new byte[(int)file.length()];
        fileInputStreamReader.read(bytes);
        encodedfile = Base64.encodeBase64(bytes).toString();*/

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
//            Connection conn = DriverManager.getConnection("jdbc:mysql://database.com:3306/weblove_atttirerentals?" + "user=weblab&password=");   

            String sql = "INSERT INTO product (admin_id,name,description,rental_price,images,category_id) values (?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            
            statement.setString(1, admin_id);
            statement.setString(2, nameOfCostume);
            statement.setString(3, description);
            statement.setString(4, price);
            //statement.setString(5, images);
            statement.setString(6, category);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(5, inputStream);
                //statement.setString(8, str);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            //request.setAttribute("Message", message);

            // forwards to the message page
            //getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
            response.sendRedirect("admin/adminPostServices.jsp");
        }
    }
}
