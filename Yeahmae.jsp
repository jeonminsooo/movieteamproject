<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    String id = (String) session.getAttribute("id");
    String mcode = request.getParameter("mcode");
    String sql = "SELECT mdir, mname, tag, director, actor FROM tbl_movie WHERE mcode = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, mcode);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    String mdir = rs.getString("mdir");
    String mname = rs.getString("mname");
    String tag = rs.getString("tag");
    String director = rs.getString("director");   // 감독
    String actor = rs.getString("actor");     // 주연
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매</title>
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    background: #f5f7fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 900px;
    margin: 100px auto 60px;
    background: white;
    padding: 40px;
    border-radius: 16px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05);
}

.movie-info {
    display: flex;
    gap: 30px;
    margin-bottom: 40px;
}

.movie-info img {
    width: 160px;
    height: 220px;
    object-fit: cover;
    border-radius: 10px;
    flex-shrink: 0;
}

.movie-text {
    flex-grow: 1;
}

.movie-text h2 {
    margin: 0;
    font-size: 24px;
    color: #333;
}

.movie-text .tag {
    color: #777;
    font-size: 14px;
    margin-top: 5px;
}

.movie-text .detail {
    margin-top: 10px;
    font-size: 15px;
    color: #555;
}

.movie-text .story {
    margin-top: 15px;
    padding: 12px;
    background-color: #f8f8f8;
    border-left: 5px solid #6a24fe;
    font-size: 14px;
    color: #333;
    line-height: 1.6;
}

.section {
    margin-bottom: 30px;
}

.section h3 {
    margin-bottom: 15px;
    color: #333;
    font-size: 18px;
}

.option-group {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.option-group label {
    background-color: #f0f0f0;
    padding: 10px 18px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
    border: 1px solid transparent;
    transition: 0.2s;
}

.option-group input[type="radio"] {
    display: none;
}

.option-group input[type="radio"]:checked + label {
    background-color: #6a24fe;
    color: white;
    border-color: #6a24fe;
}

.button-wrap {
    text-align: center;
    margin-top: 40px;
}

button {
    background-color: #6a24fe;
    color: white;
    padding: 14px 30px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

button:hover {
    background-color: #5020c2;
}
</style>
</head>
<body>
<form action="Seat.jsp" method="post" name="form">
    <div class="container">

        <!-- 영화정보 영역 -->
        <div class="movie-info">
            <img src="<%=mdir%>" alt="영화 포스터">
            <div class="movie-text">
                <h2><%=mname%></h2>
                <div class="tag">#<%=tag%></div>
                <div class="detail"><strong>감독:</strong> <%=director%> </div>
                <div class="detail"><strong>주연:</strong> <%=actor%> </div>
            </div>
        </div>

        <!-- 예매정보 영역 -->
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="mcode" value="<%=mcode%>">

        <div class="section">
            <h3>지역 선택</h3>
            <div class="option-group">
                <input type="radio" name="region" id="r1" value="서울"><label for="r1">서울</label>
                <input type="radio" name="region" id="r2" value="경기"><label for="r2">경기</label>
                <input type="radio" name="region" id="r3" value="인천"><label for="r3">인천</label>
                <input type="radio" name="region" id="r4" value="대전/충청"><label for="r4">대전/충청</label>
                <input type="radio" name="region" id="r5" value="부산/울산"><label for="r5">부산/울산</label>
            </div>
        </div>

        <div class="section">
            <h3>날짜 선택</h3>
            <div class="option-group">
                <% for (int i = 17; i <= 21; i++) { %>
                    <input type="radio" name="m_date" id="d<%=i%>" value="2025-04-<%=i%>">
                    <label for="d<%=i%>">2025-04-<%=i%></label>
                <% } %>
            </div>
        </div>

        <div class="section">
            <h3>시간 선택</h3>
            <div class="option-group">
                <input type="radio" name="m_time" id="t1" value="12:30"><label for="t1">12:30</label>
                <input type="radio" name="m_time" id="t2" value="13:30"><label for="t2">13:30</label>
                <input type="radio" name="m_time" id="t3" value="14:30"><label for="t3">14:30</label>
                <input type="radio" name="m_time" id="t4" value="15:30"><label for="t4">15:30</label>
                <input type="radio" name="m_time" id="t5" value="16:30"><label for="t5">16:30</label>
            </div>
        </div>

        <div class="section">
            <h3>관 선택</h3>
            <div class="option-group">
                <input type="radio" name="m_gan" id="g1" value="1관"><label for="g1">1관</label>
                <input type="radio" name="m_gan" id="g2" value="2관"><label for="g2">2관</label>
                <input type="radio" name="m_gan" id="g3" value="3관"><label for="g3">3관</label>
                <input type="radio" name="m_gan" id="g4" value="4관"><label for="g4">4관</label>
                <input type="radio" name="m_gan" id="g5" value="5관"><label for="g5">5관</label>
            </div>
        </div>

        <div class="button-wrap">
            <button type="submit">다음</button>
        </div>

    </div>
</form>
</body>
</html>
