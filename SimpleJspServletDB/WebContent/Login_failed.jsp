<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failed</title>
	<script>
	</script>
</head>
<body>
	<script>
		alert("아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.");
		location.href="Login.jsp";
	</script>
</body>
</html>