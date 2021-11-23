<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page session="true"%>

<%-- 데이터베이스 검증 --%>
<%
    request.setCharacterEncoding("UTF-8");

    boolean isLogin = false;

    String id_value = request.getParameter("id_value");
    String pw_value = request.getParameter("pw_value");
    String login_check = request.getParameter("login_check");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

    String sql = "SELECT * FROM user WHERE id=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id_value);
    pstmt.setString(2, pw_value);
    rs = pstmt.executeQuery();

    if(rs.next()) {
        isLogin = true;
        session.setAttribute("id_value", id_value);
        session.setAttribute("pw_value", pw_value);

        if (login_check != null) {
            Cookie c = new Cookie("id_value", id_value);
            c.setMaxAge(60 * 2);
            c.setPath("/");
            response.addCookie(c);
        }
        %>
        <script>
        alert("인증되었습니다.");
        location.href="main_page.jsp";
        </script>
        <%
    } else {
        %>
        <script>
            alert("로그인 정보가 일치하지 않습니다.");
            location.href = "login_form.jsp";
        </script>
<%
    }
%>