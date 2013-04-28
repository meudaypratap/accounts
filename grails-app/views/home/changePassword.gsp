<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Change Password</a>
    </div>
</div>
<g:form class="form-horizontal" controller="home" action="updatePassword">
    <table class="table table-bordered table-striped table-condensed">
        <tr>
            <td><label for="oldPassword">
                Old Password
                <span class="required-indicator">*</span>
            </label></td>
            <td>
                <g:passwordField name="oldPassword" required="required"/>
            </td>
        </tr>
        <tr>
            <td><label for="newPassword">
                New Password
                <span class="required-indicator">*</span>
            </label></td>
            <td>
                <g:passwordField name="newPassword" required="required"/>
            </td>
        </tr>

    </table>

    <div class="control-group">
        <g:submitButton name="update" class="btn btn-info" value="Update Password"/>
    </div>
</g:form>
</body>
</html>