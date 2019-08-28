<html>
<head>
    <title>
        User List
    </title>
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
            console.log("hi")
        } );
    </script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>
    <title>User List</title>
    <g:render template="/layout/dashboard"/>

</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 centered">
                <table id="example" class="table table-striped table-bordered">
                    <tr>
                        <td class="table-header">SI.No </td>
                        <td class="table-header">Id</td>
                        <td class="table-header">Username</td>
                        <td class="table-header">Email</td>
                        <td class="table-header">Firstname</td>
                        <td class="table-header">Lastname</td>
                        <td class="table-header">Active</td>
                        <td class="table-header">Manage</td>
                        <td class="table-header">Manage Admin</td>


                    </tr>
                    <g:each in="${userList}" var="user" status="i">
                        <tr>
                            <td>${i+1}</td>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <g:if test="${user.active}">
                                <td>Yes</td>
                            </g:if>
                            <g:else>
                                <td>No</td>
                            </g:else>
                            <g:if test="${user.active}">
                                <td><g:link class="anchor-nounderline" controller="user" action="deactivate"
                                            params="[userId: user.id]">Active</td></g:link>
                            </g:if>
                            <g:else>
                                <td><g:link class="anchor-nounderline" controller="user" action="activate"
                                            params="[userId: user.id]">Deactivated</td></g:link>
                            </g:else>

                            <g:if test="${user.admin}">
                                <td><g:link class="anchor-nounderline" controller="user" action="removeAdmin"
                                            params="[userId: user.id]">Admin</td></g:link>
                            </g:if>
                            <g:else>
                                <td><g:link class="anchor-nounderline" controller="user" action="makeAdmin"
                                            params="[userId: user.id]">notAdmin</td></g:link>
                            </g:else>

                        </tr>
                    </g:each>
                </table>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</body>
</html>