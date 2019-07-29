<%--
  Created by IntelliJ IDEA.
  User: chaithra
  Date: 26/07/19
  Time: 12:50 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        Reset Password
    </title>
</head>
<body>
<g:form url="[controller:'forgetPassword' , action : 'updatePassword']" class="form-horizontal">
    <input type="hidden" id="hiddenEmail" name="hiddenEmail" value="">
    <div class="form-group">
        <text class="control-label col-md-4" for="email"  style="text-align: left;">
            Enter New Password
        </text>
        <div class="col-md-8">
            <input type="password" class="form-control" id="resetPass" placeholder="Enter password" name="newpassword">
        </div>
    </div>
    <br>
    %{--<div class="form-group">
        <text class="control-label col-md-4" for="email"  style="text-align: left;">
            Confirm New Password
        </text>
        <div class="col-md-8">
            <input type="email" class="form-control" id="resetConfirmPass" placeholder="confirm Password" name="confirmPassword">
        </div>
    </div>--}%
    <br>
    <div class=" offset-md-1">
        <button type="submit" class="btn btn-basic">
            Update Password
        </button>
    </div>
</g:form>
</body>
</html>