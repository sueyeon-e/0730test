<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ExamMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ExamMemberDao mDao = new ExamMemberDao();
	ArrayList<ExamMemberDto> listMemberInfo = mDao.getMemberInfo("JD");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$("#btn_logout").click(function(){
				location.href="ExamLogout.jsp";
			});
			$(".intro").click(function(){
				let point = $(this).find(".point_text").text();
				let pointNum = parseInt(point.replace(/,/g, ''), 10);
				let myPoint = Number($(".my_point").text());
				alert( "선택한 포인트: "+ point);
				alert("내 포인트:" + myPoint);
				if(pointNum>myPoint) {
					alert("포인트가 부족합니다. 광고를 클릭하세요.");
				} else {
					alert("컨텐츠(intro)를 구입하였습니다.");
				}
			});
			$(".ad").click(function(){
				let randomNumber = Math.floor(Math.random() * 1000) + 1;
				alert(randomNumber+ "점이 적립되었습니다.");
				location.href="https://koreaisacademy.com/";
			});
		});
	</script>
	<style>
		* {
		    box-sizing: border-box;
		    list-style: none;
		}
		.account_box {
			float: right;
		}
		.border {	
		    border: 1px solid red;		 
		}
		.center {
		    margin: 0 auto;
		}
		.fl {
		    float: left;
		}
		.fr {
		    float: right;
		}
		ul {
		    display: flex;
    		column-gap: 5px;
    		list-style: none;
		}
		.entire {
			width: 1200px;
			height: auto;
		}
		li {
			width: 400px;
			list-style: none;
		}
		li > img {
			width: 100%;
		}
		.point_text {
			text-align: center;
		}
		.ad {
			width: 220px;
			border: 1px solid #111;
		}
		.ad_inner {
		    display: flex;
    		flex-direction: column;
		}
	</style>
</head>
<body>
<div class="entire center">
	<h1>메인페이지</h1>
	<div class="account_box fr">
		<% for(ExamMemberDto dto : listMemberInfo ) { %>
		<div class="fl"><%=dto.getName() %>님 안녕하세요.</div>
		<button id="btn_logout" class="fl">로그아웃</button>
		<div id="point">
			포인트 : <span class="my_point"><%=dto.getPoint() %></span> 점
		</div>
		<% } %>
	</div>
	<h2>구입할 컨텐츠를 선택하세요.</h2>
	<ul>
		<li class="intro">
			<img src="img/Intro_350_408.png">
			<span class="point_text">100,000</span>
			<span>포인트</span>
		</li>
		<li class="intro">
			<img src="img/Java_350_408.png">
			<span class="point_text">500,000</span>
			<span>포인트</span>
		</li>
		<li class="intro">
			<img src="img/Cpp_350_408.png">
			<span class="point_text">300,000</span>
			<span>포인트</span>
		</li>
	</ul>
	<div class="ad fr">
		<div class="ad_inner">
		&lt;광고&gt;
			<img src="img/korea_it.png" class=" fr">
		</div>
	</div>
</div>
</body>
</html>