<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Friends</a>
        <g:form controller="friend" action="search" class="navbar-search pull-right" method="get">
            <input type="text" name="q" class="search-query" placeholder="Search">
        </g:form>

    </div>
</div>

<table class="table table-bordered table-striped table-condensed">
    <thead>
    <tr>
        <th>User</th>
        <th>Add\Remove</th>
    </tr>

    </thead>
    <tbody>
    <g:each in="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td>
                <g:if test="${loggedInUser.id != user.id}">
                    <g:if test="${friends.contains(user)}">
                        <g:link class="btn btn-danger" controller="friend" action="remove" id="${user.id}">Remove</g:link>
                    </g:if>
                    <g:else>
                        <g:link class="btn btn-primary" controller="friend" action="add" id="${user.id}">Add</g:link>
                    </g:else>
                </g:if>

            </td>
        </tr>

    </g:each>
    </tbody>

</table>
</body>
</html>