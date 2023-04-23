package com.ky.controllers.admin.post;

import com.ky.dao.CategoryDAO;
import com.ky.dao.PostDAO;
import com.ky.media.MediaFile;
import com.ky.models.Category;
import com.ky.models.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PostEditController", value = "/admin/post-edit")
public class PostEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        ArrayList<Category> categories= CategoryDAO.getCategory();
        ArrayList<String> files= MediaFile.allFiles(getServletContext().getRealPath("/uploads"));
        Post post=PostDAO.getPosts(id);
        request.setAttribute("categories",categories);
        request.setAttribute("files",files);
        request.setAttribute("post",post);
        request.getRequestDispatcher("post/edit.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String title=request.getParameter("title");
        String slug=request.getParameter("slug");
        String content=request.getParameter("content");
        String thumb=request.getParameter("thumb_img");
        int cat_id=Integer.parseInt(request.getParameter("cat_id"));

        Post post=new Post();
        post.setId(id);
        post.setTitle(title);
        post.setSlug(slug);
        post.setContent(content);
        post.setThumbImg(thumb);
        post.setCategoryId(cat_id);
        PostDAO.update(post);
        response.sendRedirect("posts");
    }
}
