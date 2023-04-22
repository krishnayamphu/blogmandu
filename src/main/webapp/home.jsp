<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.ky.utility.PostExcerpt" %>
<html>
<head>
  <%@include file="head.jsp"%>
  <title>Home</title>
</head>
<body>
<%@include file="header.jsp"%>
<main>
  <div class="container">
    <div class="row py-5">
      <div class="col-9 bg-info">
        <div class="row row-cols-1 row-cols-md-2  row-cols-lg-4 g-4">
        <c:forEach var="post" items="${posts}">
            <div class="col">
              <div class="card">
                <img src="${rootPath}/uploads/${post.thumbImg}" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title"><a href="${rootPath}/single?slug=${post.slug}">${post.title}</a></h5>
                  <p class="card-text">${PostExcerpt.excerpt(post.content,60)}</p>
                </div>
              </div>
            </div>
        </c:forEach>
        </div>
      </div>
      <div class="col-3 bg-warning">sdfdasf</div>
    </div>
    <div class="row py-5">
      <div class="col-9 bg-info">
        <div class="row row-cols-1 row-cols-md-2  row-cols-lg-4 g-4">
          <c:forEach var="post" items="${posts}">
            <div class="col">
              <div class="card">
                <img src="${rootPath}/uploads/${post.thumbImg}" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title"><a href="${rootPath}/single?slug=${post.slug}">${post.title}</a></h5>
                  <p class="card-text">${PostExcerpt.excerpt(post.content,60)}</p>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      <div class="col-3 bg-warning">sdfdasf</div>
    </div>
  </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="scripts.jsp"%>
</body>
</html>
