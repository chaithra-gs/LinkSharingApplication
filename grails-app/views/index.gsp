<%@page import="grails.util.Holders"%>
<!doctype html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-3.3.1.js"></script>
  <script type = "text/javascript">
    var Matchpassword=function () {
      var password = document.getElementById("password").value;
      var confirmPassword =document.getElementById("confirmpassword").value;

      if(password!=confirmPassword){

        document.getElementById("password").value = "";
        document.getElementById("confirmpassword").value = "";
        document.getElementById("matching").innerHTML="Not Match!!!"

      }
      else
      {
        document.getElementById("matching").innerHTML="Match!!!"
      }

    }
    function myFunc() {
      alert("Please Login!!!")

    }
</script>
  <style>
  body{
    background: #555555;
  }
  </style>
</head>
<body>
  <div class="container"><br>
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="container col-md-12" style="background: #31b0d5">
          <div class="col-md-8">
            <h2 style="color: #a60000" onclick="myFunc()"><a href="${Holders.config.server.host}"><strong> <u>Link Sharing</u></strong></a></h2>
          </div>
          <br>
          <div class="col-md-3">
            <div class="input-group">
              <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
              <div class="input-group-btn">
                <button class="btn btn-basic" type="submit">
                  <span class="glyphicon glyphicon-search"></span>
                </button>
              </div>
            </div>
            <br>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-7">

      </div>
      <div class="col-md-5">
        <div class="panel panel-default">
          <div class="panel-heading">Login</div>
          <div class="panel-body">
            <g:form class="form-horizontal" controller="login" action="index">
            %{-- url="[controller:'login',action:'index']--}%
              <div class="form-group">
                <text class="control-label col-md-4" for="email"  style="text-align: left;">Email/Username *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                  ${flash.message1}
                </div>
              </div>
              <div class="form-group">
                <div class=" col-md-10">
                 <g:link class="control-label col-md-8" controller="forgetPassword" action="forgetPassword" style="text-align: left;">Forget Password</g:link>
                </div>
                <div class=" offset-md-1">
                  <button type="submit" class="btn btn-basic">Login</button>
                </div>
              </div>
            </g:form>
          </div>
        </div>




        <div class="panel panel-default">
          <div class="panel-heading">Register</div>
          <div class="panel-body">
            <g:uploadForm class="form-horizontal" controller='signup' action='index'>
              <div class="form-group">
                <text class="control-label col-md-4" for="firstName" style="text-align: left;">First Name *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="firstname" placeholder="Enter firstname" name="firstname">
                </div>
              </div>

              <div class="form-group">
                <text class="control-label col-md-4" for="lastName" style="text-align: left;">Last Name *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="lastname" placeholder="Enter lastname" name="lastname">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="email" style="text-align: left;">Email *</text>
                <div class="col-md-8">
                  <input type="email" class="form-control" id="sign_email" placeholder="Enter email" name="signup_email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="username" style="text-align: left;">Username *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="username" placeholder="username" name="username">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="password" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" >
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="password" style="text-align: left;">ConfirmPassword*</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="confirmpassword" placeholder="Enter password again" name="confirmpassword" onfocusout="Matchpassword()">
                  <g:if test="${flash.message}">
                    <div class="message">
                      ${flash.message}
                    </div>
                  </g:if>
                </div>


              <div>
                <span id="matching" style="color: #761c19" ></span>
              </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                <div class="col-md-8">
                  <input type="file" class="form-control" id="photo" placeholder="choose" name="inputphoto">
                </div>
              </div>

              <div class="form-group">
                <div class=" col-md-8">
                  ${flash.message3}
                </div>
                <div class=" col-md-4">
                  <button type="submit" class="btn btn-basic btn-block"  width=100%>Register</button>
                </div>
              </div>
            </g:uploadForm>
          </div>
        </div>
      </div>
    </div>
  </body>
  </html>