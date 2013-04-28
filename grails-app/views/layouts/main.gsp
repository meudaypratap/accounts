<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name: 'app.name'))}" scope="page"/>
    <g:set var="bootstrapTheme"
           value="${grailsApplication.config.bootstrap.theme ? '-' + grailsApplication.config.bootstrap.theme : ''}"
           scope="page"/>
    <title>${appName} | <g:layoutTitle/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap' + bootstrapTheme + '.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}"/>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.8.0.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'application.js')}"></script>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="${createLink(uri: '/')}">${appName}</a>
            <sec:ifLoggedIn>
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li><g:link controller="expense">Expense</g:link></li>
                        <li><g:link controller="payment">Payment</g:link></li>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li><g:link controller="user">User</g:link></li>
                            <li><g:link controller="userRole">User Role</g:link></li>
                        </sec:ifAllGranted>
                    </ul>
                    <ul class="nav pull-right">
                        <li><a href="#"><sec:loggedInUserInfo field="username"/></a></li>
                        <li><g:link controller="logout">Logout</g:link></li>
                    </ul>
                </div>
            </sec:ifLoggedIn>

        </div>
    </div>
</div>

<div class="container">

    <div class="container-fluid">
        <div class="row-fluid">
            <g:if test="${flash.message}">
                <div class="alert alert-error no-margin">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    ${flash.message}
                </div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="alert alert-success no-margin">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    ${flash.error}
                </div>
            </g:if>
            <div class="span12 no-margin">
                <g:layoutBody/>
            </div>
        </div>
        <hr>
        <footer>
            <p>&copy; Binary Villains : Farji Naarad.</p>
        </footer>
    </div>
</div>
</body>
</html>
