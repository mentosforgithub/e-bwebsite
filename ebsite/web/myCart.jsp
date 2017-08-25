<%-- 
    Document   : myCart
    Created on : Feb 20, 2017, 9:33:11 AM
    Author     : hment
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javascript/validateInventory.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Manage my cart</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/eb_module" user="root"  password="87445151"/>
        
        <%! String def = "1"; %>
        <jsp:useBean id="userbean" class="Bean.UserBean" scope="session" />
        <p>Hello <jsp:getProperty name="userbean" property="username"/> Please check your cart</p>

        <form name = "cartForm" action="manageCart" method="POST" onSubmit="return validateInventory(event)">
            <table border="8">
                <tr>
                    <td>Product Name</td>
                    <td>Price</td>
                    <td>Current Inventory</td>
                    <td>Input Quantity(default 1)</td>
                </tr>
                <c:forEach items="${sessionScope.cart}" var="cartItem">
                    <c:set var="pid" value="${cartItem.key}"/>
                    <sql:query dataSource="${snapshot}" var="result">
                        SELECT * FROM Products WHERE pid = ?
                        <sql:param value="${pid}" />
                    </sql:query>
                        <tr>
                            <c:forEach  var="row" items="${result.rows}">
                                <td><c:out value="${row.pname}"/></td>
                                <td><c:out value="${row.price}"/></td>
                                <td><c:out value="${row.inventory}"/></td>
                            <input type="hidden" name="inventory" value="${row.inventory}"/>
                                <td><input type="text" name ="quan" value="<%=def%>"onkeypress='return event.charCode >= 48 && event.charCode <= 57'></input></td>
                            </c:forEach>
                        </tr>
                </c:forEach>  
            </table>
            
            <input type="submit" name="submit" value="GO CHECK OUT">
        </form>
        
        <form action="clearCart" method="GET">
            <input type="submit" name="clear" value="Clear my cart">
        </form>
        
        <form action="logout" method="GET">
            <input type="submit" value="logout" />
        </form>
        
    </body>
</html>
