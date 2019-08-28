
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Profile</title>
    <g:render template="/layout/dashboard"/>
    </head>

<body>
<div class="container">
<div class="panel-default">
    <div class="panel-body">
        <h2>Post List</h2>
        <p>The table represent the posts</p>
        <table id="example" class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>Id</th>
                <th>Description</th>
                <th>Created By</th>
                <th>Topic</th>
            </tr>
            </thead>
            <tbody>
<g:each var="res" in="${list}">
    <tr>
        <td>${res.id}</td>
        <td>${res.description}</td>
        <td>${res.user.username}</td>
        <td>${res.topic.name}</td>
    </tr>
</g:each>
</tbody>
</table>
</div>
</div>
</div>
<script>
    $(document).ready(function() {
        $('#example').DataTable( {
        } );
    } );
</script>
</body>
</html>