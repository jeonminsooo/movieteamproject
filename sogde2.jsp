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
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	String d = (String) session.getAttribute("id");
	
	String id = request.getParameter("id");
	String jumin = request.getParameter("jumin");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	String sql = "update tbl_login set id=?, jumin = ?, pw= ?, name= ?, asdf= case when asdf = '1' then '0' end where id = " + "'" + d + "'";
	
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	
	pstmt.setString(1, id);
	pstmt.setString(2, jumin);
	pstmt.setString(3, pw);
	pstmt.setString(4, name);
	
	
	pstmt.executeUpdate();
	session.removeAttribute(d);
	session.setAttribute("id", id);
	
	response.sendRedirect("login.jsp");	
	%>
</body>
</html>