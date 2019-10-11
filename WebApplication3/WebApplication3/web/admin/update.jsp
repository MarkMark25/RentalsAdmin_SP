<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://database.com:3306/";
String database = "weblove_attirerentals";
String userid = "weblab";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product where product_code="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("product_code") %>">
<input type="text" name="id" value="<%=resultSet.getString("product_code") %>">
<br>
First name:<br>
<input type="text" name="first_name" value="<%=resultSet.getString("name") %>">
<br>
Last name:<br>
<input type="text" name="last_name" value="<%=resultSet.getString("description") %>">
<br>
City name:<br>
<input type="text" name="city_name" value="<%=resultSet.getString("availability") %>">
<br>
Email Id:<br>
<input type="text" name="email" value="<%=resultSet.getString("rental_price") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
out.println(e);
}
%>
</body>
</html>