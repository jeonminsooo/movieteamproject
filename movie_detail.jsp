<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style type="text/css">
* {
    margin: auto;
}
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    font-size: 28px;
    margin-top: 40px;
    color: #333;
}

table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 12px;
    text-align: center;
    font-size: 16px;
    border: 1px solid #ddd;
}

th {
    background-color: #4CAF50;
    color: white;
}

a {
    text-decoration: none;
    color: #4CAF50;
    font-weight: bold;
}

a:hover {
    color: #45a049;
}

@media (max-width: 768px) {
    table {
        width: 90%;
    }

    th, td {
        font-size: 14px;
    }

    h2 {
        font-size: 24px;
    }
}
</style>
</head>

<%
    String mcode = request.getParameter("mcode");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

    String sql = "select * from tbl_movie where mcode = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, mcode);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        String mname = rs.getString("mname");
        String mdir = rs.getString("mdir");
        String tag = rs.getString("tag");
        String director = rs.getString("director");
        String actor = rs.getString("actor");
%>

<body>
    <h2>영화 상세 정보</h2>

    <table border="1">
        <tr>
            <th>영화 제목</th>
            <td><%= mname %></td>
        </tr>
        <tr>
            <th>영화 경로</th>
            <td><img alt=""
					src="<%=mdir%>" /></td>
        </tr>
        <tr>
            <th>장르</th>
            <td><%= tag %></td>
        </tr>
        <tr>
            <th>감독</th>
            <td><%= director %></td>
        </tr>
        <tr>
            <th>주연 배우</th>
            <td><%= actor %></td>
        </tr>
    </table>

</body>

<%
    }
%>

</html>