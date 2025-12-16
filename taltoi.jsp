<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	// 1. id값은 세션에서 얻습니다.
	String id = (String) session.getAttribute("id");
    
   
	
		// 드라이버 호출
	Class.forName("oracle.jdbc.OracleDriver");
	
		// conn 생성
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	String sql = "delete from tbl_login where id = ?";
	
	
		// pstmt 생성
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	
	try{
	

		pstmt.setString(1, id);
		
		// sql 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			session.invalidate(); // 세션에 정보삭제
			response.sendRedirect("login.jsp");			
		} else{ // 실패
			response.sendRedirect("sog.jsp");
		}	
	
	} finally{
		try{//닫아주는 용도
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){ //여기도 에러 발생 위험이 있기 때문에 사용
			e.printStackTrace();
		}
	}
%>


</body>
</html>