<%-- 
    Document   : register
    Created on : Nov 24, 2018, 7:18:28 PM
    Author     : a.a
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
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
    <link href="SuperAdmin/css/sb-admin.css" rel="stylesheet">
    <link rel="icon"  href="admin/dacs.png">
    
    <script>
         function myFunction() {
            var pass1 = document.getElementById("inputPassword").value;
            var pass2 = document.getElementById("confirmPassword").value;
            if (pass1 !== pass2) {
                alert("Passwords Do not match");
                document.getElementById("inputPassword").style.borderColor = "#E34234";
                document.getElementById("confirmPassword").style.borderColor = "#E34234";
            }
            else {
            }
            alert("Registered Successfuly, wait for the confirmation of the Super Admin in order to login. Note: It takes sometimes!");
        }
    </script>
    
  </head>

  <body class="bg-dark"  id="page-top">
|<div id="wrapper">
      <div class="container" style="width: 50%;">
      <div class="card card-register mx-auto">
          <nav class="navbar navbar-expand static-top">
                <a>
                    Register an Account
                </a>
                <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="padding-top: 0; margin-top: 0;">
                    <div class="input-group">
                      <a href="index.jsp" class="btn btn-primary btn-block">
                        Log in
                      </a>
                    </div>
                </form>
          </nav>
          <div class="card-body">
           <form action="insertRegistration.jsp" method="post" name="regF">
              <div class="form-group">
                <div style="color: #FF0000;text-align: center;background-color: white;font-family: 'Comic Sans MS', cursive, sans-serif;font-size: large"><h6>${errorMessage}</h6> </div>
                <div class="form-row">
                      <div class="col-md-6">
                          <label for="inputEmail">Email address</label>
                        <div class="form-label-group">
                          <input maxlength="25" autocomplete='off' type="email" name="inputEmail" class="form-control" required="required" autofocus="autofocus">
                        </div>
                      </div>
                  <div class="col-md-6">
                      <label for="userName">Username</label>
                    <div class="form-label-group">
                         <input maxlength="10" autocomplete='off' type="text" name="userName" class="form-control" required="required" onblur="checkExist()"/><span id="isE"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="form-row">
                  <div class="col-md-6">
                      <label for="inputPassword">Password <i style="font-size: 15px;">(8-16 characters)</i></label>
                    <div class="form-label-group">
                        <input minlength="8" maxlength="16" autocomplete='off' type="password" id = "inputPassword" name="inputPassword" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-6">
                      <label for="confirmPassword">Confirm password</label>
                    <div class="form-label-group">
                      <input minlength="8" maxlength="16" autocomplete='off' type="password" id= "confirmPassword" name="confirmPassword" class="form-control" required="required">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="form-row">
                  <div class="col-md-6">
                      <label for="firstName">First name</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="firstName" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-6">
                      <label for="lastName">Last name</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="lastName" class="form-control" required="required">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="form-row">
                  <div class="col-md-6">
                      <label for="phoneNumber">Phone Number</label>
                    <div class="form-label-group">
                       <input maxlength="13" autocomplete='off' type="tel" name="phoneNumber" class="form-control" placeholder="0000-000-0000" required="required">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="form-row">
                  <div class="col-md-6">
                      <label for="address">Address</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="address" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-6">
                      <label for="city">City</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="city" class="form-control" required="required">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="form-row">
                  <div class="col-md-6">
                      <label for="province">Province</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="province" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-6">
                      <label for="postalCode">Postal Code</label>
                    <div class="form-label-group">
                      <input maxlength="4" autocomplete='off' type="integer" name="postalCode" class="form-control" required="required">
                    </div>
                  </div>
                </div>
              </div>
               <button class="btn btn-primary btn-block" onclick="return myFunction();" >Register</button>
           </form> 
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
            function checkExist(){
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["regF"]["userName"].value;
                var url = "exist.jsp?userName=" + username;
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState === 4 && xmlhttp.status === 200){
                        if(xmlhttp.responseText === "\n\n\n\n\nUser already exists"){
                            document.getElementById("isE").style.color = "#ff0000";
                        }else{
                            document.getElementById("isE").style.color = "green";
                            document.getElementById("isE").innerHTML = xmlhttp.responseText;
                        }
                    }

                };
                    try{
                        xmlhttp.open("GET",url,true);
                        xmlhttp.send();
                    }catch(e){
                        alert("unable to connect to server");
                    }
            }
    </script>
  </body>

</html>
