<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="user.css" type="text/css">
<title>List User</title>
</head>
<body>
	<table class="tb">
		<thead>
			<tr>
				<th>Account</th>
				<th>Password</th>
				<th>Score</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.account}" /></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><c:out value="${user.score}" /></td>
                    <td><a href="AdminController?action=edit&id=<c:out value="${user.id}"/>">Update</a></td>
                    <td><a href="AdminController?action=delete&id=<c:out value="${user.id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p>&nbsp;&nbsp;<a href="AdminController?action=insert">Add User</a></p>
</body>
</html>