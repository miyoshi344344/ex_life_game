<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>オプション | 人生ゲーム</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/option.css">
</head>
<body>

  <div class="screen">
    <h1>オプション</h1>

    <%-- 見た目だけ（ハリボテ）。どこにも送信しない --%>
    <div class="settings">

      <div class="label">音量</div>
      <div class="volume">
        <span>min</span>
        <input type="range" min="0" max="100" value="70">
        <span>max</span>
      </div>

      <div class="label">言語</div>
      <div class="choices">
        <label><input type="radio" name="language" checked>日本語</label>
        <label><input type="radio" name="language">English</label>
        <label><input type="radio" name="language">Нохчийн мотт</label>
      </div>

      <div class="label">難易度</div>
      <div class="choices">
        <label><input type="radio" name="difficulty">かんたん</label>
        <label><input type="radio" name="difficulty" checked>ふつう</label>
        <label><input type="radio" name="difficulty">むずかしい</label>
      </div>

      <div class="label">解像度</div>
      <div class="choices">
        <label><input type="radio" name="resolution">960×540</label>
        <label><input type="radio" name="resolution" checked>1920×1080</label>
        <label><input type="radio" name="resolution">3840×2160</label>
      </div>

      <div class="label">画面モード</div>
      <div class="choices">
        <label><input type="radio" name="screen" checked>ウィンドウ</label>
        <label><input type="radio" name="screen">ボーダレス</label>
        <label><input type="radio" name="screen">フルスクリーン</label>
      </div>

      <div class="label">R</div>
      <div class="choices">
        <label><input type="radio" name="rating" checked>12</label>
        <label><input type="radio" name="rating">15</label>
        <label><input type="radio" name="rating">18</label>
      </div>

      <div class="label">ニンニク入れますか？</div>
      <div class="choices">
        <label><input type="radio" name="garlic">抜き</label>
        <label><input type="radio" name="garlic">はい</label>
        <label><input type="radio" name="garlic" checked>全マシ</label>
      </div>

    </div>

    <div class="back">
      <%-- TitleServlet（/title）経由でタイトル画面に戻る --%>
      <a class="btn" href="${pageContext.request.contextPath}/title">戻る</a>
    </div>
  </div>

</body>
</html>