<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<form action='${postUrl}' method='POST' id='loginForm' class='form-signin well well-small' autocomplete='off'>
    <h4><g:message code="springSecurity.login.header"/></h4>
    <hr/>
    <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
    <input type='text' name='j_username' id='username' class="input-block-level" placeholder="Username" required="required"/>

    <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
    <input type='password' name='j_password' id='password' class="input-block-level" placeholder="Password" required="required"/>

    <label class="checkbox">
        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
        <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
    </label>
    <input type='submit' id="submit" class="btn btn-primary" value='${message(code: "springSecurity.login.button")}'/>
</form>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
