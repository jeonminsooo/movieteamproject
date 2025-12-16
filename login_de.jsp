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

	String sql = "select id, pw from tbl_login";

	ResultSet rs = con.prepareStatement(sql).executeQuery();

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	System.out.println(id);
	System.out.println(pw);



	while (rs.next()) {

		if (id.equals(rs.getString(1)) && pw.equals(rs.getString(2))) {

			session.setAttribute("id", id);
			String sql2 = "update tbl_login set asdf = 1 where asdf = '0' and id = " + "'" + id + "'";
			PreparedStatement patmt = con.prepareStatement(sql2);
			patmt.executeUpdate();
			response.sendRedirect("Main.jsp");
		%>
	
		
		<%
			
			} else {
		%>

	<script type="text/javascript">
		alert("아이디 또는 비밀번호를 확인해 주세요.");
		location = "login.jsp";
	</script>
	<%
	}
	}
	%>
</body>
</html>