<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
    <title>All Posts</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp" %>
<main>
    <div class="container">
        <h4>Posts</h4>
        <a class="btn btn-primary" href="post-create">Create Post</a>
        <hr>
        <table class="table">
            <thead>
            <tr>
                <th>#ID</th>
                <th>Title</th>
                <th>Slug</th>
                <th>Category</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="post" items="${posts}">
                <tr>
                    <th>${post.id}</th>
                    <td>${post.title}</td>
                    <td>${post.slug}</td>
                    <td>${post.categoryId}</td>
                    <td>
                        <div class="d-flex">
                            <a class="btn btn-info me-2" href="post-edit?id=${post.id}">
                                <i class="fa-regular fa-pen-to-square"></i>
                            </a>
                            <form class="mb-0" action="posts" method="post">
                                <input type="hidden" name="id" value="${post.id}">
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
