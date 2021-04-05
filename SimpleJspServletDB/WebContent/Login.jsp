<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="login_css.css" type="text/css">
    </head>
    <body>
        <h3 style="text-align:center;">Login</h3>
        <hr>
        <form method="post" action="UserController">
            <div id="left_content">
                <input type="text" name="id" size="10px" placeholder="ID"><br>
                <input type="password" name="password" size="10px" placeholder="Password">
            </div>
            <div id="right_content">
                &nbsp;<input type="submit" style="width: 35pt; height: 35pt;" value="확인">
            </div>
        </form>
        <div class="footer">
            <a href="RegisterController?action=list">Register</a>
            &nbsp;&nbsp;
            <a href="admin.jsp">Admin</a>
        </div>
    </body>
</html>