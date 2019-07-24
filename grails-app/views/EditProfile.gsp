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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
</head>
<body>
<div class="container"><br>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-8">
                    <h4><a href="${Holders.config.server.host}"><strong> <u>Link Sharing</u></strong></a></h4>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                        <div class="input-group-btn">
                            <button class="btn btn-basic" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
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
            <form class="form-horizontal"  action="/action_page.php">
                <div class="form-group">
                    <text class="control-label col-md-4" for="firstname" style="text-align: left;">First name *</text>
                    <div class="col-md-8">
                        <input type="email" class="form-control" id="firstname" placeholder="firstname" name="firstname">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="lastname" style="text-align: left;">Last name *</text>
                    <div class="col-md-8">
                        <input type="email" class="form-control" id="lastname" placeholder="lastname" name="lastname">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="username" style="text-align: left;">User name *</text>
                    <div class="col-md-8">
                        <input type="email" class="form-control" id="username" placeholder="username" name="username">
                    </div>
                </div>

                <div class="form-group">
                    <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                    <div class="col-md-8">
                        <input type="file" class="form-control" id="photo" placeholder="choose" name="inputphoto">
                    </div>
                </div>

                <div class="col-md-offset-9">
                    <button type="submit" value="Update" class="btn btn-basic btn-block" width=100%>Update</button>
                </div>
            </form>
            </div>
        </div>




        <div class="panel panel-default">
            <div class="panel-heading">Change password</div>
            <div class="panel-body">
            <form class="form-horizontal"  action="/action_page.php">
                <div class="form-group">
                    <text class="control-label col-md-4" for="firstname" style="text-align: left;">Password *</text>
                    <div class="col-md-8">
                        <input type="password" class="form-control" id="passwd" placeholder="firstname" name="passwd">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="confirmpwd" style="text-align: left;">Confirm password *</text>
                    <div class="col-md-8">
                        <input type="email" class="form-control" id="confirmpwd" placeholder="lastname" name="confirmpwd">
                    </div>
                </div>

                <div class="col-md-offset-9">
                    <button type="submit" value="Update" class="btn btn-basic btn-block" width=100%>Update</button>
                </div>
            </form>
            </div>
        </div>

    </div>








</div>
</body>
</html>