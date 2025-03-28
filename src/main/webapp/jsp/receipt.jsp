<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Receipt</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
    <div class="receipt-container">
        <h2>Order id: ${orderReceipt.order.id}</h2>
        <h2>Order date: ${orderReceipt.order.date}</h2>
        <h2>Delivery address: ${orderReceipt.order.address}</h2>
    </div>
</body>
</html>
