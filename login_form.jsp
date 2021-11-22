<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="login_form1.css">
    <title>로그인페이지</title>
</head>
<body>
<%
Cookie[] c = request.getCookies();
if (c != null) {
    for (Cookie cf : c) {
        if (cf.getName().equals("id_value")) {
            response.sendRedirect("main_page.jsp");
        }
    }
}
%>
    <header>
    <h1> DIARY </h1> 
    </header>
    <form action="auth.jsp" method="post">
        <div class="login_form">
            <input class="login_box" type="text" name="id_value" placeholder="아이디">
        </div>
        <div class="login_form">
            <input class="login_box" type="password" name="pw_value" placeholder="비밀번호">
        </div>
        <div class="btn_check">
        <input type="checkbox" name="login_check" value="true">
        로그인 상태 유지
        </div>
        <input class="btn_login" type="submit" value="로그인"/>
    </form>
</body>
</html>