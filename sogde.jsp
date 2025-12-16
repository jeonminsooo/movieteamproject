<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/sog2.css">

<body>
	<%
	String id = (String) session.getAttribute("id");
	String jumin = request.getParameter("jumin");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	%>


	<h2>회원가입화면</h2>
<section class="login">

<form action="sogde2.jsp" name="logs">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="<%=id %> "> </td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><input type="text" name="jumin" value="<%=jumin %>"> </td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="pw" value="<%=pw %>"> </td>
	</tr>
	
	<tr>
		<td>닉네임</td>
		<td><input type="text" name="name" value="<%=name %>"> </td>
	</tr>
	
	
	<tr>
		<td colspan="2">
		<input type="button" value="수정하기" onclick="log();"> 
		<input type="button" value="돌아가기"onclick="location.href='Main.jsp'">
		</td>
	</tr>
	
</table>
</form>
</section>

<script type="text/javascript">
	function log() {
		if (document.logs.id.value == "") {
			alert("아이디를 적어주세요");
			document.logs.id.focus();
		} else if (document.logs.jumin.value == "") {
			alert("주민번호를 적어주세요");
			document.logs.jumin.focus();
		} else if (document.logs.pw.value == "") {
			alert("비밀번호를 적어주세요");
			document.logs.pw.focus();
		} else if (document.logs.name.value == "") {
			alert("닉네임를 적어주세요");
			document.logs.name.focus();
		} else {
			alert("수정성공");
			document.logs.submit();
		}

	}
</script>


</body>
</html>
