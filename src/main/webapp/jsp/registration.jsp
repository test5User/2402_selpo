<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="static by.itclass.constants.Constants.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Registration</title>
  <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
  <jsp:include page="<%=MENU_JSP%>"/>
  <img class="default-image" src="<%=BACKGROUND_IMAGE%>">
  <div class="form-box">
    <h2>Registration</h2>
    <form action="<%=REGISTRATION_CONTROLLER%>" method="post">
      <input name="<%=NAME_PARAM%>" placeholder="Name" required>
      <input name="<%=EMAIL_PARAM%>" placeholder="Email" required>
      <input name="<%=LOGIN_PARAM%>" placeholder="Login" required>
      <input type="password" name="<%=PASS_PARAM%>" placeholder="Password" required>
      <input type="submit" value="Registration">
    </form>
    <c:if test="${not empty message}">
      <h2 class="error">${message}</h2>
    </c:if>
  </div>
</body>
</html>
