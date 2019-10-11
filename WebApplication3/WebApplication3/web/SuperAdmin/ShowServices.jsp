<%-- 
    Document   : ShowServices
    Created on : Nov 24, 2018, 7:19:32 PM
    Author     : mark_
--%>

<%@page import="java.text.DecimalFormat"%>
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

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

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
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">
            <i class="fas"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item dropdown active">
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
            <li class="breadcrumb-item active">Show Services</li>
          </ol>
          
          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header" >
                <nav class="navbar navbar-expand static-top">
                <a>
                     <i class="fas fa-table"></i>
                    Services
                </a>
                <!--
                    <form  method="post" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="padding-top: 0; margin-top: 0;">
                    <div class="input-group">
                        <input name="searchValue" type="text" class="form-control" id="nameSearch" name='nameSearch' placeholder="Enter Name..." aria-label="Search" aria-describedby="basic-addon2">
                      <div class="input-group-append">
                          <button class="btn btn-primary" type="submit">
                          <i class="fas fa-search"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                -->
                </nav>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0" id="dataTable">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Description</th>
                      <th>Price</th>
                      <th>Code</th>
                      <th>Quantity</th>
                <!--
                      <th>Image</th>
                -->
                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchValue");
  String sql;
  DecimalFormat df = new DecimalFormat("###,###,###.00");
  if(searchVal!=null){
      sql ="Select concat(a.firstname,' ',a.lastname) as 'admin', b.description, b.rental_price, b.product_code, b.quantity from product b join administrator a on a.admin_id = b.admin_id where a.role = 'admin' and -concat(a.firstname,' ',a.lastname) like '%"+searchVal+"%'";   
  }else{
      sql ="Select concat(a.firstname,' ',a.lastname) as 'admin', b.description, b.rental_price, b.product_code, b.quantity from product b join administrator a on a.admin_id = b.admin_id where a.role = 'admin' ORDER BY a.firstname"; 
  }
  //String sql ="Select * from post JOIN customer USING(FirstName) where FirstName="+session.getAttribute( "Name" ); 
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                      <tr>
                      <td><%=resultSet.getString("admin")%></td>
                      <td><%=resultSet.getString("description") %></td>
                      <td>₱ <%=df.format(resultSet.getDouble("rental_price")) %></td>
                      <td><%=resultSet.getString("product_code") %></td>
                      <td><%=resultSet.getString("quantity") %></td>
                    <!--
                      <td>
                          <div>
                            <a href=""> <button type="button" class="btn btn-default btn-xs btn-filter"><span class="fas fa-images"></span></button></a>
                          </div>
                      </td>
                    -->
                    </tr>
<%
    i++;
}
  connection.close();
} catch (Exception e) {
  e.printStackTrace();
}
%>
                  </tbody>
                </table>
              </div>
            </div>
          </div> 
        </div>
        <!-- /.container-fluid -->

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
    <script src="js/demo/datatables-demo.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
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
