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
       <h4>Create new Category</h4>
        <form action="category-create" method="post">
            <label>Name</label>
            <input type="text" name="name">

            <label>Slug</label>
            <input type="text" name="slug">

            <label>Description</label>
            <textarea name="description" id="" cols="30" rows="10"></textarea>
            <button>Save</button>
        </form>
    </div>
</main>
<footer>

</footer>


</body>
</html>
