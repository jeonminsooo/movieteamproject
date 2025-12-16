<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css" href="css/Login.css">
</head>
<body style="background-image: url('ba.png')">
	<a href="Main.jsp"> <img alt="" src="raw22.png" style="width: 20%;">
	</a>

	<section class="login">
		<form action="login_de.jsp" name="logs">
			<table>
				<tr>
					<td><input type="text" class="id" name="id" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="password" class="pwd" name="pw"
						placeholder="비밀번호"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="button" class="loginbtn"
						value="로그인" onclick="log();"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="Regbtn" value="회원가입하러가기" onclick="location.href='heone.jsp'"></td>
				</tr>
				
				
				
			</table>
			
			
			
			
		</form>
	</section>




	<script type="text/javascript">
		function log() {
			if (document.logs.id.value == "") {
				alert("아이디를 적어주세요");
				document.logs.id.focus();
			} else if (document.logs.pw.value == "") {
				alert("비밀번호를 적어주세요");
				document.logs.pw.focus();
			} else {
				document.logs.submit();
			}

		}
	</script>
</body>
</html>