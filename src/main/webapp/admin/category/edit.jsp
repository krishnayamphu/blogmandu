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
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name" value="${category.name}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Slug</label>
                <input type="text" class="form-control" name="slug" value="${category.slug}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" name="description" rows="10">${category.description}</textarea>
            </div>

            <button class="btn btn-primary">Update</button>
        </form>
    </div>
</main>
<footer>

</footer>


</body>
</html>
