<%-- 
    Document   : index
    Created on : Nov 24, 2018, 7:17:08 PM
    Author     : mark_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Baro Clothing Services</title>

    <!-- Bootstrap core CSS-->
    <link href="admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="admin/css/sb-admin.css" rel="stylesheet">
    
    <link rel="icon"  href="admin/dacs.png">

  </head>

  <body class="bg-dark">
    <div id="fullscreen_bg" class="fullscreen_bg"/>
    <div id="wrapper">
    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
          <form action="validate.jsp"  method="post" role="form">
             <div style="color: #FF0000;text-align: center;background-color: white;font-family: 'Comic Sans MS', cursive, sans-serif;font-size: large"><h6>${errorMessage}</h6> </div>
            <div class="form-group">
              <label for="inputEmail">Email or Username</label>
              <div class="form-label-group">
                <input type="text" id="inputEmail" autocomplete= "off" class="form-control" placeholder="Email address" required="" name="email">
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword">Password</label>
              <div class="form-label-group">
                <input type="password" id="inputPassword" autocomplete= "off" class="form-control" placeholder="Password" required="" name="password">
              </div>
            </div>
            <!--
            <center>
              <button class="btn btn-primary btn-block col-md-3" type="submit">Login</button>
            </center>
          -->
            <button class="btn btn-primary btn-block" type="submit">Login</button>
          </form>
            <div class="dropdown-divider"></div>
            <p>Don't have an account yet? <a href="register.jsp">Register here</a> </p>
        </div>
      </div>
    </div>
    </div>
            
  </body>

</html>
