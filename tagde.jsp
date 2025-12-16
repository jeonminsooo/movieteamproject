<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mvposter.css">
<style type="text/css">
* {
	margin: auto;
}
</style>
</head>
<body style="background-image: url('bage.png')">
<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center;">영화 검색결과</h2>
	<section>
	<table border="1">
	
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	
	String tag1 = request.getParameter("tag1");
	String tag2 = request.getParameter("tag2");
	String tag3 = request.getParameter("tag3");
	String tag4 = request.getParameter("tag4");
	String tag5 = request.getParameter("tag5");
	String tag6 = request.getParameter("tag6");
	String tag7 = request.getParameter("tag7");
	String tag8 = request.getParameter("tag8");
	String tag9 = request.getParameter("tag9");
	String tag10 = request.getParameter("tag10");
	String tag11 = request.getParameter("tag11");
	String tag12 = request.getParameter("tag12");
	String tag13 = request.getParameter("tag13");
	

	String sql = "select mcode, mname, tag from tbl_movie where REGEXP_LIKE(tag, "+ "'"+ tag1+"|"+tag2+"|"+tag3+"|"+tag4+"|"+tag5+"|"+tag6+"|"+tag7+"|"+tag8+"|"+tag9+"|"+tag10+"|"+tag11+"|"+tag12+"|"+tag13+"')";

	ResultSet rs = con.prepareStatement(sql).executeQuery();
	%>
		
		<h2 style="top:150px; text-align: center;">영화 검색결과</h2>
		<%
		while (rs.next()) {
			
			
		%>
		<tr>
		
		<form action="Yeahmae.jsp" class="movie_tb" name="form">
			<table class="movie_tb">
			<tr>
				<td colspan="2"><img class="movie" alt=""
					src="<%=rs.getString("mcode")%>" /></td>
			</tr>
			<tr style="text-align: center;color: #E6E6FA;">
				<td><%=rs.getString("mname")%> # <%=rs.getString("tag")%></td>
			</tr>
			<tr>
				<td style="display: flex; justify-content: center;">
					<input type="submit" class="btn first" value="예매" />
				</td>
			</tr>
		</table>
		
		</form>


		<%
			}
		%>
		

	</table>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>