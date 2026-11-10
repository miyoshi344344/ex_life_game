<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>人生ゲーム</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/title.css">
</head>
<body>

  <div class="screen">
    <h1>人生ゲーム</h1>

    <nav class="menu">
      <a class="btn" href="${pageContext.request.contextPath}/number_of_people">ニューゲーム</a>

      <%-- セーブデータがあるときだけ、コンティニューを押せるようにする --%>
      <c:choose>
        <c:when test="${hasSaveData}">
          <a class="btn" href="${pageContext.request.contextPath}/continue">コンティニュー</a>
        </c:when>
        <c:otherwise>
          <span class="btn disabled">コンティニュー</span>
        </c:otherwise>
      </c:choose>

      <a class="btn" href="${pageContext.request.contextPath}/option">オプション</a>
    </nav>
  </div>

</body>
</html>
