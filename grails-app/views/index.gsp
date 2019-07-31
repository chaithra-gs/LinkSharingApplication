<%@page import="grails.util.Holders"%>
<!doctype html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

%{--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">--}%
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-3.3.1.js"></script>
  <script type = "text/javascript">
    var Matchpassword=function () {
      var password = document.getElementById("password").value;
      var confirmPassword =document.getElementById("confirmpassword").value;

      if(password!=confirmPassword){
        alert("Enter same Password")
        document.getElementById("password").value = "";
        document.getElementById("confirmpassword").value = "";


        //document.getElementById("matching").innerHTML="Not Match!!!"

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
      <div class="panel panel-default">
        <div class="panel-heading">Recent Searches</div>
        <div class="panel-body">
          <table  style="width:100%">
            <tr>
            <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
            <td width=275px class="text">chaithra</td>
            <td width=150px class="text-muted">@chaithra</td>
            <td width=150px></td>
            <td width=150px></td>
            <td width=150px>
              <a href="#">
                Grails</a>
              </td>
            </tr>
            <td colspan="5" ></td>
          </tr>
          <td>Links</td>
          <td></td>
          <td></td>
          <td></td>
            <td><a href="#">View Post</a></td>
          </table>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="container">
            <div class="col-md-5">
              Top Posts</div>
              <div class="col-md-2">
                <div class="dropdown">
                  <button class="btn btn-basic dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Today  <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="about-us">
                    <li><a href="#">One Week</a></li>
                    <li><a href="#">One Month</a></li>
                    <li><a href="#">One Year</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="panel-body"> <table  style="width:100%">
            <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
            <td width=275px class="text">chaithra</td>
            <td width=150px class="text-muted">@chaithra</td>
            <td width=150px></td>
            <td width=150px></td>
            <td width=150px><a href="#">Grails</a></td>
            </tr>
            <td colspan="5" height=100px> </td>
          </tr>
          <td>Links</td>
          <td></td>
          <td></td>
          <td></td>
            <td><a href="#">View Post</a></td>
          </table></div>
        </div>
      </div>
      <div class="col-md-5">
        <div class="panel panel-default">
          <div class="panel-heading">Login</div>
          <div class="panel-body">
            <g:form class="form-horizontal" url="[controller:'login',action:'index']">
              <div class="form-group">
                <text class="control-label col-md-4" for="email"  style="text-align: left;">Email/Username *</text>
                <div class="col-md-8">
                  <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                  <g:if test="${flash.message}">
                    <div class="message">
                      ${flash.message}
                    </div>
                  </g:if>
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