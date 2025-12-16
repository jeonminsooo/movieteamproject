<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/sog.css">
</head>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

    String d = (String) session.getAttribute("id");
    String sql = "select id, jumin, pw, name, asdf from tbl_login where id = " + "'" + d + "'";

    ResultSet rs = con.prepareStatement(sql).executeQuery();
%>

<body>
    <h2 style="text-align: center;">마이페이지</h2>

    <table border="1">
        <tr>
            <th>아이디</th>
            <th>주민번호</th>
            <th>비밀번호</th>
            <th>닉네임</th>
        </tr>

        <%
            while (rs.next()) {
        %>
        <tr>
            <td><a href="sogde.jsp?
            id=<%=rs.getString("id").trim()%>&jumin=<%=rs.getString("jumin").trim()%>&pw=<%=rs.getString("pw").trim()%>&name=<%=rs.getString("name").trim()%>">
            <%=rs.getString("id")%>
            </a>
            </td>
            <td><%=rs.getString("jumin")%></td>
            <td><%=rs.getString("pw")%></td>
            <td><%=rs.getString("name")%></td>    
        </tr>

        <%
            }
        %>

    </table>

        <h2>영화 예약 정보</h2>
        <table class="movie-table">
            <tr>
                <th>아이디</th>
                <th>영화</th>
                <th>지역</th>
                <th>날짜</th>
                <th>시간</th>
                <th>관</th>
                <th>좌석</th>
            </tr>

            <%
                
                    String sql2 = "SELECT id, i.mcode, mname, region, m_date, m_time, m_gan, m_seat FROM tbl_insert i, tbl_movie m where i.mcode = m.mcode and id = " + "'" + d + "' order by m_seat";
                    PreparedStatement pstmt = con.prepareStatement(sql2);
                    ResultSet rs2 = pstmt.executeQuery();

                    while (rs2.next()) {
            %>

            <tr>
                <td><%= rs2.getString("id") %></td>
                <td><a href="movie_detail.jsp?mcode=<%= rs2.getString("mcode") %>"><%= rs2.getString("mname") %></a></td>
                <td><%= rs2.getString("region") %></td>
                <td><%= rs2.getString("m_date") %></td>
                <td><%= rs2.getString("m_time") %></td>
                <td><%= rs2.getString("m_gan") %></td>
                <td><%= rs2.getString("m_seat") %></td>
            </tr>

            <%
                    }

            %>

        </table>
</body>
</html>