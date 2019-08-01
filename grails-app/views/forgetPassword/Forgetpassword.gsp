<%--
  Created by IntelliJ IDEA.
  User: chaithra
  Date: 26/07/19
  Time: 12:47 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forget Password</title>
</head>
<body>

<g:form url="[controller:'sendlink' , action : 'index']" class="form-horizontal">
    <div class="form-group">
        <text class="control-label col-md-4" for="resetPassword"  style="text-align: left;">Email *</text>
        <div class="col-md-8">
            <input type="email" class="form-control" id="resetPassword" placeholder="Enter email" name="fetchemail">
        </div>
    </div>
    <div class=" offset-md-2">
        <button type="submit" class="btn btn-basic">
            Send Link
        </button>
    </div>
</g:form>

</body>
</html>