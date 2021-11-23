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
    <link rel="stylesheet" type="text/css" href="main_page1.css">
    <title>메인페이지</title>
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
    // session 기반 쿠키 생성
    // 예외처리 seession login_form.....

    String id = (String)session.getAttribute("id_value");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diaryDB", "ubuntu","1234");

    String sql = "SELECT auth FROM user WHERE id= ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    
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

        <% while(rs.next()) { %>
            <% if(rs.getInt(1) == 1) { %>
                <div class="user_btn_wrap">
                    <input class="user_btn" type="button" onclick="location.href='signUp_form.html'" value="signUp"/>
                </div>
            <% 
            pstmt.close();
            String sql2 = "SELECT * FROM user"; 
            pstmt = conn.prepareStatement(sql2);
            rs = pstmt.executeQuery();
            %>
            
            <% while(rs.next()) { %>
                <div class="user_list"><%= rs.getString(2) %></div>
            <% } %>
            <% } else if (rs.getInt(1) == 2) { %>

            <% 
            pstmt.close();
            String sql2 = "SELECT * FROM user"; 
            pstmt = conn.prepareStatement(sql2);
            rs = pstmt.executeQuery();
            %>

            <% while(rs.next()) { %>
                <div><%= rs.getString(2) %></div>
                <% } %>
            <% } else { %>
            <% } %>
        <% } %>
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
        <%
        pstmt.close();
        String sql3 = "SELECT DATE_FORMAT(date, '%Y-%m-%d'), main_info from main_diary WHERE user_id =?";
        pstmt = conn.prepareStatement(sql3);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        %>

        <% while(rs.next()) { %>
        <div class="wrap_box">
        <div class="delete_box">X</div>
        <div class="date_box"><%= rs.getString(1) %></div>
        <div class="main_box">
        <%= rs.getString(2) %>
        </div>
        </div>
        <% } %>
    </div>
    </main>
</div>
</body>
</html>