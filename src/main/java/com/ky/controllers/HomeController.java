package com.ky.controllers;

import com.ky.dao.PostDAO;
import com.ky.models.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomeController", value = "")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Post> posts= PostDAO.getPosts();
        request.setAttribute("posts",posts);
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }
}
