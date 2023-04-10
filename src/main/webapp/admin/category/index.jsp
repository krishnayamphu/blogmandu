<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
    <title>All Category</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp" %>
<main>
    <div class="container">
        <h4>Categories</h4>
        <a class="btn btn-primary" href="category-create">Create Category</a>
        <hr>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Slug</th>
                <th scope="col">Description</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <th scope="row">${category.id}</th>
                    <td>${category.name}</td>
                    <td>${category.slug}</td>
                    <td>${category.description}</td>
                    <td>
                        <div class="d-flex">
                            <a class="btn btn-info me-2" href="category-edit?id=${category.id}">
                                <i class="fa-regular fa-pen-to-square"></i>
                            </a>
                            <form class="mb-0" action="category" method="post">
                                <input type="hidden" name="id" value="${category.id}">
                                <button class="btn btn-danger">
                                    <i class="fa-regular fa-trash-can"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<footer>

</footer>


</body>
</html>
