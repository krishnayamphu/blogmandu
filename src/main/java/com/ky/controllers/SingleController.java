package com.ky.controllers;

import com.ky.dao.PostDAO;
import com.ky.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SingleController", value = "/single")
public class SingleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String slug=request.getParameter("slug");
        Post post= PostDAO.getPosts(slug);
        request.setAttribute("post",post);
        request.getRequestDispatcher("single.jsp").forward(request,response);
    }
}
