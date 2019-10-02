<%-- 
    Document   : adminUpcomingTransaction
    Created on : Nov 29, 2018, 12:49:59 PM
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
String database = "weblove_atttirerentals";
String userid = "root";
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
    
    <link rel="icon"  href="dacs.png">

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
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Services</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="adminPostServices.jsp">Post Services</a>
            <a class="dropdown-item" href="adminShowServices.jsp">Costumes</a>
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
            <span>Manage Users</span>
          </a>
        </li>  
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">
          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="home.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Transaction Monitoring</li>
          </ol>
          
          <div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a>
                        <i class="fas fa-table"></i>
                        <b>Upcoming Transaction</b>
                    </a>
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                        <div class="input-group">
                          <input name="searchUpcoming" type="text" class="form-control" placeholder="Enter customer name..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
                              <i class="fas fa-search"></i>
                            </button>
                          </div>
                        </div>
                    </form>
               </nav>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Customer Name</th>
                      <th>Item Name</th>
                      <th>Item Price</th>

                      <th>Action</th
                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchUpcoming");
  String sql;
  if(searchVal!=null){
      sql="Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Pending' and concat(a.firstname,' ',a.lastname) like '%"+searchVal+"%' order by lastname ASC";
  }else{
      sql ="Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Pending' order by lastname ASC";
  }
  /*String sql ="Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Pending'";*/
  
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                    <tr>
                      <td><%=resultSet.getString("cName")%></td>
                      <td><%=resultSet.getString("name")%></td>
                      <td><%=resultSet.getBigDecimal("rental_price")%></td>

                      <!--<td>
                          <a href='inProgress.jsp?d=<%=resultSet.getString("reservation_number")%>'> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: green;" class="fas fa-user-check"></span></button></a>
                          <a href='terminateTransac.jsp?d=<%=resultSet.getString("reservation_number")%>'> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: red;" class="fas fa-user-lock"></span></button></a>
                      </td>-->
                      <td>
                          <a href="" data-target="#acceptTransaction" data-toggle="modal"> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: green;" class="fas fa-user-check"></span></button></a>
                          <a href="" data-target="#declineTransaction" data-toggle="modal"> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: red;" class="fas fa-user-lock"></span></button></a>
                      </td>
                    </tr>
                    
                    <!-- Accept Transaction modal -->
                    <div class="modal fade" id="acceptTransaction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="logoutModalLable">Accept Transaction</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">Accepting this transaction will move its status to <b>in progress</b>. Do you still wish to continue?</div>
                          <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href='inProgress.jsp?d=<%=resultSet.getString("reservation_number")%>'>Accept</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Accept Transaction modal -->
                    
                    <!-- Decline Transaction modal -->
                    <div class="modal fade" id="declineTransaction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="logoutModalLable">Decline Transaction</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">Declining this transaction will move its status to <b>terminated</b>. Do you still wish to continue?</div>
                          <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href='terminateTransac.jsp?d=<%=resultSet.getString("reservation_number")%>'>Decline</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Decline Transaction modal -->

<%
    i++;
}
  connection.close();
} catch (Exception e) {
  out.println(e);
}
%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

<div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a>
                        <i class="fas fa-table"></i>
                        <b>In Progress Transaction</b>
                    </a>
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                        <div class="input-group">
                          <input name="searchInProgress" type="text" class="form-control" placeholder="Enter customer name..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
                              <i class="fas fa-search"></i>
                            </button>
                          </div>
                        </div>
                    </form>
               </nav>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Customer Name</th>
                      <th>Item Name</th>
                      <th>Item Price</th>
                      
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchInProgress");
  String sql;
  if(searchVal!=null){
      sql = "Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='InProgress' and concat(a.firstname,' ',a.lastname) like '%"+searchVal+"%' order by lastname ASC";
  }else{
      sql ="Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='InProgress' order by lastname ASC";
  }
  /* String  */
  int i=0;
  resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

                    <tr>
                      <td><%=resultSet.getString("cName")%></td>
                      <td><%=resultSet.getString("name")%></td>
                      <td><%=resultSet.getString("rental_price")%></td>
                      
                      <td>
                          <a href="" data-target="#completeTransaction" data-toggle="modal"> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: green;" class="fas fa-user-check"></span></button></a>
                          <a href="" data-target="#endTransaction" data-toggle="modal"> <button type="button" class="btn btn-default btn-xs btn-filter"><span style="color: red;" class="fas fa-user-lock"></span></button></a>
                      </td>
                    </tr>
                    
                    <!-- Complete Transaction modal -->
                    <div class="modal fade" id="completeTransaction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="logoutModalLable">Complete Transaction</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">Completing this transaction will move its status to <b>successful</b>. Do you still wish to continue?</div>
                          <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href='successTransac.jsp?d=<%=resultSet.getString("reservation_number")%>'>Complete</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Complete Transaction modal -->
                    
                    <!-- Interrupt Transaction modal -->
                    <div class="modal fade" id="endTransaction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="logoutModalLable">Interrupt Transaction</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">Interrupting this transaction will move its status to <b>terminated</b>. Do you still wish to continue?</div>
                          <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href='terminateTransac.jsp?d=<%=resultSet.getString("reservation_number")%>'>Terminate</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Interrupt Transaction modal -->
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
<div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a>
                        <i class="fas fa-table"></i>
                        <b>Successful Transaction</b>
                    </a>
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                        <div class="input-group">
                          <input name="searchSuccess" type="text" class="form-control" placeholder="Enter customer name..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
                              <i class="fas fa-search"></i>
                            </button>
                          </div>
                        </div>
                    </form>
               </nav>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Customer Name</th>
                      <th>Item Name</th>
                      <th>Item Price</th>
                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchSuccess");
  String sql;
  if(searchVal!=null){
      sql = "Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Success' and concat(a.firstname,' ',a.lastname) like '%"+searchVal+"%' order by lastname ASC";
  }else{
      sql = "Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Success' order by lastname ASC";
  }
  /* String sql ="Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Terminated'"; */
  int i=0;
  resultSet = statement.executeQuery(sql);
  
while(resultSet.next()){
    
%>

                    <tr>
                      <td><%=resultSet.getString("cName")%></td>
                      <td><%=resultSet.getString("name")%></td>
                      <td><%=resultSet.getString("rental_price")%></td>


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
<!-- -->
<div class="card mb-3">
            <div class="card-header">
                <nav class="navbar navbar-expand static-top">
                    <a>
                        <i class="fas fa-table"></i>
                        <b>Terminated Transaction</b>
                    </a>
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                        <div class="input-group">
                          <input name="searchTerm" type="text" class="form-control" placeholder="Enter customer name..." aria-label="Search" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
                              <i class="fas fa-search"></i>
                            </button>
                          </div>
                        </div>
                    </form>
               </nav>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Customer Name</th>
                      <th>Item Name</th>
                      <th>Item Price</th>


                    </tr>
                  </thead>
                  <tbody>
<%
try{
  connection = DriverManager.getConnection(connectionUrl+database, userid, password);
  statement=connection.createStatement();
  String searchVal = request.getParameter("searchTerm");
  String sql;
  if(searchVal!=null){
      sql = "Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Terminated' and concat(a.firstname,' ',a.lastname) like '%"+searchVal+"%' order by lastname ASC";
  }else{
      sql = "Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Terminated' order by lastname ASC";
  }
  /* String sql ="Select c.reservation_number, concat(a.firstname,' ',a.lastname) as 'cName', b.name, b.rental_price, c.pickup_date from client a join transaction c using(client_id) join product b using(product_code) "
          + "where c.admin_id = '"+session.getAttribute("adminID")+"' and c.status='Terminated'"; */
  int i=0;
  resultSet = statement.executeQuery(sql);
  
while(resultSet.next()){
    
%>

                    <tr>
                      <td><%=resultSet.getString("cName")%></td>
                      <td><%=resultSet.getString("name")%></td>
                      <td><%=resultSet.getString("rental_price")%></td>


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
