package com.daniel.controller;

import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.dao.UserDao;
import com.daniel.model.User;

public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao dao;

    public UserController() {
        super();
        dao = new UserDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	User user = new User();
        user.setAccount(request.getParameter("id"));
        user.setPassword(request.getParameter("password"));
        
		List<User> users = dao.getAllUsers();
		for(User u:users) {
			if(u.getAccount().equals(user.getAccount())&&u.getPassword().equals(user.getPassword())){
				request.setAttribute("id", u.getId());
				request.setAttribute("account", u.getAccount());				
				request.setAttribute("score", u.getScore());		
				request.getRequestDispatcher("Game.jsp").forward(request, response);
				return;
			}
		}
		response.sendRedirect("Login_failed.jsp");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}