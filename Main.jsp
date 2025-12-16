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
	PreparedStatement pstmt;
	ResultSet rs;
	String d = (String) session.getAttribute("id");
	System.out.println("에트리뷰트 " + d);
	//d에서 가져온 값이 있다면 아래 코드와 sql을 조회하는 문을 실행함
	//d에서 가져온 값이 null이라면? 그냥 페이지 출력
		//String sqll = "select asdf from tbl_login where id =";
								// 오라클에서 쿼리문 실행
	%>
	
		

	<nav style="position: fixed; top: 90px; height: 50px; line-height: 50px; width: 100%; background: #425e8e;">
		<% 
	if(d == null){	//로그인 안했을 때
		//실행할 코드
		//천국
	%>	
		<div class="nav">
			<a style="color: white;" href="login.jsp">로그인</a>
		 	<a style="color: white;" href="heone.jsp">회원가입</a>
		</div>
	<% 	
	} 
	
	else if(d != null){	//로그인 했을 때
	//실행할 코드
		String sql = "select asdf from tbl_login where id = " + "'" + d + "'";
		rs = con.prepareStatement(sql).executeQuery();		// 오라클로 접속하기 위한 단계
		rs.next();	
		String as = rs.getString(1);
			if(as.equals("1")) {
				
			}
		//지옥
	%>
		<div class="nav">
			<a style="color: white;" href="Logout.jsp">로그아웃</a>
			<a style="color: white;" href="sog.jsp">마이페이지</a>
			<a style="color: white;" href="Search.jsp">검색</a>
		</div>
	<%	
	}
	%>
	</nav>
	<section style="text-align: center; padding-top: 150px; padding-bottom: 20px;" >
  <jsp:include page="Search.jsp"></jsp:include>

		<%
			String sql2 = "select * from tbl_movie";
		rs = con.prepareStatement(sql2).executeQuery();
		while (rs.next()) {
			String mcode = rs.getString("mcode");

			/*
			여기다가 쓰는거지 = 메모하는 습관을 기르자
					display: flex; justify-content: center;
			*/
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
	</section>


<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>