<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tv Page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
    <jsp:include page="<%=TV_FILTER%>"/>
    <c:choose>
        <c:when test="${not empty tvs}">
            <c:forEach var="tv" items="${tvs}">
                <div class="stock-item-box">
                    <img class="small-image" src="/img/tv/${tv.vendor}-${tv.model}.jpg">
                    <p>Vendor: ${tv.vendor}</p>
                    <p>Model: ${tv.model}</p>
                    <p>Price: ${tv.price} byn.</p>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <h1>Sorry, try another combination</h1>
        </c:otherwise>
    </c:choose>
</body>
</html>
