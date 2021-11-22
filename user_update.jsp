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
    <title>내 정보</title>
    <script src="check.js"></script>
    <link rel="stylesheet" type="text/css" href="user_update1.css">
</head>
<body>
    <%
            Cookie[] c = request.getCookies();
        if (c != null) {
            for (Cookie cf : c) {
                if (cf.getName().equals("id_value")) {
                    String id_value = cf.getValue();
                    session.setAttribute("id_value", id_value);
                }
            }
        }

        String id = (String)session.getAttribute("id_value");

        // 데이터베이스 검증
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    
        // 데이터베이스 연결
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

        // 데이터베이스 명령 전달
        String sql = "SELECT id, password, name FROM user WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        while(rs.next()) {
            String user_id = rs.getString("id");
            String user_pw = rs.getString("password");
            String user_name = rs.getString("name");
    %>
<form action="update_info.jsp" name="updateInfoPage" method="post" onsubmit="updateCheck()">
    <table>
            <tr>
                <td class="update_form">
                    NAME
                </td>
                <td>
                    <input class="update_input" type="text" value=<%=user_name %> name="name">
                </td>
            </tr>
            <tr>
                <td class="update_form">
                    ID
                </td>
                <td>
                    <input class="update_input" type="text" value=<%=user_id %> id="id" name="id">
                </td>
                <td>
                    <input class="check_btn" type="button" value="check" onclick="idDuplicateCheck()">
                </td>
            </tr>
            <tr>
                <td class="update_form">
                    PASSWORD
                </td>
                <td>
                    <input class="update_input" type="password" value=<%=user_pw %> name="pw">
                </td>
            </tr>
            <tr>
                <td class="update_form">
                    CHECK PASSWORD
                </td>
                <td>
                    <input class="update_input" type="password" name="pw2">
                </td>
            </tr>
        </table>
        <input type="hidden" id="isCheck" value="">
        <input class="check_btn" type="submit" value="confirm">
        <input class="check_btn" type="button" value="cancel" onclick="location.href='main_page.jsp'">
    </form>
    <%
        }
    %>

</body>
</html>