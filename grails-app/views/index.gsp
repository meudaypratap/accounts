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
                <td rowspan="2">${user.name}</td>
            </g:each>
        </tr>
        <tr>
            <td>Receiver</td>

        </tr>
        <tbody>
        <g:each in="${userPayments}" var="userPayment">
            <tr>
                <td>${userPayment.key.name}</td>
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
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>Warning!</h4>
        There are no users for now, create users to use this application.
    </div>
</g:else>
</body>
</html>