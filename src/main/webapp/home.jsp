<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.ky.utility.PostExcerpt" %>
<html>
<head>
    <%@include file="head.jsp" %>
    <title>Home</title>
</head>
<body>
<%@include file="header.jsp" %>
<main>
    <div class="container py-5">
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="post" items="${posts}">
          <div class="col">
            <div class="card post-list h-100">
              <img src="${rootPath}/uploads/${post.thumbImg}" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title"><a href="${rootPath}/single?slug=${post.slug}">${post.title}</a></h5>
                  ${PostExcerpt.excerpt(post.content,60)}
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
</main>
<%@include file="footer.jsp" %>
<%@include file="scripts.jsp" %>
</body>
</html>
