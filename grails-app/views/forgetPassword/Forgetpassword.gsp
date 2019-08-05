<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forget Password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-3.3.1.js"></script>


</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container col-md-12" style="background: #31b0d5">
                <div class="col-md-8">
                    <h2 style="color: #a60000" onclick="myFunc()"><a href="#"><strong> <u>Link Sharing</u></strong></a></h2>
                </div>
                <br>
                <div class="col-md-3">
                    <div class="input-group">
                        <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                        <div class="input-group-btn">
                            <button class="btn btn-basic" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
<div class="row" style="alignment: center;width:50% " >
    <div class="panel-default" style="height:30px" class="col-md-8">
        <div class="panel-heading">Send Reset Link
        </div>
        <div class="panel-body">
            <g:form url="[controller:'sendLink' , action : 'link']" class="form-horizontal">
                <div class="form-group">
                    <text class="control-label col-md-4" for="resetPassword"  style="text-align: left;">Email *</text>
                    <div class="col-md-8">
                        <input type="email" class="form-control" id="resetPassword" placeholder="Enter email" name="fetchemail">
                    </div>
                    ${flash.message8}
                </div>
                <div class=" offset-md-2">
                    <button type="submit" class="btn btn-basic">
                        Send Link
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
</div>
</body>
</html>