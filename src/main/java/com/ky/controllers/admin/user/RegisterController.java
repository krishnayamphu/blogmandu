package com.ky.controllers.admin.user;

import com.ky.dao.UserDAO;
import com.ky.models.User;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String contact=request.getParameter("contact");
        String password=request.getParameter("password");
        String cpassword=request.getParameter("cpassword");
        if(password.equals(cpassword)){
            User user=new User();
            user.setName(name);
            user.setUsername(username);
            user.setEmail(email);
            user.setContact(contact);
            user.setPassword(DigestUtils.sha256Hex(password));
            user.setProfilePic("");
            UserDAO.save(user);
            System.out.println("user registered successfully");
        }else{
            String err="Confirmed password do not match";
            request.setAttribute("err",err);
            System.out.println(err);
            request.getRequestDispatcher("user/create.jsp").forward(request,response);
        }
    }
}
