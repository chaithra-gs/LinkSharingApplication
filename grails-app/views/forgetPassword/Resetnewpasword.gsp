
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        Reset Password
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="jquery-3.3.1.js"></script>
    <script type = "text/javascript">
        var Matchpassword=function () {
            var password = document.getElementById("password").value;
            var confirmPassword =document.getElementById("confirmpassword").value;

            if(password!=confirmPassword){

                document.getElementById("password").value = "";
                document.getElementById("confirmpassword").value = "";
                document.getElementById("matching").innerHTML="Not Match!!!";
            }
            else
            {
                document.getElementById("matching").innerHTML="Match!!!"
            }

        }
    </script>
</head>
<body>
<br>
<br>
<div class="container col-md-2" style="alignment: center" >
    <div class="panel-default">

        <div class="panel-body">
            <g:form url="[controller:'forgetPassword' , action : 'updatePassword']" class="form-horizontal">


                Enter password:<br>
                <input type="password" name="password"  placeholder="password">
                <br>
                Confirm Password:<br>
                <input type="password" name="confirmpassword"  placeholder="confirmpassword">
                <br>
                <g:if test="${flash.message10}">
                    <div class="message col-md-3">
                        ${flash.message10}
                    </div>
                </g:if>
                <div>
                    <span id="matching" style="color: #761c19" ></span>
                </div>
                <br>
                <br>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-basic">
                        Update Password
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>