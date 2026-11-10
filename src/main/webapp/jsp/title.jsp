<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>人生ゲーム</title>
<style>
  body {
    margin: 0;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fffdf8;
    font-family: "Hiragino Maru Gothic ProN", "Hiragino Sans", "Meiryo", sans-serif;
  }

  /* 画面全体をタイトル画面にする */
  .title-screen {
    text-align: center;
  }

  .title-screen h1 {
    margin: 0 0 48px;
    font-size: 56px;
    letter-spacing: 0.1em;
    color: #333;
  }

  /* ボタンを縦に並べる */
  .menu {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 16px;
  }

  .menu a {
    display: block;
    width: 220px;
    padding: 12px 0;
    font-size: 22px;
    font-weight: bold;
    color: #333;
    text-decoration: none;
    background: #fffdf8;
    border: 3px solid #333;
    border-radius: 8px;
    box-shadow: 3px 3px 0 #333;
    transition: transform 0.1s, box-shadow 0.1s;
  }

  /* マウスを乗せたときだけ少し暗くする */
  .menu a:hover {
    background: #f0ece2;
  }

  /* 押したときに沈む */
  .menu a:active {
    transform: translate(3px, 3px);
    box-shadow: 0 0 0 #333;
  }

  /* 押せないボタン（セーブデータがないときのコンティニュー） */
  .menu .disabled {
    display: block;
    width: 220px;
    padding: 12px 0;
    font-size: 22px;
    font-weight: bold;
    color: #aaa;
    background: #fffdf8;
    border: 3px solid #ccc;
    border-radius: 8px;
    cursor: not-allowed;
  }
</style>
</head>
<body>

  <div class="title-screen">
    <h1>人生ゲーム</h1>

    <nav class="menu">
      <%-- ★ 遷移先は各Servletの @WebServlet の名前に合わせて書き換える --%>
      <a href="${pageContext.request.contextPath}/number_of_people">ニューゲーム</a>

      <%-- セーブデータがあるときだけ、コンティニューを押せるようにする --%>
      <c:choose>
        <c:when test="${hasSaveData}">
          <a href="${pageContext.request.contextPath}/continue">コンティニュー</a>
        </c:when>
        <c:otherwise>
          <span class="disabled">コンティニュー</span>
        </c:otherwise>
      </c:choose>

      <a href="${pageContext.request.contextPath}/option">オプション</a>
    </nav>
  </div>

</body>
</html>
