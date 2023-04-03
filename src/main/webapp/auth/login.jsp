<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="login" method="post">
    <c:choose>
        <c:when test="${err!=null}">
            <p>${err}</p>
        </c:when>
    </c:choose>
    <input type="text" name="username" placeholder="username">
    <br><br>
    <input type="password" name="password" placeholder="password">
    <br><br>
    <button>Login</button>
</form>
</body>
</html>
