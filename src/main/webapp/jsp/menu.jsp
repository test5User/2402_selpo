<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav-ul">
    <c:choose>
        <c:when test="${empty user}">
            <li class="nav-li">
                <a href="<%=LOGIN_JSP%>">Login</a>
            </li>
            <li class="nav-li">
                <a href="<%=REGISTRATION_JSP%>">Registration</a>
            </li>
        </c:when>
        <c:otherwise>
            <li class="nav-li float-left">
                <a class="active" href="<%=HOME_JSP%>">Home</a>
            </li>
            <li class="nav-li">
                <a href="<%=LOGOUT_CONTROLLER%>">Logout</a>
            </li>
            <li class="nav-li float-left">
                <a href="<%=TV_CONTROLLER%>">TV</a>
            </li>
            <li class="nav-li float-left">
                <a href="<%=LAPTOP_CONTROLLER%>">Laptop</a>
            </li>
        </c:otherwise>
    </c:choose>
</ul>