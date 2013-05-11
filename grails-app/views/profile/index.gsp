<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>
<g:hasErrors bean="${userCO}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <ul class="unstyled no-bottom-margin">
            <g:eachError bean="${userCO}" var="error">
                <li><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Update Profile</a>
    </div>
</div>
<g:form class="form-horizontal" controller="profile" action="update">
    <table class="table table-bordered">
        <tr>
            <td><label for="oldPassword">
                Old Password
            </label></td>
            <td>
                <g:passwordField name="oldPassword"/>
            </td>
        </tr>
        <tr>
            <td><label for="newPassword">
                New Password
                </label></td>
            <td>
                <g:passwordField name="newPassword"/>
            </td>
        </tr>
        <tr>
            <td><label for="email">
                Email
            </label></td>
            <td>
                <g:textField name="email" value="${com.bv.fn.moneyEye.User.loggedInUser.email}"/>
            </td>
        </tr>

    </table>

    <div class="control-group">
        <g:submitButton name="update" class="btn btn-info" value="Update"/>
    </div>
</g:form>
</body>
</html>