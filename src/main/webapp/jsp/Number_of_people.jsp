<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>人数選択 | 人生ゲーム</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/number_of_people.css">
</head>
<body>

  <div class="screen">
    <h1>人数を選択</h1>

    <form action="${pageContext.request.contextPath}/human_count" method="post">
      <div class="menu">
        <button type="submit" class="btn btn-large" name="players" value="1">1人</button>
        <button type="submit" class="btn btn-large" name="players" value="2">2人</button>
        <button type="submit" class="btn btn-large" name="players" value="3">3人</button>
        <button type="submit" class="btn btn-large" name="players" value="4">4人</button>
      </div>
    </form>
  </div>

</body>
</html>
