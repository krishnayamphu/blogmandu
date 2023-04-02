<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body>

<form action="register" method="post">
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
    <button>Register</button>
</form>
</body>
</html>
