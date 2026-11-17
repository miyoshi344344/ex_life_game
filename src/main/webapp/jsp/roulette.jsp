<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ルーレット</title>

<style>
body {
margin: 0;
min-height: 100vh;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
background: #fffdf8;
color: #333;
font-family: "Hiragino Maru Gothic ProN",
"Hiragino Sans", "Meiryo", sans-serif;
}

.roulette {
position: relative;
width: 300px;
height: 300px;
margin-bottom: 32px;
}

/* 上に固定された矢印（ここに来た数字が出目） */
.pointer {
position: absolute;
top: -18px;
left: 50%;
transform: translateX(-50%);
z-index: 2;
border-left: 14px solid transparent;
border-right: 14px solid transparent;
border-top: 28px solid #333;
}

/* 回る円盤 */
.wheel {
position: relative;
width: 100%;
height: 100%;
border: 3px solid #333;
border-radius: 50%;
box-shadow: 3px 3px 0 #333;
transition: transform 4s cubic-bezier(0.17, 0.67, 0.12, 1);
}

.wheel span {
position: absolute;
left: 50%;
top: 50%;
font-size: 24px;
font-weight: bold;
}

.result {
height: 48px;
margin-bottom: 16px;
font-size: 36px;
font-weight: bold;
}

.spin {
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

.spin:hover { background: #f0ece2; }

.spin:active {
transform: translate(3px, 3px);
box-shadow: 0 0 0 #333;
}

.spin:disabled {
opacity: 0.5;
cursor: default;
}
</style>

</head>

<body>

<div class="roulette">
<div class="pointer"></div>
<div class="wheel" id="wheel"></div>
</div>

<div class="result" id="result"></div>

<button type="button" class="spin" id="spin">回す</button>

<script>
var N = 6;            // 1〜6
var SEG = 360 / N;     // 1マスの角度（60度）
var rot = 0;           // 現在の回転角（累積）

var wheel = document.getElementById("wheel");
var resultEl = document.getElementById("result");
var spinBtn = document.getElementById("spin");

// 円盤の色分けと数字を作る
var stops = [];
for (var i = 0; i < N; i++) {
	var color = (i % 2 === 0) ? "#fffdf8" : "#e9e3d3";
	stops.push(color + " " + (i * SEG) + "deg " + ((i + 1) * SEG) + "deg");

	var span = document.createElement("span");
	span.textContent = i + 1;
	var angle = (i + 0.5) * SEG; // マスの真ん中の角度（真上から時計回り）
	span.style.transform =
		"translate(-50%, -50%) rotate(" + angle + "deg) translateY(-110px)";
	wheel.appendChild(span);
}
wheel.style.background = "conic-gradient(" + stops.join(", ") + ")";

// 回す：出目はサーバーで決める
spinBtn.addEventListener("click", function () {
	spinBtn.disabled = true;
	resultEl.textContent = "";

	fetch("<%= request.getContextPath() %>/roulette", {
	    method: "POST",
	    headers: {
	        "Content-Type": "application/x-www-form-urlencoded"
	    },
	    body: "id=1"
	})
	    .then(function (res) { return res.text(); })
	    .then(function (text) {
	        spin(parseInt(text, 10));
	    })
});

// 出目 tile のマスの真ん中が、真上の矢印に来るように回す
function spin(tile) {
	var targetMod = ((-(tile - 0.5) * SEG) % 360 + 360) % 360;
	var delta = ((targetMod - (rot % 360)) + 360) % 360;
	rot = rot + 360 * 5 + delta; // 5周してから止める
	wheel.style.transform = "rotate(" + rot + "deg)";

	wheel.addEventListener("transitionend", function done() {
		wheel.removeEventListener("transitionend", done);
		resultEl.textContent = tile;
	    // 1秒後にメインゲーム画面へ戻る
	    setTimeout(function () {

	        window.location.href = "<%= request.getContextPath() %>/maingame";

	    }, 1000);
	});
}
</script>

</body>
</html>