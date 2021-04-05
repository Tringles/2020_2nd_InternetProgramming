<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.daniel.model.User" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<% List<User> users=(List<User>)request.getAttribute("users"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="register_css.css" type="text/css">
        <script>
            var check_failed=true;//회원가입 가능 유무 bool, true:has a problem
            var idCheck=true;//아이디 중복확인 bool
            var idList=new Array();
            function make_register(){//회원가입
                var make_id=document.getElementById("id");
                if(check_failed||idCheck){
                    alert("회원가입 도중 오류가 발견되었습니다.\n아이디와 비밀번호를 다시 확인해주세요.");
                    history.go(0);
                    return false;
                }
                return true;
            }
            function check_password(){//비밀번호 대조 function
                var password_f=document.getElementById("password_f").value;
                var password_s=document.getElementById("password_s").value;
                var output=document.getElementById("password_incorrect");
                if(password_f!=password_s){
                    var text="비밀번호가 일치하지 않습니다.";
                    output.innerHTML=text;
                    check_failed=true;
                }
                else{
                    var text="";
                    output.innerHTML=text;
                    check_failed=false;
                }
            }
            function id_check(){
                var id=document.getElementById("id").value;
                var flag=false;
                //중복된 아이디가 있으면 check_failed true, or false
                for(var i=0;i<idList.length;i++){
                	if(id==idList[i]){
                		flag=true;
                		break;
                	}
                }
                if(flag){
                    var output=document.getElementById("idCheck");
                    var text="해당 ID는 이미 존재합니다.";
                    output.innerHTML=text;
                }
                else{
                    idCheck=false;
                	var output=document.getElementById("idCheck");
                    var text="해당 아이디는 사용 가능합니다.";
                    output.innerHTML=text;
                }
            }
            function id_check_text(){
                if(idCheck){
                    var text="중복확인이 필요합니다."
                    var output=document.getElementById("idCheck");
                    output.innerHTML=text;
                }
                else{
                    var text="";
                    var output=document.getElementById("idCheck");
                    output.innerHTML=text;
                }
            }
        </script>
    </head>
    <body>
    	<%
    		for(User u:users){
    			String account=u.getAccount();
		%>
			<script>
				idList.push("<%=account%>");
			</script>
		<%
			}
    	%>
        <h3 style="text-align: center;">Register</h3><hr>
        <div class="layer">
            <div class="content">
                <form method="post" action="RegisterController" onsubmit="return make_register()">
                    <input type="hidden" name="action" value="insert">
                    <p>
                    ID<hr>
                    <input type="text" placeholder="ID" name="id" id="id" size="13px"
                        onfocus="id_check_text()">
                    <input type="button" value="중복확인"
                        onclick="id_check()"><br>
                    <div id="idCheck" style="color: red;"></div>
                    </p>
                    <p>
                    PASSWORD<hr>
                    <input type="password" name="pw" id="password_f" placeholder="Password"
                        onblur="check_password()"><br>
                    </p>
                <p>
                CONFIRM PASSWORD<hr>
                <input type="password" id="password_s" placeholder="Password"
                    onblur="check_password()"><br>
                <div id="password_incorrect" style="color: red;"></div>
                </p>
                <input type="submit" value="확인"
                    style="width: 40pt; height: 30pt;">
                <input type="button" value="취소"
                    style="width: 40pt; height: 30pt;"
                    onclick="history.go(-1)">
                </form>
            </div>
            <span class="blank"></span>
        </div>
    </body>
</html>