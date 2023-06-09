package com.ky.controllers.admin.post;

import com.ky.dao.PostDAO;
import com.ky.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PostController", value = "/admin/posts")
public class PostController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Post> posts = PostDAO.getPosts();
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("post/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PostDAO.delete(id);
        response.sendRedirect(request.getHeader("referer"));
    }
}
