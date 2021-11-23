<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%-- 데이터베이스 검증 --%>
<%  
    request.setCharacterEncoding("utf-8");
    
    boolean isSignUp = false;

    // 요청된 값을 받아 저장하는 부분
    String id_value = request.getParameter("id");
    String pw_value = request.getParameter("pw");
    String name_value = request.getParameter("name");
    String auth_value = request.getParameter("auth");
    
    // 데이터베이스 검증
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    // 데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

    // 데이터베이스 명령 전달
    String sql = "INSERT INTO user(id, password, name, auth) VALUES (?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id_value);
    pstmt.setString(2, pw_value);
    pstmt.setString(3, name_value);
    pstmt.setString(4, auth_value);
    int rs = pstmt.executeUpdate();

    if(rs == 1) {
        isSignUp = true;
    }
%>

<script>
    if (<%=isSignUp%> == true) {
        alert("회원가입 성공!");
        location.href= "main_page.jsp";
    } else if (<%=isSignUp%> == false) {
        alert("가입에 실패하였습니다.");
        location.href= "signUp_from.html";
    }
</script>
