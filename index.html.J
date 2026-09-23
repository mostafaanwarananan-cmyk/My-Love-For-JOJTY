<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>راديو الحب 📻💖</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', sans-serif; }
        body { background: linear-gradient(135deg, #ffe5ec, #ffc2d1); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; overflow-x: hidden; }
        .container { background: white; width: 100%; max-width: 450px; border-radius: 30px; box-shadow: 0 15px 35px rgba(255, 75, 110, 0.2); padding: 25px; text-align: center; border: 3px solid #ff4d6d; }
        h1 { color: #ff4d6d; margin-bottom: 20px; font-size: 26px; }
        .step { display: none; animation: slideIn 0.5s ease-out forwards; }
        .step.active { display: block; }
        @keyframes slideIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .btn { background: #ff4d6d; color: white; border: none; padding: 12px 25px; font-size: 18px; border-radius: 25px; cursor: pointer; transition: 0.3s; margin-top: 15px; width: 100%; font-weight: bold; }
        .btn:hover { background: #ff758f; transform: scale(1.02); }
        
        /* Tic Tac Toe Style */
        .board { display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; max-width: 260px; margin: 20px auto; }
        .cell { background: #fff0f3; height: 80px; border-radius: 15px; display: flex; justify-content: center; align-items: center; font-size: 35px; cursor: pointer; border: 2px solid #ffb3c1; transition: 0.2s; }
        .cell:hover { background: #ffe5ec; }
        
        /* Word Game Style */
        .scrambled { font-size: 32px; letter-spacing: 8px; color: #ff4d6d; margin: 20px 0; font-weight: bold; background: #fff0f3; padding: 10px; border-radius: 15px; }
        .word-input { width: 100%; padding: 12px; border: 2px solid #ffb3c1; border-radius: 15px; text-align: center; font-size: 18px; outline: none; }
        
        /* Radio Style */
        .radio-box { background: #4a4e69; padding: 25px; border-radius: 20px; border: 5px solid #22223b; margin: 20px 0; color: #f2e9e4; }
        .screen { background: #9a8c98; color: #22223b; font-family: monospace; font-size: 32px; padding: 10px; border-radius: 10px; font-weight: bold; margin-bottom: 20px; box-shadow: inset 0 0 10px rgba(0,0,0,0.5); }
        .slider { -webkit-appearance: none; width: 100%; height: 15px; border-radius: 10px; background: #c9ada7; outline: none; }
        .slider::-webkit-slider-thumb { -webkit-appearance: none; width: 25px; height: 25px; border-radius: 50%; background: #ff4d6d; cursor: pointer; border: 2px solid white; }
        
        /* Final Message */
        .final-card { background: linear-gradient(135deg, #ff4d6d, #ff758f); color: white; padding: 30px 20px; border-radius: 25px; box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .final-card p { font-size: 18px; line-height: 1.8; text-align: justify; direction: rtl; }
    </style>
</head>
<body>

<div class="container">
    <!-- البداية -->
    <div class="step active" id="step0">
        <h1>📻 راديو الحب التفاعلي 💖</h1>
        <p style="color: #666; font-size: 16px; margin-bottom: 15px;">المحطة دي مش بتشتغل غير للشخص الصح! جهزي نفسك عشان تحلي 3 العاب وتفتحي الراديو</p>
        <button class="btn" onclick="nextStep(1)">يلا نبدأ اللعب! 🚀</button>
    </div>

    <!-- اللعبة 1: إكس أو -->
    <div class="step" id="step1">
        <h1>اللعبة 1: هزيمة قلب الكمبيوتر 💖</h1>
        <p style="color: #888; font-size: 14px;">العبي بـ ❤️ والكمبيوتر بـ 🤍.. لازم تكسبي عشان تعدي!</p>
        <div class="board" id="board"></div>
        <p id="game1-status" style="font-weight: bold; color: #ff4d6d;"></p>
    </div>

    <!-- اللعبة 2: الكلمة السرية -->
    <div class="step" id="step2">
        <h1>اللعبة 2: رتبي الكلمة السرية 🧩</h1>
        <p style="color: #888; font-size: 14px;">رتب الحروف دي عشان تطلع كلمة بنقولها دايما</p>
        <div class="scrambled">ك ب ح ب ا</div>
        <input type="text" id="word-guess" class="word-input" placeholder="اكتبي الكلمة هنا...">
        <button class="btn" onclick="checkWordGame()">تحقق من الكلمة 🔒</button>
    </div>

    <!-- اللعبة 3: مؤشر الراديو -->
    <div class="step" id="step3">
        <h1>اللعبة 3: اضبطي تردد الراديو 📻</h1>
        <p style="color: #888; font-size: 14px; margin-bottom: 15px;">حركي المؤشر لحد ما توصلي لتردد الحب الصحيح (101.4)</p>
        <div class="radio-box">
            <div class="screen" id="radio-screen">90.0 FM</div>
            <input type="range" min="900" max="1080" value="900" class="slider" id="radio-slider" oninput="tuneRadio(this.value)">
        </div>
        <button class="btn" id="radio-btn" style="display:none;" onclick="nextStep(4)">مبروك كسبت اشطر كتكوتة يناااااس 🥳💖🐣</button>
    </div>

    <!-- الشاشة النهائية والرسالة (الجائزة) -->
    <div class="step" id="step4">
        <div class="final-card">
            <h1 style="color: white; font-size: 28px; margin-bottom: 15px;">جائزتك الكبيرة اهي 🏆💖</h1>
            <!-- تم تحديث رسالتك الرومانسية بالكامل هنا بدون أي همزات أو فواصل -->
            <p></p>انتي اجمل حاجة حصلت في حياتي كلهاوانا محظوظ بوجودك معايا ومقدرش اعيش من غيرك وبحبك اكتر من اي حاجة في الدنيا دي كلها يا كل دنيتي وحياتي ربنا يخليكي ليا دايما ونفضل مع بعض العمر كله يا احلي واغلي انسانة في قلبي بحبك وهفضل بحبك طول ما انا عايش بحبك وبعشقككك يا اجمل دلوعة في الدنيا كلها بحبكك اوي يچوچتي بحبكككك اويي</p>
        </div>
    </div>
</div>

<script>
    function nextStep(stepNum) {
        document.querySelectorAll('.step').forEach(s => s.classList.remove('active'));
        document.getElementById('step' + stepNum).classList.add('active');
        if(stepNum === 1) initTicTacToe();
    }

    // --- GAME 1: TIC TAC TOE ---
    let board = ['', '', '', '', '', '', '', '', ''];
    function initTicTacToe() {
        const boardDiv = document.getElementById('board');
        boardDiv.innerHTML = '';
        board = ['', '', '', '', '', '', '', '', ''];
        document.getElementById('game1-status').innerText = '';
        for (let i = 0; i < 9; i++) {
            const cell = document.createElement('div');
            cell.classList.add('cell');
            cell.dataset.index = i;
            cell.addEventListener('click', playerMove);
            boardDiv.appendChild(cell);
        }
    }
    function playerMove(e) {
        const idx = e.target.dataset.index;
        if (board[idx] !== '') return;
        board[idx] = '❤️';
        e.target.innerText = '❤️';
        if (checkWin('❤️')) { endGame1(true); return; }
        if (!board.includes('')) { document.getElementById('game1-status').innerText = 'تعادل! حاولي تاني'; setTimeout(initTicTacToe, 1500); return; }
        setTimeout(computerMove, 500);
    }
    function computerMove() {
        let emptyCells = board.map((c, i) => c === '' ? i : null).filter(v => v !== null);
        if (emptyCells.length === 0) return;
        let randomIdx = emptyCells[Math.floor(Math.random() * emptyCells.length)];
        board[randomIdx] = '🤍';
        document.querySelector(`[data-index='${randomIdx}']`).innerText = '🤍';
        if (checkWin('🤍')) { document.getElementById('game1-status').innerText = 'الكمبيوتر كسب! جربي تاني'; setTimeout(initTicTacToe, 1500); }
    }
    function checkWin(p) {
        const wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
        return wins.some(w => w.every(i => board[i] === p));
    }
    function endGame1(won) {
        if(won) {
            document.getElementById('game1-status').innerText = 'كسبتي! جاري الانتقال.. 🎉';
            setTimeout(() => nextStep(2), 1500);
        }
    }

    // --- GAME 2: WORD GAME ---
    function checkWordGame() {
        const guess = document.getElementById('word-guess').value.trim();
        if(guess === 'بحبك' || guess === 'ابحبك') {
            nextStep(3);
        } else {
            alert('حاولي تاني! فكري في الكلمة السرية 😉');
        }
    }

    // --- GAME 3: RADIO TUNING ---
    function tuneRadio(val) {
        let freq = (val / 10).toFixed(1);
        document.getElementById('radio-screen').innerText = freq + " FM";
        if(freq === "101.4") {
            document.getElementById('radio-screen').style.color = "#ff4d6d";
            document.getElementById('radio-screen').innerText = "101.4 💖 Found!";
            document.getElementById('radio-btn').style.display = "block";
        } else {
            document.getElementById('radio-screen').style.color = "#22223b";
            document.getElementById('radio-btn').style.display = "none";
        }
    }
</script>
</body>
</html>
