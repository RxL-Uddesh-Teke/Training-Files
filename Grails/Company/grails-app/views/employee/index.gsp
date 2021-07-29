<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 23/7/21
  Time: 10:45 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>This is index</title>
</head>

<body>
    <g:link controller="employee" action="index">Link to Employee Index</g:link>
    %{--${createLink(controller: 'employee', action: 'action1', params: [key: value])}--}%

</body>
</html>