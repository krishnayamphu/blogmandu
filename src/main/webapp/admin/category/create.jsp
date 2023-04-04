<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${rootPath}/css/app.css">
    <title>Create Category</title>
</head>
<body>
<header>
    <div class="container">
        <nav>
            <a href="">Dashboard</a>
            <a href="">Media</a>
            <a href="">Posts</a>
            <a href="">Category</a>
            <a href="">Users</a>
            <form action="${rootPath}/logout" method="post">
                <button>Logout</button>
            </form>
        </nav>
    </div>
</header>
<main>
    <div class="container">
       <h4>Create new Category</h4>
        <form action="">
            <label>Name</label>
            <input type="text" name="name">

            <label>Slug</label>
            <input type="text" name="slug">

            <label>Description</label>
            <textarea name="" id="" cols="30" rows="10"></textarea>
            
        </form>
    </div>
</main>
<footer>

</footer>


</body>
</html>
