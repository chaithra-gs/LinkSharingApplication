<%@ page import="linksharing.Resource" %>
<html>
<head>
    <title>Home Page</title>
    <g:render template="/layout/dashboard"/>
</head>
<body>
<div class="container"><br>
    <!-- for left pannel elements -->

    <div class="row">
        <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table   style="width:100%">
                            <tr>
                                <td rowspan="4" colspan="3" width="10%">
                                    <g:link controller="profileShow" action="showData"> <asset:image src="${userdata.photo}" style="width:90px;height:90px;margin-right:10px"></asset:image></g:link>
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
           %{-- </div>--}%

            %{--subscription Modal--}%
            <div class="panel panel-default" style="height:300px;overflow: auto;">
                <div class="panel-heading">Subscriptions
                </div>
                <div class="panel-body" >
                    <g:each in="${subscriptions}" var="us" status="i">
                        <ul class="list-inline">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                   <g:link controller="profileShow" action="showData"> <asset:image src="${userdata.photo}" style="width:90px;height:90px"></asset:image></g:link></div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;">
                                        <g:link controller="topic" action="topicshow" params="[id: us.id]"> ${us.topic.name} </g:link>

                                    </div>
                                    <div>@${us.topic.createdBy.username}</div>
                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${subscount.getAt(i) }</div>
                                    </div>
                                    <div class="col-sm-6">
                                        Posts:
                                        <div>${resourcecount.get(i)}</div>
                                    </div >
                                    <div class="col-sm-6">
                                    <g:if test="${us.topic.createdBy.email==session.name}">
                                        <a>unsubscribe</a>
                                    </g:if>
                                   <g:else>
                                        <g:link controller="subscription" action="changesub" params="[id:us.id ,  flag:0]">Unsubscribe</g:link></div>
                                    </g:else>
                                    </div>
                                <g:if test  = "${us.topic.createdBy.email==session.name}" >
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-1">
                                                <g:link controller="topic" action="deleted" params="[id:us.topic.id]"><span class="glyphicon glyphicon-trash"></span></g:link>
                                            </div>
                                            <div class="col-md-7">%{--controller="subscription" action="updateSerious"--}% %{--onChange="submit()"--}%
                                                    <g:form controller="subscription" action="updateSerious">
                                                        <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                        <g:select onChange="submit()" id="modify" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                                  value="${us.seriousness}" />
                                                    </g:form>
                                        </div>
                                        <div class="col-md-3">

                                                    <g:form controller="topic" action="updateVisibility"><g:field type="hidden" name="id" value="${us.topicId}"></g:field>
                                                        <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                                  value="${us.topic.visibility}" />
                                                    </g:form>
                                        </div>
                                        </div>
                                    </div>
                                </g:if>
                                <g:else>
                                    <g:form controller="subscription" action="updateSerious">
                                        <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                        <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                  value="${us.seriousness}" />
                                    </g:form>
                                </g:else>
                        </li>
                        </ul>
                    </g:each>
                </div>
            </div>


           %{-- Trending topic --}%

            <div class="panel panel-default" style="height:300px;overflow: auto;">
                <div class="panel-heading">Trending Topics
                    <div style="float:left"></div>
                </div>
                <div class="panel-body">
                    <g:each in="${trending}" var="us" status="i">
                        <ul class="list-inline">
                    <li>
                    <div class="row">
                        <div class="col-md-4">
                            <g:link controller="profileShow" action="showData"> <asset:image src="${userdata.photo}" style="width:90px;height:90px;"></asset:image></g:link>
                        </div>
                        <div class="col-sm-8">
                            <div style="font-size:15px;">
                                <g:link><b>${us.name}</g:link></b></div>
                            <div>@${us.createdBy.username}</div>

                            <div class="col-sm-6">
                                Subscriptions:
                                <div>${subs1.get(i)}</div></div>
                            <div class="col-sm-6">
                                Posts:
                                <div>${topic1.getAt(i)}</div></div>
                        </div>

                        <g:link controller="subscription" action="subscribe" params="[id:us.id ,page:"dashboard"]">Subscribe</g:link>
                    </div>

                    </li>
                        </ul>
                    </g:each>
                </div>
            </div>

        </div>
        <!-- this is for right side pannel -->


        <div class="col-md-7">
        %{--INBOX HERE--}%
            <div class="panel panel-default" style="height:350px;overflow: auto;">
                <div class="panel-heading">Inbox</div>
                <div class="panel-body">
                    <g:each in="${resources}" var="res" status="i">
                        <ul class="list-inline">
                        <li>
                            <div class="row">
                                <div class="col-md-3">
                                   %{-- <asset:image src="${res.user.photo}"  style="width:90px;height:90px"/>--}%
                                    <g:link controller="profileShow" action="showData"> <asset:image src="${userdata.photo}" style="width:90px;height:90px;margin-right: 2%"></asset:image></g:link>
                                </div>
                                <div class="col-md-9">
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
                                    <g:if test="${res.hasProperty("Linkurl")}">

                                        </div>
                                        <div class="col-md-3">
                                            <a href="${res.Linkurl}" target="_blank">View Full Site</a>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <g:link  controller="Document" action="download" params="[id:res.id , tid:res.id , flag:1]"  >Download</g:link>
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </g:else>

                                    <div class="col-md-3">
                                        <g:link  id="changeread" onclick="updateread('${userdata.username}','${res.id}')" >Mark as read</g:link>
                                    </div>
                                    <div class="col-md-3">
                                        <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </ul>
                       <hr style="color: black" size="100" color="black">
                    </g:each>

                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editTopicModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Topic</h4>
            </div>
            <div class="modal-body">
                <g:uploadForm  class="topicForm" controller="topic" action="updateTopic" params="[id:user.topics.id]">
                    Name *:
                    <input type="text" class="form-control"  name="topicName" value="${user.topics.name}" id="tname"/>
                    Visibility *:
                    <select class="form-control" id="select" name="selection" value="${user.topics.visibility}">
                        <option>PUBLIC</option>
                        <option>PRIVATE</option>
                    </select>
                    <input type="submit" value="save" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                </g:uploadForm>
            </div>
            <div class="modal-footer" style=" margin-top: 15px;">
                <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</div>

%{--EDIT TOPIC MODEL--}%

<!-- create topic -->
<div class="modal fade" id="topicModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topic</h4>
            </div>
            <div class="modal-body">
                <g:form  controller="topic" action="save" class="topicForm">
                    Name *:
                    <input class="form-control" type="text" name="topicName" pattern="[A-Za-z0-9]+"   title="Only characters  and numericals allowed" required id="topicName"/>
                    Visibility *:
                    <select class="form-control" id="select" name="selection">
                        <option>PUBLIC</option>
                        <option>PRIVATE</option>
                    </select>
                    <input type="submit" value="save" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                </g:form>

            </div>
            <div class="modal-footer" style=" margin-top: 15px;">
                <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
    function displaydocument(){
        document.getElementById("drop").style.display="block";
    }
    function displayinvite(){
        document.getElementById("drop").style.display="block";
    }
    var resetTopicForm = function () {
        $(".topicForm").trigger("reset");
    }
    function modifyThis(){
        alert("hi");
        var seriousness =${'#modify'}.val();
        $.ajax({
            "url": urll,
            "type": "get",
            "data": {seriousness: seriousness}
        });
    }
</script>
</body>
</html>