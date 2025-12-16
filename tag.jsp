<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
.search-section {
	max-width: 900px;
	margin: 50px auto;
	padding: 40px;
	background-color: #fff;
	border-radius: 20px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
}

.search-section h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #333;
}

.tag-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-bottom: 30px;
}

.tag-group input[type="checkbox"] {
	display: none;
}

.tag-group label {
	padding: 8px 16px;
	border: 1px solid #ccc;
	border-radius: 20px;
	font-size: 14px;
	background-color: #f5f5f5;
	cursor: pointer;
	transition: 0.2s;
}

.tag-group input[type="checkbox"]:checked+label {
	background-color: #6a24fe;
	color: white;
	border-color: #6a24fe;
}

.button-group {
	text-align: center;
	margin-top: 20px;
}

.button-group input[type="button"], .button-group input[type="reset"] {
	background-color: #6a24fe;
	color: white;
	padding: 10px 20px;
	margin: 0 8px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 15px;
	transition: background-color 0.2s;
}

.button-group input:hover {
	background-color: #5020c2;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="search-section">
		<h2>🎬 태그 영화 검색</h2>
		<form action="tagde.jsp" name="mo">
			<div class="tag-group ">
				<input type="checkbox" id="t1" name="tag1" value="SF"><label
					for="t1">SF</label> <input type="checkbox" id="t2" name="tag2"
					value="공포"><label for="t2">공포</label> <input
					type="checkbox" id="t3" name="tag3" value="로맨스 코미디"><label
					for="t3">로맨스 코미디</label> <input type="checkbox" id="t4" name="tag4"
					value="멜로"><label for="t4">멜로</label> <input
					type="checkbox" id="t5" name="tag5" value="뮤지컬"><label
					for="t5">뮤지컬</label> <input type="checkbox" id="t6" name="tag6"
					value="범죄"><label for="t6">범죄</label> <input
					type="checkbox" id="t7" name="tag7" value="스릴러"><label
					for="t7">스릴러</label> <input type="checkbox" id="t8" name="tag8"
					value="스포츠"><label for="t8">스포츠</label> <input
					type="checkbox" id="t9" name="tag9" value="슬랩스틱 코미디"><label
					for="t9">슬랩스틱 코미디</label> <input type="checkbox" id="t10"
					name="tag10" value="음악"><label for="t10">음악</label> <input
					type="checkbox" id="t11" name="tag11" value="전쟁"><label
					for="t11">전쟁</label> <input type="checkbox" id="t12" name="tag12"
					value="코미디"><label for="t12">코미디</label> <input
					type="checkbox" id="t13" name="tag13" value="판타지"><label
					for="t13">판타지</label>
			</div>
			<div class="button-group">
				<input type="button" value="검색하기" onclick="mv();"> <input
					type="reset" value="다시쓰기" onclick="re();"> <input
					type="button" value="홈으로" onclick="location.href='Main.jsp'">
			</div>


		</form>
	</section>
	<script type="text/javascript">
		function re() {
			if (document.mo.reset) {
				alert("다시쓰죠");
				document.mo.reset();
			}
		}
		function mv() {
			if (document.mo.tag1.checked == false
					&& document.mo.tag2.checked == false
					&& document.mo.tag3.checked == false
					&& document.mo.tag4.checked == false) {
				alert("태그를 선택해주세요");
				document.mo.tag.focus();
			} else {
				alert("검색완료!")
				document.mo.submit();
			}
		}
	</script>

</body>
</html>