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
*{
margin: auto;
}
a{
	padding-left: 60px;
	color: white;
}

.nav {
	text-align: right;
	padding-right: 80px;
}
</style>
</head>
<body style="background-image: url('bage.png')">
	<jsp:include page="Header.jsp"></jsp:include>


		

		
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String d = (String) session.getAttribute("id");
	String mname = request.getParameter("mname");
	String tag = request.getParameter("tag");
	System.out.println(mname);
	System.out.println(tag);
	String plusSql = "";
	
	if(tag == null){
		plusSql = "mname like"+"'"+"%"+mname+"%"+"'";
	}
	else{
		plusSql = "mname like " +  "'" + "%" + mname + "%" + "'" + "and tag =" + "'" + tag + "'";
	}
	

	String sql = "select mcode, mdir, mname, tag from tbl_movie where " + plusSql;

	ResultSet rs = con.prepareStatement(sql).executeQuery();
	
	
	
	%>
		
		
		<%
		while (rs.next()) {
			String mcode = rs.getString("mcode");
			
		%>
		
		<form action="Yeahmae.jsp" class="movie_tb" name="form">
		<table>
			<tr>
				<td colspan="2"><img class="movie" alt=""
					src="<%=rs.getString(2)%>" /></td>
			</tr>
			<tr style="text-align: center;color: #E6E6FA; ">
				<td style="text-align: center;"><%=rs.getString(3)%> # <%=rs.getString(4)%></td>
				<td><input type="hidden" name="mcode" value="<%=rs.getString(1)%>"></td>
			</tr>
				<%
			if(d != null){
				
			
			%>			
				
			<tr>
				<td style="display: flex; justify-content: center;">
					<input type="submit" class="btn first" value="예매" onclick="yeahmae()"/>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		
	</form>
		

		<% 
		}
		%>
		
		

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>