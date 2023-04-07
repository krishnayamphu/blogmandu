<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
    <title>Create Category</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp"%>
<main>
    <div class="container">
       <h4>Category Details</h4>
        <form action="category-edit" method="post">
            <input type="hidden" name="id" value="${category.id}">
            <label>Name</label>
            <input type="text" name="name" value="${category.name}" required>

            <label>Slug</label>
            <input type="text" name="slug" value="${category.slug}" required>

            <label>Description</label>
            <textarea name="description" id="" cols="30" rows="10">${category.description}</textarea>
            <button>Update</button>
        </form>
    </div>
</main>
<footer>

</footer>


</body>
</html>
