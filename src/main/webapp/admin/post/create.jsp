<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
    <title>Create New Post</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp"%>
<main>
    <div class="container">
       <h4>Create new Category</h4>
        <form action="post-create" method="post">
            <div class="mb-3">
                <label for="txttitle" class="form-label">Title</label>
                <input type="text" class="form-control" id="txttitle" name="title" required>
            </div>
            <div class="mb-3">
                <label for="txtslug" class="form-label">Slug</label>
                <input type="text" class="form-control" id="txtslug" name="slug" required>
            </div>
            <div class="mb-3">
                <label for="txtcontent" class="form-label">Content</label>
                <textarea class="form-control" id="txtcontent" rows="10" name="content"></textarea>
            </div>

            <div class="mb-3">
                <label for="txtcategory" class="form-label">Category</label>
                <select name="cat_id" class="form-select" id="txtcategory">
                    <option selected>Open this select Category</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}">${cat.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Thumbnail Image</label>
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon1" data-bs-toggle="modal" data-bs-target="#exampleModal" >Choose</button>
                    <input type="text" id="txtPath" class="form-control" name="thumb_img" placeholder="">
                </div>

                <!-- Modal -->
                <div class="modal modal-xl fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <c:choose>
                                    <c:when test="${!files.isEmpty()}">
                                        <div class="row row-cols-1 row-cols-md-6 g-4">
                                            <c:forEach var="file" items="${files}">
                                                <div class="col">
                                                    <div class="card">
                                                        <a href="#!">
                                                            <img src="${rootPath}/uploads/${file}" class="card-img-top img-thumb" onclick="setImage('${file}')" alt="${file}" data-bs-dismiss="modal">
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:when>
                                    <c:otherwise>No media files</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</main>
<footer>

</footer>

<%@include file="/admin/inc/script.jsp" %>
<script>
    function setImage(image){
        let path=document.getElementById("txtPath");
        path.value=image;
        console.log(image);
    }
</script>
</body>
</html>
