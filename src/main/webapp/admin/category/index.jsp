<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${rootPath}/css/app.css">
    <title>All Category</title>
</head>
<body>
<header>
    <div class="container">
        <nav>
            <a href="${rootPath}/admin/dashboard">Dashboard</a>
            <a href="">Media</a>
            <a href="">Posts</a>
            <a href="${rootPath}/admin/category">Category</a>
            <a href="">Users</a>
            <form action="${rootPath}/logout" method="post">
                <button>Logout</button>
            </form>
        </nav>
    </div>
</header>
<main>
    <div class="container">
        <h4>Categories</h4>
        <a href="category-create">Create Category</a>
        <hr>
        <table>
            <tr>
                <th>#ID</th>
                <th>Name</th>
                <th>Slug</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>${category.slug}</td>
                    <td>${category.description}</td>
                    <td>
                        <a href="category-edit?id=${category.id}">Edit</a>
                        <form action="category" method="post">
                            <input type="hidden" name="id" value="${category.id}">
                            <button>Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>
</main>
<footer>

</footer>


</body>
</html>
