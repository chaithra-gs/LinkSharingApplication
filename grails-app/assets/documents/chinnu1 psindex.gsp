<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
           <meta name="description" content="" />
           <meta name="author" content="" />
           <!--[if IE]>
               <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
               <![endif]-->
           <title>LINK SHARING APPLICATION</title>
           <!-- BOOTSTRAP CORE STYLE  -->
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>

           <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
           <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
       	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
      document.getElementById(i).style.color="orange";
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







