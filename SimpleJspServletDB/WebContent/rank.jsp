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
<script>var idx=1;</script>
</head>
<body>
	<table class="tb">
		<thead>
			<tr>
				<th>Rank</th>
				<th>Score</th>
				<th>Account</th>
			</tr>
		</thead>
		<tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>
                    	<script>
                    		document.write(idx++);
                    	</script>
                    </td>
                    <td><c:out value="${user.score}" /></td>
                    <td><c:out value="${user.account}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>