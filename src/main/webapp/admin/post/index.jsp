<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${rootPath}/css/app.css">
    <title>All Posts</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp"%>
<main>
    <div class="container">
        <h4>Posts</h4>
        <a href="post-create">Create Post</a>
        <hr>
        <table>
            <tr>
                <th>#ID</th>
                <th>Title</th>
                <th>Slug</th>
                <th>Category</th>
                <th>Thumbnail</th>
                <th>Action</th>
            </tr>
            <c:forEach var="post" items="${posts}">
                <tr>
                    <td>${post.id}</td>
                    <td>${post.title}</td>
                    <td>${post.slug}</td>
                    <td>${post.categoryId}</td>
                    <td>${post.thumbImg}</td>
                    <td>
                        <a href="post-edit?id=${post.id}">Edit</a>
                        <form action="post" method="post">
                            <input type="hidden" name="id" value="${post.id}">
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
