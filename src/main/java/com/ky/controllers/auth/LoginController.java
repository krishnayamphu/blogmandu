package com.ky.controllers.auth;

import com.ky.dao.UserDAO;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String hash= DigestUtils.sha256Hex(password);
        if (UserDAO.authUser(username,hash)) {
            HttpSession session=request.getSession();
            session.setAttribute("user",username);
            System.out.println("welcome "+username);
            //response.sendRedirect("welcome");
        } else {
            String msg = "Invalid Username or Password";
            request.setAttribute("err", msg);
            request.getRequestDispatcher("auth/login.jsp").include(request, response);
        }

    }


}
