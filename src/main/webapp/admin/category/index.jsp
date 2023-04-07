<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
    <title>All Category</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp"%>
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
