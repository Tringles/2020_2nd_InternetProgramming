<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<title>User</title>
</head>
<body>
    <form method="post" action='AdminController' name="addUser">
    	<input type="hidden"name="id"
            value="<c:out value="${user.id}" />" /> <br /> 
        Account : <input
            type="text" name="account"
            value="<c:out value="${user.account}" />" /> <br /> 
        Password : <input
            type="password" name="password"
            value="<c:out value="${user.password}" />" /> <br /> 
        Score : <input type="text" name="score"
            value="<c:out value="${user.score}" />" /> <br />
            <input type="submit" value="Submit" />
    </form>
</body>
</html>