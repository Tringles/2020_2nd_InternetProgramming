package com.daniel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.dao.UserDao;
import com.daniel.model.User;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao;   
	
    public RegisterController() {
        super();
        dao=new UserDao();
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward=request.getParameter("action");
		System.out.println(forward);
        if(forward.equalsIgnoreCase("list")) {
			request.setAttribute("users", dao.getAllUsers());
	        request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
        else {
        	User user=new User();
        	user.setAccount(request.getParameter("id"));
        	user.setPassword(request.getParameter("pw"));
        	user.setScore(0);
        	dao.addUser(user);
	   		request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
