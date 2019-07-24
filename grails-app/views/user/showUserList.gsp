<html>
<head>
    <title>
        User List
    </title>
    <style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    tr:nth-child(even) {
        background-color: #dddddd;
    }
    </style>
</head>>
<body>

<table>
    <tr>
        <th>Id</th>
        <th>Username</th>
        <th>Email</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>Active</th>
        <th>Manage<th>
    </tr>
    <g:each var="Us" in="${userList}">
        <tr>
            <td>${Us.id}</td>
            <td>${Us.username}</td>
            <td>${Us.email}</td>
            <td>${Us.firstName}</td>
            <td>${Us.lastName}</td>
            <td>${Us.active}</td>
            <td>
                <button type="button" onclick="">
                    Activate/Deactivate
                </button>
            <td>
        </tr>
    </g:each>
</table>
</body>
</html>