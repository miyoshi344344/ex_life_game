
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>人数選択</title>

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

    /* ボタンを2列にする */
    .menu {
        display: grid;
        grid-template-columns: 220px 220px;
        gap: 24px;
    }

    .menu button {
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

    .menu button:hover {
        background: #f0ece2;
    }

    .menu button:active {
        transform: translate(3px, 3px);
        box-shadow: 0 0 0 #333;
    }
</style>

</head>

<body>

    <div class="title-screen">

        <h1>人数を選択</h1>
        
        <form action="${pageContext.request.contextPath}/human_count"
      method="post">

    <div class="menu">
        <button type="submit" name="players" value="1">1人</button>
        <button type="submit" name="players" value="2">2人</button>
        <button type="submit" name="players" value="3">3人</button>
        <button type="submit" name="players" value="4">4人</button>
    </div>
    </form>

    </div>

</body>
</html>
