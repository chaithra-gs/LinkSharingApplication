<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<div class="container"><br>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container">
                    <div class="col-md-5">
                        <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
                    </div>
                    <div class="col-md-7">
                        <table class="table">
                            <td width=200px>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-basic" type="submit">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                            </td>

                            <td width=30px> <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#resource"><i class="material-icons" style="text-align:center;">
                                attach_file
                            </i></button>
                            </td>

                            <td width=30px><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#linkresource"><i class="material-icons" style="text-align:center;">description
                            </i></button>
                            </td>

                            <td width=30px> name here%{--${userdata.username}--}%
                            </td>

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Menu
                                        <span class="caret" onclick="display()"></span></button>
                                    <ul class="dropdown-menu" id="drop">
                                        <li><a href="#">profile</a></li>
                                        <li><a href="/user/showlist">Users</a></li>
                                        <li><a href="/user/logout">Logout</a></li>
                                    </ul>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-5">
            %{--here left pannel elements--}%

            %{-- particular topic information--}%
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div>Topic:%{--${}--}%</div>
                </div>
                <div class="panel-body">
                    <table>
                        <tr>
                            <td rowspan="3" align="center">
                                <asset:image src="https://i.stack.imgur.com/l60Hf.png" style="width:60px;height:60px"/>
                            </td>
                            <td>
                                Grails
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">
                                @emailid here
                            </td>
                            <td style="width: 30%">
                                <nbsp></nbsp>Subscriptions
                            </td>
                            <td style="width: 50%">
                                Post
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">
                                <a>Subscribe</a>
                            </td>
                            <td style="width: 30%">
                                50
                            </td>
                            <td style="width: 30%">
                                50
                            </td>
                        </tr>
                        <tr>
                            <td>


                            </td>
                        </tr>
                    </table>
                    <div>
                        <g:form controller="subscription" action="updateSerious">
                            <g:field type="hidden" name="id" ></g:field>
                            <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"/>
                        </g:form>

                    </div>


                </div>
            </div>

            %{-- all the users of particular topic--}%

            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: medium">
                    users
                </div>
                <div class="panel-body">
                    <g:each in="${subscriptions}" var="us" status="i">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                    <asset:image src="https://i.stack.imgur.com/l60Hf.png" style="width:60px;height:60px"/>
                                </div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;">%{--<g:link controller="dashboard" action="index" params="[id: us.id]">${us.topic.name}</g:link>--}%</div>
                                    <div>@%{--${us.topic.createdBy.username}--}%</div>
                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>%{--${subscount.getAt(i) }--}%</div></div>
                                    <div class="col-sm-6">
                                        Posts:
                                        <div><a>%{--${resourcecount.get(i)}--}%</a></div></div>
                                    <a>Unsubscribe</a></div></div>
                        </li>
                    </g:each>

                </div>
            </div>

        </div>


    %{--here  right pannel elements--}%

        <div class="col-md-7">
            %{--here posts of particular topic --}%
            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: medium">
                    posts:grails
                </div>
                <div class="panel-body">
                    %{--<g:each in="${subscriptions}" var="us" status="i">--}%
                        <li>
                                <div class="col-md-4">
                                    <img src="https://i.stack.imgur.com/l60Hf.png" style="width:60px;height:60px"/>
                                </div>
                                <div class="col-md-8">
                                    <div>%{--${descriptionhere}--}% nkjsCJBNCBKNCLKAHCLKNCMN,.ZNCLKHCCN M,NVDFsBNKALHA</div>
                                </div>
                                    <div class="row">
                                    <div class="col-md-3">
                                        <a href="#">Downloads</a>
                                    </div>
                                        <div class="col-md-3">
                                            <a href="#">View Fullsite</a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">Mark as Unread</a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">view Post</a>
                                        </div>
                                    </div>
                                </div>

                        </li>
                   %{-- </g:each>--}%

                </div>
            </div>
            </div>
    </div>



</div>
</body>
</html>