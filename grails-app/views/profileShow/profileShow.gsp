<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <title>Profile</title>
    <g:render template="/layout/dashboard"/>
</head>
<body>
<div class="container">
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
                                <div class="col-md-5">
                                    <div style="font-size:15px;">
                                        <g:link><b>${us.name}</g:link></b>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    Posts:
                                    <div>${topic1.getAt(i)}</div>
                                </div>
                                <div class="col-md-3" style="float: right">

                                    Subscriptions:
                                    <div>${subs1.get(i)}</div>&nbsp
                                </div>
                            </div>
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