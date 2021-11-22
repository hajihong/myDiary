<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디중복체크</title>
    <script src="check.js"></script>
</head>
<body>
<%
    String id_value = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

    String sql = "SELECT * FROM user WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id_value);
    rs = pstmt.executeQuery();

    if(rs.next()) {
        out.println("이미 사용중인 아이디입니다");
    
%>
<input type="button" value="확인" onclick="window.close()">
<%
    } else {
        out.println("사용 가능한 아이디입니다");
    %>
    <input type="button" value="사용" onclick="userId()">
    <input type="button" value="취소" onclick="window.close()">
    <%
    }
    %>

</body>
</html>