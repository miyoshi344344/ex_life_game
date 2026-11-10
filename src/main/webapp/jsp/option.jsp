<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>オプション | 人生ゲーム</title>
<style>
  body {
    margin: 0;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fffdf8;
    color: #333;
    font-family: "Hiragino Maru Gothic ProN", "Hiragino Sans", "Meiryo", sans-serif;
  }

  .option-screen {
    padding: 48px 24px;
  }

  .option-screen h1 {
    margin: 0 0 40px;
    font-size: 40px;
    letter-spacing: 0.1em;
    text-align: center;
  }

  /* 左に項目名、右に選択肢 */
  .settings {
    display: grid;
    grid-template-columns: 240px auto;
    row-gap: 28px;
    align-items: center;
  }

  .settings .label {
    font-size: 20px;
    font-weight: bold;
  }

  /* 選択肢を横に並べる */
  .choices {
    display: flex;
    font-size: 17px;
  }

  /* 幅をそろえて、選択肢を縦の列にそろえる */
  .choices label {
    width: 170px;
    display: flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
  }

  /* ラジオボタンとスライダーの色を文字色に合わせる */
  input[type="radio"],
  input[type="range"] {
    accent-color: #333;
  }

  input[type="radio"] {
    width: 18px;
    height: 18px;
    margin: 0;
  }

  .volume {
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 17px;
  }

  .volume input {
    width: 320px;
  }

  /* 戻るボタン（タイトル画面と同じ見た目） */
  .back {
    display: flex;
    justify-content: center;
    margin-top: 48px;
  }

  .back a {
    display: block;
    width: 220px;
    padding: 12px 0;
    font-size: 22px;
    font-weight: bold;
    text-align: center;
    color: #333;
    text-decoration: none;
    background: #fffdf8;
    border: 3px solid #333;
    border-radius: 8px;
    box-shadow: 3px 3px 0 #333;
    transition: transform 0.1s, box-shadow 0.1s;
  }

  .back a:hover {
    background: #f0ece2;
  }

  .back a:active {
    transform: translate(3px, 3px);
    box-shadow: 0 0 0 #333;
  }
</style>
</head>
<body>

  <div class="option-screen">
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
        <label><input type="radio" name="garlic" checked>はい</label>
        <label><input type="radio" name="garlic">全マシ</label>
      </div>

    </div>

    <div class="back">
      <%-- TitleServlet（/title）経由でタイトル画面に戻る --%>
      <a href="${pageContext.request.contextPath}/title">戻る</a>
    </div>
  </div>

</body>
</html>