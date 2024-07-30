<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script>
        $(function() {
            var loginFailed = "<%= request.getAttribute("loginFailed") %>";
            if (loginFailed === "true") {
                alert("아이디/비밀번호를 다시 확인하세요.");
            }
        });
    </script>
</head>
<body>
    <h1>로그인</h1>
    <form action="ExamLoginServlet" method="post">
        ID : <input type="text" name="id"> <br/> <br/>
        PW : <input type="password" name="pw"> <br/>
        <input type="submit" id="btn_login" value="로그인"> <br/>
    </form>
    <button id="go_regist_page" value="회원가입">회원가입</button>
</body>
</html>
