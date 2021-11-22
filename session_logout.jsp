<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="login_form1.css">
    <title>logOut</title>
</head>
<body>
<%
    session.invalidate();

    Cookie[] c = request.getCookies();

    if (c != null) {
        for (Cookie cf : c) {
            if (cf.getName().equals("id_value")) {
                cf.setMaxAge(0);
                cf.setPath("/");
                response.addCookie(cf);
            }
        }
    }
%>
    <script>
    alert("로그아웃 되었습니다.");
    location.href="login_form.jsp";
    </script>
</body>
</html>