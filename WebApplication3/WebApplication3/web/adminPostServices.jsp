<%-- 
    Document   : adminPostServices
    Created on : Nov 29, 2018, 12:51:52 PM
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
              String sql ="Select * from administrator";
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
          <a class="nav-link" href="admin/home.jsp">
            <i class="fas"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item dropdown active">
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Services</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="adminPostServices.jsp">Post Services</a>
            <a class="dropdown-item" href="admin/adminShowServices.jsp">Show Services</a>
            <a class="dropdown-item" href="admin/adminUpdateServices.jsp">Edit Services</a>
          </div>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="admin/transactionMon.jsp">
            <i class="fas"></i>
            <span>Transaction Monitoring</span>
          </a>
        </li>
        </li>  
        <li class="nav-item">
          <a class="nav-link" href="admin/manageUsers.jsp">
            <i class="fas"></i>
            <span>Manage Accounts</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas"></i>
            <span>Settings</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="admin/profile.jsp">Edit Profile</a>
            <a class="dropdown-item" href="admin/changepassword.jsp">Change Password</a>
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
            <li class="breadcrumb-item active">Post Service</li>
          </ol>
        <div class="card-mb-3">
          <div class="row">
          <form class="" width="100%" cellspacing="0" style="margin-right: 50%;" method="post" action="UploadFileController" enctype="multipart/form-data">
                <div class="card-header">
                    <i class="fas fa-mail"></i>
                    Post Services
                </div>
                <div class="form-group" style="margin-left: 5%; margin-right: 5%;">
            <center>
                <table border="1" width="25%" cellpadding="5">
                    <thead> 
                            <th colspan="3">Upload File</th>        
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="hidden" name="id" size="30" value='<%=session.getAttribute("adminID")%>'></td>
                        <tr>    
                            <td>Product name: </td>
                            <td><input type="text" name="title" size="30"></td>
                        </tr>
                        <tr>
                            <td>Description: </td>
                            <td><input type="text" name="description" size="30"></td>
                        </tr>
                        <tr>
                            <td>Genre: </td>
                            <td><select name="category">
                                    <option>Casual</option>
                                    <option>Christmas</option>
                                    <option>Cosplay</option>
                                    <option>Formal</option>
                                    <option>Halloween</option>
                                    <option>others</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Rental Price: </td>
                            <td><input maxlength="4" type="text" name="price" onkeypress="validate(event)"></td>
                        </tr>
                        <tr>
                            <td>Quantity: </td>
                            <td><input type="text" name="qty" onkeypress="validate(event)"></td>
                        </tr>
                        <tr>
                            <td>Sizes: </td>
                            <td>
                                <select name="sizes">
                                        <option value="S">S</option>
                                        <option value="M">M</option>
                                        <option value="M, L">M, L</option>
                                        <option value="S, M">S, M</option>
                                        <option value="S, M, L">S, M, L</option>
                                        <option value="M, L ,X">M, L ,X</option>
                                        <option value="X, S">X, S</option>
                                        <option value="XS, S, M, L, ML">XS, S, M, L, ML</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Front Image: </td>
                            <td><input id='checkI' type="file" name="file_uploaded" /></td>
                        </tr>
                        <!--<tr>
                            <td>Back Image: </td>
                            <td><input id='checkI' type="file" name="file_uploaded2" /></td>
                        </tr>-->
                        <tr>
                            <td>Category: </td>
                            <td><select name="gender">
                                        <option value="Women">Women</option>
                                        <option value="Men">Men</option>
                                        <option value="Kids">Kids</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3"><center><input type="submit" value="Upload"></center></td>
                        </tr>
                        </div>
                    </tbody>             
                </table>

                    </center>
                </div>
            </form>
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
                <a class="btn btn-primary" href="admin/logout.jsp">Logout</a>
              </div>
            </div>
          </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="admin/vendor/jquery/jquery.min.js"></script>
        <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="admin/js/sb-admin.min.js"></script>
            <script>
        function validate(evt) {
            var theEvent = evt || window.event;

            // Handle paste
            if (theEvent.type === 'paste') {
                key = event.clipboardData.getData('text/plain');
            } else {
            // Handle key press
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
            }
            var regex = /[0-9]/;
            if( !regex.test(key) ) {
              theEvent.returnValue = false;
              if(theEvent.preventDefault) theEvent.preventDefault();
            }
          }
    </script>
      </body>
      
    </html>
    <%
        }
    %>

