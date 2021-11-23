<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%

    request.setCharacterEncoding("utf-8");

    boolean isUpdate = false;
    String id = session.getAttribute("id_value").toString();

    String id_value = request.getParameter("id");
    String pw_value = request.getParameter("pw");
    String name_value = request.getParameter("name");

    // 데이터베이스 검증
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    // 데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

    String sql = "UPDATE user SET id=?, password=?, name =? WHERE id=?";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id_value);
    pstmt.setString(2, pw_value);
    pstmt.setString(3, name_value);
    pstmt.setString(4, id);
    int rs = pstmt.executeUpdate();

    if (rs == 1) {
        isUpdate = true;
    }

%>

<script>
    if (<%=isUpdate%> == true) {
        alert("수정 성공!");
        location.href= "session_logout.jsp";
    } else if (<%=isUpdate%> == false) {
        alert("수정에 실패하였습니다.");
        location.href= "user_update.jsp";
    }
</script>
