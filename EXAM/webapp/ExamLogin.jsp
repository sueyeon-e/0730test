<%@page import="dao.ExamMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	ExamMemberDao mDao = new ExamMemberDao();
	boolean result = mDao.loginCheck(id, pw);
	if (result) {
%>	<script>
		alert("로그인 성공!");
	</script>
<% } else { %>
	<script>
		alert("아이디/비밀번호를 다시 확인하세요");
		location.href="ExamLoginMain.jsp";
	</script>
<% } %>
