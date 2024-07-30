<%@page import="dao.ExamMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	ExamMemberDao mDao = new ExamMemberDao();
	
	if (id != null && !id.isEmpty()) {
	    try {
	        mDao.delete(id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			alert("삭제되었습니다.");
			location.href="ExamAdmin.jsp";
		});
	</script>
</head>
<body>
	
</body>
</html>