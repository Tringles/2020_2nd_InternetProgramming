package com.daniel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.dao.UserDao;
import com.daniel.model.User;

@WebServlet("/UpdateScoreController")
public class UpdateScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao;   
	
    public UpdateScoreController() {
        super();
        dao= new UserDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("parsed");
		String StrUserId=request.getParameter("id");
		String StrScore=request.getParameter("score");
		int userId=Integer.parseInt(StrUserId);
		int score=Integer.parseInt(StrScore);
		User user=dao.getUserById(userId);
		user.setScore(score);
		dao.updateUser(user);
		
		request.setAttribute("id", user.getId());
		request.setAttribute("account", user.getAccount());
		request.setAttribute("score", user.getScore());
		request.getRequestDispatcher("Game.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
