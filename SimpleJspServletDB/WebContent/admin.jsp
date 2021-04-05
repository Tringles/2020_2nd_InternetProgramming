<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="login_css.css" type="text/css">
<title>Administrator Page</title>
	<script>
		function admit(){
			var adminId=document.getElementById("adminId").value;
			var pw=document.getElementById("password").value;
			if(adminId=="admin"&&pw=="admin"){
				location.href="AdminController?action=listUser";
			}
			else{
				alert("Invalid Id or Password");
				history.go(0);
			}
		}
	</script>
</head>
<body>
	<form name="admin">
		<div id="left_content">
            <input type="text" id="adminId" size="10px" placeholder="ID"><br>
            <input type="password" id="password" size="10px" placeholder="Password">
        </div>
        <div id="right_content">
            &nbsp;<input type="button" style="width: 35pt; height: 35pt;" value="확인"
            	onclick="admit()">
        </div>
        <div class="footer">
            <a href="Login.jsp">User Login</a>
        </div>
	</form>
</body>
</html>