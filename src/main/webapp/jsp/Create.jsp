<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>プレイヤー設定</title>

<style>
body {
margin: 0;
min-height: 100vh;
display: flex;
justify-content: center;
align-items: center;
background: #fffdf8;
font-family: "Hiragino Maru Gothic ProN",
"Hiragino Sans", "Meiryo", sans-serif;
}

.title-screen {
text-align: center;
}

.title-screen h1 {
margin: 0 0 48px;
font-size: 56px;
letter-spacing: 0.1em;
color: #333;
}

/* 2列：1P=左上, 2P=右上, 3P=左下, 4P=右下 */
.players {
display: grid;
grid-template-columns: 220px 220px;
gap: 24px;
justify-content: center;
margin-bottom: 40px;
}

.slot {
width: 220px;
padding: 20px 0;
color: #333;
background: #fffdf8;
border: 3px solid #333;
border-radius: 8px;
box-shadow: 3px 3px 0 #333;
}

.slot b {
display: block;
margin-bottom: 12px;
font-size: 28px;
}

.slot input {
width: 160px;
text-align: center;
font: inherit;
font-size: 16px;
color: #333;
background: transparent;
border: none;
border-bottom: 2px solid #333;
padding: 4px;
}

.slot input:focus {
outline: none;
}

.start {
width: 220px;
padding: 20px 0;
font-size: 22px;
font-weight: bold;
color: #333;
background: #fffdf8;
border: 3px solid #333;
border-radius: 8px;
box-shadow: 3px 3px 0 #333;
cursor: pointer;
transition: transform 0.1s, box-shadow 0.1s;
}

.start:hover {
background: #f0ece2;
}

.start:active {
transform: translate(3px, 3px);
box-shadow: 0 0 0 #333;
}
</style>

</head>

<body>

<div class="title-screen">
<h1>名前を入力してね</h1>

<form action="${pageContext.request.contextPath}/player" method="post">
<input type="hidden" name="players" value="${players}">

<div class="players">
<c:forEach var="i" begin="1" end="${players}">
<div class="slot">
<b>${i}P</b>
<input type="text" name="playerName"
value="プレイヤー${i}" minlength="2" maxlength="10">
</div>
</c:forEach>
</div>

<button type="submit" class="start">スタート</button>
</form>

</div>

</body>
</html>