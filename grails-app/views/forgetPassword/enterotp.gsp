<%--
  Created by IntelliJ IDEA.
  User: chaithra
  Date: 05/08/19
  Time: 11:23 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="container col-md-2" style="alignment: center" >
    <div class="panel-default">

        <div class="panel-body">
            <g:form url="[controller:'sendLink' , action : 'resetpage']" class="form-horizontal">


                Enter OTP:<br>
                <input type="password" name="otp"  placeholder="Enter Otp">
                <br>
                <br>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-basic">
                        Submit
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>