<%-- 
    Document   : products
    Created on : Feb 20, 2017, 3:18:03 AM
    Author     : hment_lfx
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shopping module</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/eb_module" user="root"  password="87445151"/>
        
        <jsp:useBean id="userbean" class="Bean.UserBean" scope="session" />
        <form action="addToCart" method="POST">
        <div class="p1"style = "display: inline">
            <image src="${pageContext.request.contextPath}/images/shui.jpg" alt="product1" />
            <c:set var="pid" value="1"/>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * FROM Products WHERE pid = ?
                <sql:param value="${pid}" />
            </sql:query>
                <c:forEach var="row" items="${result.rows}">
                    <p><c:out value="${row.pname}"/></p>
                    <p> Price is:  $<c:out value="${row.price}"/></p>
                    <p>Inventory: <c:out value="${row.inventory}"/></p>
                </c:forEach>
             <p>Add to shopping cart:<input type="checkbox" name = "addCart" id="p1check" value="1"></p> 
        </div>
            
            <div class="p2"style = "display: inline">
            <image src="${pageContext.request.contextPath}/images/shui.jpg" alt="product2" />
            <c:set var="pid" value="2"/>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * FROM Products WHERE pid = ?
                <sql:param value="${pid}" />
            </sql:query>
                <c:forEach var="row" items="${result.rows}">
                    <p><c:out value="${row.pname}"/></p>
                    <p> Price is:  $<c:out value="${row.price}"/></p>
                    <p>Inventory: <c:out value="${row.inventory}"/></p>
                </c:forEach>
                    <p>Add to shopping cart:<input type="checkbox" name = "addCart" id="p2check" value="2"></p> 
        </div>
            
            <div class="p3"style = "display: inline">
            <image src="${pageContext.request.contextPath}/images/shui.jpg" alt="product3" />
            <c:set var="pid" value="3"/>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * FROM Products WHERE pid = ?
                <sql:param value="${pid}" />
            </sql:query>
                <c:forEach var="row" items="${result.rows}">
                    <p><c:out value="${row.pname}"/></p>
                    <p> Price is:  $<c:out value="${row.price}"/></p>
                    <p>Inventory: <c:out value="${row.inventory}"/></p>
                </c:forEach>
             <p>Add to shopping cart:<input type="checkbox" name = "addCart"  id="p3check" value="3"></p> 
        </div>
            <input type="submit" name="submit" value="view my cart">
            <input type="hidden" name="username" id="username" value ='<jsp:getProperty name="userbean" property="username"/>'/>
        </form>
            
        <form action="logout" method="GET">
            <input type="submit" value="logout" />
        </form>

    </body>
</html>
