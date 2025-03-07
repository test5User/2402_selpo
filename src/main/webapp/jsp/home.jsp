<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
    <h2>User Info:</h2>
    <p>Id: ${user.id}</p>
    <p>Name: ${user.name}</p>
    <p>Email: ${user.email}</p>
    <p>Login: ${user.login}</p>
    <p>Password: ${user.password}</p>
</body>
</html>
