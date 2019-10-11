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
    <link href="SuperAdmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="SuperAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="SuperAdmin/css/sb-admin.css" rel="stylesheet">
    <link rel="icon"  href="SuperAdmin/dacs.png">
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
              alert("Registered Successfuly, wait for the confirmation of the Super Admin in order to login. Note: It will take some time!");
            }
            
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
              </div>
              <div class="form-group">
                  <div class="col-md-10">
                      <label for="userName">Username</label>
                    <div class="form-label-group">
                         <input maxlength="10" autocomplete='off' type="text" autofocus="autofocus" name="userName" class="form-control" required="required" onblur="checkExist()"/><span id="isE"></span>
                    </div>
                  </div>
                  <div class="col-md-10">
                      <label for="firstName">First name</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="firstName" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-10">
                      <label for="lastName">Last name</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="lastName" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-10">
                      <label for="inputPassword">Password <i style="font-size: 15px;">(8-16 characters)</i></label>
                    <div class="form-label-group">
                        <input minlength="8" maxlength="16" autocomplete='off' type="password" id = "inputPassword" name="inputPassword" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-10">
                      <label for="confirmPassword">Confirm password</label>
                    <div class="form-label-group">
                      <input minlength="8" maxlength="16" autocomplete='off' type="password" id= "confirmPassword" name="confirmPassword" class="form-control" required="required" onkeyup="checkPasswordMatch();">
                    </div>
                    <div class="registrationFormAlert" id="divCheckPasswordMatch"></div>
                  </div>
              <div class="form-group">
                  <div class="col-md-10">
                      <label for="phoneNumber">Phone Number</label>
                    <div class="form-label-group">
                      <select name="numberPrefix">
                        <option></option>
                        <option value="+63906">+63906</option>
                        <option value="+63907">+63907</option>
                        <option value="+63908">+63908</option>
                        <option value="+63915">+63915</option>
                        <option value="+63917">+63917</option>
                        <option value="+63927">+63927</option>
                        <option value="+63923">+63923</option>
                        <option value="+63924">+63924</option>
                        <option value="+63925">+63925</option>
                        <option value="+63937">+63937</option>
                        <option value="+63938">+63938</option>
                        <option value="+63939">+63939</option>
                      </select> 
                      <input maxlength="7" autocomplete='off' type="text" name="phoneNumber" class="col-md-9" required="required" onkeypress='validate(event)'>
                    </div>
                  </div>
                  <div class="col-md-10">
                        <label for="inputEmail">Email address</label>
                        <div class="form-label-group">
                          <input maxlength="25" autocomplete='off' type="email" name="inputEmail" class="form-control" required="required" onblur="checkEmail()" ><span id="idE"></span>
                        </div>
                  </div>
                  <div class="col-md-10">
                      <label for="address">Address</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="address" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-10">
                      <label for="city">City</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="city" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-10">
                      <label for="province">Province</label>
                    <div class="form-label-group">
                      <input maxlength="20" autocomplete='off' type="text" name="province" class="form-control" required="required">
                    </div>
                  </div>
                  <div class="col-md-10">
                    <label for="postalCode">Postal Code</label>
                    <div class="form-label-group">
                      <input maxlength="4" autocomplete='off' type="integer" name="postalCode" class="form-control" required="required">
                    </div>
                  </div>
              </div>
               <center>
                 <button class="btn btn-primary btn-block col-md-3" onclick="return myFunction();" >Register</button>
               </center>
               <!--
                <button class="btn btn-primary btn-block col-md-3" onclick="return myFunction();" >Register</button>
               -->
           </form> 
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="SuperAdmin/vendor/jquery/jquery.min.js"></script>
    <script src="SuperAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="SuperAdmin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="SuperAdmin/js/sb-admin.min.js"></script>
    <script src="SuperAdmin/js/jquery.min.js"></script>
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
    <script>
            function checkEmail(){
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["regF"]["inputEmail"].value;
                var url = "checkEmail.jsp?inputEmail=" + username;
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState === 4 && xmlhttp.status === 200){
                        if(xmlhttp.responseText === "\n\n\n\n\nemail already exists"){
                            document.getElementById("idE").style.color = "#ff0000";
                        }else{
                            document.getElementById("idE").style.color = "green";
                            document.getElementById("idE").innerHTML = xmlhttp.responseText;
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
    <script>
     function checkPasswordMatch() {
          var password = $("#inputPassword").val();
          var confirmPassword = $("#confirmPassword").val();

          if (password != confirmPassword)
              $("#divCheckPasswordMatch").html("Passwords do not match!").css('color','red');
          else
              $("#divCheckPasswordMatch").html("Passwords match.").css('color','green');
      }
    </script>
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
