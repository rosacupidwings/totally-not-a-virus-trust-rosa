<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>totally-not-a-virus-trust-rose</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('Untitleddesign-ezgif.com-crop.gif') no-repeat center center fixed;
            background-size: cover;
            font-family: 'MS Sans Serif', sans-serif;
            height: 100vh;
            overflow: hidden;
        }
        .popup {
            position: absolute;
            width: 320px;
            background: #ece9d8;
            border: 2px solid #000;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
            padding: 0;
        }
        .popup-header {
            background: #000080;
            color: white;
            padding: 4px 8px;
            font-size: 14px;
            text-align: left;
        }
        .popup-content {
            padding: 20px;
            text-align: center;
            font-size: 14px;
        }
        .popup-buttons {
            padding: 10px;
            text-align: center;
            border-top: 1px solid #000;
        }
        .popup button {
            padding: 4px 12px;
            margin: 0 5px;
            border: 2px solid #000;
            background: #c0c0c0;
            cursor: pointer;
            font-family: 'MS Sans Serif', sans-serif;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <audio id="bgMusic" loop>
        <source src="idk.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>

    <script>
        const lyrics = [
            { text: "Why I'm in love now?", button: "idk" },
            { text: "How can I live forever?", button: "idk" },
            { text: "Where can I find the heaven?", button: "idk" },
            { text: "What is going to happen?", button: "idk" },
            { text: "Why I'm in love now?", button: "idk :<" }
        ];

        let index = 0;

        function showNextLyric() {
            const audio = document.getElementById('bgMusic');
            if (audio.paused) {
                audio.play();
            }

            const popup = document.createElement('div');
            popup.className = 'popup';

            const header = document.createElement('div');
            header.className = 'popup-header';
            header.innerText = 'System Message - Error';

            const content = document.createElement('div');
            content.className = 'popup-content';
            content.innerHTML = index < lyrics.length ? lyrics[index].text : "I need an explanation<br>tell me more >:C";

            const buttons = document.createElement('div');
            buttons.className = 'popup-buttons';

            const button = document.createElement('button');
            button.innerText = index < lyrics.length ? lyrics[index].button : "oki :>";
            button.onclick = showNextLyric;

            buttons.appendChild(button);
            popup.appendChild(header);
            popup.appendChild(content);
            popup.appendChild(buttons);

            document.body.appendChild(popup);

            // Random Positioning
            popup.style.top = Math.floor(Math.random() * (window.innerHeight - 200)) + 'px';
            popup.style.left = Math.floor(Math.random() * (window.innerWidth - 300)) + 'px';

            index++;
            if (index > lyrics.length) {
                index = 0;
            }
        }

        // Create the first pop-up on page load
        window.onload = () => {
            showNextLyric();
        }
    </script>
</body>
</html>
