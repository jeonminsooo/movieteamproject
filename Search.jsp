<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.search-section {
    max-width: 900px;
    margin: 50px auto;
    padding: 40px;
    background-color: #fff;
    border-radius: 20px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.05);
}

.search-section h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

.search-box {
    width: 100%;
    height: 45px;
    padding: 0 10px;
    border: 1px solid #ccc;
    border-radius: 30px;
    font-size: 16px;
    outline: none;
    margin-bottom: 20px;
    transition: 0.2s;
}

.search-box:focus {
    border-color: #6a24fe;
    box-shadow: 0 0 5px rgba(106, 36, 254, 0.3);
}

.tag-group {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 30px;
}

.tag-group input[type="radio"] {
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

.tag-group input[type="radio"]:checked + label {
    background-color: #6a24fe;
    color: white;
    border-color: #6a24fe;
}

.button-group {
    text-align: center;
    margin-top: 20px;
}

.button-group input[type="button"],
.button-group input[type="reset"] {
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

<section class="search-section">
    <form action="Searchde.jsp" name="mo">
        <h2>🎬 영화 검색</h2>
        <input type="text" class="search-box" name="mname" placeholder="🔍영화 제목을 입력하세요...">

        <div class="tag-group">
            <input type="radio" id="t1" name="tag" value="SF"><label for="t1">SF</label>
            <input type="radio" id="t2" name="tag" value="공포"><label for="t2">공포</label>
            <input type="radio" id="t3" name="tag" value="로맨스 코미디"><label for="t3">로맨스 코미디</label>
            <input type="radio" id="t4" name="tag" value="멜로"><label for="t4">멜로</label>
            <input type="radio" id="t5" name="tag" value="뮤지컬"><label for="t5">뮤지컬</label>
            <input type="radio" id="t6" name="tag" value="범죄"><label for="t6">범죄</label>
            <input type="radio" id="t7" name="tag" value="스릴러"><label for="t7">스릴러</label>
            <input type="radio" id="t8" name="tag" value="스포츠"><label for="t8">스포츠</label>
            <input type="radio" id="t9" name="tag" value="슬랩스틱 코미디"><label for="t9">슬랩스틱 코미디</label>
            <input type="radio" id="t10" name="tag" value="음악"><label for="t10">음악</label>
            <input type="radio" id="t11" name="tag" value="전쟁"><label for="t11">전쟁</label>
            <input type="radio" id="t12" name="tag" value="코미디"><label for="t12">코미디</label>
            <input type="radio" id="t13" name="tag" value="판타지"><label for="t13">판타지</label>
        </div>

        <div class="button-group">
            <input type="button" value="검색하기" onclick="mv();">
            <input type="reset" value="다시쓰기">
            <input type="button" value="태그만 검색" onclick="location.href='Main_tag.jsp'">
            <input type="button" value="홈으로" onclick="location.href='Main.jsp'">
        </div>
    </form>
</section>

<script type="text/javascript">
    function mv() {
        if (document.mo.mname.value.trim() === "") {
            alert("검색어를 입력해주세요!");
            document.mo.mname.focus();
        } else {
            alert("검색 완료!");
            document.mo.submit();
        }
    }
</script>