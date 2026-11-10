<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>確認用</title>
</head>
<body>

  <h1>プレイヤー一覧</h1>

  <c:choose>
    <c:when test="${empty players}">
      <p>プレイヤーがいません</p>
    </c:when>
    <c:otherwise>
      <table border="1">
        <tr>
          <th>id</th>
          <th>名前</th>
          <th>お金</th>
          <th>マス</th>
          <th>ターン</th>
          <th>年齢</th>
        </tr>
        <c:forEach var="player" items="${players}">
          <tr>
            <td>${player.id}</td>
            <td>${player.name}</td>
            <td>${player.money}</td>
            <td>${player.tileId}</td>
            <td>${player.turn}</td>
            <td>${player.age}</td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>

</body>
</html>