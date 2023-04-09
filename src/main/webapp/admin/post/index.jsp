<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
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
                    <td>
                        <img src="${rootPath}/uploads/${post.thumbImg}" class="img-thumbnail img-thumb-100" >
                    </td>
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
