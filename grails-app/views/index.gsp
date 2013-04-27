<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>
<g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name: 'app.name'))}" scope="page"/>
<div class="span4">
        <login></login>
        <signup></signup>
</div>

<div class="span8">
       <tweets></tweets>
</div>

</body>
</html>