<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Laptop Page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
    <jsp:include page="<%=LAPTOP_FILTER%>"/>
    <c:choose>
        <c:when test="${not empty laptops}">
            <c:forEach var="laptop" items="${laptops}">
                <div class="stock-item-box">
                    <img class="small-image" src="/img/laptop/${laptop.vendor}-${laptop.model}.jpg">
                    <p>Vendor: ${laptop.vendor}</p>
                    <p>Model: ${laptop.model}</p>
                    <p>Price: ${laptop.price} byn.</p>
                    <form action="<%=CART_CONTROLLER%>" method="post">
                        <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="add">
                        <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="2">
                        <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${laptop.id}">
                        <input type="hidden" name="<%=ITEM_VENDOR_PARAM%>" value="${laptop.vendor}">
                        <input type="hidden" name="<%=ITEM_MODEL_PARAM%>" value="${laptop.model}">
                        <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${laptop.price}">
                        <input type="hidden" name="<%=QUANTITY_PARAM%>" value="1">
                        <input type="submit" value="Add to Cart">
                    </form>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <h1>Sorry, try another combination</h1>
        </c:otherwise>
    </c:choose>
</body>
</html>
