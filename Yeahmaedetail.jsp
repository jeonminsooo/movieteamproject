<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 완료</title>
</head>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String id = (String) session.getAttribute("id");
String mcode = request.getParameter("mcode");
String region = request.getParameter("region");
String m_date = request.getParameter("m_date");
String m_time = request.getParameter("m_time");
String m_gan = request.getParameter("m_gan");

String[] m_seat = request.getParameterValues("m_seat");

String sql = "INSERT INTO tbl_insert (id, mcode, region, m_date, m_time, m_gan, m_seat) VALUES (?, ?, ?, ?, ?, ?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);

if (m_seat != null) {
    for (int i = 0; i < m_seat.length; i++) {
        pstmt.setString(1, id);
        pstmt.setString(2, mcode);
        pstmt.setString(3, region);
        pstmt.setString(4, m_date);
        pstmt.setString(5, m_time);
        pstmt.setString(6, m_gan);
        pstmt.setString(7, m_seat[i]);
        pstmt.executeUpdate();
    }
}
%>
<body>
    <script>
        alert("예매가 완료되었습니다!");
        location.href = "Main.jsp";
    </script>
</body>
</html>
