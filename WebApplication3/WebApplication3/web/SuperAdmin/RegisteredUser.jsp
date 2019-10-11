<%-- 
    Document   : RegisteredUser
    Created on : Nov 25, 2018, 4:30:07 PM
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

    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="css/jquery.dataTables.min.css" rel="stylesheet">
    
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
        <li class="nav-item dropdown active">
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
            <li class="breadcrumb-item active">Registered Accounts</li>
          </ol>
	<!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a>
                        <i class="fas fa-table"></i>
                        Registered Accounts of Service Providers
                    </a>
                  <!--  
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="padding-top: 0; margin-top: 0;">
                        <div class="input-group">
                          <input name="searchValue" type="text" class="form-control" placeholder="Enter name..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
                              <i class="fas fa-search"></i>
                            </button>
                          </div>
                        </div>
                    </form>
                  -->
               </nav>
            </div>
            <div class="card mb-3">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0" id="dataTable">
                  <thead>
                      <tr>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Phone No.</th>
                      <th>Address</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchValue");
  String sql;
  if(searchVal!=null){
      sql = "Select * from administrator where status='Approved' and role='admin' and  concat(firstname,' ',lastname) like '%"+searchVal+"%' order by lastname ASC";
  }else{
      sql ="Select firstname,lastname,email,phone_number,address_line,city,status from administrator where status='Approved' and role='admin' ORDER BY firstname"; 
  }  
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                    <tr>
                      <td><%=resultSet.getString("firstname")%> <%=resultSet.getString("lastname")%></td>
                      <td><%=resultSet.getString("email") %></td>
                      <td><%=resultSet.getString("phone_number") %></td>
                      <td><%=resultSet.getString("address_line") %>, <%=resultSet.getString("city")%></td>
                      <td><%=resultSet.getString("status") %></td>
                      <td>
                           <div>
                            <a href="" data-target="#blockUserAdmin" data-toggle="modal"> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: red;" class="fas fa-user-lock"></span></button></a>
                          </div>
                      </td>
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
          <!-- DataTables Example -->
          <div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a href="RegisteredUser.jsp" style="color: black;">
                        <i class="fas fa-table"></i>
                        Registered Accounts of Clients
                    </a>
                    <!--
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="padding-top: 0; margin-top: 0;">
                        <div class="input-group">
                          <input name="searchClient" type="text" class="form-control" placeholder="Enter name..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
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
                <table class="table table-bordered" width="100%" cellspacing="0" id="example">
                  <thead>
                      <tr>         
                      <th>Name</th>
                      <th>Email</th>
                      <th>Phone No.</th>
                      <th>Address</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchClient");
  String sql;
  if(searchVal!=null){
      sql = "Select * from client where status='Approved' and concat(firstname,' ',lastname) like '%"+searchVal+"%' order by lastname ASC";
  }else{
      sql ="Select firstname,lastname,email,phone_number,address_line,city,status from client where status='Approved' and role='client' ORDER BY firstname"; 
  } 
  //String sql ="Select * from post JOIN customer USING(FirstName) where FirstName="+session.getAttribute( "Name" ); 
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                    <tr>
                      <td><%=resultSet.getString("firstname")%> <%=resultSet.getString("lastname")%></td>
                      <td><%=resultSet.getString("email") %></td>
                      <td><%=resultSet.getString("phone_number") %></td>
                      <td><%=resultSet.getString("address_line") %>, <%=resultSet.getString("city")%></td>
                      <td><%=resultSet.getString("status") %></td>
                      <td>
                           <div>
                            <a href="" data-target="#blockUserClient" data-toggle="modal"> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: red;" class="fas fa-user-lock"></span></button></a>
                          </div>
                      </td>
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
        </div><!-- /.container-fluid -->
        

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
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String sql ="Select admin_id,firstname,lastname,email,phone_number,address_line,city,status from administrator where status='Approved' and role='admin'"; 
  //String sql ="Select * from post JOIN customer USING(FirstName) where FirstName="+session.getAttribute( "Name" ); 
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
    <!-- Block User-->
    <div class="modal fade" id="blockUserAdmin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Block User</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">You're about to disable/block Service Provider account . Select "Block" below if you are to disable/block user account.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href='BlockAdmin.jsp?d=<%=resultSet.getString("admin_id")%>'>Block</a>
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
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String sql ="Select client_id,firstname,lastname,email,phone_number,address_line,city,status from client where status='Approved' and role='client'"; 
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
     <!-- Block User-->
    <div class="modal fade" id="blockUserClient" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Block User</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">You're about to disable/block Client account . Select "Block" below if you are to disable/block user account.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href='BlockClient.jsp?d=<%=resultSet.getString("client_id")%>'>Block</a>
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

    <script src="js/demo/example-demo.js"></script>
    <script src="vendor/jquery/jquery-3.3.1.js"></script>
    <script src="vendor/jquery/jquery.dataTables.min.js"></script>
	
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
