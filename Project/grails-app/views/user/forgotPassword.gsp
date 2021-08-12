<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 12/8/21
  Time: 10:46 AM
--%>

<%@ page import="com.rxlogix.Token" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
    div {
        width: 500px;
        height: 100px;

        position: absolute;
        top:0;
        bottom: 0;
        left: 0;
        right: 0;
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: black;
        padding: 5px;
        margin: auto;
    }
    </style>
</head>

<body>
    <div>
        <g:form action="changePassword" controller="user" params="[user: user]">
            <label for="password" >Password</label><br>
            <input id="password" type="password" name="password" required><hr>
            <label for="cnfpassword">Confirm Password</label><br>
            <input id="cnfpassword" type="password" name="cnfpassword" required><br><br>
            <button type="submit">Submit</button>
        </g:form>
    </div>
</body>
</html>