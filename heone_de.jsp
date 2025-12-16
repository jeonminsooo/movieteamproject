<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

String sql = "insert into tbl_login values(?,?,?,?,?)";

PreparedStatement pstmt = con.prepareStatement(sql);


pstmt.setString(1, request.getParameter("id"));
pstmt.setString(2, request.getParameter("jumin"));
pstmt.setString(3, request.getParameter("pw"));
pstmt.setString(4, request.getParameter("name"));
pstmt.setString(5, "0");


pstmt.executeUpdate();




response.sendRedirect("login.jsp");

%>




</body>
</html>