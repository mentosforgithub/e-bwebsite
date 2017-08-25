<%-- 
    Document   : login
    Created on : Feb 27, 2017, 11:04:29 PM
    Author     : hment
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in page</title>
    </head>
    <body>
        <h1>Please enter your username and password to log in</h1>
        <image src="${pageContext.request.contextPath}/images/shui.jpg" alt="longin page" />
        <form action="login" method="POST">
            Username: <input type="text" name="username">
            Password: <input type="password" name="password">
            <br>
            <input type="submit" name="login" value="log in">
        </form>
    </body>
</html>
