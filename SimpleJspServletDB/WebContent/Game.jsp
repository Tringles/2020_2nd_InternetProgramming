<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	Object id=request.getAttribute("id");
	Object account=request.getAttribute("account");
	Object score=request.getAttribute("score");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Game</title>
        <script>
            var map_img=new Image();
            map_img.src="map.png";
            var black_box=new Image();
            black_box.src="black_box.png";
            var item_img=new Image();
            item_img.src="eat_item.png";
            var red_box=new Image();
            red_box.src="red_box.png";
            var board;
            var level=0;
            var id=<%=id %>;
            var highscore=<%=score %>;
            var score=0;
            var hy=9;
            var hx=5;
            var snake_size=3;
            var MAX_SIZE=20;
            var item=0;
            var dy=new Array();
            var dx=new Array();
            var direction=0;
            var timer;
            dy=[0,0,1,-1];
            dx=[1,-1,0,0];
            var map=new Array(MAX_SIZE);
            for(var i=0;i<map.length;i++){
                map[i]=new Array(MAX_SIZE);
            }
            map[9][3]=1;
            map[9][4]=2;
            map[9][5]=3;
            function next_direction(e){
                var past_dir=direction;
                if(e.keyCode==37){
                    direction=1;
                    if(map[hy+dy[direction]][hx+dx[direction]]==snake_size-1)
                        direction=past_dir;
                }
                else if(e.keyCode==38){
                    direction=3;
                    if(map[hy+dy[direction]][hx+dx[direction]]==snake_size-1)
                        direction=past_dir;
                }
                else if(e.keyCode==39){
                    direction=0;
                    if(map[hy+dy[direction]][hx+dx[direction]]==snake_size-1)
                        direction=past_dir;
                }
                else if(e.keyCode==40){
                    direction=2;
                    if(map[hy+dy[direction]][hx+dx[direction]]==snake_size-1)
                        direction=past_dir;
                }
            }
            function movement(){
                for(var i=0;i<MAX_SIZE;i++){
                    for(var j=0;j<MAX_SIZE;j++){
                        if(map[i][j]>0){
                            map[i][j]--;
                        }
                    }
                }
                map[hy][hx]=snake_size;
            }
            function make_item(){
                item=1;
                do{
                    var rand_y=Math.random()*100;
                    var rand_x=Math.random()*100;
                    rand_y=Math.floor(rand_y);
                    rand_x=Math.floor(rand_x);
                    rand_y/=5;
                    rand_x/=5;
                    rand_y=Math.floor(rand_y);
                    rand_x=Math.floor(rand_x);
                }while(map[rand_y][rand_x]>0);
                map[rand_y][rand_x]=-1;
            }
            function eat_item(){
                snake_size++;
                score++;
                if(score%10==0)level++;
                var scoreboard=document.getElementById("score");
                scoreboard.innerHTML="SCORE : "+score+"<br>LEVEL: "+level;
                item--;
                for(var i=0;i<MAX_SIZE;i++){
                    for(var j=0;j<MAX_SIZE;j++){
                        if(map[i][j]>0){
                            map[i][j]++;
                        }
                    }
                }
            }
            function game_over(){
                board.drawImage(red_box,hx*20+11,hy*20+10);
                if(score>highscore){
                	var update=confirm("최고기록을 경신하였습니다. 갱신하겠습니까?")
                	if(update==true){
                		var text="updateScore.jsp?id="+id+"&score="+score;
                		location.href=text;
                	}
                }
            }
            function init(){
                hy=9;
                hx=5;
                for(var i=0;i<MAX_SIZE;i++)
                    for(var j=0;j<MAX_SIZE;j++)
                        map[i][j]=0;
                map[9][3]=1;
                map[9][4]=2;
                map[9][5]=3;
                direction=0;
                snake_size=3;
                score=0;
                past_score=0;
                var scoreboard=document.getElementById("score");
                scoreboard.innerHTML="SCORE : "+score+"<br>LEVEL : "+level;
                item=0;
                level=0;
                board=document.getElementById("Game").getContext('2d');
                draw();
            }
            function draw(){//each box's area is 20*20;
                board.clearRect(0,0,510,510);
                draw_background();
                draw_snake();
            }
            function draw_background(){
                board.drawImage(map_img,10,10);
            }
            function draw_snake(){
                for(var i=0;i<MAX_SIZE;i++){
                    for(var j=0;j<MAX_SIZE;j++){
                        if(map[i][j]>0){
                            board.drawImage(black_box,j*20+11,i*20+10);
                        }
                        else if(map[i][j]==-1){
                            board.drawImage(item_img,j*20+11,i*20+11);
                        }
                    }
                }
            }
            function start(){
                init();
                timer=setInterval(ingame,300-10*level);
            }
            function suicide(){
                hy=hy+dy[direction];
                hx=hx+dx[direction];
                if(map[hy][hx]>1){
                    return true;
                }
                else return false;
            }
            function ingame(){
                if(hy<0||hy>MAX_SIZE-1||hx<0||hx>MAX_SIZE-1||suicide()){
                    clearInterval(timer);
                    game_over();
                    return false;
                }
                if(item==1){
                    if(map[hy][hx]==-1)eat_item();
                }
                else make_item();
                movement();
                draw();
            }
        </script>
    </head>
    <body onload="init()" onkeydown="next_direction(event)">
        <canvas id="Game" width="510" height="510"></canvas>
        <p>
        <input type="button" value="Start" onclick="start()">
        <div id="user">
        	YOUR ACCOUNT : <%=account %><br>
        	YOUR HIGHEST RECORD : <%=score %>
        </div>
        <div id="score">
        	SCORE : 0
        </div>
        <div id="rank">
        	<a href="RankController">Ranking</a>
        </div>
    </body>
</html>