<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>プレイヤー設定 | 人生ゲーム</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/player.css">
</head>
<body>

  <div class="screen">
    <h1>名前を入力してね</h1>

    <form action="${pageContext.request.contextPath}/player" method="post">
      <input type="hidden" name="players" value="${players}">

      <div class="players">
        <c:forEach var="i" begin="1" end="${players}">
          <div class="frame slot">
            <b>${i}P</b>
            <input type="text" name="playerName"
                   value="プレイヤー${i}" minlength="2" maxlength="10">
          </div>
        </c:forEach>
      </div>

      <button type="submit" class="btn btn-large start">スタート</button>
    </form>
  </div>

</body>
</html>
