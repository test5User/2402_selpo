<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
    <h2>Hello ${user.name}</h2>
    <c:choose>
        <c:when test="${not empty orderItems}">
            <c:forEach var="item" items="${orderItems}">
                <div class="cart-item-container">
                    <img class="cart-img" src="/img/${item.itemType eq 1 ? 'tv' : 'laptop'}/${item.itemVendor}-${item.itemModel}.jpg">
                    <h3 class="cart-text">${item.itemType eq 1 ? 'Televizor' : 'Noutbook'}
                            ${item.itemVendor} ${item.itemModel} by ${item.itemPrice} byn.</h3>

<%--                    <form method="post" action="<%=CART_CONTROLLER%>">--%>
<%--                        <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="decrease">--%>
<%--                        <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">--%>
<%--                        <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">--%>
<%--                        <input type="hidden" name="<%=ITEM_VENDOR_PARAM%>" value="${item.itemVendor}">--%>
<%--                        <input type="hidden" name="<%=ITEM_MODEL_PARAM%>" value="${item.itemModel}">--%>
<%--                        <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${item.itemPrice}">--%>
<%--                        <input type="hidden" name="<%=QUANTITY_PARAM%>" value="${item.quantity}">--%>
<%--                        <input class="change-number" type="submit" value="-">--%>
<%--                    </form>--%>
<%--                    ${item.quantity}--%>
<%--                    <form method="post" action="<%=CART_CONTROLLER%>">--%>
<%--                        <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="increase">--%>
<%--                        <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">--%>
<%--                        <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">--%>
<%--                        <input type="hidden" name="<%=ITEM_VENDOR_PARAM%>" value="${item.itemVendor}">--%>
<%--                        <input type="hidden" name="<%=ITEM_MODEL_PARAM%>" value="${item.itemModel}">--%>
<%--                        <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${item.itemPrice}">--%>
<%--                        <input type="hidden" name="<%=QUANTITY_PARAM%>" value="${item.quantity}">--%>
<%--                        <input class="change-number" type="submit" value="+">--%>
<%--                    </form>--%>

                    <form method="post" action="<%=CART_CONTROLLER%>">
                        <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="change">
                        <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">
                        <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">
                        <input type="hidden" name="<%=ITEM_VENDOR_PARAM%>" value="${item.itemVendor}">
                        <input type="hidden" name="<%=ITEM_MODEL_PARAM%>" value="${item.itemModel}">
                        <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${item.itemPrice}">
                        <div class="number-input">
                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
                            <input type="number" name="<%=QUANTITY_PARAM%>" value="${item.quantity}" min="1" max="5">
                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                        </div>
                    </form>

                    <form method="post" action="<%=CART_CONTROLLER%>">
                        <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="remove">
                        <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">
                        <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">
                        <input type="hidden" name="<%=ITEM_VENDOR_PARAM%>" value="${item.itemVendor}">
                        <input type="hidden" name="<%=ITEM_MODEL_PARAM%>" value="${item.itemModel}">
                        <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="0">
                        <input type="hidden" name="<%=QUANTITY_PARAM%>" value="0">
                        <input type="submit" value="Remove from Cart">
                    </form>

                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>Your cart is empty</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
