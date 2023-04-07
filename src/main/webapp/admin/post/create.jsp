<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${rootPath}/css/app.css">
    <title>Create New Post</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp"%>
<main>
    <div class="container">
       <h4>Create new Category</h4>
        <form action="post-create" method="post">
            <label>Title</label>
            <input type="text" name="title">

            <label>Slug</label>
            <input type="text" name="slug">

            <label>Content</label>
            <textarea name="content" id="" cols="30" rows="10"></textarea>
            <label>Category</label>
            <select name="cat_id">
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}">${cat.name}</option>
                </c:forEach>
            </select>
            <label>Thumbnail Image</label>
            <input type="text" name="thumb_img" value="default.jpg">
            <button>Save</button>
        </form>
    </div>
</main>
<footer>

</footer>


</body>
</html>
