<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/admin/inc/head.jsp" %>
    <title>Post Details</title>
</head>
<body>
<%@include file="/admin/inc/header.jsp" %>
<main>
    <div class="container">
        <h4>Post Details</h4>
        <form action="post-edit" method="post">
            <input type="hidden" name="id" value="${post.id}">
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title" onfocusout="convertSlug()" value="${post.title}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Slug</label>
                <input type="text" class="form-control" id="slug" name="slug" value="${post.slug}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Content</label>
                <textarea id="editor" class="form-control" rows="30" name="content">${post.content}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Category</label>
                <select name="cat_id" class="form-select" required>
                    <option value="">Select Category</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}" ${cat.id==post.categoryId?"selected":""}>${cat.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Thumbnail Image</label>
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon1" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">Choose
                    </button>
                    <input type="text" id="txtPath" class="form-control" name="thumb_img" value="${post.thumbImg}" placeholder="choose thumbnaili">
                </div>

                <!-- Modal -->
                <div class="modal modal-xl fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <c:choose>
                                    <c:when test="${!files.isEmpty()}">
                                        <div class="row row-cols-1 row-cols-md-6 g-4">
                                            <c:forEach var="file" items="${files}">
                                                <div class="col">
                                                    <div class="card">
                                                        <a href="#!">
                                                            <img src="${rootPath}/uploads/${file}"
                                                                 class="card-img-top img-thumb"
                                                                 onclick="setImage('${file}')" alt="${file}"
                                                                 data-bs-dismiss="modal">
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
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</main>
<footer>

</footer>

<%@include file="/admin/inc/script.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#editor'))
        .catch(error => {
            console.error(error);
        });

    function setImage(image) {
        let path = document.getElementById("txtPath");
        path.value = image;
        console.log(image);
    }
    function convertSlug() {
        var title = document.getElementById("title").value;
        var slug = title.trim().toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
        document.getElementById("slug").value = slug;
    }
</script>
</body>
</html>
