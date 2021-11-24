<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="main_page.css">
    <title>메인페이지</title>
</head>
<body>
<%
    String id = (String)session.getAttribute("id_value");

    if (id == null) {
        response.sendRedirect("login_form.jsp");
    };

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

    String sql = "SELECT auth FROM user WHERE id= ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    String auth = null;

    if(rs.next()) {
        auth = rs.getString("auth");
    }

    String user_list = null;

    String sql2 = "SELECT * FROM user";
    pstmt = conn.prepareStatement(sql2);
    rs1 = pstmt.executeQuery();

    ArrayList userList = new ArrayList();

    while(rs1.next()){
        userList.add((String)rs1.getString(3));
    };

    String sql3 = "SELECT DATE_FORMAT(date, '%Y-%m-%d'), main_info from main_diary WHERE user_id =?";
    pstmt = conn.prepareStatement(sql3);
    pstmt.setString(1, id);
    rs2 = pstmt.executeQuery();

%>

<div class="container">
    <section>
        <div class="user_id">
            <%= id %> 
            <br>
            is loggined
        </div>
            <div class="user_btn_wrap">
                <input class="user_btn" type="button" onclick="location.href='session_logout.jsp'" value="logOut"/>
            </div>
            <div class="user_btn_wrap">
                <input class="user_btn" type="button" onclick="location.href='user_update.jsp'" value="update Info"/>
            </div>
            <div class="user_btn_wrap">
                <input id="signup" class="user_btn" type="button" onclick="location.href='signUp_form.html'" value="signUp"/>
            </div>
        <div id="userList"></div>
    </section>

    <header>
        <div id="month_box">
            <div class="month_btn">1</div>
            <div class="month_btn">2</div>
            <div class="month_btn">3</div>
            <div class="month_btn">4</div>
            <div class="month_btn">5</div>
            <div class="month_btn">6</div>
            <div class="month_btn">7</div>
            <div class="month_btn">8</div>
            <div class="month_btn">9</div>
            <div class="month_btn">10</div>
            <div class="month_btn">11</div>
            <div class="month_btn">12</div>
            <div class="add_btn">+</div>
        </div>
    </header>
    <main>
    <div id="diary_contents">
    </div>
    </main>
</div>
<script>

    if('<%= auth %>' == 1 || '<%= auth %>' ==2) {

    var array="<%=userList%>";
    array = array.replace("[", "");
    array = array.replace("]", "");
    array = array.split(",");

    for (i = 0; i < array.length; i++) {
        temp = document.createElement('div');
        temp.className = 'user_list';
        temp.innerHTML = array[i];
        document.getElementById("userList").appendChild(temp);
        };
    }



    if('<%= auth %>' == 1) {
        var admin = document.getElementById("signup");
        admin.style.display = "block"; 
    };


</script>
</body>
</html>