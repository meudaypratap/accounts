<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<div class="span6 no-margin-left">
    <form action='${postUrl}' method='POST' class='form-signin well well-small' autocomplete='off'>
        <login></login>
    </form>
</div>

<div class="span6">
    <g:form url="/signup" method='POST' class='form-signin well well-small' autocomplete='off'>
       <signup></signup>
    </g:form>
</div>
</body>
</html>
