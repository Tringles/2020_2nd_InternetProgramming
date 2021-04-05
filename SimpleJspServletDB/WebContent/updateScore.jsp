<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Score</title>
	<script>
	</script>
</head>
<body>
	<%
		String id=request.getParameter("id");
		String score=request.getParameter("score");
		response.sendRedirect("UpdateScoreController?id="+id+"&score="+score);
	%>
</body>
</html>