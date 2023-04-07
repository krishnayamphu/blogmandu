package com.ky.controllers.admin.post;

import com.ky.dao.CategoryDAO;
import com.ky.dao.PostDAO;
import com.ky.media.MediaFile;
import com.ky.models.Category;
import com.ky.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PostCreateController", value = "/admin/post-create")
public class PostCreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories= CategoryDAO.getCategory();
        request.setAttribute("categories",categories);
        ArrayList<String> files= MediaFile.allFiles(getServletContext().getRealPath("/uploads"));
        request.setAttribute("files",files);
        request.getRequestDispatcher("post/create.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title=request.getParameter("title");
        String slug=request.getParameter("slug");
        String content=request.getParameter("content");
        String thumb=request.getParameter("thumb_img");
        int cat_id=Integer.parseInt(request.getParameter("cat_id"));

        Post post=new Post();
        post.setTitle(title);
        post.setSlug(slug);
        post.setContent(content);
        post.setThumbImg(thumb);
        post.setCategoryId(cat_id);
        PostDAO.save(post);
        response.sendRedirect("posts");
    }
}
