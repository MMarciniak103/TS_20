package com.mmarciniak.servlets;

import com.mmarciniak.config.HibernateConfig;
import org.hibernate.cfg.Configuration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // HARD CODED FOR TESTING PURPOSE
        if(username.equals("admin") && password.equals("admin123"))
        {
            HttpSession httpSession = req.getSession();

            httpSession.setAttribute("isAdmin",true);

            HibernateConfig.changeConfiguration(username,password);

        }
        else{
            req.setAttribute("error","INVALID CREDENTIALS");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
        dispatcher.forward(req,resp);

    }
}
