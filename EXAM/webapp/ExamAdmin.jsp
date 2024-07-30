<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ExamMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    ExamMemberDao mDao = new ExamMemberDao();
    ArrayList<ExamMemberListDto> listMember = mDao.getMemberList();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
        table { border-collapse: collapse; }
        td, th { border: 1px solid grey; padding: 8px; }
        .member_title {
            position: relative;
        }
        #btn_login {
            position: absolute;
            top: 28px;
            left: 370px;
        }
    </style>
</head>
<body>
    <div>
        <h1 class="member_title">회원관리</h1>
        <button id="btn_login">로그인</button>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>PW</th>
            <th>Name</th>
            <th>Point</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <% for (ExamMemberListDto dto : listMember) { %>
        <tr>
            <td><%= dto.getId() %></td>
            <td><%= dto.getPw() %></td>
            <td><%= dto.getName() %></td>
            <td><%= dto.getPoint() %></td>
            <td><button class="btn_edit">수정</button></td>
            <td>
	      		<form action="ExamDeleteServlet" method="post" style="display:inline;">
	    			<input type="hidden" name="id" value="<%= dto.getId() %>">
	    			<input type="submit" value="삭제">
				</form>
            </td>
        </tr>
        <% } %>
    </table>
    <h1>스케줄러관리</h1>
    <button id="btn_schedule_begin">스케줄러(20초마다 포인트1 증가)실행 시작</button>
    <button id="btn_schedule_end">스케줄러 실행 종료</button>
</body>
</html>
