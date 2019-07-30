<html>
<head>
    <title>
        User List
    </title>
    <style>

    </style>
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
</head>
<body>
<div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container col-md-12" style="background: #31b0d5">
                    <div class="col-md-5">
                        <h2 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h2>
                    </div>
                    <div class="col-md-7">
                        <table class="table" id="tab1" style="background-color: #31b0d5">
                            <td width=200px>
                                <div class="input-group">
                                    <g:form controller="search" action="search">
                                        <div class="input-group">
                                            <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-basic" type="submit">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </g:form>

                                </div>
                            </td>
                            <td width=10px style="text-align:center;"}>
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"    data-target="#topicModal">
                                    <i class="material-icons">chat_bubble_outline</i></button>

                            </td>

                            <td width=30px style="text-align:center;"><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" style="caret-color: #48802c"   data-target="#invite"><i class="material-icons">
                                mail_outline
                            </i></button>
                            </td>

                            <td width=30px> <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#resource"><i class="material-icons" style="text-align:center;">
                                attach_file
                            </i></button>
                            </td>

                            <td width=30px><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#linkresource"><i class="material-icons" style="text-align:center;">description
                            </i></button>
                            </td>

                            %{-- <td width=40px style="text-align:right;"><i class="material-icons">face</i>
                             </td>--}%

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${userdata.username}
                                        <span class="caret" onclick="display()" ></span></button>
                                    <ul class="dropdown-menu" id="droped" style="width: 100%">
                                        <g:if test="${userdata.admin==true}">
                                            <li><a href="/User/myaction">profile</a></li>
                                            <li><a href="/user/showlist" >Users</a></li>
                                            <li><a href="/topic/topicshow">Topics</a></li>
                                            <li><a href="/user/logout">Logout</a></li>

                                        </g:if>
                                        <g:else>
                                            <li><a href="/User/myaction">profile</a></li>
                                            <li><a href="/user/logout">Logout</a></li>

                                        </g:else>
                                    </ul>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 centered">
                <table border="1px" class="table table-striped table-bordered table-hover" style="padding: 10px;">
                    <tr>
                        <td class="table-header">Id</td>
                        <td class="table-header">Username</td>
                        <td class="table-header">Email</td>
                        <td class="table-header">Firstname</td>
                        <td class="table-header">Lastname</td>
                        <td class="table-header">Active</td>
                        <td class="table-header">Manage</td>
                    </tr>
                    <g:each in="${userList}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <g:if test="${user.active}">
                                <td>Yes</td></g:if>
                            <g:else>
                                <td>No</td>
                            </g:else>
                            <g:if test="${user.active}">
                                <td><g:link class="anchor-nounderline" controller="user" action="deactivate"
                                            params="[userId: user.id]">Active</td></g:link>
                            </g:if>
                            <g:else>
                                <td><g:link class="anchor-nounderline" controller="user" action="activate"
                                            params="[userId: user.id]">Deactivated</td></g:link>
                            </g:else>
                        </tr>
                    </g:each>
                </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div>
</body>
</html>