<%--
  Created by IntelliJ IDEA.
  User: chaithra
  Date: 06/08/19
  Time: 2:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
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
    <div>
        <div class="panel panel-default">
            <div class="panel-heading">Recent shares</div>
            <div class="panel-body">
                <g:each in="${resources}" var="res" status="i">
                    <ul class="list-inline">
                        <li>
                            <div class="row">
                                <div class="col-md-3">
                                    <asset:image src="${res.user.photo}"  style="width:90px;height:90px"/></div>
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <b>${res.user.firstName}&nbsp${res.user.lastName}</b></div>
                                        <div class="col-sm-5">@${res.user.username}</div>

                                        <a class=col-sm-3 style="font-size: medium"><u>${res.topic.name}</u></a></div>
                                    <br>
                                    <div class="row">
                                        ${res.description}
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                                        </div>
                                    </div>
                                </div>
                                </div>
                        </li>
                    </ul>
                </g:each>

            </div>

        </div>

    </div>
</div>
</div>
</body>
</html>