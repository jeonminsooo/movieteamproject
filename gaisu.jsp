<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: auto;
}

.seats {
	display: grid;
	grid-template-columns: repeat(5, 60px);
	gap: 10px;
	padding: 20px;
	background-color: #222;
	border-radius: 10px;
	width: fit-content;
}

.seat-checkbox {
	display: none;
}

.seat-label {
	display: inline-block;
	width: 60px;
	height: 60px;
	background-color: #ccc;
	border-radius: 10px;
	text-align: center;
	line-height: 60px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
}

.seat-checkbox:checked+.seat-label {
	background-color: #4CAF50;
	color: white;
}

.seat-label.reserved {
	background-color: #999;
	cursor: not-allowed;
}
</style>
</head>
<body>

	<div class="reserve-container">
		<div style="text-align: center;">스크린</div>

		<form name="movie" action="test.jsp">
			<table class="table">
				<tr>

					<%
					int num = 0;
					%>
					<%
					for (int i = 1; i <= 15; i++) {
					%>
					<%
					if (num % 5 == 0) {
					%>
					<td></td>
					<%
					num = 0;
					%>
					<%
					}
					%>

					<%
					++num;
					%>
					<%
					}
					%>
				</tr>
			</table>
			<table class="table">
				<%
				char alp = 'A';
				%>
				<%
				int num2 = 1;
				%>
				<%
				int sitnum = 1;
				%>
				<%
				for (int j = 0; j < 10; j++) {
				%>
				<tr>
					<td id="row<%=alp%>"><%=alp%></td>
					<%for (int i = 1; i < 18; i++) {%>
					<%if (num2 % 6 == 0) {%>
					<td style="background: #e4e4e4">|&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;|</td>
					<%num2 = 1;%>
					<%continue;
					}
					%>
					<td><input id="<%=alp%><%=sitnum%>"
						value="<%=alp%><%=sitnum%>" type="checkbox" name="sit"
						class="seat-checkbox"> <label for="<%=alp%><%=sitnum%>"
						class="seat-label"><%=alp%><%=sitnum%> </label></td>

					<%++num2;%>
					<%++sitnum;%>
					<% }%>
					<%num2 = 1;%>
					<%sitnum = 1;%>
					<td id="row<%=alp%>"><%=alp%></td>
				</tr>
				<%alp++;%>
				<%
				}
				%>
			</table>
			<table>
				<tr>
					<td>
						<button type="button" class="btn" onclick="reservation();">좌석예약</button>
					</td>
				</tr>
			</table>

		</form>
	</div>
<script type="text/javascript">
function reservation() {
	const f = document.movie;
	const count = document.getElementsByName("sit");
	
	const chk = count.length;
	let sum = 0;
	for(let i=0; i<chk; i++){
		if(f.sit[i].checked == true){
			sum += 1;
		}
	}
	
	if(sum > 4){
		alert("좌석은 최대 4개까지만 선택 가능합니다.")
		return;
	}
	if( ! sum){
		alert("좌석은 1개 이상 선택해야합니다.")
		return;
	}
	
	f.submit();
	
}
 
// 이 부분 다시 짤 것
window.addEventListener("load", function(){

		
}); 
 
</script>

</body>
</html>