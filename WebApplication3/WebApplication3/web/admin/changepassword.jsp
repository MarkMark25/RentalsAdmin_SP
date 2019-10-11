<%-- 
    Document   : adminDisabledAccounts
    Created on : 11 29, 18, 8:02:52 PM
    Author     : Gigabyte
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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Baro Clothing Services</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/secret.js"></script>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    
    <link rel="icon"  href="dacs.png">
    <link
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

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">
            <i class="fas"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Services</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="../adminPostServices.jsp">Post Services</a>
            <a class="dropdown-item" href="adminShowServices.jsp">Show Services</a>
            <a class="dropdown-item" href="adminUpdateServices.jsp">Edit Services</a>
          </div>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="transactionMon.jsp">
            <i class="fas"></i>
            <span>Transaction Monitoring</span>
          </a>
        </li>
        </li>  
        <li class="nav-item">
          <a class="nav-link" href="manageUsers.jsp">
            <i class="fas"></i>
            <span>Manage Accounts</span>
          </a>
        </li>
        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Settings</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="profile.jsp">Edit Profile</a>
            <a class="dropdown-item" href="changepassword.jsp">Change Password</a>
          </div>
        </li>   
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="home.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Settings</li>
          </ol>
          

          <div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a>
                        <i class="fas fa-table"></i>
                        <b>Change Password</b>
                    </a>
               </nav>
            </div>   
  <div class="card-body">
    <div class="table-responsive">
      <div class="content">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h5 class="title">Password Settings</h5>
              </div>
              <div class="card-body">
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchCostume");
  String sql;
  sql = "SELECT * FROM `administrator` where admin_id = '"+session.getAttribute( "adminID" )+"'";
  //String sql ="Select * from product where admin_id = '"+session.getAttribute( "adminID" )+"'"; ; 
  //String sql ="Select * from post JOIN customer USING(FirstName) where FirstName="+session.getAttribute( "Name" );
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                <form method="post" action="changepasswordprocess.jsp">
                  <div class="row">
                    <input type="hidden" name="id" value='<%=resultSet.getString("admin_id") %>'>
                    <div class="col-md-3 px-1">
                      <div class="form-group">
                        <label>New Password:</label>
                        <input id="newPassword" min="8" max="16" autocomplete="off" required="required" name="newpass" type="password" class="form-control" placeholder="New Password">
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label >Confirm Password:</label>
                        <input id="confirmPassword" min="8" max="16" autocomplete="off" required="required" name="newconpass" type="password" class="form-control" placeholder="Confirm Password">
                      </div>
                    </div>
                    <br>
                  </div>
                  <button type="submit" class="btn btn-warning" value="submit">Change Password</button>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-user">
              <div class="card-body">
                <div class="author">
                  <a href="#">
                    <h5 class="title"><%=resultSet.getString("firstname")%>, <%=resultSet.getString("lastname")%></h5>
                  </a>
                  <p class="description">
                    <%=session.getAttribute("role")%>
                  </p>
                </div>
                <p class="description text-center">
                  "Motto:
                  <br> ~~ You can't be late until you show up. " 
                </p>
              </div>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%
    i++;
}
  connection.close();
} catch (Exception e) {
  e.printStackTrace();
}
%>

              </div>
            </div>
          </div>
          
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright
                  © Matatapang na Tao 2018</span>
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
  </body>

</html>
<%
    }
%>
