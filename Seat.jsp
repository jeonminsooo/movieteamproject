<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String mcode = request.getParameter("mcode");
String region = request.getParameter("region");
String m_date = request.getParameter("m_date");
String m_time = request.getParameter("m_time");
String m_gan = request.getParameter("m_gan");
%>
<style type="text/css">
* {
	margin: 0 auto;
	background: #3d3937;
}
.gaisubtn:hover{
	background-color: #4CAF50;;
}

.gaisubtn{
	margin-bottom: 7px;
	width: 100px;
    height: 40px;
    background-color: #f0efef;
    color: black;
    border: none;
    border-radius: 10%;
    font-weight: bold;
    
 } 
 
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
	<%@include file="Header.jsp"%>

	
		<section style="position:fixed; top: 110px;  width: 100%;">
			
			 <div style="text-align: center; background-color:white; display: flex; align-content: center; 
			 justify-content: center;height: 50PX; line-height: 50px;width: 880px; margin-left: 526.5px; margin-bottom: 20px;font-size: 30px;font-weight: bold;">S&nbsp;C&nbsp;R&nbsp;E&nbsp;E&nbsp;N</div>
			
			 
			<form name="movie" action="Yeahmaedetail.jsp"style="display: flex; align-content: center; justify-content: center;">
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
						<td style="color: white;" id="row<%=alp%>"><%=alp%></td>
						<td style="background: #e4e4e4">|&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;|</td>
						<%
						for (int i = 1; i < 16; i++) {
						%>
						<%
						if (num2 % 5 == 0) {
						%>
						<td style="background: #e4e4e4">|&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;|</td>
						<%
						num2 = 1;
						%>
						<%
						continue;
						}
						%>
						<td>
							<input id="<%=alp%><%=sitnum%>"
							 value="<%=alp%><%=sitnum%>"
							  type="checkbox"
							   name="m_seat"
							class="seat-checkbox">
								
							 <label for="<%=alp%><%=sitnum%>" class="seat-label">
							 	<%=alp%><%=sitnum%> 
							 </label>
						</td>

						<%
						++num2;
						%>
						<%
						++sitnum;
						%>
						<%
						}
						%>
						<%
						num2 = 1;
						%>
						<%
						sitnum = 1;
						%>
						
						<td style="color: white;"id="row<%=alp%>"><%=alp%></td>

					</tr>
					<%
					alp++;
					%>
					<%
					}
					%>
				</table>
				<table style="position: fixed;width: 100%;bottom: 40px;text-align: center;">
					<tr>
						<td><input type="hidden" name="id" value="<%=id %>"></td>
						<td><input type="hidden" name="mcode" value="<%=mcode %>"></td>
						<td><input type="hidden" name="region" value="<%=region %>"></td>
						<td><input type="hidden" name="m_date" value="<%=m_date %>"></td>
						<td><input type="hidden" name="m_time" value="<%=m_time%>"></td>
						<td><input type="hidden" name="m_gan" value="<%=m_gan%>"></td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;<button  type="button" class="gaisubtn" onclick="reservation();">좌석예약</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button  type="button" class="gaisubtn" onclick="location.href='Main.jsp'">홈으로</button>
						</td>
					</tr>
				</table>

			</form>
	</section>
	</div>
	<script type="text/javascript">
		function reservation() {
			const f = document.movie;
			const count = document.getElementsByName("m_seat");

			const chk = count.length;
			let sum = 0;
			for (let i = 0; i < chk; i++) {
				if (f.m_seat[i].checked == true) {
					sum += 1;
				}
			}

			if (sum > 4) {
				alert("좌석은 최대 4개까지만 선택 가능합니다.")
				return;
			}
			if (!sum) {
				alert("좌석은 1개 이상 선택해야합니다.")
				return;
			}

			f.submit();

		}

	</script>

</body>
</html>