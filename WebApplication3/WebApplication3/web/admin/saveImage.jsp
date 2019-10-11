<%@ page import="java.sql.* " %>
<%@ page import="org.apache.commons.* "%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
   Connection conn=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weblab","root", "");

   PreparedStatement psImageInsertDatabase=null;

   byte[] b=null;
   try{
      String sqlImageInsertDatabase="insert into image (image,username,fname,email) values(?)";
      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);

      DiskFileItemFactory factory = new DiskFileItemFactory();

      ServletFileUpload sfu = new ServletFileUpload(factory);
      List items = sfu.parseRequest(request);

      Iterator iter = items.iterator();

      while (iter.hasNext()) {
         FileItem item = (FileItem) iter.next();
         if (!item.isFormField()) {
              b = item.get();
          }
      }

      psImageInsertDatabase.setBytes(1,b);
      psImageInsertDatabase.setString(2,"Arnel");
      psImageInsertDatabase.setString(3,"Arnel");
      psImageInsertDatabase.setString(4,"Arnel");

      psImageInsertDatabase.executeUpdate();
   }
   catch(Exception e)
   {
     e.printStackTrace();
     response.sendRedirect("addimage.jsp");
   }

%>