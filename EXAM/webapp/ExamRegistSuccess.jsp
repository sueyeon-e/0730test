<%@page import="dao.ExamMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	ExamMemberDao mDao = new ExamMemberDao();
	mDao.registMember(id, pw, name);
%>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			alert("가입되었습니다. 로그인 해주세요.");
			location.href="ExamLoginMain.jsp";
		});
	</script>
</head>
<body>
	
</body>
</html>