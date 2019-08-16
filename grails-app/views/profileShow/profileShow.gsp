<html>
<head>
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

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    .dropbtn {
        background-color: #d58512;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }
    .dropdown {
        position: relative;
        display: inline-block;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-content a:hover {background-color: #ddd;}
    .dropdown:hover .dropdown-content {display: block;}
    .dropdown:hover .dropbtn {background-color: #3e8e41;}
    </style>
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
                        <table class="table">
                            <td width=200px>
                                <div class="input-group">
                                    <g:form controller="search" action="search">
                                        <div class="input-group">
                                            <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-basic" type="submit">
                                                    <span class="glyphicon glyphicon-search" style="height: 20%"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </g:form>
                                    <div style="font-size: medium" >
                                        ${flash.message4}   ${flash.message11} ${flash.message13} ${flash.message23} ${flash.message}
                                    </div>
                                </div>
                            </td>
                            <td width=10px style="text-align:center;"}>
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" title="Create topic"   data-target="#topicModal">
                                    <i class="material-icons">chat_bubble_outline</i></button>

                            </td>

                            <td width=30px style="text-align:center;"><button type="button" class="btn btn-info btn-group-sm" title="Send invitation" data-toggle="modal" style="caret-color: #48802c"   data-target="#invite"><i class="material-icons">
                                mail_outline
                            </i></button>
                            </td>

                            <td width=30px> <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" title="Create resource"  data-target="#resource"><i class="material-icons" style="text-align:center;">
                                attach_file
                            </i></button>
                            </td>

                            <td width=30px><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" title="Create link"  data-target="#linkresource"><i class="material-icons" style="text-align:center;">description
                            </i></button>
                            </td>

                            <td width=30px>%{--<a href="/User/myaction" >--}%<asset:image src="${userdata.photo}"  height="38px" width="40px" style="margin-right: 10px;"></asset:image>%{--</a>--}%
                            </td>

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary" >${userdata.username}
                                    </button>
                                    <div class="dropdown-content">

                                        <g:if test="${userdata.admin==true}">
                                            <a href="/User/myaction">Profile</a>
                                            <a href="/user/showlist" >Users</a>
                                            <a href="/topic/topiclist">Topics</a>
                                            <a href="/resource/postlist">Posts</a>
                                            <a href="/user/logout">Logout</a>
                                        </g:if>
                                        <g:else>
                                            <a href="/User/myaction">Profile</a>
                                            <a href="/user/logout">Logout</a>
                                        </g:else>
                                    </div>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- write here for left column pannels-->
    <div class="col-md-5">
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


    %{--TOPICS PANNEL--}%

        <div class="panel panel-default">
            <div class="panel-heading">Topics:</div>
            <div class="panel-body">
                <g:each in="${topics}" var="us" status="i">
                    <ul class="list-inline">
                        <li>
                            <div class="row">
                                <div class="col-md-6">
                                    <div style="font-size:15px;">
                                        <g:link><b>${us.name}</g:link></b>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                        Subscriptions:
                                        <div>${subs1.get(i)}</div>&nbsp
                                </div>
                                <div class="col-md-offset-1" style="float: right">
                                        Posts:
                                        <div>${topic1.getAt(i)}</div>
                                </div>
                                <g:link controller="subscription" action="subscribe" params="[id:us.id ,page:"dashboard"]">Subscribe</g:link>
                        </li>
                    </ul>
                </g:each>

            </div>
        </div>

    <div class="panel panel-default">
        <div class="panel-heading">Subscriptions:</div>
        <div class="panel-body">
            <g:each in="${allTopics}" var="us" status="i">
                <ul class="list-inline">
                    <li>
                        <div class="row">
                            <div class="col-md-6">
                                <div style="font-size:15px;">
                                    <g:link><b>${us.name}</g:link></b>
                                </div>
                            </div>
                            <div class="col-md-3" style="float: right">
                                Subscriptions:
                                <div>${allSubs1.get(i)}</div>
                            </div>
                            <div class="col-md-3" style="float: right">
                                Posts:
                                <div>${allTopics1.getAt(i)}</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </g:each>

        </div>
    </div>
    </div>

    %{--RIGHT SIDE PANNEL --}%

    <div class="col-md-7" style="float: left">
    <div class="panel panel-default" >
        <div class="panel-heading">Posts:</div>
        <div class="panel-body" style="overflow: auto;height: 280px">
            <g:each in="${resources}" var="res" status="i">
                <div class="row" style="margin-left: 2%;font-size: medium;text-transform: capitalize"><u>${res.topic.name}</u>
                </div>
                <div class="row">
                    <div class="col-md-4">
                <asset:image src="${userdata.photo}" style="width:90px;height:90px"/>
                    </div>

                    <div class="col-md-8">${res.description}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <g:if test="${res instanceof linksharing.LinkResource}">
                            <a href="${res.Linkurl}" target="_blank" class="col-md-3">View Full Site</a>
                        </g:if>
                    </div>
                    <div class="col-md-3">
                        <g:if test="${res instanceof linksharing.DocumentResource}">
                            <g:link controller="Document" action="download" params="[id:res.id , tid:res.topic.id]" >Download</g:link>
                        </g:if>
                    </div>
                  %{--  </div>--}%
                    <div class="col-md-3">
                        <g:link controller="Resource" action="index" params="[id:res.id]" >View post</g:link>
                    </div>
                </div>
            </g:each>
            <br>
                </div>
                </br>
                 </div>

        </div>
    </div>
</div>
</div>
</body>
</html>