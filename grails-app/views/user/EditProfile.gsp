<%--
  Created by IntelliJ IDEA.
  User: chaithra
  Date: 23/7/19
  Time: 11:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="grails.util.Holders"%>
<!doctype html>
<html>
<head>
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
    body{
        background: #555555;
    }

    </style>
</head>
<body>
<div class="container"><br>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container col-md-12" style="background: #31b0d5">
                    <div class="col-md-5">
                        <h2 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h2>
                    </div>
                    <div class="col-md-7">
                        <table class="table">
                            <td width=200px>
                                <div class="input-group">
                                    <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-basic" type="submit">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                            </td>

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${userdata.username}
                                        <span class="caret" onclick="display()" id="droped"></span></button>
                                    <ul class="dropdown-menu" >
                                        <li><a href="/User/myaction">profile</a></li>
                                        <li><a href="/user/showlist">Users</a></li>
                                        <li><a href="#">Topics</a></li>
                                        <li><a href="/user/logout">Logout</a></li>
                                    </ul>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel-heading">Recent Searches</div>
            <div class="panel-body">
                <table  style="width:100%">
                    <td rowspan="3" width=15% align="center"> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
                    <td width=275px class="text">chaithra</td>
                    <td width=150px class="text-muted">@chaithra</td>
                    <td width=150px></td>
                    <td width=150px></td>
                    <td width=150px>
                        <a href="#"></a>
                        Grails
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

        <!-- write here for left column pannels-->
    </div>

    <!-- right side pannel elements starts here-->
    <div class="col-md-7">

    <div class="panel panel-default">
        <div class="panel-heading">Profile</div>
        <div class="panel-body">
            <g:form class="form-horizontal"  controller="Profile" action="profile" enctype="multipart/form-data">
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">First Name *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="fname" placeholder="Enter firstname" name="fname">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">Last Name *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="lname" id="lname" placeholder="Enter lastname" >
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">Username *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" >
                    </div>
                </div>
                %{--<div class="form-group">
                    <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Photo</text>

                    <div class="col col-md-5">
                        <input type="file" class="btn btn-basic" name ="photo">
                    </div>
                </div>--}%
                <div class="form-group">
                    <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                    <div class="col-md-8">
                        <input type="file" class="form-control" id="inputphoto" placeholder="choose" name="inputphoto">
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-md-8">
                    </div>
                    <div class=" col-md-4">
                        <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Change Password</div>
        <div class="panel-body">
            <g:form class="form-horizontal"  controller="Profile" action="password" >

                <div class="form-group">
                    <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="email" placeholder="Password" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="pwd" style="text-align: left;">ConfirmPassword*</text>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="email" placeholder="Confirm password" name="confirmpass">
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-md-8">
                    </div>
                    <div class=" col-md-4">
                        <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

</div>






</body>
</html>