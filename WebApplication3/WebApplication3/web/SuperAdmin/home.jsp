<%-- 
    Document   : home
    Created on : Nov 24, 2018, 7:16:23 PM
    Author     : mark_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%
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
 
if (session.getAttribute( "Name" ) == null){
    response.sendRedirect("index.jsp");
}else {
%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta http-equiv="refresh" content="10">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Baro Clothing Services</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    
    <link rel="icon"  href="dacs.png">
    
    <script language=“javascript”>
        window.location="../index.jsp";
        window.history.forward(0);
    </script>

  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="home.jsp">Baro Clothing Services</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
          <div class="input-group-append">
          </div>
        </div>
      </div>
            <%
              try{
              connection = DriverManager.getConnection(connectionUrl+database, userid, password);
              statement=connection.createStatement();
              String sql ="Select * from client";
              resultSet = statement.executeQuery(sql);
              if (resultSet.next()){
            %>
      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0 d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
              <center><b style="background-color: white;"><%= session.getAttribute( "Name" ) %></b><center> 
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
          </div>
        </li>
      </ul>
              <%
              }
              connection.close();
              } catch (Exception e) {
              e.printStackTrace();
              }
              %>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="home.jsp">
            <i class="fas"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="ShowServices.jsp">
            <i class="fas"></i>
            <span>Show Services</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="Transaction.jsp">
            <i class="fas"></i>
            <span>Transactions Monitoring</span>
          </a>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Manage User</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="NewUser.jsp">New</a>
            <a class="dropdown-item" href="RegisteredUser.jsp">Registered</a>
            <a class="dropdown-item" href="SuperAdminBlockUsers.jsp">Block Users</a>
            <a class="dropdown-item" href="SuperAdminDeniedAcc.jsp">Denied Acc.</a>
          </div>
        </li>
        <!--
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Settings</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="profile.jsp">Edit Profile</a>
            <a class="dropdown-item" href="changepassword.jsp">Change Password</a>
          </div>
        </li>
        -->   
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="home.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Overview</li>
          </ol>

          <!-- Icon Cards-->
          <div class="row">
            <a href="NewUser.jsp" style="color: white;">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-users"></i>
                  </div>
            <%
              try{
              connection = DriverManager.getConnection(connectionUrl+database, userid, password);
              statement=connection.createStatement();
              String sql ="SELECT (SELECT COUNT(status) AS total from client where status='Pending') + (SELECT COUNT(status) AS total from administrator WHERE status='Pending')";
              resultSet = statement.executeQuery(sql);
              int count= 0;
              if (resultSet.next()){
            %>
              <a class="text-white" href="NewUser.jsp"><div class="mr-5"><%=count=resultSet.getInt(1)%> New Accounts!</div></a>
            <%
              }
              connection.close();
              } catch (Exception e) {
              e.printStackTrace();
              }
              %>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="NewUser.jsp"><!-- HREF-->
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            </a>
            <a href="RegisteredUser.jsp" style="color: white;">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-users"></i>
                  </div>
            <%
              try{
              connection = DriverManager.getConnection(connectionUrl+database, userid, password);
              statement=connection.createStatement();
              String sql ="SELECT (SELECT COUNT(status) AS total from client where status='Approved' and role ='client') + (SELECT COUNT(status) AS total from administrator WHERE status='Approved' and role='admin')";
              resultSet = statement.executeQuery(sql);
              int count= 0;
              if (resultSet.next()){
            %>
                  <a class="text-white" href="RegisteredUser.jsp"><div class="mr-5"><%=count=resultSet.getInt(1)%> Registered Accounts!</div></a>
            <%
              }
              connection.close();
              } catch (Exception e) {
              e.printStackTrace();
              }
              %>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="RegisteredUser.jsp"><!-- HREF-->
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            </a>
            <a href="SuperAdminDeniedAcc.jsp" style="color: white;">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-archive"></i>
                  </div>
            <%
              try{
              connection = DriverManager.getConnection(connectionUrl+database, userid, password);
              statement=connection.createStatement();
              String sql ="SELECT (SELECT COUNT(status) AS total from client where status='Denied') + (SELECT COUNT(status) AS total from administrator WHERE status='Denied')";
              resultSet = statement.executeQuery(sql);
              int count= 0;
              if (resultSet.next()){
            %>
                  <a class="text-white" href="SuperAdminDeniedAcc.jsp"><div class="mr-5"><%=count=resultSet.getInt(1)%> Denied Accounts!</div></a>
            <%
              }
              connection.close();
              } catch (Exception e) {
              e.printStackTrace();
              }
              %>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="SuperAdminDeniedAcc.jsp"><!-- HREF-->
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            </a>
            <a href="SuperAdminBlockUsers.jsp" style="color: white;">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-eye"></i>
                  </div>
            <%
              try{
              connection = DriverManager.getConnection(connectionUrl+database, userid, password);
              statement=connection.createStatement();
               String sql ="SELECT (SELECT COUNT(status) AS total from client where status='Disabled') + (SELECT COUNT(status) AS total from administrator WHERE status='Disabled')";
              resultSet = statement.executeQuery(sql);
              int count= 0;
              if (resultSet.next()){
            %>
                  <a class="text-white" href="SuperAdminBlockUsers.jsp"><div class="mr-5"><%=count=resultSet.getInt(1)%> Blocked Accounts!</div></a>
            <%
              }
              connection.close();
              } catch (Exception e) {
              e.printStackTrace();
              }
              %>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="SuperAdminBlockUsers.jsp"><!-- HREF-->
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            </a>
          </div>
        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright © Matatapang na Tao 2018</span>
            </div>
          </div>
        </footer>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="logout.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    
<script>

    $(document).ready(function() {
        function disableBack() { window.history.forward(); }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack(); };
    });

</script>

  </body>

</html>
<%
    }
%>
