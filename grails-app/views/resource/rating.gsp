<%@ page import="linksharing.Resource" %>
<%@ page import="linksharing.DocumentResource" %>
<!DOCTYPE html>
<html>
<head>
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
    <g:javascript>
    var url="${createLink(controller:'resourceRating',action:'save')}"
</g:javascript>
    <title>Rating</title>
    <g:render template="/layout/dashboard"/>

</head>
<body onload="Ratingsprint(${value})">
<div class="container">
        <div class="row" class="rate">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-2">
                                <asset:image src="${resource.user.photo}" style="width:70px;height:70px"/></div>
                            <div class="col-md-6">
                                <div style="font-size:18px;"><b>${resource.user.firstName}&nbsp${resource.user.lastName}</b></div>
                                <div>@${resource.user.username}</div></div>
                            <div class="col-md-4">
                                <g:link controller="topic" action="index" params="[id: resource.topic.id]">${resource.topic.name}</g:link><br>
                                ${resource.dateCreated}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                ${resource.description}
                            </div>
                            <div class="col-md-3">
                                <span id="1" onclick="Rating('${session.name}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                                <span id="2" onclick="Rating('${session.name}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                                <span id="3" onclick="Rating('${session.name}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                                <span id="4" onclick="Rating('${session.name}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                                <span id="5" onclick="Rating('${session.name}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>
                            </div>
                        </div>
                       <br><br><br>

                        <div class="row">
                        %{--<div class="col-md-6"></div>--}%
                        <div class="col-md-2">
                        <g:if test="${resource.user.email==session.name}">
                            <g:link controller="resource" action="delete" params="[id:resource.id]">Delete</g:link>
                        </g:if>
                        </div>
                        <g:if test="${resource.user.email==session.name}">
                            <g:if test="${resource.hasProperty("path")}">
                                <div class="col-md-1">
                                    <a data-toggle="modal" data-target="#editdesc">Edit</a>
                                </div>
                            </g:if>
                            <g:else>
                                <div class="col-md-1">
                                    <a data-toggle="modal" data-target="#editdesc">Edit</a>
                                </div>
                            </g:else>
                        </g:if>
                            <g:if test="${resource.hasProperty("Linkurl")}">
                            <div class="col-md-2">
                            <a href="${resource.Linkurl}" target="_blank">View Full Site</a>
                            </div>
                            </g:if>
                            <g:else>
                            <div class="col-md-2">
                            <g:link controller="Document" action="download" params="[id:resource.id]" >Download</g:link>
                            </div>
                            </g:else>
                            <br>
                        </div>
            </div>
                </div>
        </div>


            %{--Edit Resorece Model--}%
            <div class="modal fade"  id="editdesc" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Share Document</h4>
                        </div>
                        <div class="modal-body">
                            <g:uploadForm  controller="topic" action="editDocument" params="[id:resource.id,tname:resource.topic.name]" class="topicForm">
                                Document *:
                                <g:if test="${resource.hasProperty("path")}">
                                    <input type="file" class="form-control" id="doc" placeholder="choose"  name="document">${resource.path}
                                </g:if>
                                <g:else>
                                    <g:field type="url" class="form-control" id="linkres" value="${resource.url}" placeholder="Link" name="link" ></g:field>
                                </g:else>
                                <br>
                                <br>
                                Description *:
                                <textarea class="form-control" id="select" name="desc" >${resource.description}</textarea>
                                <br>
                                Topic:
                                <label class="form-control" type="text"  name="topicName" id="topicName" >"${resource.topic.name}"</label>
                                <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>
                                <br>
                                <br>
                            </g:uploadForm>
                        </div>
                    </div>
                </div>
            </div>




%{--TRENDING TOPICS--}%
            <div class ="col-md-6">
                <div class="panel panel-default" style="height:280px;overflow: auto;">
                    <div class="panel-heading">Trending Topics
                    </div>
                    <div class="panel-body">
                        <g:each in="${trending}" var="us" status="i">
                            <ul class="list-inline">
                                <li>
                                <div class="row">
                                    <div class="col-md-4">
                                        <asset:image src="${us.createdBy.photo}"  style="width:70px;height:70px"/></div>
                                    <div class="col-md-4">
                                        <div style="font-size:20px;"><b>${us.name}</b></div>
                                        </div>
                                        <div class="col-md-4" style="font-size:23px;">@${us.createdBy.username}</div>

                                        <div class="col-md-4">
                                            Subscriptions:
                                            <div>${countforsubs.getAt(i)}</div>
                                        </div>
                                        <div class="col-md-4">
                                            Posts:
                                            <div>${countforposts.getAt(i)}</div>
                                        </div>
                                    <div class="col-md-8">
                                        <g:link controller="subscription" action="subscribe" params="[id:us.id ,page:"rating"]">Subscribe</g:link>
                                    </div>
                                </div>
                            </li>
                            </ul>
                        </g:each>
                        <hr size="80px">
                    </div>

                </div>
            </div>
        </div>
        <script>
            function Rating(username , resourceId , value)
            {
                console.log("inside")

                for(var i=1;i<=5;i++)
                {
                    document.getElementById(i).style.color="black";
                }

                for(var i=1;i<=value;i++)
                {
                    document.getElementById(i).style.color="red";
                }

                console.log("above ajax")
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
                    document.getElementById(i).style.color="red";
                }
            }
        </script>
</body>
</html>