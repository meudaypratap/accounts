<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>
<g:if test="${users}">
    <table class="table table-bordered table-striped table-condensed">
        <tr>
            <td>Payer</td>
            <g:each in="${users}" var="user">
                <td rowspan="2">${user.username}</td>
            </g:each>
        </tr>
        <tr>
            <td>Receiver</td>

        </tr>
        <tbody>
        <g:each in="${userPayments}" var="userPayment">
            <tr>
                <td>${userPayment.key.username}</td>
                <g:each in="${userPayment.value}" var="amount">
                    <td>${amount}</td>
                </g:each>
            </tr>
        </g:each>
        </tbody>

    </table>
</g:if>
<g:else>
    <div class="alert alert-info">
        <h4>Warning!</h4>
        There are no friends for now, add friends to use this application.
    </div>
</g:else>
</body>
</html>