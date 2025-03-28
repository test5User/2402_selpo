<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="canvas" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders History</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
    <c:choose>
        <c:when test="${not empty orders}">
            <c:forEach var="order" items="${orders}">
                <div class="order-list-container">
                    <h3>${order.date}, number: ${order.id}, address: ${order.address}</h3>
                    <form action="<%=PRINT_ORDER_CONTROLLER%>" method="post">
                        <input type="hidden" name="<%=ORDER_ID_ATTR%>" value="${order.id}">
                        <input type="submit" value="Print receipt">
                    </form>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>User have no orders at the moment</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
