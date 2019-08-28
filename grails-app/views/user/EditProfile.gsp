<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="grails.util.Holders"%>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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

    </script>
    <title>Profile</title>
    <g:render template="/layout/dashboard"/>

</head>
<body>
<div class="container"><br>
    <div class="col-md-5">
        <!-- write here for left column pannels-->
            <div class="panel panel-default">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table   style="width:100%">
                            <tr>
                                <td rowspan="4" colspan="3" width="10%">
                                    <asset:image src="${userdata.photo}"  height="100px" width="90px" style="margin-right: 10px;"></asset:image>
                                </td>
                                <td width=200px class="text" colspan="3">${userdata.firstName} ${userdata.lastName}</td>
                            </tr>
                            <tr>
                                <td width=150px class="text-muted" colspan="3">@${userdata.username}</td>
                            </tr>
                            <tr>
                                <td width=150px>Subscriptions</td>
                                <td width="150px">Topics</td>
                            </tr>
                            <tr>
                                <td width=150px>${count_subscribe}</td>
                                <td width=150px>${count_topic }</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
    </div>

    <!-- right side pannel elements starts here-->
    <div class="col-md-7">

    <div class="panel panel-default">
        <div class="panel-heading">Profile</div>
        <div class="panel-body">
            <g:form class="form-horizontal"  controller="profile" action="profile" enctype="multipart/form-data">
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">First Name *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="fname" id="fname" value="${userdata.firstName}" >
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">Last Name *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="lname" id="lname" value="${userdata.lastName}" >
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">Username *</text>
                    <div class="col-md-8">
                       %{-- <g:select from="${name}" />--}%
                        <input type="text" class="form-control" id="username" name="username" value="${userdata.username}" >
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                    <div class="col-md-8">
                        <input type="file" class="form-control" accept=".jpg,.jpeg,.png" id="inputphoto" value="${userdata.photo}" name="inputphoto">
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-md-8">
                    </div>
                    <div class=" col-md-4">

                        <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                    </div>
                    ${flash.message9}
                </div>
            </g:form>
            ${flash.message6}
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Change Password</div>
        <div class="panel-body">
            <g:form class="form-horizontal"  controller="Profile" action="password" >

                <div class="form-group">
                    <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="password" placeholder="Password" value="${userdata.password}" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="pwd" style="text-align: left;" >ConfirmPassword*</text>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="confirmpassword" placeholder="Confirm password" value="${userdata.password}" name="confirmpassword" onfocusout="Matchpassword()">
                    </div>
                    <g:if test="${flash.message}">
                        <div class="message">
                            ${flash.message}
                        </div>
                    </g:if>
                    <div>
                        <span id="matching" style="color: #761c19" ></span>
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