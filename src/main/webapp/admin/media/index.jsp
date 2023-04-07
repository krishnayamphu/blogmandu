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
        <form class="my-4" action="media" method="post" enctype="multipart/form-data">
            <div class="input-group mb-3">
                <input type="file" name="upfile" class="form-control">
                <button class="input-group-text">Upload</button>
            </div>
        </form>

        <h4>All Media Files</h4>
        <c:choose>
            <c:when test="${!files.isEmpty()}">
                <div class="row row-cols-1 row-cols-md-6 g-4">
                    <c:forEach var="file" items="${files}">
                        <div class="col">
                            <div class="card">
                                <a href="${rootPath}/uploads/${file}">
                                    <img src="${rootPath}/uploads/${file}" class="card-img-top img-thumb" alt="${file}">
                                </a>
                                <div class="card-body">
                                    <form action="media" method="post">
                                        <input type="hidden" name="image" value="${file}">
                                        <button class="btn btn-danger">Remove</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>No media files</c:otherwise>
        </c:choose>

    </div>
</main>
<footer>

</footer>

<%@include file="/admin/inc/script.jsp" %>
</body>
</html>
