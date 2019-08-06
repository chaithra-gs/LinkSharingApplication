%{--
<!DOCTYPE html>
<html>
    <head>
        head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script>
            function display(){
                document.getElementById("droped").style.display="block";
            }
        </script>
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

                            --}%
%{-- <td width=40px style="text-align:right;"><i class="material-icons">face</i>
                             </td>--}%%{--


                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary" >${userdata.username}
                                    </button>
                                    <div class="dropdown-content">

                                        <g:if test="${userdata.admin==true}">
                                            <a href="/User/myaction">profile</a>
                                            <a href="/user/showlist" >Users</a>
                                            <a href="/topic/topiclist">Topics</a>
                                            <a href="/resource/postlist">posts</a>
                                            <a href="/user/logout">Logout</a>
                                        </g:if>
                                        <g:else>
                                            <a href="/User/myaction">profile</a>
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


</head>
<body onload="Ratingsprint('${rating}')">
<div class="container"><br>
    <div class="panel panel-default" style="height:70px">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-6">
                    <h4><g:link controller="users" action="dashboard"><strong> <u>Link Sharing</u></strong></g:link></h4>
                </div>
                <div class="col-md-4">
                    <g:form controller="search" action="search">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search" id="txtSearch"/>
                            <div class="input-group-btn">
                                <button class="btn btn-basic" type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>



                <div class ="col-md-2">
                    ${session.username}

                    <li class="fa fa-caret-down"  onclick="Show()"></li>
                    <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
                        <li style="height:20px"><a href="#">Profile</a></li>
                        <li style="height:20px"><a href="#">Users</a></li>
                        <li style="height:20px"><a href="#">Topics</a></li>
                        <li style="height:20px"><a href="#">Posts</a></li>
                        <li style="height:20px"><a href="">Logout</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-7">


                <div class="panel panel-default">


                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-2">
                                <asset:image src="${resource.owner.photo}" style="width:70px;height:70px"/></div>
                            <div class="col-md-6">
                                <div style="font-size:18px;"><b>${resource.owner.firstname}&nbsp${resource.owner.lastname}</b></div>
                                <div>@${resource.owner.username}</div></div>
                            <div class="col-md-4">
                                <g:link controller="topic" action="index" params="[id: resource.topic.id]">${resource.topic.name}</g:link><br>
                                ${resource.dateCreated}
                            </div></div>
                        <div class="row">
                            <div class="col-md-9">



                                ${resource.description}</div>
                            <div class="col-md-3">
                                <span id="1" onclick="Rating('${session.username}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                                <span id="2" onclick="Rating('${session.username}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                                <span id="3" onclick="Rating('${session.username}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                                <span id="4" onclick="Rating('${session.username}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                                <span id="5" onclick="Rating('${session.username}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>
                            </div>
                        </div><br><br><br>
                        <p id="test"></p>


                    <div class="row">
                        <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <g:if test="${resource.owner.username==session.username}">
                            <g:link controller="resource" action="delete" params="[id:resource.id]">Delete</g:link>
                            </div>
                            <div class="col-md-2">
                                <a>Edit</a>
                            </div></g:if>
                        <g:else>
                            <a>Delete</a>
                            </div>
                            <div class="col-md-2">
                                <a>Edit</a>
                            </div>
                        </g:else>


                        <div class="col-md-2">
                            <g:link controller="resource" action="index">Download</g:link>
                        </div>

                        <div class="col-md-2">
                            <a>View full site</a>   </div>
                    </div>




                </div>
            </div></div>

        <div class ="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading"><div style="float:left">Trending Topics</div>

                </div>
                <div class="panel-body">
                    <g:each in="${trending}" var="us" status="i">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                    <asset:image src="${Topic.get(us).owner.photo}"  style="width:70px;height:70px"/></div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;"><b>${Topic.get(us).name}</b></div>
                                    <div>@${Topic.get(us).owner.username}</div>

                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${countforsubs.getAt(i)}</div></div>
                                    <div class="col-sm-6">

                                        Posts:
                                        <div><a>${countforposts.getAt(i)}</a></div></div>
                                </div>
                                <a>Unsubscribe</a></div>

                        </li>
                    </g:each>

                </div>

            </div>
        </div>

    </div>



    <script>
        function Rating(username , resourceId , value)
        {

            for(var i=1;i<=5;i++)
            {
                document.getElementById(i).style.color="black";
            }

            for(var i=1;i<=value;i++)
            {
                document.getElementById(i).style.color="red";
            }

            var url="${createLink(controller:'ResourceRating',action:'save')}"

            $.ajax({
                "url":     url,
                "type":    "get",
                "data":    {username : username , resourceId : resourceId , value : value},
                success: function(resp){
                    document.getElementById("test").innerHTML=resp.success
                }
            });

        }
        function Ratingsprint(value)
        {
            for(var i=1;i<=5;i++)
            {
                document.getElementById(i).style.color="black";
            }

            for(var i=1;i<=value;i++)
            {
                document.getElementById(i).style.color="orange";
            }
        }
    </script>


</body>
</html>--}%
