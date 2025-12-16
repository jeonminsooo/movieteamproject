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

	String sql = "select * from tbl_login";

	ResultSet rs = con.prepareStatement(sql).executeQuery();

	
	String id = (String) session.getAttribute("id");
	session.setAttribute("id", null);



			String sql2 = "update tbl_login set asdf = 0 where asdf = '1' and id = " + "'" + id + "'";
			ResultSet rs2 = con.prepareStatement(sql2).executeQuery();
			PreparedStatement patmt = con.prepareStatement(sql2);
			patmt.executeUpdate();
		
			
		
		%>
		<script type="text/javascript">
			alert("로그아웃 성공!");
			location = "Main.jsp";
		</script>




</body>
</html>