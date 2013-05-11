<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<g:hasErrors bean="${user}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <ul class="unstyled no-margin-left">
            <g:eachError bean="${user}" var="error">
                <li><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<div class="span6 no-margin-left">
    <form action='${postUrl}' method='POST' class='form-signin well well-small' autocomplete='off'>
        <h4><g:message code="springSecurity.login.header"/></h4>
        <hr/>
        <label for='username'><g:message code="springSecurity.login.username.label"/><span class="required-indicator">*</span></label>
        <input type='text' name='j_username' id='username' class="input-block-level" placeholder="Username" required="required"/>

        <label for='password'><g:message code="springSecurity.login.password.label"/><span class="required-indicator">*</span></label>
        <input type='password' name='j_password' id='password' class="input-block-level" placeholder="Password" required="required"/>

        <label class="checkbox">
            <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
            <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
        </label>
        <input type='submit' id="submit" class="btn btn-primary" value='${message(code: "springSecurity.login.button")}'/>
    </form>
</div>

<div class="span6">
    <g:form url="/signup" method='POST' class='form-signin well well-small' autocomplete='off'>
        <h4>Sign up</h4>
        <hr/>
        <label for='username'><g:message code="springSecurity.login.username.label"/><span class="required-indicator">*</span></label>
        <input type='text' name='username' id='username' class="input-block-level" placeholder="Username" required="required"/>

        <label for='password'><g:message code="springSecurity.login.password.label"/><span class="required-indicator">*</span></label>
        <input type='password' name='password' id='password' class="input-block-level" placeholder="Password" required="required"/>

        <label for='email'>Email</label>
        <input type='password' name='email' id='email' class="input-block-level" placeholder="Email"/>

        <input type='submit' id="signup" class="btn btn-primary" value='Sign up'/>
    </g:form>
</div>
</body>
</html>
