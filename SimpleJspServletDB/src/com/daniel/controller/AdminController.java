package com.daniel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.dao.UserDao;
import com.daniel.model.User;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String INSERT = "/updateUser.jsp";
    private static String EDIT = "/updateUser.jsp";
    private static String LIST_USER = "/listUser.jsp";
    private UserDao dao;   

    public AdminController() {
        super();
        dao=new UserDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		 String forward="";
	        String action = request.getParameter("action");

	        if (action.equalsIgnoreCase("delete")){
	            int id = Integer.parseInt(request.getParameter("id"));
	            dao.deleteUser(id);
	            forward = LIST_USER;
	            request.setAttribute("users", dao.getAllUsers());    
	        }
	        else if (action.equalsIgnoreCase("edit")){
	            forward = EDIT;
	            int id = Integer.parseInt(request.getParameter("id"));
	            User user = dao.getUserById(id);
	            request.setAttribute("user", user);
	        }
	        else if (action.equalsIgnoreCase("listUser")){
	            forward = LIST_USER;
	            request.setAttribute("users", dao.getAllUsers());
	        }
	        else {
	            forward = INSERT;
	        }

	        RequestDispatcher view = request.getRequestDispatcher(forward);
	        view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		 User user=new User();
		 String id=request.getParameter("id");
		 user.setAccount(request.getParameter("account"));
		 user.setPassword(request.getParameter("password"));
		 user.setScore(Integer.parseInt(request.getParameter("score")));
		 if(id==null||id.isEmpty()) {
			 dao.addUser(user);
		 }
		 else {
			 user.setId(Integer.parseInt(id));
			 dao.updateUser(user);
		 }
		 request.setAttribute("users", dao.getAllUsers());
		 RequestDispatcher view=request.getRequestDispatcher(LIST_USER);
		 view.forward(request, response);
	}
}
