
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%> 

<%

Connection con=null;

ResultSet rs=null;

PreparedStatement psmt=null;

FileInputStream fis;

String url="jdbc:mysql://localhost:3306/weblab";

try{

Class.forName("com.mysql.jdbc.Driver").newInstance();

con=DriverManager.getConnection(url,"weblab","");

File image=new File("C:\Users\mark_\Downloads\");

psmt=con.prepareStatement("insert into image(username,image,fname,email)"+"values(?,?,?,?)");

psmt.setString(1,"Barack Obama");

psmt.setString(3,"Wasington D.C.");

psmt.setString(4,"Wasington D.C.");

fis=new FileInputStream(image);

psmt.setBinaryStream(2, (InputStream)fis, (int)(image.length()));

int s = psmt.executeUpdate();

if(s>0) {

%> 

<b><font color="Blue"> 

<% out.println("Image Uploaded successfully !"); %> 

</font></b> 

<% 

}

else {

out.println("unsucessfull to upload image.");

}

con.close();

psmt.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>