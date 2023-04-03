<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body>

<form action="register" method="post">
    <c:choose>
        <c:when test="${err!=null}">
            <p>${err}</p>
        </c:when>
    </c:choose>
    <label>Name</label>
    <input type="text" name="name" required>
    <br><br>
    <label>Username</label>
    <input type="text" name="username" required>
    <br><br>
    <label>Email</label>
    <input type="email" name="email" required>
    <br><br>
    <label>Contact</label>
    <input type="text" name="contact" required>
    <br><br>
    <lable>Password</lable>
    <input type="password" name="password" required>
    <br><br>
    <lable>Confirmed Password</lable>
    <input type="password" name="cpassword" required>
    <br><br>
    <button>Register</button>
</form>
</body>
</html>
