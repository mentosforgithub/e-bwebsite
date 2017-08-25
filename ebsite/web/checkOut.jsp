<%-- 
    Document   : checkOut
    Created on : Feb 20, 2017, 10:20:52 AM
    Author     : hment
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Check out</h1>
        <jsp:useBean id="userbean" class="Bean.UserBean" scope="session" />
        <p>Hi, <jsp:getProperty name="userbean" property="username"/>.You have bought:</p>
        <p>Your total is: <%= session.getAttribute("total") %></p>
        
        <form action="logout" method="GET">
            <input type="submit" value="logout" />
        </form>
    </body>
</html>
