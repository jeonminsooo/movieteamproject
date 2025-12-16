<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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

.seat-checkbox:checked + .seat-label {
  background-color: #4CAF50;
  color: white;
}

.seat-label.reserved {
  background-color: #999;
  cursor: not-allowed;
}
</style>

<body>
<div class="seats">
  <input type="checkbox" id="seatA1" class="seat-checkbox">
  <label for="seatA1" class="seat-label">A1</label>

  <input type="checkbox" id="seatA2" class="seat-checkbox">
  <label for="seatA2" class="seat-label">A2</label>

    <!-- 아래는 이미 예약된 좌석처리 -->
  <input type="checkbox" id="seatA3" class="seat-checkbox" disabled>
  <label for="seatA3" class="seat-label reserved">A3</label>
</div>

</body>
</html>